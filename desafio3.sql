SELECT users.user_name AS usuario,
	COUNT(historic.id_user) AS qtde_musicas_ouvidas,
    ROUND(SUM(songs.duration /60), 2) AS total_minutos
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historic AS historic
	ON historic.id_user = users.id_user
INNER JOIN SpotifyClone.songs AS songs
	ON historic.id_song = songs.id_song
GROUP BY users.user_name
ORDER BY users.user_name ASC;