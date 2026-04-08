{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
\
# 1. Ar\uc0\u351 iv klas\'f6r\'fcn\'fc olu\u351 tur ve herkese a\'e7\u305 k yetki ver (macOS Permission Fix)\
sudo mkdir -p /Users/Shared/wal_archives\
sudo chmod -R 777 /Users/Shared/wal_archives\
\
# 2. PostgreSQL'i manuel ba\uc0\u351 latma (Hata durumunda)\
# Not: /tmp klas\'f6r\'fcne ge\'e7mek yetki sorunlar\uc0\u305 n\u305  \'f6nler.\
cd /tmp\
sudo -u postgres /Library/PostgreSQL/16/bin/pg_ctl -D /Library/PostgreSQL/16/data start\
\
# 3. Kilitli kalan soket dosyalar\uc0\u305 n\u305  temizleme\
sudo rm /tmp/.s.PGSQL.5432*\
\
# 4. Crontab'a yedekleme g\'f6revini ekleme\
# (crontab -e yaz\uc0\u305 p en alta \u351 u sat\u305 r\u305  ekleyin)\
# 0 3 * * * /Users/macbook/Documents/PostgreSQL-Backup-Project/other_scripts/yedekle.sh}