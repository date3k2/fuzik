# Fuzik 

This is a mobile application for ordering concert ticket and listening music built using Flutter for the frontend and FastAPI, Supabase for the backend.

## Project Structure

The project is divided into two main parts: the frontend and the backend.

### Frontend

The frontend is built using Flutter. The main entry point of the application is `lib/main.dart`. The `screens` directory contains the different screens of the application, and the `services` directory contains the services used in the application, such as the authentication service. The `widgets` directory contains reusable widgets used across the application.

### Backend

The backend is built using FastAPI and Supabase. The main entry point of the FastAPI application is `fastapi_app/main.py`. The `models` directory contains the SQLModel definitions, and the `routers` directory contains the route definitions for the application. The `tests` directory contains tests for the application.

The `supabase` directory contains the setup for the Supabase client, which is used to interact with the Supabase backend.

## Setup

To set up the project, follow these steps:

1. Clone the repository.
2. Install the dependencies listed in `frontend/pubspec.yaml` for the frontend and `backend/requirements.txt` for the backend.
3. Set up the environment variables in `backend/.env`.
4. Run the FastAPI application using `uvicorn fastapi_app.main:app`.
5. Run the Flutter application using `flutter run`.

For more detailed setup instructions, refer to the `README.md` files in the `frontend` and `backend` directories.
```
This `README.md` file provides a brief overview of the project, its structure, and basic setup instructions. For more detailed information, users are directed to the `README.md` files in the `frontend` and `backend` directories.