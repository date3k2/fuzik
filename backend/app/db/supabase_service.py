from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SECRET_KEY = os.getenv("SUPABASE_SECRET_KEY")
SUPABASE = create_client(SUPABASE_URL, SUPABASE_SECRET_KEY)


def get_supabase():
    return SUPABASE
