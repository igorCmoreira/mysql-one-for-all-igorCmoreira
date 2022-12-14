DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
	id_plan INTEGER AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(14) NOT NULL,
    price DOUBLE NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artist(
	id_artist INTEGER AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(20) NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.users(
	id_user INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(10) NOT NULL,
    user_age INTEGER,
    id_plan INTEGER NOT NULL,
	FOREIGN KEY (id_plan) REFERENCES plans (id_plan),
    signature_date DATE NOT NULL
    ) ENGINE = InnoDB;
    
CREATE TABLE SpotifyClone.followers(
	id_user INTEGER,
    id_artist INTEGER,
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
    CONSTRAINT PRIMARY KEY (id_user, id_artist)
    ) ENGINE = InnoDB;
    
    
CREATE TABLE SpotifyClone.album(
	id_album INTEGER AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(50) NOT NULL,
    launch_year INTEGER,
    id_artist INTEGER,
    FOREIGN KEY (id_artist) REFERENCES artist (id_artist)
    ) ENGINE = InnoDB;
    
CREATE TABLE SpotifyClone.songs(
	id_song INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_artist INTEGER,
    id_album INTEGER,
    song_name VARCHAR(50) NOT NULL,
    duration INTEGER NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
	FOREIGN KEY (id_album) REFERENCES album (id_album)
    ) ENGINE = InnoDB;
    
CREATE TABLE SpotifyClone.historic(
    id_user INTEGER,
    id_song INTEGER,
    FOREIGN KEY (id_user) REFERENCES users (id_user),
	FOREIGN KEY (id_song) REFERENCES songs (id_song),
    repro_date DATETIME,
    CONSTRAINT PRIMARY KEY (id_user,id_song)
    ) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans(plan_name, price)
	VALUES ('Gratuito', 0.00),
		   ('Familiar', 7.99),
           ('Pessoal', 6.99),
           ('Universitário', 5.99);

INSERT INTO SpotifyClone.users(user_name, user_age, signature_date, id_plan)
	VALUES ('Thati', 23, '2019-10-20', 1),
           ('Cintia', 35, '2017-12-30', 2),
           ('Bill', 20, '2019-06-05', 4),
           ('Roger', 45, '2020-05-13', 3),
           ('Norman', 58, '2017-02-17', 3),
           ('Patrick', 33, '2017-01-06', 2), 
           ('Vivian', 26, '2018-01-05', 4),
           ('Carol', 19, '2018-02-14', 4),
           ('Angelina', 42, '2018-04-29', 2),
           ('Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.artist(artist_name)
	VALUES ('Walter Phoenix'),
           ('Peter Strong'),
           ('Lance Day'),
           ('Tyler Isle'),
           ('Fog'),
           ('Freedie Shannon');
           
INSERT INTO SpotifyClone.album(album_name, launch_year, id_artist)
	VALUES('Envious', 1990, 1),
		  ('Exuberant', 1993, 1),
          ('Hallowed Steam', 1995, 2),
          ('Incandescent', 1998, 3),
          ('Temporary Culture', 2001, 6),
          ('Library of liberty', 2003, 6),
          ('Chained Down', 2007, 4),
          ('Cabinet of fools', 2012, 4),
          ('No guarantees', 2015, 4),
          ('Apparatus', 2015, 5);

INSERT INTO SpotifyClone.songs(id_artist, id_album, song_name, duration)
	VALUES (1, 1, 'Soul For Us', 200),
		   (1, 1, 'Reflections Of Magic', 163),
           (1, 1, 'Dance With Her Own', 116),
           (1, 2, 'Troubles Of My Inner Fire', 203),
           (1, 2, 'Time Fireworks', 152),
           (2, 3, 'Magic Circus', 105),
           (2, 3, 'Honey, So Do I', 207),
           (2, 3, "Sweetie, Let's Go Wild", 139),
           (2, 3, 'She Knows', 244),
           (3, 4, 'Fantasy For Me', 100),
           (3, 4, 'Celebration Of More', 146),
           (3, 4, 'Rock His Everything', 223),
           (3, 4, 'Home Forever', 231),
           (3, 4, 'Diamond Power', 241),
           (3, 4, "Let's Be Silly", 132),
           (6, 5, 'Thang Of Thunder', 240),
           (6, 5, 'Words Of Her Life', 185),
           (6, 5, 'Without My Streets', 176),
           (6, 6, 'Need Of The Evening', 190),
           (6, 6, 'History Of My Roses', 222),
           (6, 6, 'Without My Love', 111),
           (6, 6, 'Walking And Game', 123),
           (6, 6, 'Young And Father', 197),
           (4, 7, 'Finding My Traditions', 179),
           (4, 7, 'Walking And Man', 229),
           (4, 7, 'Hard And Time', 135),
           (4, 7, "Honey, I'm A Lone Wolf", 150),
           (4, 8, "She Thinks I Won't Stay Tonigth", 166),
           (4, 8, "He Heard You're Bad For Me", 154),
           (4, 8, "He Hopes We Can't Stay", 210),
           (4, 8, "I Know I Know", 117),
           (4, 9, "He's Walking Away", 159),
           (4, 9, "He's Trouble", 138),
           (4, 9, "I Heard I Want To Be Alone", 120),
           (4, 9, "I Ride Alone", 151),
           (5, 10, "Honey", 79),
           (5, 10, "You Cheated On Me", 95),
           (5, 10, "Wouldn't It Be Nice", 213),
           (5, 10, "Baby", 136),
           (5, 10, "You Make Me Feel So ...", 83);
           
INSERT INTO SpotifyClone.followers(id_user, id_artist)
	VALUES (1, 1),
		   (1, 6),
           (1, 3),
           (2, 1),
           (2, 3),
           (3, 2),
           (3, 1),
           (4, 6),
           (5, 4),
           (5, 5),
           (6, 1),
           (6, 3),
           (6, 5),
           (7, 2),
           (7, 4),
           (8, 1),
           (8, 4),
           (9, 5),
           (9, 6),
           (9, 3),
           (10, 2),
           (10, 5);

INSERT INTO SpotifyClone.historic(id_user, id_song, repro_date)
	VALUES (1, 36, '2020-02-28 10:45:55'),
           (1, 25, '2020-05-02 05:30:35'),
           (1, 23, '2020-03-06 11:22:33'),
           (1, 14, '2020-08-05 08:05:17'),
           (1, 15, '2020-09-14 16:32:22'),
           (2, 34, '2020-01-02 07:40:33'),
           (2, 24, '2020-05-16 06:16:22'),
           (2, 21, '2020-10-09 12:27:48'),
           (2, 39, '2020-09-21 13:14:46'),
           (3, 3, '2020-11-13 16:55:13'),
           (3, 6, '2020-12-05 18:38:30'),
           (3, 26, '2020-07-30 10:00:00'),
           (4, 2, '2021-08-15 17:10:10'),
           (4, 35, '2021-07-10 15:20:30'),
           (4, 27, '2021-01-09 01:44:33'),
           (5, 7, '2020-07-03 19:33:28'),
           (5, 12, '2017-02-24 21:14:22'),
           (5, 14, '2020-08-06 15:23:43'),
           (5, 1, '2020-11-10 13:52:27'),
           (6, 38, '2019-02-07 20:33:48'),
           (6, 29, '2017-01-24 00:31:17'),
           (6, 30, '2017-10-12 12:35:20'),
           (6, 22, '2018-05-29 14:56:41'),
           (7, 5, '2018-05-09 22:30:49'),
           (7, 4, '2020-07-27 12:52:58'),
           (7, 11, '2018-01-16 18:40:43'),
           (8, 39, '2018-03-21 16:56:40'),
           (8, 40, '2020-10-18 13:38:05'),
           (8, 32, '2019-05-25 08:14:03'),
           (8, 33, '2021-08-15 21:37:09'),
           (9, 16, '2021-05-24 17:23:45'),
           (9, 17, '2018-12-07 22:48:52'),
           (9, 8, '2021-03-14 06:14:26'),
           (9, 9, '2020-04-01 03:36:00'),
           (10, 20, '2017-02-06 08:21:34'),
           (10, 21, '2017-12-04 05:33:43'),
           (10, 12, '2017-07-27 05:24:49'),
           (10, 13, '2017-12-25 01:03:57');