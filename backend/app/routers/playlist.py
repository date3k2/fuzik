from fastapi import (
    APIRouter,
    Depends,
    HTTPException,
    status,
    Security,
)
from models.music import Playlist, BasePlaylist
from db.supabase_service import get_supabase
from typing import Annotated, List
from supabase import Client
from utils.auth import get_id
from fastapi.encoders import jsonable_encoder
from utils.exceptions import BAD_REQUEST

router = APIRouter(tags=["Playlist"], prefix="/playlist")


@router.post("", description="Create playlist")
async def create_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist: BasePlaylist,
):
    try:
        supabase.table("playlist").insert(
            {"name": playlist.name, "song_id" : [], "user_id": user_id}
        ).execute()
        return {"detail": "Playlist created"}
    except:
        raise BAD_REQUEST
    

@router.delete("", description="Delete playlist")
async def delete_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist_id: int,
):
    try:
        supabase.table("playlist").delete().eq("id", playlist_id).execute()
        return {"detail": "Album deleted"}
    except:
        raise BAD_REQUEST

# get list of all your playlist      
@router.get("/all", description="Get list of your playlist", response_model=List[Playlist])
async def get_all_album(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
) -> List[Playlist]:
    try:
        
        res = supabase.table("playlist").select("*").match({"user_id" : user_id}).execute().data
        return res
    except:
        raise BAD_REQUEST

# modify playlist
@router.patch("", description="Modify playlist")
async def modify_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist: Playlist,
    songs: List[int],
):
    
    if playlist.user_id != user_id:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="You are not the owner of this playlist",
            )
    try:
        supabase.table("playlist").update(
            jsonable_encoder(playlist, exclude={"id", "user_id", "created_at"})
        ).eq("id", playlist.id).execute()

        supabase.table("playlist").update({ "song_id": songs }).eq("id", playlist.id).execute()

        return {"detail": "Playlist modified"}
    except:
        raise BAD_REQUEST
    



# get playlist and its songs
@router.get("/{playlist_id}", description="Get playlist and its songs")
async def get_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist_id: int,
):
    try:
        res = (
            supabase.table("playlist")
            .select("*")
            .eq("id", playlist_id)
            .execute()
            .dict()["data"]
        )
        return res
    except:
        raise BAD_REQUEST
