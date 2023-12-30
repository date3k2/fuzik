from fastapi import APIRouter, Depends, HTTPException, status, Security
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_role, get_id, oauth2_scheme
from models.enums import Role
from models.group import GroupInfo
from utils.exceptions import UNAUTHORIZED
from typing import List

router = APIRouter(tags=["Group"], prefix="/group")


@router.post("", description="Create group")
async def create_group(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_info: GroupInfo,
):
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


@router.post("/user", description="Modify group")
async def add_user(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    email: str,
    group_id: int,
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    user_id = supabase.rpc("get_user_id_by_email", {"email": email}).execute().data
    if len(user_id) == 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User does not exist",
        )
    user_id = user_id[0]["id"]
    members_id: List = (
        supabase.table("groups")
        .select("members_id")
        .match({"admin_id": id, "id": group_id})
        .execute()
        .data[0]["members_id"]
    )
    if not members_id:
        members_id = []
    if user_id in members_id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User already in group",
        )
    members_id.append(user_id)
    supabase.table("groups").update({"members_id": members_id}).match(
        {"admin_id": id, "id": group_id}
    ).execute()
    return {"detail": "User added to group"}


@router.delete("/user", description="Delete user from group")
async def delete_user(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_id: int,
    email: str,
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    user_id = supabase.rpc("get_user_id_by_email", {"email": email}).execute().data
    if len(user_id) == 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User does not exist",
        )
    user_id = user_id[0]["id"]
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
    return {"detail": "User deleted from group"}
