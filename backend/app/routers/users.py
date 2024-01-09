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

router = APIRouter(tags=["User"], prefix="/user")


@router.get("/info")
async def get_user_info(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    """
    Get information of logged in user
    """
    return await get_user(supabase, token)


@router.post(
    "/signup_group_admin",
    status_code=status.HTTP_201_CREATED,
)
async def signup_as_group_admin(
    supabase: Annotated[Client, Depends(get_supabase)],
    role: Annotated[str, Security(get_role)],
    id: Annotated[str, Security(get_id)],
    group_info: GroupInfo,
):
    """
    Sign up to be a group admin
    - **name**: each group must have a name
    - **description**: a long description about this you
    """ 
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


@router.put("/password")
async def change_password(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    new_password: Annotated[
        str, Query(min_length=6, description="New password", title="New password")
    ],
):
    """
    Change password of logged in user
    - **New password**: new password of user
    """
    if len(new_password) < 6:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Password should be at least 6 characters",
        )
    try:
        await update_user(supabase, password=new_password)
        return {"detail": "Password updated"}
    except:
        raise BAD_REQUEST


@router.patch("/info")
async def update_user_info(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    new_user_info: Annotated[UserInfo, Body()],
):
    """
    Update user infomation
    - **name**: the new name of user
    - **birthdate**: the new birthdate of user
    - **phone_number**: the new phone number of user
    - **gender**: the new gender of user
    - **role**: not updated
    """
    try:
        if new_user_info.role:
            del new_user_info.role
        await update_user(supabase, data=jsonable_encoder(new_user_info))
        return {"detail": "User info updated"}
    except:
        raise BAD_REQUEST


#  buy ticket
@router.post("/buy_ticket")
async def buy_ticket(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_id: int,
):
    """
    Buy ticket
    - **concert_id**: id of concert user want to by ticket
    """
    try:
        number_of_tickets = (
            supabase.table("concerts")
            .select("number_of_tickets")
            .eq("id", concert_id)
            .execute()
            .dict()["data"][0]["number_of_tickets"]
        )
        if number_of_tickets == 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="There are no tickets left",
            )
        return {"detail": "Please navigate to the payment page"}
    except:
        raise BAD_REQUEST


# Confirm payment
@router.post("/confirm_payment")
async def confirm_payment(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_id: int,
):
    """
    Confirm payment
    - **concert_id**: id of concert user paid 
    """
    try:
        number_of_tickets = (
            supabase.table("concerts")
            .select("number_of_tickets")
            .eq("id", concert_id)
            .execute()
            .dict()["data"][0]["number_of_tickets"]
        )
        if number_of_tickets == 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="There are no tickets left",
            )
        supabase.table("concerts").update(
            {"number_of_tickets": number_of_tickets - 1}
        ).eq("id", concert_id).execute()
        return {"detail": "Payment successful"}
    except:
        raise BAD_REQUEST
