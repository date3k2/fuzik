from typing import Optional
from pydantic import BaseModel


class UserLogin(BaseModel):
    email: str
    password: str


class UserInfo(BaseModel):
    name: str
    gender: int
    role: str
    balance: int = 0


class UserSignup(UserLogin, UserInfo):
    pass
