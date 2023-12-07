Retrieve all tracks with their corresponding artist and album names.


SELECT Track.Name AS Trackname, Artist.Name AS ArtistName, Album.Title AS AlbumTitle
FROM Track
JOIN Album ON Track.Album_Id = Album.Album_Id
JOIN Artist ON Album.Artist_Id = Artist.Artist_Id;





--> Find the top 5 most purchased genres and the total number of tracks sold within each genre.


SELECT genre.name, COUNT(track.track_id) AS Nooftrcakssold
FROM genre
JOIN track ON genre.genre_id = track.genre_id
JOIN invoice_line ON track.track_id = invoice_line.track_id
GROUP BY genre.name
ORDER BY Nooftrcakssold DESC
LIMIT 5

-->List all playlists along with the number of tracks and total duration in each playlist.

SELECT playlist.Playlist_id, playlist.name, COUNT(playlist_track.track_id) AS Nooftracksinplaylist, 
SUM(track.milliseconds) totalduration
FROM Playlist
JOIN Playlist_track ON playlist.playlist_id = playlist_track.playlist_id
JOIN track ON playlist_track.track_id = track.track_id
GROUP BY playlist.playlist_id


-->Retrieve the top 3 customers who spent the most on purchases, along with the total amount spent by each customer.


SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS amountspent
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY amountspent DESC
LIMIT 5

-->Find the number of tracks for each album released by a specific artist (e.g., 'ArtistName').

SELECT Album.title, COUNT(track.track_id) AS numoftracks
FROM artist
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
WHERE artist.name = 'Accept'
GROUP BY Album.title

-->Calculate the average invoice total for each country where customers reside.

SELECT customer.country, AVG(invoice.total)
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.country


-->Retrieve the longest track duration and its corresponding track details for each genre.

SELECT track.track_id, track.name, track.track.milliseconds, track.composer
FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE track.Milliseconds = (
    SELECT MAX(Milliseconds)
    FROM track t
    WHERE t.Genre_Id = Genre.Genre_Id
);
