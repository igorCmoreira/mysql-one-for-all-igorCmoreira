SELECT users.user_name AS usuario,
	IF(MAX(YEAR(historic.repro_date)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historic AS historic
	ON users.id_user = historic.id_user
    GROUP BY users.user_name
    ORDER BY users.user_name ASC;