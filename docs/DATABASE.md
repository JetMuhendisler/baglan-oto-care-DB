# Bağlan Oto Care Database Documentation

## Overview

This is the database repository for Bağlan Oto Care - a comprehensive appointment and customer management system designed specifically for automotive service centers.

## Database Schema

### Entity Relationship

The database consists of the following main entities:

1. **Customers** - Customer information
2. **Vehicles** - Vehicles owned by customers
3. **Services** - Service catalog offered by the shop
4. **Employees** - Staff and mechanics
5. **Appointments** - Scheduled service appointments
6. **Work Orders** - Active work being performed
7. **Parts** - Parts inventory
8. **Work Order Parts** - Parts used in work orders
9. **Invoices** - Billing and payment records
10. **Maintenance History** - Historical service records
11. **System Settings** - Configuration settings
12. **Audit Log** - Change tracking

### Table Details

#### Customers Table
Stores customer information including contact details and address.

**Key Fields:**
- `id` (UUID) - Primary key
- `first_name`, `last_name` - Customer name
- `email`, `phone` - Contact information
- `address`, `city`, `postal_code` - Location
- `is_active` - Account status

#### Vehicles Table
Vehicle information associated with customers.

**Key Fields:**
- `id` (UUID) - Primary key
- `customer_id` (UUID) - Reference to customer
- `make`, `model`, `year` - Vehicle details
- `license_plate` - Unique identifier
- `vin` - Vehicle Identification Number
- `mileage` - Current mileage

#### Services Table
Catalog of services offered by the shop.

**Key Fields:**
- `id` (UUID) - Primary key
- `name` - Service name
- `description` - Service details
- `duration_minutes` - Expected duration
- `price` - Service cost
- `category` - Service category

#### Employees Table
Staff and mechanic information.

**Key Fields:**
- `id` (UUID) - Primary key
- `first_name`, `last_name` - Employee name
- `email`, `phone` - Contact information
- `role` - Job role
- `specialization` - Area of expertise
- `hire_date` - Employment start date

#### Appointments Table
Scheduled service appointments.

**Key Fields:**
- `id` (UUID) - Primary key
- `customer_id`, `vehicle_id`, `service_id`, `employee_id` - References
- `appointment_date` - Scheduled date
- `start_time`, `end_time` - Time slot
- `status` - Appointment status (scheduled, completed, cancelled)

#### Work Orders Table
Active work being performed on vehicles.

**Key Fields:**
- `id` (UUID) - Primary key
- `appointment_id` - Reference to appointment
- `status` - Work status (pending, in_progress, completed)
- `labor_cost`, `parts_cost` - Cost breakdown
- `total_cost` - Calculated total (generated column)

#### Parts Table
Inventory management for parts.

**Key Fields:**
- `id` (UUID) - Primary key
- `part_number` - Unique part identifier
- `name`, `description` - Part details
- `unit_price` - Part price
- `quantity_in_stock` - Current inventory
- `reorder_level` - Minimum stock level

#### Work Order Parts Table
Junction table linking parts to work orders.

**Key Fields:**
- `id` (UUID) - Primary key
- `work_order_id`, `part_id` - References
- `quantity` - Parts used
- `unit_price` - Price at time of use
- `total_price` - Calculated total (generated column)

#### Invoices Table
Billing and payment records.

**Key Fields:**
- `id` (UUID) - Primary key
- `work_order_id` - Reference to work order
- `invoice_number` - Unique invoice identifier
- `issue_date`, `due_date` - Invoice dates
- `subtotal`, `tax_amount`, `discount_amount`, `total_amount` - Financial details
- `status` - Payment status (pending, paid, overdue)

#### Maintenance History Table
Historical record of all services performed.

**Key Fields:**
- `id` (UUID) - Primary key
- `vehicle_id` - Reference to vehicle
- `service_type` - Type of service
- `service_date` - When service was performed
- `mileage` - Vehicle mileage at service time
- `next_service_date`, `next_service_mileage` - Scheduled next service

#### System Settings Table
Configuration settings for the application.

**Key Fields:**
- `setting_key` - Unique setting identifier
- `setting_value` - Setting value
- `description` - Setting description

#### Audit Log Table
Tracks all changes made to the database.

**Key Fields:**
- `id` (UUID) - Primary key
- `table_name` - Table that was modified
- `record_id` - ID of the modified record
- `action` - Type of action (INSERT, UPDATE, DELETE)
- `old_values`, `new_values` - JSONB data
- `changed_by` - User who made the change

## Database Features

### Automatic Timestamps
All main tables have automatic `updated_at` timestamp updates via database triggers.

### UUID Primary Keys
All tables use UUID primary keys for better scalability and security.

### Indexes
Comprehensive indexes on foreign keys and commonly queried fields for optimal performance.

### Referential Integrity
Proper foreign key constraints with appropriate CASCADE, RESTRICT, and SET NULL behaviors.

### Generated Columns
Calculated fields like `total_cost` are automatically computed using generated columns.

### Data Validation
Check constraints ensure data integrity (e.g., end_time > start_time).

## Setup Instructions

### Prerequisites
- PostgreSQL 12 or higher
- psql command-line tool

### Quick Setup

1. Run the setup script:
```bash
./scripts/setup_database.sh
```

2. With custom parameters:
```bash
./scripts/setup_database.sh \
  --db-name baglan_oto_care \
  --db-user postgres \
  --db-host localhost \
  --db-port 5432
```

### Manual Setup

1. Create the database:
```bash
createdb baglan_oto_care
```

2. Run the schema:
```bash
psql -d baglan_oto_care -f schema/001_initial_schema.sql
```

3. Load seed data:
```bash
psql -d baglan_oto_care -f seeds/001_initial_data.sql
```

## Backup and Restore

### Create Backup

Run the backup script:
```bash
./scripts/backup_database.sh
```

This creates two backup files in the `backups` directory:
- `.sql` file - Plain SQL format
- `.dump` file - PostgreSQL custom format

### Restore from Backup

From SQL file:
```bash
psql -d baglan_oto_care < backups/baglan_oto_care_YYYYMMDD_HHMMSS.sql
```

From custom format:
```bash
pg_restore -d baglan_oto_care backups/baglan_oto_care_YYYYMMDD_HHMMSS.sql.dump
```

## Migrations

Migrations are stored in the `migrations` directory and should be run in numerical order.

### Migration History

| Version | Description | Date |
|---------|-------------|------|
| 001 | Initial database schema | 2025-10-21 |

### Running Migrations

Migrations can be run using the setup script or manually:
```bash
psql -d baglan_oto_care -f migrations/001_create_initial_schema.sql
```

## Common Queries

### Get customer appointment history
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

### Get pending work orders
```sql
SELECT 
    wo.id,
    c.first_name || ' ' || c.last_name as customer_name,
    v.license_plate,
    s.name as service,
    wo.status,
    wo.total_cost
FROM work_orders wo
JOIN appointments a ON wo.appointment_id = a.id
JOIN customers c ON a.customer_id = c.id
JOIN vehicles v ON a.vehicle_id = v.id
JOIN services s ON a.service_id = s.id
WHERE wo.status IN ('pending', 'in_progress')
ORDER BY a.appointment_date;
```

### Get inventory below reorder level
```sql
SELECT 
    part_number,
    name,
    quantity_in_stock,
    reorder_level,
    (reorder_level - quantity_in_stock) as quantity_needed
FROM parts
WHERE quantity_in_stock < reorder_level
    AND is_active = true
ORDER BY (reorder_level - quantity_in_stock) DESC;
```

### Get revenue by service category
```sql
SELECT 
    s.category,
    COUNT(*) as service_count,
    SUM(s.price) as total_revenue
FROM appointments a
JOIN services s ON a.service_id = s.id
WHERE a.status = 'completed'
    AND a.appointment_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY s.category
ORDER BY total_revenue DESC;
```

## Security Considerations

1. **Sensitive Data**: Customer email and phone numbers should be encrypted at the application level
2. **User Permissions**: Implement role-based access control at the application level
3. **Audit Trail**: All changes are logged in the audit_log table
4. **Backups**: Regular backups should be scheduled and stored securely
5. **Connection**: Use SSL/TLS for database connections in production

## Development Guidelines

1. **Schema Changes**: Always create a new migration file for schema changes
2. **Testing**: Test migrations on a development database before production
3. **Rollback**: Keep rollback scripts for each migration
4. **Documentation**: Update this documentation with any schema changes
5. **Naming**: Use snake_case for all database objects

## Support

For issues or questions about the database:
- Check the documentation in the `docs` directory
- Review the schema files in the `schema` directory
- Examine seed data in the `seeds` directory for examples

## License

This database schema is proprietary to Bağlan Oto Care.
