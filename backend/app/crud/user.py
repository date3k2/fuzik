from supabase import Client
from utils.auth import get_user_response
from models.user import User


async def update_user(
    supabase: Client, email: str = None, password: str = None, data: dict = None
):
    info = {}
    if email:
        info["email"] = email
    if password:
        info["password"] = password
    if data:
        info["data"] = data
    supabase.auth.update_user(info)
    return True


async def get_user(supabase: Client, token: str):
    user_response = get_user_response(token, supabase)
    if user_response:
        return User(email=user_response.user.email, **user_response.user.user_metadata)
    else:
        return None
