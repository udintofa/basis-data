# melihat seluruh database
show databases;

# membuat database baru
create database portofolio1;

# mengaktifkan database yang baru dibuat
use portofolio1;

# melihat isi tabel
show tables;

# membuat tabel siswa
CREATE TABLE siswa (
    id_siswa VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100),
    jenjang varchar(30),
    kelas INT
);

# membuat table tentor
CREATE TABLE tentor (
    id_tentor VARCHAR(50) PRIMARY KEY,
    nama VARCHAR(100),
    jenjang VARCHAR(50)
);

# membuat tabel program
CREATE TABLE program (
    kode_program VARCHAR(50) PRIMARY KEY,
    jenjang VARCHAR(50),
    biaya INT
);

CREATE TABLE dompet (
    id_dompet VARCHAR(50) PRIMARY KEY,
    id_tentor VARCHAR(50),
    saldo DECIMAL(12,2),

    CONSTRAINT fk_dompet_tentor
        FOREIGN KEY (id_tentor) REFERENCES tentor(id_tentor)
);

CREATE TABLE saldo_bimbel (
    id_saldo_bimbel VARCHAR(50) PRIMARY KEY,
    saldo DECIMAL(12,2)
);

CREATE TABLE sesi_privat (
    id_sesi VARCHAR(50) PRIMARY KEY,
    id_siswa VARCHAR(50),
    id_tentor VARCHAR(50),
    kode_program VARCHAR(50),
    tanggal DATETIME,
    biaya DECIMAL(10,2),

    CONSTRAINT fk_sesi_siswa
        FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),

    CONSTRAINT fk_sesi_tentor
        FOREIGN KEY (id_tentor) REFERENCES tentor(id_tentor),

    CONSTRAINT fk_sesi_program
        FOREIGN KEY (kode_program) REFERENCES program(kode_program)
);

CREATE TABLE tagihan (
    id_tagihan VARCHAR(50) PRIMARY KEY,
    id_sesi VARCHAR(50),
    id_siswa VARCHAR(50),
    id_dompet VARCHAR(50),
    total DECIMAL(10,2),
    status VARCHAR(20),
    tanggal_bayar DATETIME,

    CONSTRAINT fk_tagihan_sesi
        FOREIGN KEY (id_sesi) REFERENCES sesi_privat(id_sesi),

    CONSTRAINT fk_tagihan_siswa
        FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),

    CONSTRAINT fk_tagihan_dompet
        FOREIGN KEY (id_dompet) REFERENCES dompet(id_dompet)
);

CREATE TABLE pembagian_tagihan (
    id_pembagian VARCHAR(50) PRIMARY KEY,
    id_tagihan VARCHAR(50),
    id_dompet VARCHAR(50),
    id_saldo_bimbel VARCHAR(50),
    nominal_tentor DECIMAL(10,2),
    nominal_bimbel DECIMAL(10,2),

    CONSTRAINT fk_pembagian_tagihan
        FOREIGN KEY (id_tagihan) REFERENCES tagihan(id_tagihan),

    CONSTRAINT fk_pembagian_dompet
        FOREIGN KEY (id_dompet) REFERENCES dompet(id_dompet),

    CONSTRAINT fk_pembagian_saldo_bimbel
        FOREIGN KEY (id_saldo_bimbel) REFERENCES saldo_bimbel(id_saldo_bimbel)
);

show tables;
