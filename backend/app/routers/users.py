# from fastapi import APIRouter, Depends, HTTPException, status
# from sqlmodel import Session, select
# from ..models.user import User, UserCreate, UserRead, UserUpdate
# from ..database import get_session

# router = APIRouter()

# @router.post("/users/", response_model=UserRead)
# def create_user(*, session: Session = Depends(get_session), user: UserCreate):
#     db_user = session.exec(select(User).where(User.email == user.email)).first()
#     if db_user:
#         raise HTTPException(
#             status_code=status.HTTP_400_BAD_REQUEST,
#             detail="A user with this email already exists.",
#         )
#     db_user = User.from_orm(user)
#     session.add(db_user)
#     session.commit()
#     session.refresh(db_user)
#     return db_user

# @router.get("/users/{user_id}", response_model=UserRead)
# def read_user(*, session: Session = Depends(get_session), user_id: int):
#     db_user = session.get(User, user_id)
#     if not db_user:
#         raise HTTPException(
#             status_code=status.HTTP_404_NOT_FOUND,
#             detail="This user does not exist in the system.",
#         )
#     return db_user

# @router.put("/users/{user_id}", response_model=UserRead)
# def update_user(*, session: Session = Depends(get_session), user_id: int, user: UserUpdate):
#     db_user = session.get(User, user_id)
#     if not db_user:
#         raise HTTPException(
#             status_code=status.HTTP_404_NOT_FOUND,
#             detail="This user does not exist in the system.",
#         )
#     user_data = user.dict(exclude_unset=True)
#     for key, value in user_data.items():
#         setattr(db_user, key, value)
#     session.add(db_user)
#     session.commit()
#     session.refresh(db_user)
#     return db_user

# @router.delete("/users/{user_id}", response_model=UserRead)
# def delete_user(*, session: Session = Depends(get_session), user_id: int):
#     db_user = session.get(User, user_id)
#     if not db_user:
#         raise HTTPException(
#             status_code=status.HTTP_404_NOT_FOUND,
#             detail="This user does not exist in the system.",
#         )
#     session.delete(db_user)
#     session.commit()
#     return db_user