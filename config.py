import os


class Config:
    DATABASE = "instance/songs.db"
    SECRET_KEY = "dev"
    # SECRET_KEY = os.environ.get("SECRET_KEY")
    # SQLALCHEMY_DATABASE_URI = "sqlite:///instance/flaskr.sqlite"
    # SQLALCHEMY_TRACK_MODIFICATIONS = False
