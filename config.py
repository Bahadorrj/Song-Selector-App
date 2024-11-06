import os

from sqlalchemy.engine import URL


def create_db_url() -> URL:
    """Create database URL from environment variables."""
    try:
        return URL.create(
            drivername="postgresql",
            username=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            host=os.getenv("DB_HOST"),
            port=int(os.getenv("DB_PORT")),
            database=os.getenv("DB_NAME"),
        )
    except Exception:
        return None


class Config:
    SECRET_KEY = os.getenv("SECRET_KEY")
    SQLALCHEMY_DATABASE_URI = create_db_url()
    SQLALCHEMY_TRACK_MODIFICATIONS = False
