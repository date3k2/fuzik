from pydantic import BaseModel


class ConcertInfo(BaseModel):
    name: str
    location: str
    description: str | None = None
    start_at: str
    number_of_tickets: int = 0


class Concert(ConcertInfo):
    id: int
    created_at: str
    group_id: int
