from enum import Enum


class Role(str, Enum):
    user = "user"
    admin = "admin"
    group_admin = "group_admin"


class Gender(Enum):
    male = 0
    female = 1
    other = 2
