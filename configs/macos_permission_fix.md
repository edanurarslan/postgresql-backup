{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # macOS Permission Fixes\
\
PostgreSQL servisinin kullan\uc0\u305 c\u305  klas\'f6rlerine (Documents vb.) eri\u351 imi k\u305 s\u305 tl\u305 d\u305 r. \
Bu sorunu \'e7\'f6zmek i\'e7in ar\uc0\u351 iv yolu olarak '/Users/Shared/' klas\'f6r\'fc kullan\u305 lm\u305 \u351  ve a\u351 a\u287 \u305 daki yetkilendirme yap\u305 lm\u305 \u351 t\u305 r:\
\
```bash\
sudo mkdir -p /Users/Shared/wal_archives\
sudo chmod -R 777 /Users/Shared/wal_archives}