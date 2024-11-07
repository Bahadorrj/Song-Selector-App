-- First, drop tables if they exist (in correct order due to dependencies)
DROP TABLE IF EXISTS responds;
DROP TABLE IF EXISTS songs;
-- Create tables with proper PostgreSQL conventions
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) UNIQUE NOT NULL,
    composer VARCHAR(100) NOT NULL,
    filepath VARCHAR(255) UNIQUE NOT NULL,
    icon VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE responds (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);