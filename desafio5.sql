
SELECT songs.song_name AS cancao,
	COUNT(historic.id_song) AS reproducoes
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.historic AS historic
	ON songs.id_song = historic.id_song
    GROUP BY songs.song_name
    ORDER BY reproducoes DESC, songs.song_name asc LIMIT 2;