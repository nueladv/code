DROP DATABASE IF EXISTS dblatihanjoin;
CREATE DATABASE dblatihanjoin;
USE dblatihanjoin;

CREATE TABLE tblBooks
(
    BookID VARCHAR(5) PRIMARY KEY,
    BookTitle VARCHAR(255),
    Copyright INT
);

INSERT INTO tblBooks VALUES
('12786', 'Letters to a Young Poet', 1934),
('13331', 'Winesburg, Ohio', 1919),
('14356', 'Hell s Angels', 1966),
('15729', 'Black Elk Speaks', 1932),
('16284', 'Noncomformity', 1996),
('17695', 'A Confederacy of Dunces', 1980),
('19264', 'Postcards', 1992),
('19354', 'The Shipping News', 1993) 
;

CREATE TABLE tblAuthors
(
    AuthID INT PRIMARY KEY,
    AuthFN VARCHAR(255),
    AuthLN VARCHAR(255),
    AuthMN VARCHAR(255)
);

INSERT INTO tblAuthors VALUES
(1006, 'Hunter', 'S.', 'Thompson'),
(1007, 'Joyce', 'Carol', 'Oates'),
(1008, 'Black', NULL, 'Elk'),
(1009, 'Rainer', 'Maria', 'Rilke'),
(1010, 'John', 'Kennedy', 'Toole'),
(1011, 'John', 'G.', 'Neihardt'),
(1012, 'Annie', NULL, 'Proulx'),
(1013, 'Alan', NULL, 'Watts'),
(1014, 'Nelson', NULL, 'Algren')
;

CREATE TABLE tblAuthorBook
(
    AuthID INT,
    BookID VARCHAR(100),
    FOREIGN KEY(AuthID) REFERENCES tblAuthors(AuthID),
    FOREIGN KEY(BookID) REFERENCES tblBooks(BookID)
);

INSERT INTO tblAuthorBook VALUES
(1009, '12786'),
(1006, '14356'),
(1008, '15729'),
(1011, '15729'),
(1014, '16284'),
(1010, '17695'),
(1012, '19264'),
(1012, '19354')
;


--nomor 1
SELECT
    tblBooks.BookTitle,
    tblBooks.Copyright AS 'Copyright<1980',
    tblAuthors.AuthID
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.BookID
    AND
    tblBooks.Copyright < 1980
ORDER BY
    tblBooks.Copyright ASC
;


--nomor 2
SELECT
    tblBooks.BookTitle,
    tblBooks.Copyright,
    tblAuthors.AuthID
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.BookID
;


--nomor 3
SELECT
    CONCAT (tblAuthors.AuthFN, " ", tblAuthors.AuthLN) AS 'Author dengan BookTitle = Noncomformity'
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.AuthID
    AND
    tblBooks.BookTitle = 'Noncomformity'
;


--nomor 4
SELECT
    IF (tblAuthors.AuthMN is NOT NULL,
    CONCAT (tblAuthors.AuthFN, ' ', tblAuthors.AuthMN, ' ', tblAuthors.AuthLN),
    CONCAT (tblAuthors.AuthFN, ' ', tblAuthors.AuthLN)
    ) AS 'Author yang tidak mengarang BookTitle Nomcomformity'
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.BookID
    AND
    tblBooks.BookTitle = 'Noncomformity'
;


--nomor 5
SELECT 
    tblBooks.BookTitle,
    tblBooks.Copyright AS 'Copyright dari AuthorLN=Proulx'
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.BookID
    AND
    tblAuthors.AuthLN = 'Proulx'
;


--nomor 6
SELECT 
    tblBooks.BookTitle,
    tblBooks.Copyright AS 'Copyright < maksimal tahun Copyright - 50'
FROM
    tblBooks,
    tblAuthors,
    tblAuthorBook
WHERE
    tblAuthors.AuthID = tblAuthorBook.AuthID
    AND
    tblBooks.BookID = tblAuthorBook.BookID
    AND
    tblBooks.Copyright < (
    SELECT(max(tblBooks.Copyright) - 50) 
    FROM tblBooks)
;





