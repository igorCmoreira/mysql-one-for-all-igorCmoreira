SELECT songs.song_name AS nome,
	COUNT(histo.id_song) AS reproducoes
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.users AS users
ON users.id_plan = 1 OR users.id_plan = 3 
INNER JOIN SpotifyClone.historic AS histo
ON users.id_user = histo.id_user AND songs.id_song = histo.id_song
GROUP BY songs.song_name
ORDER BY songs.song_name ASC;