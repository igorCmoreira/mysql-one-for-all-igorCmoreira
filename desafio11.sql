SELECT songs.song_name AS nome_musica,
	CASE
		WHEN songs.song_name LIKE "%Streets%" THEN REPLACE(songs.song_name, 'Streets' , 'Code Review')
        WHEN songs.song_name LIKE "%Her Own%" THEN REPLACE(songs.song_name, 'Her Own' , 'Trybe')
        WHEN songs.song_name LIKE "%Inner Fire%" THEN REPLACE(songs.song_name, 'Inner Fire' , 'Project')
        WHEN songs.song_name LIKE "%Silly%" THEN REPLACE(songs.song_name, 'Silly' , 'Nice')
        WHEN songs.song_name LIKE "%Circus%" THEN REPLACE(songs.song_name, 'Circus' , 'Pull Request')
        ELSE songs.song_name
	END AS novo_nome
FROM SpotifyClone.songs AS songs
WHERE songs.id_song IN (3, 4, 6, 18, 15)
ORDER BY songs.song_name ASC;