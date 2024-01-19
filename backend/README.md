# Backend

This is the backend of the mobile application. It is built with FastAPI and Supabase.

## Getting Started

To get started with the backend, follow these steps:

1. Install the required Python packages:

```bash
$ cd backend/app
$ pip install -r requirements.txt
```

2. Set up your environment variables in the `.env` file. You will need to provide your Supabase URL and secret key.

3. Run the FastAPI application with host and port of your choice:, example:

```bash
$ uvicorn main:app --host 127.0.0.1 --port 5000 --reload
```

## Structure

The backend is structured as follows:

- `app/`: This directory contains the FastAPI application.
  - `main.py`: This is the main entry point of the FastAPI application.
  - `models/`: This directory contains the SQLModel models.
  - `routers/`: This directory contains the FastAPI routers.
  - `tests/`: This directory contains tests for the FastAPI application.
  - `db/`: This directory contains the Supabase service.

## Testing

To run the tests, use the following command:

```bash
pytest
```

## Documentation

FastAPI provides automatic interactive API documentation. Once the application is running, you can view the documentation at `http://127.0.0.1:5000/docs`.

## Security

The application uses token-based authentication for security. The tokens are generated and validated using the `routers/authentication.py` router.

## Database

The application uses Supabase as the backend and SQLModel as the ORM. The Supabase service is set up in `db/supabase_service.py`.
