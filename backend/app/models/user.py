from typing import Optional
from pydantic import BaseModel
from datetime import date
from .enums import Gender, Role


class UserLogin(BaseModel):
    email: str
    password: str


class UserInfo(BaseModel):
    name: str
    birthdate: Optional[date]
    phone_number: Optional[str]
    gender: Gender
    role: Role = Role.user


class UserSignup(UserLogin, UserInfo):
    pass
