import os

from flask import Flask
from db import db, init_db_command
from routes import bp


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__)

    if test_config is None:
        app.config.from_mapping(
            {
                "SECRET_KEY": os.getenv("SECRET_KEY"),
                "SQLALCHEMY_DATABASE_URI": os.getenv("DATABASE_URL"),
                "SQLALCHEMY_TRACK_MODIFICATIONS": False,
            }
        )
    else:
        # load the test config if passed in
        app.config.update(test_config)

    db.init_app(app)
    app.cli.add_command(init_db_command)

    # Register blueprints
    app.register_blueprint(bp)

    return app


app = create_app()
