from fastapi import (
    APIRouter,
    Depends,
    HTTPException,
    status,
    Security,
)
from models.music import Album, BaseAlbum
from db.supabase_service import get_supabase
from typing import Annotated, List, Tuple
from supabase import Client
from utils.auth import get_id
from fastapi.encoders import jsonable_encoder
from utils.exceptions import BAD_REQUEST

router = APIRouter(tags=["Album"])


@router.post("/create_album", description="Create album")
async def create_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    album: BaseAlbum,
):
    try:
        supabase.table("albums").insert(
            {"name": album.name, "description": album.description, "user_id": user_id}
        ).execute()
        return {"detail": "Album created"}
    except:
        raise BAD_REQUEST


# delete album
@router.delete("/delete_album", description="Delete album")
async def delete_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    album_id: int,
):
    try:
        supabase.table("albums").delete().eq("id", album_id).execute()
        return {"detail": "Album deleted"}
    except:
        raise BAD_REQUEST


# get list of all album
@router.get(
    "/get_all_album", description="Get list of all album", response_model=List[Album]
)
async def get_all_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
) -> List[Album]:
    try:
        res = supabase.table("albums").select("*").execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST


# modify album
@router.patch("/modify_album", description="Modify album")
async def modify_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    album: Album,
    songs: List[int],
):
    try:
        if album.user_id != user_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="You are not the owner of this album",
            )
        supabase.table("albums").update(
            jsonable_encoder(album, exclude={"id", "user_id", "created_at"})
        ).eq("id", album.id).execute()
        supabase.table("songs").update({"album_id": None}).eq(
            "album_id", album.id
        ).execute()
        supabase.table("songs").update({"album_id": album.id}).in_(
            "id", songs
        ).execute()
        return {"detail": "Album modified"}
    except:
        raise BAD_REQUEST


# get album and its songs
@router.get("/get_album", description="Get album and its songs")
async def get_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    album_id: int,
):
    try:
        res = (
            supabase.table("albums")
            .select("*, songs(*)")
            .eq("id", album_id)
            .execute()
            .dict()["data"][0]
        )
        return res
    except:
        raise BAD_REQUEST
