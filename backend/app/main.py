from fastapi.responses import RedirectResponse
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import authentication, users, group_admin, song, album, concert, playlist

app = FastAPI()

app.include_router(authentication.router)
app.include_router(users.router)
app.include_router(group_admin.router)
app.include_router(song.router)
app.include_router(album.router)
app.include_router(concert.router)
app.include_router(playlist.router)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return RedirectResponse(url="/docs")
