from pydantic import BaseModel


class Song(BaseModel):
    id: int
    name: str
    created_at: str
    user_id: str
    name_in_storage: str
    description: str | None
    lyric: str | None


class BaseAlbum(BaseModel):
    name: str
    description: str | None


class Album(BaseAlbum):
    id: int
    created_at: str
    user_id: str
