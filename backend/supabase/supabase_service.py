from supabase_py import create_client, Client
from dotenv import load_dotenv
import os

load_dotenv()

SUPABASE_URL = os.getenv('SUPABASE_URL')
SUPABASE_SECRET_KEY = os.getenv('SUPABASE_SECRET_KEY')

supabase: Client = create_client(SUPABASE_URL, SUPABASE_SECRET_KEY)