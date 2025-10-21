-- Migration: Initial Database Setup
-- Version: 001
-- Description: Creates the initial schema for Bağlan Oto Care database
-- Author: Database Team
-- Date: 2025-10-21

-- This migration creates all base tables for the appointment and customer management system

-- Run this script to set up the database:
-- psql -U <username> -d <database_name> -f 001_create_initial_schema.sql

\echo 'Starting migration 001: Initial Database Setup'

-- Create schema version table if it doesn't exist
CREATE TABLE IF NOT EXISTS schema_version (
    id SERIAL PRIMARY KEY,
    version INTEGER NOT NULL UNIQUE,
    description TEXT NOT NULL,
    applied_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    applied_by VARCHAR(100) DEFAULT CURRENT_USER
);

\echo 'Running schema creation...'

-- Execute the main schema file
\i ../schema/001_initial_schema.sql

\echo 'Running seed data...'

-- Execute seed data
\i ../seeds/001_initial_data.sql

-- Record this migration
INSERT INTO schema_version (version, description) 
VALUES (1, 'Initial database schema with all core tables');

\echo 'Migration 001 completed successfully!'
\echo 'Database is ready for use.'
