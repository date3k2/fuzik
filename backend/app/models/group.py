from pydantic import BaseModel


class GroupBase(BaseModel):
    id: int
    created_at: str


class GroupInfo(BaseModel):
    name: str
    description: str | None = None


class Group(GroupBase, GroupInfo):
    admin_id: str
    members_id: list[str] | None = None
