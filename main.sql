-- Active: 1735825087428@@if.unismuh.ac.id@3388@kelas-b
CREATE TABLE mahasiswa (
    nim     INT(12) PRIMARY KEY NOT NULL,
    nama    VARCHAR(50) NOT NULL,
    jurusan VARCHAR(255) NOT NULL
);

CREATE TABLE test_mhs (
    nim     INT(12) PRIMARY KEY NOT NULL,
    nama    VARCHAR(50) NOT NULL,
    jurusan VARCHAR(255) NOT NULL,
    email  VARCHAR(255) UNIQUE
);

INSERT INTO test_mhs (nim, nama, jurusan, email) VALUES (1058411083, 'DHFAI', 'Computer Science', 'test@gmail.com');

INSERT INTO mahasiswa (nim, nama, jurusan) VALUES (1058411086, 'DHFAI', 'Computer Science');

INSERT INTO mahasiswa (nim, nama, jurusan) VALUES
(1081108621, 'DHFAI', 'Computer Science'),
(1081108622, 'DHFAI', 'Computer Science'),
(1081108623, 'DHFAI', 'Computer Science'),
(1081108624, 'DHFAI', 'Computer Science');

DESC test_mhs;


SET SQL_SAFE_UPDATES = 0;


SELECT * FROM mahasiswa;

SELECT * FROM mahasiswa WHERE nim = 1058411086;

SET nim = 105841108621;
SELECT * FROM mahasiswa WHERE jurusan = 'Computer Science' AND nama = 'DHFAI'

DROP TABLE mahasiswa

ALTER TABLE mahasiswa ADD COLUMN fakultas VARCHAR(255) NOT NULL

UPDATE mahasiswa WHERE nim = 105841108621;

ALTER TABLE mahasiswa MODIFY COLUMN nim INT(12) NOT NULL

ALTER TABLE mahasiswa DROP COLUMN fakultas;







-- add column table unique
INSERT FROM mahasiswa



20201	Teknik Elektro
22201	Teknik Pengairan
23201	Arsitektur
35201	Perencanaan Wilayah dan Kota
55202	Informatika














-- apa itu sql => sql adalah singkatan dari structured query language, yang merupakan bahasa standar untuk sistem manajemen basis data relasional (rdbms). sql digunakan untuk mengakses, mengubah, dan mengelola data dalam basis data. sql dapat digunakan untuk mengambil data dari basis data, memperbarui data dalam basis data, menghapus data dari basis data, dan memasukkan data ke dalam basis data. sql juga dapat digunakan untuk membuat dan mengelola tabel dalam basis data, serta membuat dan mengelola indeks pada tabel. sql adalah bahasa yang sangat kuat dan fleksibel yang digunakan