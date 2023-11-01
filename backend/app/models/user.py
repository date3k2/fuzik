from sqlmodel import SQLModel, Field
from typing import Optional

class UserBase(SQLModel):
    username: str 
    email: str 

class User(UserBase, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    hashed_password: str

class UserCreate(UserBase):
    password: str

class UserRead(UserBase):
    id: int

class UserUpdate(UserBase):
    password: str | None = None