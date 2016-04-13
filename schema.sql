DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS songs;

CREATE TABLE artists (
  id PRIMARY KEY (int),
  name TEXT,
  photo_url TEXT,
  nationality TEXT
);

CREATE TABLE songs (
  id PRIMARY KEY (int),
  title TEXT,
  album TEXT,
  preview_url TEXT,
  artist_id FOREIGN KEY (int),
  instructor_id INT
);
