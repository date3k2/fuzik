from fastapi import APIRouter, Depends, status, Security, Body
from db.supabase_service import get_supabase
from typing import Annotated, Tuple
from supabase import Client
from utils.auth import get_role, get_email, oauth2_scheme
from models.enums import Role
from models.user import UserInfo
from fastapi.encoders import jsonable_encoder
from crud.user import get_user, update_user
from utils.exceptions import BAD_REQUEST

router = APIRouter(tags=["Users"])


@router.get("/get_user_info", description="Get information of logged in user")
async def get_user_info(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    return await get_user(supabase, token)


@router.patch(
    "/signup_group_admin",
    description="Sign up to be a group admin",
    status_code=status.HTTP_201_CREATED,
)
async def signup_as_group_admin(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[Tuple[str, str], Security(get_role)],
):
    if role != Role.user:
        raise BAD_REQUEST
    try:
        supabase.auth.update_user({"data": {"role": Role.group_admin}})
        return {"detail": "You are now a group admin"}
    except:
        raise BAD_REQUEST


@router.patch("/update_user_info", description="Update user info")
async def update_user_info(
    supabase: Annotated[Client, Depends(get_supabase)],
    email: Annotated[Tuple[str, str], Security(get_email)],
    new_user_info: Annotated[UserInfo, Body()],
):
    try:
        if new_user_info.role:
            del new_user_info.role
        await update_user(supabase, data=jsonable_encoder(new_user_info))
        return {"detail": "User info updated"}
    except:
        raise BAD_REQUEST
