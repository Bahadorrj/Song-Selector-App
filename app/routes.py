from collections import defaultdict
import sqlite3
import mimetypes
from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from app.db import get_db

mimetypes.add_type("audio/mpeg", ".mp3")
mimetypes.add_type("audio/wav", ".wav")

bp = Blueprint("main", __name__)


@bp.route("/")
def index():
    db = get_db()
    songs = db.execute("SELECT * FROM Songs").fetchall()
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
            db.execute(
                "INSERT INTO Responds (username, song_id) VALUES (?, ?)",
                (username, song_id),
            )
            db.commit()

            # Get the song title for the thank you page
            song = db.execute(
                "SELECT title FROM Songs WHERE id = ?", (song_id,)
            ).fetchone()

            # Redirect to thank you page with the username and song title
            return render_template(
                "success.html",
                user=username,
                song_title=song["title"] if song else "selected song",
            )

        except sqlite3.Error as e:
            # If there's a database error, redirect back to index
            flash(f"An error occurred: {str(e)}")
            return redirect(url_for("main.index"))

    # If someone tries to access success page directly, redirect to index
    return redirect(url_for("main.index"))


@bp.route("/responses", methods=["GET"])
def get_responses():
    conn = get_db()
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Responds")
    responds = cursor.fetchall()
    responds_data = [dict(row) for row in responds]

    cursor.execute("SELECT * FROM Songs")
    songs = cursor.fetchall()
    songs_data = [dict(row) for row in songs]

    conn.close()

    counter = defaultdict(int)
    for respond in responds_data:
        key = next(
            song_data
            for song_data in songs_data
            if song_data["id"] == respond["song_id"]
        ).get("title")
        counter[key] += 1
    return jsonify(counter)
