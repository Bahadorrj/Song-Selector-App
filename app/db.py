import click
from flask import g, current_app
from flask.cli import with_appcontext
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

db = SQLAlchemy()


def get_db():
    if "db" not in g:
        g.db = db
    return g.db


def init_db():
    db = get_db()
    # Check if table exists using PostgreSQL's information_schema
    result = db.session.execute(
        text(
            "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'Songs')"
        )
    ).scalar()
    if result:
        return
    try:
        # Execute schema and seed files
        with current_app.open_resource("schema.sql") as f:
            db.session.execute(text(f.read().decode("utf8")))
        with current_app.open_resource("seed.sql") as f:
            db.session.execute(text(f.read().decode("utf8")))
        # Commit the changes
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        click.echo(f"Error initializing database: {str(e)}", err=True)
        raise


@click.command("init-db")
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo("Initialized the database.")
