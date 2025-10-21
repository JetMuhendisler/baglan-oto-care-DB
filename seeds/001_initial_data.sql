-- Bağlan Oto Care - Initial Seed Data
-- This file contains sample data for testing and initial setup

-- ============================================================================
-- SERVICES - Common automotive services
-- ============================================================================
INSERT INTO services (id, name, description, duration_minutes, price, category) VALUES
    ('550e8400-e29b-41d4-a716-446655440001', 'Yağ Değişimi', 'Motor yağı ve filtre değişimi', 30, 250.00, 'Bakım'),
    ('550e8400-e29b-41d4-a716-446655440002', 'Fren Bakımı', 'Fren balatası kontrolü ve değişimi', 60, 500.00, 'Fren Sistemi'),
    ('550e8400-e29b-41d4-a716-446655440003', 'Lastik Değişimi', 'Mevsimsel lastik değişimi', 45, 200.00, 'Lastik'),
    ('550e8400-e29b-41d4-a716-446655440004', 'Rot Balans', 'Rot ve balans ayarı', 60, 300.00, 'Lastik'),
    ('550e8400-e29b-41d4-a716-446655440005', 'Klima Bakımı', 'Klima gazı kontrolü ve dolumu', 45, 400.00, 'Klima'),
    ('550e8400-e29b-41d4-a716-446655440006', 'Motor Genel Kontrolü', 'Motor sistemleri genel kontrolü', 90, 350.00, 'Motor'),
    ('550e8400-e29b-41d4-a716-446655440007', 'Akü Değişimi', 'Akü kontrolü ve değişimi', 20, 800.00, 'Elektrik'),
    ('550e8400-e29b-41d4-a716-446655440008', 'Triger Değişimi', 'Triger kayışı ve kasnak değişimi', 180, 1500.00, 'Motor'),
    ('550e8400-e29b-41d4-a716-446655440009', 'Egzoz Sistemi Onarımı', 'Egzoz sistemi kontrolü ve onarımı', 90, 600.00, 'Egzoz'),
    ('550e8400-e29b-41d4-a716-446655440010', 'Diferansiyel Bakımı', 'Diferansiyel yağı değişimi', 60, 450.00, 'Bakım');

-- ============================================================================
-- EMPLOYEES - Sample employees
-- ============================================================================
INSERT INTO employees (id, first_name, last_name, email, phone, role, specialization, hire_date) VALUES
    ('650e8400-e29b-41d4-a716-446655440001', 'Ahmet', 'Yılmaz', 'ahmet.yilmaz@baglanotocare.com', '+905551234567', 'Baş Mekanik', 'Motor Uzmanı', '2020-01-15'),
    ('650e8400-e29b-41d4-a716-446655440002', 'Mehmet', 'Demir', 'mehmet.demir@baglanotocare.com', '+905551234568', 'Mekanik', 'Fren Uzmanı', '2021-03-20'),
    ('650e8400-e29b-41d4-a716-446655440003', 'Ayşe', 'Kaya', 'ayse.kaya@baglanotocare.com', '+905551234569', 'Ön Büro', 'Müşteri İlişkileri', '2019-06-01'),
    ('650e8400-e29b-41d4-a716-446655440004', 'Fatma', 'Şahin', 'fatma.sahin@baglanotocare.com', '+905551234570', 'Muhasebe', 'Mali İşler', '2020-09-10'),
    ('650e8400-e29b-41d4-a716-446655440005', 'Mustafa', 'Çelik', 'mustafa.celik@baglanotocare.com', '+905551234571', 'Mekanik', 'Elektrik Uzmanı', '2021-11-05');

-- ============================================================================
-- PARTS - Common automotive parts
-- ============================================================================
INSERT INTO parts (id, part_number, name, description, category, unit_price, quantity_in_stock, reorder_level, supplier) VALUES
    ('750e8400-e29b-41d4-a716-446655440001', 'OIL-5W30-001', 'Motor Yağı 5W-30', 'Sentetik motor yağı 5 litre', 'Yağlar', 180.00, 50, 10, 'Shell Türkiye'),
    ('750e8400-e29b-41d4-a716-446655440002', 'FILTER-OIL-001', 'Yağ Filtresi', 'Standart yağ filtresi', 'Filtreler', 45.00, 100, 20, 'Mann Filter'),
    ('750e8400-e29b-41d4-a716-446655440003', 'BRAKE-PAD-001', 'Fren Balatası Ön', 'Ön fren balatası takımı', 'Fren Parçaları', 250.00, 40, 10, 'Bosch'),
    ('750e8400-e29b-41d4-a716-446655440004', 'BRAKE-PAD-002', 'Fren Balatası Arka', 'Arka fren balatası takımı', 'Fren Parçaları', 200.00, 40, 10, 'Bosch'),
    ('750e8400-e29b-41d4-a716-446655440005', 'FILTER-AIR-001', 'Hava Filtresi', 'Motor hava filtresi', 'Filtreler', 80.00, 60, 15, 'Mann Filter'),
    ('750e8400-e29b-41d4-a716-446655440006', 'SPARK-PLUG-001', 'Buji Takımı', '4 adet buji takımı', 'Elektrik', 120.00, 30, 10, 'NGK'),
    ('750e8400-e29b-41d4-a716-446655440007', 'BATTERY-12V-001', 'Akü 12V 60Ah', '12V 60Ah akü', 'Elektrik', 650.00, 15, 5, 'Mutlu Akü'),
    ('750e8400-e29b-41d4-a716-446655440008', 'COOLANT-001', 'Antifriz', 'Motor soğutma sıvısı 5 litre', 'Sıvılar', 150.00, 40, 10, 'Castrol'),
    ('750e8400-e29b-41d4-a716-446655440009', 'WIPER-BLADE-001', 'Silecek Takımı', 'Ön cam silecek çifti', 'Aksesuar', 90.00, 50, 15, 'Bosch'),
    ('750e8400-e29b-41d4-a716-446655440010', 'TIMING-BELT-001', 'Triger Kayışı', 'Triger kayış seti', 'Motor Parçaları', 450.00, 20, 5, 'Continental');

-- ============================================================================
-- SYSTEM SETTINGS - Default configuration
-- ============================================================================
INSERT INTO system_settings (setting_key, setting_value, description) VALUES
    ('business_name', 'Bağlan Oto Care', 'İşletme adı'),
    ('business_address', 'Örnek Mahallesi, Oto Sanayi Sitesi No:15, İstanbul', 'İşletme adresi'),
    ('business_phone', '+902121234567', 'İşletme telefon numarası'),
    ('business_email', 'info@baglanotocare.com', 'İşletme e-posta adresi'),
    ('tax_rate', '0.18', 'KDV oranı (18%)'),
    ('currency', 'TRY', 'Para birimi'),
    ('appointment_duration_default', '60', 'Varsayılan randevu süresi (dakika)'),
    ('working_hours_start', '08:00', 'İş günü başlangıç saati'),
    ('working_hours_end', '18:00', 'İş günü bitiş saati'),
    ('working_days', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday', 'Çalışma günleri'),
    ('invoice_prefix', 'INV', 'Fatura numarası ön eki'),
    ('reminder_days_before', '1', 'Randevu hatırlatma süresi (gün)');

-- ============================================================================
-- SAMPLE CUSTOMERS (for testing)
-- ============================================================================
INSERT INTO customers (id, first_name, last_name, email, phone, address, city, postal_code) VALUES
    ('850e8400-e29b-41d4-a716-446655440001', 'Ali', 'Veli', 'ali.veli@example.com', '+905301234567', 'Atatürk Caddesi No:25', 'İstanbul', '34000'),
    ('850e8400-e29b-41d4-a716-446655440002', 'Zeynep', 'Yıldız', 'zeynep.yildiz@example.com', '+905301234568', 'İstiklal Caddesi No:45', 'Ankara', '06000'),
    ('850e8400-e29b-41d4-a716-446655440003', 'Can', 'Özkan', 'can.ozkan@example.com', '+905301234569', 'Cumhuriyet Bulvarı No:78', 'İzmir', '35000');

-- ============================================================================
-- SAMPLE VEHICLES (for testing)
-- ============================================================================
INSERT INTO vehicles (id, customer_id, make, model, year, license_plate, vin, color, mileage) VALUES
    ('950e8400-e29b-41d4-a716-446655440001', '850e8400-e29b-41d4-a716-446655440001', 'Toyota', 'Corolla', 2020, '34ABC123', 'JTDKN3DU0E0123456', 'Beyaz', 45000),
    ('950e8400-e29b-41d4-a716-446655440002', '850e8400-e29b-41d4-a716-446655440002', 'Volkswagen', 'Passat', 2019, '06XYZ456', 'WVWZZZ3CZKP654321', 'Siyah', 62000),
    ('950e8400-e29b-41d4-a716-446655440003', '850e8400-e29b-41d4-a716-446655440003', 'Renault', 'Megane', 2021, '35DEF789', 'VF1LM1B0H55654321', 'Gri', 28000);
