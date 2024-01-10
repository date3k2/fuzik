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


@router.post("/create",)
async def create_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist: BasePlaylist,
):
    """
    Create playlist
    - **name**: each playlist must have a name
    """ 
    try:
        supabase.table("playlist").insert(
            {"name": playlist.name, "song_id" : [], "user_id": user_id}
        ).execute()
        return {"detail": "Playlist created"}
    except:
        raise BAD_REQUEST
    

@router.delete("/delete",)
async def delete_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist_id: int,
):
    """
    Delete playlist
    - **playlist_id**: id of playlist you want to delete
    """ 
    if supabase.table("playlist").select("*").match({"id" : playlist_id,"user_id": user_id}).execute().data ==[]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="This playlist isn't manage by you",
        )
    try:
        supabase.table("playlist").delete().eq("id", playlist_id).execute()
        return {"detail": "Playlist deleted"}
    except:
        raise BAD_REQUEST

# get list of all your playlist      
@router.get("/all", description="Get list of your playlist", response_model=List[Playlist])
async def get_all_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
) -> List[Playlist]:
    try:
        
        res = supabase.table("playlist").select("*").match({"user_id" : user_id}).execute().data
        return res
    except:
        raise BAD_REQUEST

# modify playlist
@router.patch("/modify/{playlist_id}", )
async def modify_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist_id: int,
    playlist: BasePlaylist,
    songs: List[int],
):    
    """
    Modify playlist
    - **playlist_id**: id of playlist you want to update
    - **name**: new name of playlist
    - **songs**: the new list song of playlist
    """ 
    if supabase.table("playlist").select("*").match({"user_id" : user_id,"id": playlist_id}).execute().data ==[]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="This playlist isn't manage by you or not exist",
        )
    
    try:
        supabase.table("playlist").update( { "name": playlist.name}).eq("id", playlist_id).execute()
        supabase.table("playlist").update({ "song_id": songs }).eq("id", playlist_id).execute()

        return {"detail": "Playlist modified"}
    except:
        raise BAD_REQUEST
    



# get playlist and its songs
@router.get("/{playlist_id}",)
async def get_playlist(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    playlist_id: int,
):
    """
    Get detail playlist and its songs
    - **playlist_id**: id of playlist you want to get detail
    """ 
    try:
        res = (
            supabase.table("playlist")
            .select("id,name,created_at,song_id")
            .eq("id", playlist_id)
            .execute()
            .dict()["data"]
        )
        for i in range( len(res[0]["song_id"])):
            res[0]["song_id"][i] = supabase.table("songs").select("*").eq("id", res[0]["song_id"][i]).execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST
