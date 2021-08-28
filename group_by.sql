-- Find a count of how many tracks there are per genre. Display the genre name with the count.
SELECT genre.name, count(*) FROM track
JOIN genre ON genre.genre_id = track.genre_id
GROUP BY genre.genre_id


-- Find a count of how many tracks are the "Pop" genre and how many tracks are the "Rock" genre.
SELECT genre.name, count(*) FROM track
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name

-- Find a list of all artists and how many albums they have.
SELECT artist.name, count(*) FROM album
JOIN artist ON album.artist_id = artist.artist_id
GROUP BY artist.name