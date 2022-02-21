SELECT 
    COUNT(DISTINCT songs.song_name) AS cancoes,
    COUNT(DISTINCT artist.id_artist) AS artistas,
    COUNT(DISTINCT album.id_album) AS albuns
FROM
    SpotifyClone.songs AS songs
INNER JOIN
    SpotifyClone.artist AS artist
INNER JOIN
    SpotifyClone.album AS album;