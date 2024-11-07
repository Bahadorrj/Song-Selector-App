from collections import defaultdict
import mimetypes
from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from sqlalchemy import text
from db import get_db

mimetypes.add_type("audio/mpeg", ".mp3")
mimetypes.add_type("audio/wav", ".wav")

bp = Blueprint("main", __name__)


@bp.route("/")
def index():
    db = get_db()
    songs = db.session.execute(text("SELECT * FROM Songs")).fetchall()
    return render_template("index.html", songs=songs)


@bp.route("/success", methods=["POST"])
def success():
    if request.method == "POST":
        username = request.form.get("user")
        song_id = request.form.get("song_id")
        if not song_id:
            flash("Please select a song")
            return redirect(url_for("main.index"))

        if not username:
            # If data is missing, redirect back to index with an error
            flash("Please fill in all fields")
            return redirect(url_for("main.index"))

        db = get_db()
        try:
            # Insert the response into the database
            db.session.execute(
                text(
                    "INSERT INTO Responds (username, song_id) VALUES (:username, :song_id)"
                ),
                {"username": username, "song_id": song_id},
            )
            db.session.commit()

            # Get the song title for the thank you page
            song = db.session.execute(
                text("SELECT title FROM Songs WHERE id = :song_id"),
                {"song_id": song_id},
            ).fetchone()

            # Redirect to thank you page with the username and song title
            return render_template(
                "success.html",
                user=username,
                song_title=song[0] if song else "selected song",
            )

        except Exception as e:
            # If there's a database error, redirect back to index
            raise e
            # flash(f"An error occurred: {str(e)}")
            # return redirect(url_for("main.index"))

    # If someone tries to access success page directly, redirect to index
    return redirect(url_for("main.index"))


@bp.route("/responses", methods=["GET"])
def get_responses():
    db = get_db()

    # Get all responses and songs using SQLAlchemy
    responds = db.session.execute(text("SELECT * FROM Responds")).fetchall()
    songs = db.session.execute(text("SELECT * FROM Songs")).fetchall()

    # Convert results to dictionaries
    responds_data = [dict(row._mapping) for row in responds]
    songs_data = [dict(row._mapping) for row in songs]

    counter = defaultdict(int)
    for respond in responds_data:
        key = next(
            song_data
            for song_data in songs_data
            if song_data["id"] == respond["song_id"]
        ).get("title")
        counter[key] += 1
    return jsonify(counter)
