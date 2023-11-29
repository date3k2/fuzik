from fastapi import APIRouter, Depends, HTTPException, status, Security, Body
from fastapi.security import OAuth2PasswordRequestForm
from models.user import UserInfo, UserSignup
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_current_user, oauth2_scheme

router = APIRouter(tags=["Authentication"])


@router.post("/login", description="Login user using email and password")
async def login(
    form_data: Annotated[OAuth2PasswordRequestForm, Depends()],
    supabase: Annotated[Client, Depends(get_supabase)],
):
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
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
        )


@router.post("/signup", description="Sign up new user")
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
        user = supabase.auth.sign_up(
            {
                "email": email,
                "password": password,
                "options": {"data": UserInfo(**user.dict()).dict()},
            }
        )
        return {"detail": "User created"}
    except:
        # raise HTTPException(
        #     status_code=status.HTTP_401_UNAUTHORIZED,
        #     detail="User already exists",
        # )
        raise


@router.get("/get_user_info", description="Get information of logged in user")
async def get_user(
    supabase: Annotated[Client, Depends(get_supabase)],
    token: Annotated[str, Depends(oauth2_scheme)],
):
    if not token:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="User not logged in",
        )
    return supabase.auth.get_user(token)


# @router.post("/signout", description="Sign out logged in user")
# async def logout(
#     supabase: Annotated[Client, Depends(get_supabase)],
#     token: Annotated[str, Depends(oauth2_scheme)],
# ):
#     if not token:
#         raise HTTPException(
#             status_code=status.HTTP_401_UNAUTHORIZED,
#             detail="User not logged in",
#         )
#     supabase.auth.sign_out()
#     return {"message": "User logged out"}


@router.put("/change_password", description="Change password of logged in user")
async def change_password(
    supabase: Annotated[Client, Depends(get_supabase)],
    email: Annotated[str, Security(get_current_user)],
    new_password: str,
):
    if not email:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="User not logged in",
        )
    try:
        supabase.auth.update_user({"password": new_password})
        return {"message": "Password updated"}

    except:
        # Password should be at least 6 characters
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Password should be at least 6 characters",
        )


@router.post("/reset_password", description="Send reset password email")
async def reset_password(
    supabase: Annotated[Client, Depends(get_supabase)],
    email: str,
):
    supabase.auth.reset_password_email(
        email, {"redirect_to": "http://localhost:3000/reset-password"}
    )
