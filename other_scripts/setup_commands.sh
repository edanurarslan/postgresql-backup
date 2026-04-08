#!/bin/bash

# 1. Arşiv klasörünü oluştur ve herkese açık yetki ver (macOS Permission Fix)
sudo mkdir -p /Users/Shared/wal_archives
sudo chmod -R 777 /Users/Shared/wal_archives

# 2. PostgreSQL'i manuel başlatma (Hata durumunda)
# Not: /tmp klasörüne geçmek yetki sorunlarını önler.
cd /tmp
sudo -u postgres /Library/PostgreSQL/16/bin/pg_ctl -D /Library/PostgreSQL/16/data start

# 3. Kilitli kalan soket dosyalarını temizleme
sudo rm /tmp/.s.PGSQL.5432*

# 4. Crontab'a yedekleme görevini ekleme
# (crontab -e yazıp en alta şu satırı ekleyin)
# 0 3 * * * /Users/macbook/Documents/PostgreSQL-Backup-Project/other_scripts/yedekle.sh
