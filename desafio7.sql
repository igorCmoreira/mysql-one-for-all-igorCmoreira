SELECT artist.artist_name AS artista,
	   album.album_name AS album,
       COUNT(follow.id_artist) AS seguidores
FROM SpotifyClone.artist AS artist
INNER JOIN SpotifyClone.album AS album
	ON album.id_artist = artist.id_artist
INNER JOIN SpotifyClone.followers AS follow
	ON artist.id_artist=follow.id_artist
GROUP BY album.album_name, artist.artist_name
ORDER BY seguidores DESC, artista, album;