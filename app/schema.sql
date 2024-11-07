DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Songs;

CREATE TABLE Songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT UNIQUE NOT NULL,
    composer TEXT NOT NULL,
    filepath TEXT UNIQUE NOT NULL,
    icon TEXT NOT NULL
);

CREATE TABLE Responds (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    song_id INTEGER NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Songs (id)
);