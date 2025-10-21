# Database Migrations

This directory contains database migration scripts for Bağlan Oto Care.

## Migration Naming Convention

Migrations follow the pattern: `{version}_{description}.sql`

Example: `001_create_initial_schema.sql`

## Running Migrations

### Automatic (Recommended)

Use the setup script which runs all migrations:
```bash
./scripts/setup_database.sh
```

### Manual

Run migrations in order:
```bash
psql -d baglan_oto_care -f migrations/001_create_initial_schema.sql
```

## Rollback

Each migration has a corresponding rollback script:
```bash
psql -d baglan_oto_care -f migrations/001_rollback.sql
```

## Migration History

| Version | Description | Applied Date | Status |
|---------|-------------|--------------|--------|
| 001 | Initial database schema | 2025-10-21 | ✅ Active |

## Creating New Migrations

1. Create a new migration file with the next version number
2. Create a corresponding rollback file
3. Test on development database
4. Update this README with migration details
5. Run migration on production

## Best Practices

- Always create a rollback script
- Test migrations on development first
- Keep migrations idempotent when possible
- Document breaking changes
- Back up database before applying migrations
