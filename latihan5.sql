drop database if exists dbRumahMakan;
create database dbRumahMakan;
use dbRumahMakan;



create table tblmenu
(
    nomenu int primary key,
    menu varchar(255),
    harga double
);



create table tblpemesanan
(
    nopemesanan varchar(8) primary key,
    nomeja int,
    waktupemesanan timestamp,
    namapemesan varchar(100)
);



create table tblpesanan
(
    nopemesanan varchar(8),
    nomenu int,
    porsi int,
    hargabayar double,
    diskon int,
    FOREIGN KEY(nopemesanan) REFERENCES tblpemesanan(nopemesanan),
    FOREIGN KEY(nomenu) REFERENCES tblmenu(nomenu)
);



INSERT INTO tblmenu VALUES
 (1 , 'NASI + AYAM GORENG MENTEGA' , 18182),
 (2 , 'NASI + AYAM GORENG TEPUNG' , 18182),
 (3 , 'NASI + AYAM GORENG RICA-RICA' , 18182),
 (4 , 'NASI + AYAM NANKING' , 18182),
 (5 , 'NASI + AYAM ASAM MANIS' , 18182),
 (6 , 'NASI + CUMI GORENG MENTEGA' , 20910),
 (7 , 'NASI + CUMI GORENG RICA-RICA' , 20910),
 (8 , 'NASI + FILLET IKAN GORENG MENTEGA' , 21819),
 (9 , 'NASI + FILLET IKAN GORENG TEPUNG' , 21819),
 (10 , 'NASI + FILLET IKAN GORENG RICA-RICA' , 21819),
 (11 , 'NASI + FILLET IKAN ASAM MANIS' , 21819)
 ;



 INSERT INTO tblmenu VALUES
 (12 , 'NASI + UDANG GORENG TEPUNG' , 20910);



 select *
 FROM tblmenu;



INSERT INTO tblpemesanan VALUES
('0106-001' , 3 , '2013-06-01 00:00:00' , 'Carolina'),
('0106-002' , 5 , '2013-06-01 00:00:00' , 'Vey'),
('0106-003' , 8 , '2013-06-01 00:00:00' , 'Beni'),
('0106-004' , 4 , '2013-06-01 00:00:00' , 'Merly'),
('0106-005' , 2 , '2013-06-01 00:00:00' , 'Edward')
;



INSERT INTO tblpemesanan VALUES
('0106-006' , 4 , '2013-06-01 00:00:00' , 'Jerry');



INSERT INTO tblpesanan VALUES
('0106-001' , 1 , 2 , 18182 , 0),
('0106-002' , 2 , 1 , 18182 , 5),
('0106-002' , 2 , 3 , 18182 , 5), 
('0106-002' , 3 , 4 , 18182 , 5), 
('0106-003' , 3 , 2 , 18182 , 0),
('0106-003' , 5 , 4 , 18182 , 0), 
('0106-003' , 7 , 3 , 20910 , 0), 
('0106-003' , 9 , 1 , 21819 , 0), 
('0106-004' , 11 , 1 , 21819 ,0),
('0106-004' , 12 , 5 , 20910 ,0),
('0106-004' , 5 , 2 , 18182 , 0), 
('0106-005' , 6 , 3 , 20910 , 0), 
('0106-005' , 4 , 5 , 18182 , 0), 
('0106-006' , 2 , 7 , 18182 , 10),
('0106-006' , 1 , 2 , 18182 , 10),
('0106-006' , 7 , 3 , 20910 , 10),
('0106-006' , 9 , 1 , 21819 , 10),
('0106-006' , 12 , 4 , 20910 , 1), 
('0106-002' , 10 , 5 , 21819 , 5)
;



INSERT INTO tblpesanan VALUES
('0106-003', 12, 5, 20910, 0);



SELECT menu as 'menu', harga as 'harga'
FROM tblmenu;



SELECT nomeja as 'nomor meja', namapemesan as 'Nama pemesan'
from tblpemesanan
order by  nomeja;





SELECT menu as 'menu', harga as 'harga'
from tblmenu
WHERE harga <= 20000; 



SELECT menu as 'menu', harga AS 'harga'
from tblmenu
WHERE menu rlike('ayam') or menu rlike('cumi');


SELECT
    tblpemesanan.nomeja AS 'nomor meja',
    tblpemesanan.namapemesan AS 'nama pemesan',
    tblmenu.menu AS 'menu pesanan',
    tblpesanan.porsi AS 'jumlah porsi',
    tblpesanan.hargabayar AS 'harga bayar',
CONCAT(tblpesanan.hargabayar*tblpesanan.porsi) AS 'total'
FROM
    tblmenu,
    tblpemesanan,
    tblpesanan
WHERE
    tblmenu.nomenu = tblpesanan.nomenu
    AND
    tblpemesanan.nopemesanan = tblpesanan.nopemesanan;



SELECT
    tblpemesanan.namapemesan AS 'nama pemesan',
    tblmenu.menu AS 'menu pesanan',
    tblpesanan.porsi As 'jumlah porsi',
    tblpesanan.hargabayar AS 'harga bayar',
CONCAT(tblpesanan.hargabayar*tblpesanan.porsi) AS 'total'
FROM
    tblmenu,
    tblpemesanan,
    tblpesanan
WHERE
    tblpemesanan.namapemesan = 'Jerry'
    AND
    tblmenu.nomenu = tblpesanan.nomenu
    AND
    tblpemesanan.nopemesanan = tblpesanan.nopemesanan;



SELECT
    namapemesan AS "Nama Pesanan",
    menu AS "Menu Pesanan"
FROM
    tblmenu,
    tblpemesanan,
    tblpesanan
WHERE
    (tblpemesanan.nopemesanan = tblpesanan.nopemesanan
    AND
    tblmenu.nomenu = tblpesanan.nomenu)
    AND
    (menu RLIKE ('ayam') or menu RLIKE('cumi'));
