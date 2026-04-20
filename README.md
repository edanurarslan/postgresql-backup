# VİDEO LİNK: https://youtu.be/aEyRzxgKImg

# PostgreSQL Automated Backup & Disaster Recovery Plan

Bu proje, bir veritabanı sisteminin güvenliğini ve sürekliliğini sağlamak amacıyla geliştirilmiş **uçtan uca bir yedekleme ve felaketten kurtarma (Disaster Recovery)** çözümüdür. PostgreSQL 16 üzerinde yapılandırılmış olan sistem; otomatik tam yedekler, saniyelik veri kaybını önleyen **Point-in-Time Recovery (PITR)** ve otomasyon süreçlerini içerir.

## Proje Özellikleri

* **Full Backup Automation:** `pg_dump` kullanılarak her gece otomatik olarak alınan tam yedekler.
* **Point-in-Time Recovery (PITR):** WAL (Write-Ahead Logging) arşivleme mekanizması ile saniyelik geri dönüş imkanı.
* **Crontab Integration:** Yedekleme süreçlerinin insan müdahalesi olmadan çalışması için zamanlanmış görevler.
* **Error Handling & Troubleshooting:** macOS dosya sistemi kısıtlamaları ve izin sorunları (Permission Issues) için özel çözümler.

---

## Proje Yapısı

| Klasör | Açıklama |
| :--- | :--- |
| `configs/` | PostgreSQL arşivleme ve crontab yapılandırma notları. |
| `sql_scripts/` | Veritabanı şeması, test verileri ve WAL tetikleme sorguları. |
| `other_scripts/` | Yedekleme yapan Bash scriptleri ve sistem kurulum komutları. |
| `screenshots/` | Sistemin çalıştığını kanıtlayan terminal ve pgAdmin çıktıları. |
| `logs/` | Yedekleme işlemlerinin başarı/hata günlükleri. |

---

## Kurulum ve Yapılandırma

### 1. Arşiv Klasörünün Hazırlanması (macOS Fix)
macOS servislerinin kullanıcı klasörlerine erişim engeli olduğu için paylaşılan bir dizin oluşturulmuştur:
```bash
sudo mkdir -p /Users/Shared/wal_archives
sudo chmod -R 777 /Users/Shared/wal_archives
```

### 2. PostgreSQL Yapılandırması (`postgresql.conf`)
Arşivleme mekanizmasını aktif etmek için aşağıdaki ayarlar uygulanmıştır:
```text
wal_level = replica
archive_mode = on
archive_command = 'cp %p /Users/Shared/wal_archives/%f'
```

### 3. Otomatik Yedekleme (Crontab)
Her gece saat **03:00**'te yedekleme scriptini çalıştırmak için:
```bash
0 3 * * * /Users/macbook/Documents/PostgreSQL-Backup-Project/other_scripts/yedekle.sh
```

---

## Felaket Senaryosu Testi (Disaster Recovery)

Proje kapsamında aşağıdaki senaryo başarıyla test edilmiştir:
1.  **Veri Kaybı:** Önemli bir tablo (`musteriler`) kaza ile `DROP TABLE` komutuyla silindi.
2.  **Müdahale:** Arşivlenen WAL dosyaları ve alınan son tam yedek (Full Backup) kullanılarak sistem geri yükleme sürecine sokuldu.
3.  **Sonuç:** Veriler saniyeler içindeki haline başarıyla geri döndürüldü.

---

## Karşılaşılan Sorunlar ve Çözümler

* **Hata:** `Permission Denied` (PostgreSQL'in Documents klasörüne yazamaması).
    * **Çözüm:** Arşiv dizini `/Users/Shared/` altına taşındı ve `chmod` yetkileri düzenlendi.
* **Hata:** `Address already in use` (Port 5432 çakışması).
    * **Çözüm:** Arka plandaki hayalet süreçler `pkill` ile sonlandırıldı ve `.lock` dosyaları temizlendi.

---

### Nasıl Kullanılır?
1. Repoyu klonlayın.
2. `other_scripts/yedekle.sh` içindeki yolları kendi sisteminize göre güncelleyin.
3. PostgreSQL servisini `restart` ederek arşivlemeyi başlatın.
