FROM python:3

WORKDIR /app

COPY  requirements.txt .

RUN pip install -r requirements.txt

ENV SUPABASE_URL='https://lakewjtjnwmihctodrow.supabase.co'
ENV SUPABASE_SECRET_KEY='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxha2V3anRqbndtaWhjdG9kcm93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0MTgwMTMsImV4cCI6MjAxMzk5NDAxM30.6UI7vAzZXZFoSXPaJ2v8LQYpHmzAAuBVykWXV8lMLEA'

CMD ["uvicorn", "main:app", "--host", "127.0.0.1", "--port", "8000"]