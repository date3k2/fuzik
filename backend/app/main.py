from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import authentication, users, group_admin

app = FastAPI(debug=True)

app.include_router(authentication.router)
app.include_router(users.router)
app.include_router(group_admin.router)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return {"Hello": "World"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("main:app", host="127.0.0.1", port=5000, reload=True)
