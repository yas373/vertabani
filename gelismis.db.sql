BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `ogrenci` (
	`id`	INTEGER NOT NULL,
	`ad`	TEXT,
	`soyad`	TEXT,
	`e-mail`	TEXT,
	PRIMARY KEY(`id`)
);
INSERT INTO `ogrenci` (id,ad,soyad,e-mail) VALUES (1,'yasin','turpcu','yas@gmail.com'),
 (2,'neslihan','turpcu','nes@gmail.com');
CREATE TABLE IF NOT EXISTS `odev` (
	`id`	INTEGER NOT NULL,
	`icerik`	TEXT,
	`tarih`	TEXT,
	`puan`	INTEGER,
	`link`	TEXT
);
INSERT INTO `odev` (id,icerik,tarih,puan,link) VALUES (1,'db','27.02.2017',60,'vt.yasinturpcu.com'),
 (1,'db2','02.10.2017',100,'vt.yasinturpcu.com'),
 (2,'db','27.02.2017',89,'sgfwdflf.com');
COMMIT;
