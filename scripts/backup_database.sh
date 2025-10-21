#!/bin/bash

# Bağlan Oto Care Database Backup Script
# This script creates backups of the database

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
DB_NAME="baglan_oto_care"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create backup directory
create_backup_dir() {
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
        print_info "Created backup directory: $BACKUP_DIR"
    fi
}

# Function to backup database
backup_database() {
    local backup_file="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql"
    
    print_info "Creating backup: $backup_file"
    
    pg_dump -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -F c -f "$backup_file.dump"
    pg_dump -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" > "$backup_file"
    
    print_info "Backup completed successfully!"
    print_info "Backup files:"
    print_info "  - $backup_file (SQL format)"
    print_info "  - $backup_file.dump (Custom format)"
}

# Function to cleanup old backups
cleanup_old_backups() {
    local days_to_keep=30
    
    print_info "Cleaning up backups older than $days_to_keep days..."
    find "$BACKUP_DIR" -name "*.sql" -type f -mtime +$days_to_keep -delete
    find "$BACKUP_DIR" -name "*.dump" -type f -mtime +$days_to_keep -delete
    print_info "Cleanup completed."
}

# Main execution
main() {
    echo "========================================"
    echo "Bağlan Oto Care Database Backup"
    echo "========================================"
    echo ""
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --db-name)
                DB_NAME="$2"
                shift 2
                ;;
            --db-user)
                DB_USER="$2"
                shift 2
                ;;
            --db-host)
                DB_HOST="$2"
                shift 2
                ;;
            --db-port)
                DB_PORT="$2"
                shift 2
                ;;
            --backup-dir)
                BACKUP_DIR="$2"
                shift 2
                ;;
            --help)
                echo "Usage: $0 [options]"
                echo ""
                echo "Options:"
                echo "  --db-name NAME      Database name (default: baglan_oto_care)"
                echo "  --db-user USER      Database user (default: postgres)"
                echo "  --db-host HOST      Database host (default: localhost)"
                echo "  --db-port PORT      Database port (default: 5432)"
                echo "  --backup-dir DIR    Backup directory (default: ./backups)"
                echo "  --help              Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
    
    create_backup_dir
    backup_database
    cleanup_old_backups
    
    print_info "All done!"
}

main "$@"
