-- =============================================================
-- PostgreSQL Yedekleme ve Felaketten Kurtarma Stratejileri
-- Açıklama: Proje boyunca kullanılan tüm SQL komutları
-- =============================================================

-- -------------------------------------------------------------
-- 1. ADIM: PROJE VERİTABANI VE TABLO HAZIRLIĞI
-- -------------------------------------------------------------
-- Önce üzerinde çalışacağımız veritabanını oluşturduk
CREATE DATABASE felaket_yonetimi;

-- Test için örnek bir tablo ve veri seti ekledik
CREATE TABLE musteriler (
    id SERIAL PRIMARY KEY,
    ad VARCHAR(100),
    soyad VARCHAR(100),
    email VARCHAR(150),
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO musteriler (ad, soyad, email) VALUES 
('Eda', 'Arslan', 'eda@example.com'),
('Ahmet', 'Yılmaz', 'ahmet@example.com'),
('Mehmet', 'Demir', 'mehmet@example.com');

-- -------------------------------------------------------------
-- 2. ADIM: SİSTEM YAPILANDIRMA KONTROLLERİ
-- -------------------------------------------------------------
-- postgresql.conf dosyasında yaptığımız ayarların sisteme 
-- işlenip işlenmediğini kontrol etmek için kullandık.
SELECT name, setting, unit FROM pg_settings 
WHERE name IN ('archive_mode', 'wal_level', 'archive_command');

-- -------------------------------------------------------------
-- 3. ADIM: WAL ARŞİVLEME VE ZAMAN MAKİNESİ TESTİ
-- -------------------------------------------------------------
-- Mevcut günlük dosyasını (WAL) manuel olarak kapatıp 
-- arşive gönderilmesini (Shared klasörüne) tetikledik.
SELECT pg_switch_wal();

-- -------------------------------------------------------------
-- 4. ADIM: FELAKET SENARYOSU (KAZA İLE VERİ SİLME)
-- -------------------------------------------------------------
-- Bir felaket anını simüle etmek için tabloyu tamamen sildik.
DROP TABLE musteriler;
