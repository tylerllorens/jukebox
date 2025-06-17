
DROP TABLE IF EXISTS playlists;
DROP TABLE IF EXISTS playlist_tracks;
DROP TABLE IF EXISTS tracks;


CREATE TABLE playlists (
    id serial PRIMARY KEY,
    name text NOT NULL,
    description text NOT NULL
);

CREATE TABLE playlist_tracks (
    id serial PRIMARY KEY,
    playlist_id integer UNIQUE NOT NULL REFERENCES playlists(id) ON DELETE CASCADE,
    track_id integer UNIQUE NOT NULL REFERENCES tracks(id) ON DELETE CASCADE
);

CREATE TABLE tracks (
    id serial PRIMARY KEY,
    name text NOT NULL,
    duration_ms integer NOT NULL 
);

/*Done */