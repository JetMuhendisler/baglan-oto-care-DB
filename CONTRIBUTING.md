# Contributing to Bağlan Oto Care Database

Thank you for considering contributing to our database! This document provides guidelines for database changes.

## Getting Started

1. Fork the repository
2. Set up your local development environment using Docker:
   ```bash
   docker-compose up -d
   ```
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Database Change Guidelines

### Schema Changes

When making schema changes:

1. **Create a new migration file**
   ```
   migrations/00X_description_of_change.sql
   ```

2. **Create a rollback script**
   ```
   migrations/00X_rollback.sql
   ```

3. **Test both migration and rollback**
   ```bash
   # Apply migration
   psql -d baglan_oto_care -f migrations/00X_description_of_change.sql
   
   # Test rollback
   psql -d baglan_oto_care -f migrations/00X_rollback.sql
   ```

4. **Update documentation**
   - Update `docs/DATABASE.md` with new tables/columns
   - Update `docs/ER_DIAGRAM.md` if relationships change
   - Update `migrations/README.md` with migration details

### Naming Conventions

#### Tables
- Use plural nouns: `customers`, `vehicles`, `appointments`
- Use snake_case: `work_orders`, `maintenance_history`

#### Columns
- Use snake_case: `first_name`, `created_at`
- Use descriptive names: `appointment_date` not `appt_dt`
- Foreign keys: `{table}_id` (e.g., `customer_id`)

#### Indexes
- Pattern: `idx_{table}_{column(s)}`
- Example: `idx_customers_email`, `idx_appointments_date`

#### Constraints
- Primary keys: `{table}_pkey` (auto-generated)
- Foreign keys: `{table}_{referenced_table}_fkey` (auto-generated)
- Check constraints: `check_{table}_{description}`
- Unique constraints: `{table}_{column}_key` (auto-generated)

### Data Types

Use appropriate data types:

- **IDs**: `UUID` (with `uuid_generate_v4()`)
- **Strings**: 
  - Fixed/limited length: `VARCHAR(n)`
  - Unlimited: `TEXT`
- **Numbers**:
  - Integers: `INTEGER` or `BIGINT`
  - Decimals: `DECIMAL(p, s)` for money
- **Dates/Times**:
  - Date only: `DATE`
  - Time only: `TIME`
  - Full timestamp: `TIMESTAMP WITH TIME ZONE`
- **Boolean**: `BOOLEAN`
- **JSON**: `JSONB` (not `JSON`)

### Indexes

Add indexes for:
- Foreign keys (always)
- Columns frequently used in WHERE clauses
- Columns used in JOIN conditions
- Columns used in ORDER BY
- Columns with high selectivity

Don't over-index:
- Avoid indexes on small tables (< 1000 rows)
- Avoid indexes on columns with low selectivity
- Consider composite indexes instead of multiple single-column indexes

### Constraints

Always use:
- Primary keys on all tables
- Foreign keys with appropriate ON DELETE behavior:
  - `CASCADE`: Delete child when parent deleted
  - `RESTRICT`: Prevent deletion if children exist
  - `SET NULL`: Set to NULL when parent deleted
- NOT NULL where appropriate
- CHECK constraints for data validation
- UNIQUE constraints where needed

### Default Values

Use default values for:
- Timestamps: `DEFAULT CURRENT_TIMESTAMP`
- Boolean flags: `DEFAULT TRUE` or `DEFAULT FALSE`
- Status fields: `DEFAULT 'pending'`
- UUIDs: `DEFAULT uuid_generate_v4()`

## Seed Data

### Adding Seed Data

1. Create file in `seeds/` directory
2. Use fixed UUIDs for test data (like existing seed data)
3. Include diverse realistic examples
4. Document data purpose in comments

### Example Seed Data Structure

```sql
-- Description of data
-- Why this data is needed

INSERT INTO table_name (columns...) VALUES
    ('value1', 'value2', ...),
    ('value1', 'value2', ...);
```

## Testing Changes

### Test Checklist

Before submitting:

- [ ] Migration runs without errors
- [ ] Rollback works correctly
- [ ] Data integrity maintained
- [ ] Indexes created as expected
- [ ] Constraints work as intended
- [ ] Seed data loads successfully
- [ ] Documentation updated
- [ ] No breaking changes (or documented)

### Testing Process

1. **Fresh database test**
   ```bash
   docker-compose down -v
   docker-compose up -d
   ./scripts/setup_database.sh
   ```

2. **Migration test**
   ```bash
   psql -d baglan_oto_care -f migrations/00X_new_migration.sql
   ```

3. **Rollback test**
   ```bash
   psql -d baglan_oto_care -f migrations/00X_rollback.sql
   ```

4. **Performance test**
   ```sql
   EXPLAIN ANALYZE SELECT ...;
   ```

## Documentation

Update documentation for all changes:

### Required Documentation

1. **Migration README**
   - Add entry to migration history table
   - Document breaking changes

2. **DATABASE.md**
   - Add new tables to schema section
   - Update table descriptions
   - Add example queries if applicable

3. **ER_DIAGRAM.md**
   - Update relationships
   - Add new entities
   - Update cascade behaviors

4. **QUICK_REFERENCE.md**
   - Add useful queries for new features

## Code Review Process

Pull requests will be reviewed for:

1. **Correctness**
   - SQL syntax
   - Logic correctness
   - Data integrity

2. **Performance**
   - Query efficiency
   - Index usage
   - Scalability

3. **Maintainability**
   - Code clarity
   - Naming conventions
   - Documentation

4. **Testing**
   - Test coverage
   - Edge cases
   - Rollback capability

## Breaking Changes

If your change is breaking:

1. Document it clearly in PR description
2. Provide migration path for existing data
3. Update major version number
4. Consider deprecation period

## Questions?

- Open an issue for discussion
- Check existing documentation
- Review past migrations for examples

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
