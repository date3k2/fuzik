from fastapi import APIRouter, Depends, Security,HTTPException,status
from typing import Annotated
from fastapi.encoders import jsonable_encoder
from supabase import Client
from db.supabase_service import get_supabase
from typing import Annotated
from supabase import Client
from utils.auth import get_id
from utils.exceptions import BAD_REQUEST, UNAUTHORIZED
from models.concert import  ConcertInfo


router = APIRouter(tags=["Concert"], prefix="/concert")


# create concert
@router.post("")
async def create_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_info: ConcertInfo,
):
    """
    Create concert
    - **name**: each concert must have a name
    - **location**: the location concert will be hold
    - **description**: a long description about this concert
    - **start_at**: the time concert start
    - **number_of_tiket**: number ticket of this concert
    """ 
    group_id = supabase.rpc("get_group_id", {"user_id": user_id}).execute().data
    if group_id == None:
        raise UNAUTHORIZED
    try:
        supabase.table("concerts").insert(
            {
                "name": concert_info.name,
                "location": concert_info.location,
                "description": concert_info.description,
                "start_at": concert_info.start_at,
                "group_id":group_id,
                "number_of_tickets":concert_info.number_of_tickets
            }
        ).execute()
        return {"detail": "Concert created"}
    except:
        raise BAD_REQUEST


#user get list of all concert
@router.get("/get_all", description="Get list of all concert")
async def get_all_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
):
    try:
        res = supabase.table("concerts").select("*").execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST

#get list of your group concert
@router.get("/get_group_concert", description="Get list of your group concert")
async def get_all_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
):
    group_id = supabase.rpc("get_group_id", {"user_id": user_id}).execute().data
    if group_id == None:
        raise UNAUTHORIZED

    try:
        res = supabase.table("concerts").select("*").match({"group_id" : group_id}).execute().dict()["data"]
        return res
    except:
        raise BAD_REQUEST

# modify concert
@router.put("")
async def modify_concert(
    supabase: Annotated[Client, Depends(get_supabase)],
    user_id: Annotated[str, Security(get_id)],
    concert_info: ConcertInfo,
    concert_id: int
):
    """
    Change concert infomation
    - **concert_id**: id of concert your group manage

    - **name**: new name of concert
    - **location**: new location concert will be hold
    - **description**: new description about this group
    - **start_at**: new time concert start
    - **number_of_tiket**: number ticket of this concert
    """ 
    group_id = supabase.rpc("get_group_id", {"user_id": user_id}).execute().data
    if group_id == None:
        raise UNAUTHORIZED
    
    
    if supabase.table("concerts").select("*").match({"group_id" : group_id,"id": concert_id}).execute().data ==[]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="This concert isn't manage by your group",
        )
    try:
        supabase.table("concerts").update(jsonable_encoder(concert_info)).eq(
            "id", concert_id
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
    """
    Delete concert
    - **concert_id**: id of concert your group manage
    """ 
    group_id = supabase.rpc("get_group_id", {"user_id": user_id}).execute().data
    if group_id == None:
        raise UNAUTHORIZED
    
    
    if supabase.table("concerts").select("*").match({"group_id" : group_id,"id": concert_id}).execute().data ==[]:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="This concert isn't manage by your group",
        )
    
    try:
        supabase.table("concerts").delete().eq("id", concert_id).execute()
        return {"detail": "Concert deleted"}
    except:
        raise BAD_REQUEST
