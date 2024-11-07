PRAGMA foreign_keys = off;
BEGIN TRANSACTION;
-- Table: Songs
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
COMMIT TRANSACTION;
PRAGMA foreign_keys = on;