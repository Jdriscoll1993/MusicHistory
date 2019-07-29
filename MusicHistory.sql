--First Look at Queries

--Query all of the entries in the Genre table
SELECT * 
FROM Artist;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) 
VALUES ('RTG', 2017);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('Magnificent Creatures', '03/03/2018', 2000, 'Independent', 30, 13);

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Cant Keep Up', 180, '03/03/2018', 13, 30, 26 );

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Flame Igniter', 180, '03/03/2018', 13, 30, 26 );

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Game Over', 180, '03/03/2018', 13, 30, 26 );

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT ar.Id AS ArtistId, ar.ArtistName, s.ArtistId AS 'ArtistId on Song', s.Title AS SongTitle, al.Title AS AlbumTitle
FROM Artist ar
JOIN Album al ON al.ArtistId = ar.Id 
JOIN Song s ON s.ArtistId = ar.Id;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.AlbumId, COUNT(s.Title) as SongCount
FROM Song s
GROUP BY AlbumId;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.ArtistId, COUNT(s.Title) as SongCount
FROM Song s 
GROUP BY ArtistId;
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
-- GROUP BY is taking all the songs within a particular genre and putting them into a group
SELECT s.GenreId, COUNT(s.Title) as SongCount
FROM Song s
GROUP BY GenreId;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
--Inner Query in parens. Inner Query runs first.
SELECT al.Title, al.AlbumLength
FROM Album al 
WHERE al.AlbumLength = (SELECT MAX(AlbumLength)as MaxAlbumLength
FROM Album);
--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, s.SongLength
FROM Song s
WHERE s.SongLength = (SELECT MAX(SongLength) as MaxSongLength
FROM Song);

--Modify the previous query to also display the title of the album.
SELECT s.Title as SongTitle, s.SongLength, a.Title as AlbumTitle
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
WHERE s.SongLength = (SELECT MAX(SongLength) as MaxSongLength
FROM Song);
