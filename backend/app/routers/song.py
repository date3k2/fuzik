from fastapi import (
    APIRouter,
    Depends,
    HTTPException,
    UploadFile,
    status,
    Security,
)
from models.music import Song
from db.supabase_service import get_supabase
from typing import Annotated, List, Tuple
from supabase import Client
from utils.auth import get_id
from fastapi.encoders import jsonable_encoder
from utils.exceptions import BAD_REQUEST

router = APIRouter(tags=["Song"], prefix="/song")


# upload mp3 file to supabase storage
@router.post("", )
async def upload_music(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    music: UploadFile,
    name: str | None = None,
):
    """
    Upload music file
    - **name**: each song must have a name
    - **music**: a file mp3 song
    """ 
    if music.content_type != "audio/mpeg":
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Only mp3 file is accepted",
        )
    try:
        if not name:
            name = music.filename
        f = await music.read()
        supabase.storage.from_("songs").upload(
            path=music.filename, file=f, file_options={"content-type": "audio/mpeg"}
        )
        supabase.table("songs").insert(
            {"name": name, "name_in_storage": music.filename, "user_id": id}
        ).execute()
        return {"detail": "Music uploaded"}
    except:
        raise BAD_REQUEST


# get url of music file from supabase storage
@router.get("/link", description="Get url of music file")
async def get_link_to_music(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    name_in_storage: str,
):
    try:
        res = supabase.storage.from_("songs").create_signed_url(
            path=name_in_storage, expires_in=3600
        )
        return res
    except:
        raise BAD_REQUEST


# get list of all song from search
@router.get(
    "/search", description="Get list of all music", response_model=List[Song]
)
async def get_music(
    supabase: Annotated[Client, Depends(get_supabase)],
    id: Annotated[str, Security(get_id)],
    query: str | None = None,
) -> List[Song]:
    try:
        if query:
            res = (
                supabase.table("songs")
                .select("*")
                .ilike("name", f"%{query}%")
                .execute()
                .dict()["data"]
            )
        else:
            res = supabase.table("songs").select("*").execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST


# delete song
@router.delete("", description="Delete music")
async def delete_music(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    song: Song,
):
    try:
        if song.user_id != user_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="You are not the owner of this music",
            )
        supabase.storage.from_("songs").remove([song.name_in_storage])
        supabase.table("songs").delete().eq("id", song.id).execute()
        return {"detail": "Music deleted"}
    except:
        raise


# change music info
@router.patch("/info", description="Change music info")
async def change_music_info(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    song: Song,
):
    try:
        if song.user_id != user_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="You are not the owner of this music",
            )
        supabase.table("songs").update(
            jsonable_encoder(
                song, exclude={"id", "user_id", "created_at", "name_in_storage"}
            )
        ).eq("id", song.id).execute()
        return {"detail": "Music info updated"}
    except:
        raise BAD_REQUEST
