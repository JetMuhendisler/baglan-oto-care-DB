# Quick Reference Guide

## Common Commands

### Setup
```bash
# Initial setup
./scripts/setup_database.sh

# With custom settings
./scripts/setup_database.sh --db-name my_db --db-user my_user
```

### Docker
```bash
# Start database
docker-compose up -d

# Stop database
docker-compose down

# View logs
docker-compose logs -f postgres

# Access psql
docker-compose exec postgres psql -U postgres -d baglan_oto_care
```

### Backup
```bash
# Create backup
./scripts/backup_database.sh

# Restore backup
./scripts/restore_database.sh --backup-file backups/baglan_oto_care_20231021_120000.sql
```

### Database Access
```bash
# Connect via psql
psql -d baglan_oto_care -U postgres

# Connection string
postgresql://postgres@localhost:5432/baglan_oto_care
```

## Useful SQL Queries

### View all customers
```sql
SELECT * FROM customers ORDER BY created_at DESC;
```

### View appointments for today
```sql
SELECT 
    c.first_name || ' ' || c.last_name as customer,
    v.license_plate,
    s.name as service,
    a.start_time,
    a.status
FROM appointments a
JOIN customers c ON a.customer_id = c.id
JOIN vehicles v ON a.vehicle_id = v.id
JOIN services s ON a.service_id = s.id
WHERE a.appointment_date = CURRENT_DATE
ORDER BY a.start_time;
```

### Check parts inventory
```sql
SELECT 
    part_number,
    name,
    quantity_in_stock,
    reorder_level,
    CASE 
        WHEN quantity_in_stock < reorder_level THEN 'REORDER'
        ELSE 'OK'
    END as status
FROM parts
WHERE is_active = true
ORDER BY status DESC, name;
```

### Get customer with vehicles
```sql
SELECT 
    c.first_name || ' ' || c.last_name as customer,
    c.phone,
    v.make || ' ' || v.model || ' (' || v.year || ')' as vehicle,
    v.license_plate
FROM customers c
LEFT JOIN vehicles v ON c.id = v.customer_id
WHERE c.is_active = true
ORDER BY c.last_name, c.first_name;
```

### View pending invoices
```sql
SELECT 
    i.invoice_number,
    c.first_name || ' ' || c.last_name as customer,
    i.total_amount,
    i.issue_date,
    i.due_date
FROM invoices i
JOIN work_orders wo ON i.work_order_id = wo.id
JOIN appointments a ON wo.appointment_id = a.id
JOIN customers c ON a.customer_id = c.id
WHERE i.status = 'pending'
ORDER BY i.due_date;
```

## Maintenance Tasks

### Analyze database
```sql
ANALYZE;
```

### Vacuum database
```sql
VACUUM ANALYZE;
```

### Check table sizes
```sql
SELECT 
    tablename,
    pg_size_pretty(pg_total_relation_size(tablename::text)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(tablename::text) DESC;
```

### View active connections
```sql
SELECT 
    pid,
    usename,
    application_name,
    client_addr,
    state
FROM pg_stat_activity
WHERE datname = 'baglan_oto_care';
```

## Troubleshooting

### Database won't start
1. Check PostgreSQL is running: `systemctl status postgresql`
2. Check port availability: `netstat -an | grep 5432`
3. Check logs: `tail -f /var/log/postgresql/postgresql-*.log`

### Can't connect
1. Verify credentials
2. Check pg_hba.conf authentication settings
3. Ensure PostgreSQL is listening on correct interface

### Slow queries
1. Enable query logging
2. Run EXPLAIN ANALYZE on slow queries
3. Check for missing indexes
4. Consider vacuuming tables

### Out of disk space
1. Check database size: `SELECT pg_size_pretty(pg_database_size('baglan_oto_care'));`
2. Identify large tables (see query above)
3. Clean old audit logs
4. Archive old data
5. Vacuum full if necessary

## Getting Help

- Check documentation in `docs/` directory
- Review schema in `schema/001_initial_schema.sql`
- Examine seed data in `seeds/001_initial_data.sql`
- Read migrations in `migrations/` directory
