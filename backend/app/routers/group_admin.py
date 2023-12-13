from fastapi import APIRouter, Depends, status, Security, Body, Query
from db.supabase_service import get_supabase
from typing import Annotated, Tuple
from supabase import Client
from utils.auth import get_role, get_email, oauth2_scheme
from models.enums import Role
from models.user import UserInfo
from models.group import GroupInfo
from fastapi.encoders import jsonable_encoder
from crud.user import get_user, update_user
from utils.exceptions import BAD_REQUEST, UNAUTHORIZED


router = APIRouter(tags=["Group Admin"], prefix="/group-admin")


@router.get("/get_user_info", description="Get information of logged in user")
async def get_user_info(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    return await get_user(supabase, token)


@router.get("/add_user", description="Add user to group")
async def add_user(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[Tuple[str, str], Security(get_role)],
    email: Annotated[str, Query()]
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    return email


@router.post("/create_group", description="Create group")
async def create_group(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[Tuple[str, str], Security(get_role)],
    group : GroupInfo
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    # write func to cr group in crud
    return 'cek'


@router.get("/delete_user", description="Remove user from group")
async def add_user(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[Tuple[str, str], Security(get_role)],
    email: Annotated[str, Query()]
):
    if role != Role.group_admin:
        raise UNAUTHORIZED
    return email
