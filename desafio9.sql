SELECT COUNT(histo.id_song) AS quantidade_musicas_no_historico
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historic AS histo
	ON users.id_user = 3 AND users.id_user = histo.id_user;