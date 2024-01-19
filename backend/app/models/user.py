from typing import Optional
from pydantic import BaseModel, Field
from datetime import date
from .enums import Gender, Role


class UserBase(BaseModel):
    email: str = Field(description="Email of user", example="datvip@gmail.com")


class UserLogin(UserBase):
    password: str


class UserInfo(BaseModel):
    name: str
    birthdate: date | None = Field(example="2000-01-01")
    phone_number: str | None = Field(example="0382929292")
    gender: Gender
    role: Role = Role.user


class UserSignup(UserLogin, UserInfo):
    pass


class User(UserBase, UserInfo):
    pass
