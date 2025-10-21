-- Rollback Migration: Initial Database Setup
-- Version: 001
-- Description: Drops all tables created in migration 001
-- Author: Database Team
-- Date: 2025-10-21

\echo 'Starting rollback of migration 001...'

-- Drop tables in reverse order of dependencies

DROP TABLE IF EXISTS audit_log CASCADE;
DROP TABLE IF EXISTS maintenance_history CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;
DROP TABLE IF EXISTS work_order_parts CASCADE;
DROP TABLE IF EXISTS parts CASCADE;
DROP TABLE IF EXISTS work_orders CASCADE;
DROP TABLE IF EXISTS appointments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS vehicles CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS system_settings CASCADE;

-- Drop functions
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;

-- Drop extension
DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE;

-- Remove version record
DELETE FROM schema_version WHERE version = 1;

\echo 'Rollback of migration 001 completed successfully!'
\echo 'All tables and related objects have been removed.'
