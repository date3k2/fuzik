FROM python:3.11.7-bookworm

WORKDIR /app

COPY ./app/ .

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

ENV SUPABASE_URL='https://lakewjtjnwmihctodrow.supabase.co'
ENV SUPABASE_SECRET_KEY='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxha2V3anRqbndtaWhjdG9kcm93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0MTgwMTMsImV4cCI6MjAxMzk5NDAxM30.6UI7vAzZXZFoSXPaJ2v8LQYpHmzAAuBVykWXV8lMLEA'
EXPOSE 5000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]