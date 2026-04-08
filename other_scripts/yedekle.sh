#!/bin/bash

# =============================================================
# PostgreSQL Otomatik Yedekleme Scripti
# Açıklama: Bu script veritabanını yedekler ve log tutar.
# =============================================================

# Ayarlar
BACKUP_DIR="/Users/Shared/wal_archives"
DB_NAME="felaket_yonetimi"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="/Users/macbook/Documents/PostgreSQL-Backup-Project/logs/backup.log"

# Klasör kontrolü
mkdir -p $BACKUP_DIR

echo "--- Yedekleme Başladı: $DATE ---" >> $LOG_FILE

# Yedekleme işlemi (pg_dump)
# Not: Şifre sormaması için ~/.pgpass dosyası yapılandırılmalıdır.
/Library/PostgreSQL/16/bin/pg_dump -U postgres $DB_NAME > $BACKUP_DIR/full_backup_$DATE.sql

if [ $? -eq 0 ]; then
    echo "[$DATE] Başarılı: Yedek alındı -> full_backup_$DATE.sql" >> $LOG_FILE
else
    echo "[$DATE] HATA: Yedekleme başarısız!" >> $LOG_FILE
fi

echo "--- İşlem Tamamlandı ---" >> $LOG_FILE
