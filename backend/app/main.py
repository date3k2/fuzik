from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routers import authentication, users

app = FastAPI()

app.include_router(authentication.router)
app.include_router(users.router)

origins = [
    "http://localhost",
    "http://localhost:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)