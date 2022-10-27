CREATE DATABASE dblatihan1;
SHOW DATABASES;
USE dblatihan1;
CREATE TABLE tbidentitas2
(
id INT,
judul_lagu VARCHAR(150),
artist VARCHAR(100),
genre VARCHAR(100)
);

SHOW TABLES;

DESC tbidentitas2;

INSERT INTO tbidentitas2 VALUES
(1, 'Asmalibrasi', 'Soegi Bornean', 'Indie'),
(2, 'Heat Waves', 'Glass Animlas', 'POP'),
(3, 'Industry Baby', 'Lil Nas X', 'Hip Hop'),
(4, 'When She Loved Me', 'Sarah McLachlan', 'POP'),
(5, 'Gang Up', '2 Chainz & Wiz Khalifa', 'Latin Urbano'),
(6, 'As It Was', 'Harry Styles', 'Synth-pop'),
(7, 'Bad Habit', 'Steve Lacy', 'POP'),
(8, 'I Like You', 'Post Malone feat Doja Cat', 'R&B'),
(9, 'First Class', 'Jack Harlow', 'Hip Hop'),
(10, 'Ghost', 'Justin Bieber', 'POP')
;

SELECT *
FROM tbidentitas2

DELETE
FROM tbidentitas2

/*source C:/xampp/htdocs/rdbms/latihan1.sql*/