--
-- File generated with SQLiteStudio v3.4.4 on Sun Nov 3 22:00:51 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;
-- Table: Songs
DROP TABLE IF EXISTS Songs;
CREATE TABLE IF NOT EXISTS Songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT UNIQUE NOT NULL,
    composer TEXT NOT NULL,
    filepath TEXT UNIQUE NOT NULL,
    icon TEXT NOT NULL
);
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        1,
        'Concerto in D Minor, BWV 974',
        'Bach',
        'songs/Concerto in D Minor, BWV 974.mp3',
        'icons/bach.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        2,
        'Lieder ohne Worte, Op 30 No. 6',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op 30 No. 6 Allegretto In F.mp3',
        'icons/mendelsohn.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        3,
        'Lieder ohne Worte, Op.19 No. 6',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op.19 No. 6 in G-Minor.mp3',
        'icons/mendelsohn.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        4,
        'Lieder ohne Worte, Op.30 No. 1',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op.30 No. 1 in E-Flat Major.mp3',
        'icons/mendelsohn.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        5,
        'Mazurka Op.17 No.13',
        'Chopin',
        'songs/Mazurka No.13 - Op.17 No.4 - in Am.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        6,
        'Mazurka Op.67 No.4',
        'Chopin',
        'songs/Mazurka No.45 - Op.posth.67 No.4 - in Am.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        7,
        'Nocturne Op.9 No.2',
        'Chopin',
        'songs/Nocturne No.2 - Op.9 No.2 - in Eb.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        8,
        'Nocturne Op.55 No.1',
        'Chopin',
        'songs/Nocturne No.15 - Op.55 No.1 - in Fm.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        9,
        'Nocturne Op.72 No.1Em',
        'Chopin',
        'songs/Nocturne No.19 - Op.posth.72 No.1 - in Em.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        10,
        'Nocturne Op.1 No.16',
        'Chopin',
        'songs/Nocturne No.20 - Op.P1 No.16 - in C#m (BI 49).mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        11,
        'Preludes Op. 28 No. 4',
        'Chopin',
        'songs/Preludes Op. 28- No. 4 in E minor.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        12,
        'Valse Op.34 No.2',
        'Chopin',
        'songs/Valse - Op.34 No.2 - in Am.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        13,
        'Valse Op.64 No.2',
        'Chopin',
        'songs/Valse - Op.64 No.2 - in C#m.mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        14,
        'Valse Op.69 No.2',
        'Chopin',
        'songs/Valse - Op.posth.69 No.2 - in Bm (BI 35).mp3',
        'icons/chopin.jpg'
    );
INSERT INTO Songs (
        id,
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        15,
        'Sonata for keyboard K.87',
        'Scarlatti',
        'songs/Sonata for keyboard in B minor, K. 87 (L. 33).mp3',
        'icons/scarlatti.jpg'
    );
COMMIT TRANSACTION;
PRAGMA foreign_keys = on;