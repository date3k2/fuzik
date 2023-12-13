from datetime import date
from pydantic import BaseModel, Field


class GroupBase(BaseModel):
    id: int
    created_at: date


class GroupInfo(BaseModel):
    name: str


class Group(GroupBase, GroupInfo):
    pass
