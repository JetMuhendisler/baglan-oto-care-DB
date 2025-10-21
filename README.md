# Bağlan Oto Care - Database Repository

Bağlan Oto Care için geliştirilen randevu ve müşteri yönetim sistemi veritabanı. (Database for the appointment and customer management system developed for Bağlan Oto Care.)

## 📋 İçindekiler (Table of Contents)

- [Genel Bakış (Overview)](#genel-bakış-overview)
- [Özellikler (Features)](#özellikler-features)
- [Kurulum (Installation)](#kurulum-installation)
- [Kullanım (Usage)](#kullanım-usage)
- [Veritabanı Şeması (Database Schema)](#veritabanı-şeması-database-schema)
- [Dokümantasyon (Documentation)](#dokümantasyon-documentation)
- [Yedekleme (Backup)](#yedekleme-backup)

## 🎯 Genel Bakış (Overview)

Bu repository, Bağlan Oto Care için tasarlanmış kapsamlı bir PostgreSQL veritabanı içerir. Veritabanı, otomotiv servis merkezlerinin randevu yönetimi, müşteri takibi, araç bakım kayıtları, çalışan yönetimi ve faturalandırma süreçlerini destekler.

This repository contains a comprehensive PostgreSQL database designed for Bağlan Oto Care. The database supports appointment management, customer tracking, vehicle maintenance records, employee management, and billing processes for automotive service centers.

## ✨ Özellikler (Features)

### Temel Modüller (Core Modules)
- **Müşteri Yönetimi** - Customer information and contact details
- **Araç Takibi** - Vehicle registration and history
- **Randevu Sistemi** - Appointment scheduling and management
- **Servis Kataloğu** - Service offerings and pricing
- **İş Emirleri** - Work order tracking
- **Parça Envanteri** - Parts inventory management
- **Faturalandırma** - Invoicing and payment tracking
- **Bakım Geçmişi** - Complete maintenance history
- **Çalışan Yönetimi** - Employee and mechanic records

### Teknik Özellikler (Technical Features)
- ✅ UUID tabanlı birincil anahtarlar (UUID-based primary keys)
- ✅ Otomatik zaman damgaları (Automatic timestamps)
- ✅ Referans bütünlüğü (Referential integrity)
- ✅ Kapsamlı indeksler (Comprehensive indexes)
- ✅ Denetim günlüğü (Audit trail)
- ✅ Hesaplanmış kolonlar (Generated columns)
- ✅ Veri doğrulama (Data validation)
- ✅ Migrasyon sistemi (Migration system)

## 🚀 Kurulum (Installation)

### Gereksinimler (Prerequisites)
- PostgreSQL 12 veya üzeri (PostgreSQL 12 or higher)
- psql komut satırı aracı (psql command-line tool)

### Hızlı Kurulum (Quick Setup)

1. Repository'yi klonlayın (Clone the repository):
```bash
git clone https://github.com/JetMuhendisler/baglan-oto-care-DB.git
cd baglan-oto-care-DB
```

2. Kurulum scriptini çalıştırın (Run the setup script):
```bash
./scripts/setup_database.sh
```

3. Özel parametrelerle kurulum (Setup with custom parameters):
```bash
./scripts/setup_database.sh \
  --db-name baglan_oto_care \
  --db-user postgres \
  --db-host localhost \
  --db-port 5432
```

### Manuel Kurulum (Manual Setup)

1. Veritabanı oluşturun (Create database):
```bash
createdb baglan_oto_care
```

2. Şemayı yükleyin (Load schema):
```bash
psql -d baglan_oto_care -f schema/001_initial_schema.sql
```

3. Başlangıç verilerini yükleyin (Load seed data):
```bash
psql -d baglan_oto_care -f seeds/001_initial_data.sql
```

## 💻 Kullanım (Usage)

### Veritabanına Bağlanma (Connecting to Database)

```bash
psql -d baglan_oto_care -U postgres
```

Connection string:
```
postgresql://postgres@localhost:5432/baglan_oto_care
```

### Örnek Sorgular (Example Queries)

#### Müşteri randevu geçmişini görüntüleme
```sql
SELECT 
    c.first_name || ' ' || c.last_name as customer_name,
    v.make || ' ' || v.model as vehicle,
    s.name as service,
    a.appointment_date,
    a.status
FROM appointments a
JOIN customers c ON a.customer_id = c.id
JOIN vehicles v ON a.vehicle_id = v.id
JOIN services s ON a.service_id = s.id
WHERE c.id = 'customer_uuid'
ORDER BY a.appointment_date DESC;
```

Daha fazla örnek için [DATABASE.md](docs/DATABASE.md) dosyasına bakın.

## 📊 Veritabanı Şeması (Database Schema)

### Ana Tablolar (Main Tables)

| Tablo | Açıklama | Description |
|-------|----------|-------------|
| `customers` | Müşteri bilgileri | Customer information |
| `vehicles` | Araç kayıtları | Vehicle records |
| `services` | Servis kataloğu | Service catalog |
| `employees` | Çalışan bilgileri | Employee information |
| `appointments` | Randevular | Appointments |
| `work_orders` | İş emirleri | Work orders |
| `parts` | Parça envanteri | Parts inventory |
| `work_order_parts` | İş emri parçaları | Work order parts |
| `invoices` | Faturalar | Invoices |
| `maintenance_history` | Bakım geçmişi | Maintenance history |
| `system_settings` | Sistem ayarları | System settings |
| `audit_log` | Denetim günlüğü | Audit log |

Detaylı şema bilgisi için [ER_DIAGRAM.md](docs/ER_DIAGRAM.md) dosyasına bakın.

## 📚 Dokümantasyon (Documentation)

Detaylı dokümantasyon `docs` klasöründe mevcuttur:

- [DATABASE.md](docs/DATABASE.md) - Kapsamlı veritabanı dokümantasyonu (Comprehensive database documentation)
- [ER_DIAGRAM.md](docs/ER_DIAGRAM.md) - Entity relationship diyagramları (Entity relationship diagrams)

## 💾 Yedekleme (Backup)

### Yedek Oluşturma (Creating Backup)

```bash
./scripts/backup_database.sh
```

Yedekler `backups` klasöründe saklanır ve otomatik olarak 30 günden eski yedekler temizlenir.

Backups are stored in the `backups` directory and automatically cleaned up after 30 days.

### Yedekten Geri Yükleme (Restoring from Backup)

SQL dosyasından (From SQL file):
```bash
psql -d baglan_oto_care < backups/baglan_oto_care_YYYYMMDD_HHMMSS.sql
```

Custom format'tan (From custom format):
```bash
pg_restore -d baglan_oto_care backups/baglan_oto_care_YYYYMMDD_HHMMSS.sql.dump
```

## 📁 Dizin Yapısı (Directory Structure)

```
baglan-oto-care-DB/
├── schema/              # Veritabanı şema dosyaları (Database schema files)
│   └── 001_initial_schema.sql
├── migrations/          # Migrasyon scriptleri (Migration scripts)
│   └── 001_create_initial_schema.sql
├── seeds/              # Başlangıç verileri (Seed data)
│   └── 001_initial_data.sql
├── scripts/            # Yardımcı scriptler (Utility scripts)
│   ├── setup_database.sh
│   └── backup_database.sh
├── docs/               # Dokümantasyon (Documentation)
│   ├── DATABASE.md
│   └── ER_DIAGRAM.md
└── README.md           # Bu dosya (This file)
```

## 🔒 Güvenlik (Security)

- Hassas veriler için uygulama seviyesinde şifreleme önerilir (Application-level encryption recommended for sensitive data)
- SSL/TLS bağlantıları kullanın (Use SSL/TLS connections)
- Rol tabanlı erişim kontrolü uygulayın (Implement role-based access control)
- Düzenli yedekleme yapın (Maintain regular backups)
- Audit log'ları inceleyin (Monitor audit logs)

## 🤝 Katkıda Bulunma (Contributing)

1. Şema değişiklikleri için yeni migrasyon dosyası oluşturun (Create new migration files for schema changes)
2. Test veritabanında test edin (Test on development database)
3. Dokümantasyonu güncelleyin (Update documentation)
4. Rollback scriptleri hazırlayın (Prepare rollback scripts)

## 📄 Lisans (License)

Bu veritabanı şeması Bağlan Oto Care'e aittir. (This database schema is proprietary to Bağlan Oto Care.)

## 📞 İletişim (Contact)

Sorularınız için: info@baglanotocare.com

For questions: info@baglanotocare.com
