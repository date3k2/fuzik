from fastapi import APIRouter, Depends, Security
from typing import Annotated
from fastapi.encoders import jsonable_encoder
from supabase import Client
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_id
from utils.exceptions import BAD_REQUEST
from models.concert import ConcertInfo

router = APIRouter(tags=["Concert"], prefix="/concert")


# create concert
@router.post("", description="Create concert")
async def create_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_info: ConcertInfo,
):
    try:
        supabase.table("concerts").insert(jsonable_encoder(concert_info)).execute()
        return {"detail": "Concert created"}
    except:
        raise BAD_REQUEST


# get list of all concert
@router.get("/all", description="Get list of all concert")
async def get_all_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
):
    try:
        res = supabase.table("concerts").select("*").execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST


# modify concert
@router.put("", description="Modify concert")
async def modify_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_info: ConcertInfo,
):
    try:
        supabase.table("concerts").update(jsonable_encoder(concert_info)).eq(
            "id", concert_info.id
        ).execute()
        return {"detail": "Concert modified"}
    except:
        raise BAD_REQUEST


# delete concert
@router.delete("", description="Delete concert")
async def delete_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_id: int,
):
    try:
        supabase.table("concerts").delete().eq("id", concert_id).execute()
        return {"detail": "Concert deleted"}
    except:
        raise BAD_REQUEST
