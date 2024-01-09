from fastapi import APIRouter, Depends, HTTPException, status, Security
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_role, get_id, oauth2_scheme
from models.enums import Role
from models.group import GroupInfo
from utils.exceptions import UNAUTHORIZED, BAD_REQUEST
from typing import List

router = APIRouter(tags=["Group"], prefix="/group")


@router.post("/create_group",)
async def create_group(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_info: GroupInfo,
):
    """
    Create group
    - **name**: each group must have a name
    - **description**: a long description about this group
    """ 
    if role != Role.group_admin:
        raise UNAUTHORIZED
    supabase.table("groups").insert(
        {
            "name": group_info.name,
            "description": group_info.description,
            "admin_id": id,
        }
    ).execute()
    return {"detail": "Group created"}

@router.put("/change_group_info",)
async def create_group(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_id:int,
    group_info: GroupInfo,
):
    """
    Change group infomation
    - **group_id**: id of group you manage
    - **name**: new name of your group
    - **description**: new description of your group
    """
    if role != Role.group_admin:
        raise UNAUTHORIZED
    try: 
        supabase.table("groups").select("admin_id").match({"id": group_id}).execute().data[0]["admin_id"]
    except:
        raise BAD_REQUEST
    
    if id != supabase.table("groups").select("admin_id").match({"id": group_id}).execute().data[0]["admin_id"]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="You aren't this group admin",
        )
    
    supabase.table("groups").update({"name": group_info.name,"description": group_info.description,}).match(
        {"admin_id": id, "id": group_id}
    ).execute()

    return {"detail": "Group updated"}


@router.get("/add_user")
async def add_user(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    email: str,
    group_id: int,
):
    """
    add user from group
    - **group_id**: id of group you manage
    - **email**: email of user you want to add
    """
    if role != Role.group_admin:
        raise UNAUTHORIZED
    user_id = supabase.rpc("get_user_by_email", {"e": email}).execute().data
    if user_id == None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User does not exist",
        )
    
    if id != supabase.table("groups").select("admin_id").match({"id": group_id}).execute().data[0]["admin_id"]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="You aren't this group admin",
        )
    user_group_id = supabase.rpc("get_group_id", {"user_id": user_id}).execute().data
    
    if user_group_id == group_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User already in group",
        )
    elif user_group_id != None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User was in orther group",
        )

    members_id: List = (
        supabase.table("groups")
        .select("members_id")
        .match({"admin_id": id, "id": group_id})
        .execute()
        .data[0]["members_id"]
    )

    if not members_id:
        members_id = []
    members_id.append(user_id)
    
    supabase.table("groups").update({"members_id": members_id}).match(
        {"admin_id": id, "id": group_id}
    ).execute()
    
    supabase.rpc("set_group_id_new", {"user_id": user_id,"gid":group_id}).execute()

    return {"detail": "User added to group"}


@router.delete("/delete_user",)
async def delete_user(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_id: int,
    email: str,
):
    """
    Delete user from group
    - **group_id**: id of group you manage
    - **email**: email of user you want to delete
    """
    if role != Role.group_admin:
        raise UNAUTHORIZED
    user_id = supabase.rpc("get_user_by_email", {"e": email}).execute().data
    
    if not user_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User does not exist",
        )
    
    if id != supabase.table("groups").select("admin_id").match({"id": group_id}).execute().data[0]["admin_id"]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="You aren't this group admin",
        )
    
    members_id: List = (
        supabase.table("groups")
        .select("members_id")
        .match({"admin_id": id, "id": group_id})
        .execute()
        .data[0]["members_id"]
    )

    if not members_id:
        members_id = []
    if user_id not in members_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User not in group",
        )
    members_id.remove(user_id)

    supabase.table("groups").update({"members_id": members_id}).match(
        {"admin_id": id, "id": group_id}
    ).execute()

    supabase.rpc("set_group_id_new", {"user_id": user_id,"gid":None}).execute()

    return {"detail": "User deleted from group"}


@router.get("/show_all_group", description="Show all my group and user member")
async def delete_user(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    
    list_group: List = (
        supabase.table("groups")
        .select("*")
        .match({"admin_id": id})
        .execute()
        .data
    )
    for group in list_group:
        for i in range (len(group["members_id"])):
            group["members_id"][i] = user_id = supabase.rpc("get_user_by_id", {"i": group["members_id"][i]}).execute().data
    return list_group

