# macOS Permission Fixes

PostgreSQL servisinin kullanıcı klasörlerine (Documents vb.) erişimi kısıtlıdır. 
Bu sorunu çözmek için arşiv yolu olarak '/Users/Shared/' klasörü kullanılmış ve aşağıdaki yetkilendirme yapılmıştır:

```bash
sudo mkdir -p /Users/Shared/wal_archives
sudo chmod -R 777 /Users/Shared/wal_archives
