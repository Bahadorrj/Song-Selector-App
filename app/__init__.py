from flask import Flask
from config import Config


def create_app(test_config=None):
    # create and configure the app
    app = Flask(
        __name__,
        template_folder="../templates/",
        static_folder="../static/",
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_object(Config)
    else:
        # load the test config if passed in
        app.config.update(test_config)

    from .db import db, init_db_command

    db.init_app(app)
    app.cli.add_command(init_db_command)

    # Register blueprints
    from . import routes

    app.register_blueprint(routes.bp)

    return app
