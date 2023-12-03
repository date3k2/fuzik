from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from typing import Annotated
from db.supabase_service import get_supabase
from supabase import Client

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")


def get_user_response(token: str, supabase: Client):
    try:
        return supabase.auth.get_user(token)
    except:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Something went wrong",
        )


async def get_email(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    try:
        res = get_user_response(token, supabase)
        if res is None:
            raise credentials_exception
        email: str = res.user.email
        return email
    except:
        raise credentials_exception


async def get_role(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    try:
        res = get_user_response(token, supabase)
        if res is None:
            raise credentials_exception
        role: str = res.user.user_metadata.get("role", None)
        if not role:
            raise credentials_exception
        return role
    except:
        raise credentials_exception


credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
)
