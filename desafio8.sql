SELECT artist.artist_name  AS artista,
	   album.album_name AS album
FROM SpotifyClone.artist AS artist
INNER JOIN SpotifyClone.album AS album
    ON artist.id_artist = 1 AND artist.id_artist = album.id_artist