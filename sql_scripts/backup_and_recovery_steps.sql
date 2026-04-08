{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf0 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 -- =============================================================\
\'97 PostgreSQL Yedekleme ve Felaketten Kurtarma Stratejileri\
-- A\'e7\uc0\u305 klama: Proje boyunca kullan\u305 lan t\'fcm SQL komutlar\u305 \
-- =============================================================\
\
-- -------------------------------------------------------------\
-- 1. ADIM: PROJE VER\uc0\u304 TABANI VE TABLO HAZIRLI\u286 I\
-- -------------------------------------------------------------\
-- \'d6nce \'fczerinde \'e7al\uc0\u305 \u351 aca\u287 \u305 m\u305 z veritaban\u305 n\u305  olu\u351 turduk\
CREATE DATABASE felaket_yonetimi;\
\
-- Test i\'e7in \'f6rnek bir tablo ve veri seti ekledik\
CREATE TABLE musteriler (\
    id SERIAL PRIMARY KEY,\
    ad VARCHAR(100),\
    soyad VARCHAR(100),\
    email VARCHAR(150),\
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP\
);\
\
INSERT INTO musteriler (ad, soyad, email) VALUES \
('Eda', 'Arslan', 'eda@example.com'),\
('Ahmet', 'Y\uc0\u305 lmaz', 'ahmet@example.com'),\
('Mehmet', 'Demir', 'mehmet@example.com');\
\
-- -------------------------------------------------------------\
-- 2. ADIM: S\uc0\u304 STEM YAPILANDIRMA KONTROLLER\u304 \
-- -------------------------------------------------------------\
-- postgresql.conf dosyas\uc0\u305 nda yapt\u305 \u287 \u305 m\u305 z ayarlar\u305 n sisteme \
-- i\uc0\u351 lenip i\u351 lenmedi\u287 ini kontrol etmek i\'e7in kulland\u305 k.\
SELECT name, setting, unit FROM pg_settings \
WHERE name IN ('archive_mode', 'wal_level', 'archive_command');\
\
-- -------------------------------------------------------------\
-- 3. ADIM: WAL AR\uc0\u350 \u304 VLEME VE ZAMAN MAK\u304 NES\u304  TEST\u304 \
-- -------------------------------------------------------------\
-- Mevcut g\'fcnl\'fck dosyas\uc0\u305 n\u305  (WAL) manuel olarak kapat\u305 p \
-- ar\uc0\u351 ive g\'f6nderilmesini (Shared klas\'f6r\'fcne) tetikledik.\
SELECT pg_switch_wal();\
\
-- -------------------------------------------------------------\
-- 4. ADIM: FELAKET SENARYOSU (KAZA \uc0\u304 LE VER\u304  S\u304 LME)\
-- -------------------------------------------------------------\
-- Bir felaket an\uc0\u305 n\u305  sim\'fcle etmek i\'e7in tabloyu tamamen sildik.\
DROP TABLE musteriler;}