drop database if exists dbPenjualanBarang;

create database dbPenjualanBarang;

use dbPenjualanBarang;

create table tblBarang 
(
    kodebarang varchar(11) primary key, 
    namabarang varchar(100),
    satuan varchar(10),
    hargabeli double,
    hargajual double 
);

create table tblTransBarangMasuk
(
    nomasuk varchar(15)primary key,
    tanggalmasuk datetime
);

create table tblTransBarangKeluar
(
    nokeluar varchar(15) primary key,
    tanggalkeluar datetime
);

create table tblRinciMasuk
(
    nomasuk varchar(15),
    kodebarang varchar(11),
    jumlahmasuk int,
    hargamasuk double,
    foreign key (nomasuk) references tblTransBarangMasuk(nomasuk),
    foreign key (kodebarang) references tblBarang (kodebarang)
);

create table tblRinciKeluar
(
    nokeluar varchar(15),
    kodebarang varchar(11),
    jumlahkeluar int,
    hargakeluar double,
    foreign key (nokeluar) references tblTransBarangKeluar(nokeluar),
    foreign key (kodebarang) references tblBarang(kodebarang)
);

desc tblBarang;
desc tblTransBarangMasuk;
desc tblTransBarangKeluar;
desc tblRinciMasuk;
desc tblRinciKeluar;