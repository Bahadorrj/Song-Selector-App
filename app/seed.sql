BEGIN TRANSACTION;
-- Table: Songs
INSERT INTO Songs (
        title,
        composer,
        filepath,
        icon
    )
VALUES (
        'Concerto in D Minor, BWV 974',
        'Bach',
        'songs/Concerto in D Minor, BWV 974.mp3',
        'icons/bach.jpg'
    ),
    (
        'Lieder ohne Worte, Op 30 No. 6',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op 30 No. 6 Allegretto In F.mp3',
        'icons/mendelsohn.jpg'
    ),
    (
        'Lieder ohne Worte, Op.19 No. 6',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op.19 No. 6 in G-Minor.mp3',
        'icons/mendelsohn.jpg'
    ),
    (
        'Lieder ohne Worte, Op.30 No. 1',
        'Mendelsohn',
        'songs/Lieder ohne Worte, Op.30 No. 1 in E-Flat Major.mp3',
        'icons/mendelsohn.jpg'
    ),
    (
        'Mazurka Op.17 No.13',
        'Chopin',
        'songs/Mazurka No.13 - Op.17 No.4 - in Am.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Mazurka Op.67 No.4',
        'Chopin',
        'songs/Mazurka No.45 - Op.posth.67 No.4 - in Am.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Nocturne Op.9 No.2',
        'Chopin',
        'songs/Nocturne No.2 - Op.9 No.2 - in Eb.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Nocturne Op.55 No.1',
        'Chopin',
        'songs/Nocturne No.15 - Op.55 No.1 - in Fm.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Nocturne Op.72 No.1Em',
        'Chopin',
        'songs/Nocturne No.19 - Op.posth.72 No.1 - in Em.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Nocturne Op.1 No.16',
        'Chopin',
        'songs/Nocturne No.20 - Op.P1 No.16 - in C#m (BI 49).mp3',
        'icons/chopin.jpg'
    ),
    (
        'Preludes Op. 28 No. 4',
        'Chopin',
        'songs/Preludes Op. 28- No. 4 in E minor.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Valse Op.34 No.2',
        'Chopin',
        'songs/Valse - Op.34 No.2 - in Am.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Valse Op.64 No.2',
        'Chopin',
        'songs/Valse - Op.64 No.2 - in C#m.mp3',
        'icons/chopin.jpg'
    ),
    (
        'Valse Op.69 No.2',
        'Chopin',
        'songs/Valse - Op.posth.69 No.2 - in Bm (BI 35).mp3',
        'icons/chopin.jpg'
    ),
    (
        'Sonata for keyboard K.87',
        'Scarlatti',
        'songs/Sonata for keyboard in B minor, K. 87 (L. 33).mp3',
        'icons/scarlatti.jpg'
    );