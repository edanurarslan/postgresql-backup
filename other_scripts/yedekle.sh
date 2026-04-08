{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
# G\'fcn\'fcn tarihini al\
TARIH=$(date +%Y_%m_%d_%H%M)\
# Yedekleme klas\'f6r\'fcn (Buray\uc0\u305  kendine g\'f6re d\'fczenleyebilirsin)\
HEDEF=~/Documents/backups/yedek_$TARIH.sql\
\
# Klas\'f6r yoksa olu\uc0\u351 tur\
mkdir -p ~/Documents/backups\
\
# Yedekleme i\uc0\u351 lemini yap\
/Library/PostgreSQL/16/bin/pg_dump -U postgres -d felaket_yonetimi > $HEDEF\
\
echo "Yedekleme tamamland\uc0\u305 : $HEDEF"}