from fastapi import APIRouter, Depends, HTTPException, status, Security, Body, Query
from fastapi.security import OAuth2PasswordRequestForm
from models.user import UserSignup
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_id
from fastapi.encoders import jsonable_encoder
from models.enums import Role
from gotrue.errors import AuthApiError
from crud.user import update_user
from utils.exceptions import BAD_REQUEST, CONFLICT, NOT_FOUND

router = APIRouter(tags=["Authentication"])


@router.post("/login", description="Login user using email and password")
async def login(
    form_data: Annotated[OAuth2PasswordRequestForm, Depends()],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    """
    Login to the account
    - **username**: the email of user
    - **password**: the password of user
    """
    email = form_data.username
    password = form_data.password
    try:
        user = supabase.auth.sign_in_with_password(
            {"email": email, "password": password}
        )
        return {
            "access_token": user.session.access_token,
            "token_type": "bearer",
        }
    except:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Incorrect email or password",
        )


@router.post(
    "/signup", description="Sign up new user", status_code=status.HTTP_201_CREATED
)
async def signup(
    user: Annotated[UserSignup, Body()],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    email = user.email
    password = user.password
    if len(password) < 6:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Password should be at least 6 characters",
        )
    try:
        user.role = Role.user
        res = supabase.auth.sign_up(
            {
                "email": email,
                "password": password,
                "options": {
                    "data": jsonable_encoder(user, exclude=("password", "email"))
                },
            }
        )
        return {"detail": "User created"}
    except AuthApiError:
        raise CONFLICT
    except:
        raise BAD_REQUEST


@router.post("/reset_password", description="Send reset password email")
async def reset_password(
    supabase: Annotated[Client, Depends(get_supabase)],
    email: str,
):
    try:
        if (
            len(supabase.rpc("get_user_id_by_email", {"email": email}).execute().data)
            > 0
        ):
            supabase.auth.reset_password_email(email)
            return {"detail": "Reset password email sent"}
        else:
            raise NOT_FOUND
    except:
        raise NOT_FOUND


@router.post("/reset_password_confirm", description="Reset password")
async def reset_password_confirm(
    supabase: Annotated[Client, Depends(get_supabase)],
    email: Annotated[str, Query(description="Email", title="Email")],
    new_password: Annotated[
        str, Query(min_length=6, description="New password", title="New password")
    ],
    token: Annotated[
        str, Query(description="Reset password token", title="Reset password token")
    ],
):
    try:
        supabase.auth.verify_otp(
            {
                "email": email,
                "token": token,
                "type": "email",
            }
        )
        await update_user(supabase, password=new_password)
        return {"detail": "Your password has been reset"}
    except:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Incorrect token",
        )
