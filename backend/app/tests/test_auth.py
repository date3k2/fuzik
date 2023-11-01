import pytest
from fastapi.testclient import TestClient
from sqlmodel import Session, SQLModel, create_engine
from sqlmodel.pool import StaticPool

from ..main import app
from ..models.user import User
from ..routers.authentication import get_password_hash

def test_authenticate_user():
    engine = create_engine("sqlite://", connect_args={"check_same_thread": False}, poolclass=StaticPool)
    with Session(engine) as session:
        # Create a test user
        test_user = User(username="testuser", email="testuser@example.com", hashed_password=get_password_hash("testpassword"))
        session.add(test_user)
        session.commit()

    client = TestClient(app)
    response = client.post(
        "/token",
        data={
            "username": "testuser",
            "password": "testpassword",
        },
    )

    assert response.status_code == 200, response.text
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"

def test_authenticate_user_incorrect_password():
    client = TestClient(app)
    response = client.post(
        "/token",
        data={
            "username": "testuser",
            "password": "wrongpassword",
        },
    )

    assert response.status_code == 400
    assert response.json() == {"detail": "Incorrect username or password"}

def test_authenticate_user_nonexistent_user():
    client = TestClient(app)
    response = client.post(
        "/token",
        data={
            "username": "nonexistent",
            "password": "testpassword",
        },
    )

    assert response.status_code == 400
    assert response.json() == {"detail": "Incorrect username or password"}