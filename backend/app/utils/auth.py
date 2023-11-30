from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from typing import Annotated
from db.supabase_service import get_supabase
from supabase import Client

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")


async def get_current_user(
    token: Annotated[str, Depends(oauth2_scheme)],
    supabase: Annotated[Client, Depends(get_supabase)],
):
    try:
        payload = supabase.auth.get_user(token)
        email: str = payload.user.email
        role: str = payload.user.user_metadata.get("role", None)
        if email is None or role is None:
            raise credentials_exception
        return email, role
    except:
        raise credentials_exception


credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
)
