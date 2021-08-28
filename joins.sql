-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > .99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM customer c
JOIN invoice i
ON c.customer_id = i.customer_id;

-- Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.
SELECT c.first_name AS customer_first_name,
c.last_name AS customer_last_name,
e.first_name AS support_rep_first_name,
e.last_name AS support_rep_last_name
FROM customer c
JOIN employee e
ON c.support_rep_id = e.employee_id;

-- Get the album title and the artist name from all albums.
SELECT album.title, artist.name
FROM album
JOIN artist
ON album.artist_id = artist.artist_id;

-- Get all playlist_track track_ids where the playlist name is Music.
SELECT playlist_track.track_id
FROM playlist_track
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music';

-- Get all track names for playlist_id 5.
SELECT track.name
FROM track
JOIN playlist_track
ON track.track_id = playlist_track.track_id
WHERE playlist_track.playlist_id = 5;

-- Get all track names and the playlist name that they're on ( 2 joins ).
SELECT track.name, playlist.name
FROM track
JOIN playlist_track
ON track.track_id = playlist_track.track_id
JOIN playlist
ON playlist.playlist_id = playlist_track.playlist_id;

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT track.name, album.title
FROM track
JOIN album
ON album.album_id = track.album_id
JOIN genre
ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk';