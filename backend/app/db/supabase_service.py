from supabase import create_client


SUPABASE_URL = ""
SUPABASE_SECRET_KEY = ""
SUPABASE = create_client(SUPABASE_URL, SUPABASE_SECRET_KEY)


def get_supabase():
    return SUPABASE
