from fastapi import APIRouter, Depends, HTTPException, status, Security, Body
from db.supabase_service import get_supabase
from typing import Annotated, Tuple
from supabase import Client
from utils.auth import get_current_user
from models.enums import Role
from models.user import UserInfo
from fastapi.encoders import jsonable_encoder

router = APIRouter(tags=["Users"])


@router.patch(
    "/signup_group_admin",
    description="Sign up to be a group admin",
    status_code=status.HTTP_201_CREATED,
)
async def signup_as_group_admin(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_info: Annotated[Tuple[str, str], Security(get_current_user)],
):
    _, role = user_info
    if role != Role.user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="You are already a group admin",
        )
    try:
        supabase.auth.update_user({"data": {"role": Role.group_admin}})
        return {"detail": "You are now a group admin"}
    except:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="User already exists",
        )


@router.patch("/update_user_info", description="Update user info")
async def update_user_info(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_info: Annotated[Tuple[str, str], Security(get_current_user)],
    new_user_info: Annotated[UserInfo, Body()],
):
    email, _ = user_info
    try:
        supabase.auth.update_user(
            {"data": jsonable_encoder(new_user_info, exclude=("role",))}
        )
        return {"detail": "User info updated"}
    except:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="You're not logged in",
        )
