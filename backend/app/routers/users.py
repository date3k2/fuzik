from fastapi import APIRouter, Depends, HTTPException, status, Security, Body, Query
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_role, get_id, oauth2_scheme
from models.enums import Role
from models.user import UserInfo
from models.group import GroupInfo
from fastapi.encoders import jsonable_encoder
from crud.user import get_user, update_user
from utils.exceptions import BAD_REQUEST

router = APIRouter(tags=["User"])


@router.get("/get_user_info", description="Get information of logged in user")
async def get_user_info(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    return await get_user(supabase, token)


@router.post(
    "/signup_group_admin",
    description="Sign up to be a group admin",
    status_code=status.HTTP_201_CREATED,
)
async def signup_as_group_admin(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_info: GroupInfo,
):
    if role != Role.user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="You are already a group admin or an admin",
        )
    try:
        supabase.auth.update_user({"data": {"role": Role.group_admin}})
        supabase.table("groups").insert(
            {
                "name": group_info.name,
                "description": group_info.description,
                "admin_id": id,
            }
        ).execute()
        return {"detail": "You are now a group admin"}
    except:
        raise BAD_REQUEST


@router.put("/change_password", description="Change password of logged in user")
async def change_password(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    new_password: Annotated[
        str, Query(min_length=6, description="New password", title="New password")
    ],
):
    try:
        await update_user(supabase, password=new_password)
        return {"detail": "Password updated"}
    except:
        raise


@router.patch("/update_user_info", description="Update user info")
async def update_user_info(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    new_user_info: Annotated[UserInfo, Body()],
):
    try:
        if new_user_info.role:
            del new_user_info.role
        await update_user(supabase, data=jsonable_encoder(new_user_info))
        return {"detail": "User info updated"}
    except:
        raise BAD_REQUEST
