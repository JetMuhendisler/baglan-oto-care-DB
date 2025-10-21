# Docker Setup for Bağlan Oto Care Database

This directory includes Docker Compose configuration for running the database locally.

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Start the database:
```bash
docker-compose up -d
```

2. Check status:
```bash
docker-compose ps
```

3. View logs:
```bash
docker-compose logs -f postgres
```

## Services

### PostgreSQL Database
- **Port**: 5432
- **Database**: baglan_oto_care
- **User**: postgres
- **Password**: postgres

Connection string:
```
postgresql://postgres:postgres@localhost:5432/baglan_oto_care
```

### pgAdmin (Web UI)
- **Port**: 5050
- **URL**: http://localhost:5050
- **Email**: admin@baglanotocare.com
- **Password**: admin

## Initializing the Database

The schema and seed data are automatically loaded when the container starts for the first time.

To manually initialize or reset:

1. Stop and remove containers:
```bash
docker-compose down -v
```

2. Start again:
```bash
docker-compose up -d
```

## Connecting to Database

### Using psql
```bash
docker-compose exec postgres psql -U postgres -d baglan_oto_care
```

### Using pgAdmin
1. Open http://localhost:5050 in your browser
2. Login with credentials above
3. Add new server:
   - Name: Bağlan Oto Care
   - Host: postgres
   - Port: 5432
   - Database: baglan_oto_care
   - Username: postgres
   - Password: postgres

## Backup and Restore

### Create Backup
```bash
docker-compose exec postgres pg_dump -U postgres baglan_oto_care > backup.sql
```

### Restore from Backup
```bash
cat backup.sql | docker-compose exec -T postgres psql -U postgres baglan_oto_care
```

## Stopping the Database

Temporary stop:
```bash
docker-compose stop
```

Stop and remove (keeps data):
```bash
docker-compose down
```

Stop and remove all data:
```bash
docker-compose down -v
```

## Troubleshooting

### Port already in use
If port 5432 is already in use, modify `docker-compose.yml`:
```yaml
ports:
  - "5433:5432"  # Changed from 5432:5432
```

### Database not initializing
Check logs:
```bash
docker-compose logs postgres
```

### Reset everything
```bash
docker-compose down -v
docker volume prune -f
docker-compose up -d
```

## Production Notes

This Docker setup is for **development only**. For production:

1. Use strong passwords
2. Don't expose ports publicly
3. Use Docker secrets for credentials
4. Set up proper backup strategy
5. Use persistent volume mounting
6. Configure resource limits
