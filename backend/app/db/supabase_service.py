from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()

# SUPABASE_URL = os.getenv("SUPABASE_URL")
# SUPABASE_SECRET_KEY = os.getenv("SUPABASE_SECRET_KEY")

SUPABASE_URL = "https://lakewjtjnwmihctodrow.supabase.co"
SUPABASE_SECRET_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxha2V3anRqbndtaWhjdG9kcm93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0MTgwMTMsImV4cCI6MjAxMzk5NDAxM30.6UI7vAzZXZFoSXPaJ2v8LQYpHmzAAuBVykWXV8lMLEA"
SUPABASE = create_client(SUPABASE_URL, SUPABASE_SECRET_KEY)



def get_supabase():
    return SUPABASE



