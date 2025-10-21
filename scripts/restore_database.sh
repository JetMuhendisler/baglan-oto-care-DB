#!/bin/bash

# Bağlan Oto Care Database Restore Script
# This script restores a database from backup

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
BACKUP_FILE=""

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

# Function to validate backup file
validate_backup() {
    if [ -z "$BACKUP_FILE" ]; then
        print_error "No backup file specified. Use --backup-file option."
        exit 1
    fi
    
    if [ ! -f "$BACKUP_FILE" ]; then
        print_error "Backup file not found: $BACKUP_FILE"
        exit 1
    fi
    
    print_info "Backup file validated: $BACKUP_FILE"
}

# Function to restore database
restore_database() {
    print_warning "This will drop the existing database '$DB_NAME' and restore from backup."
    read -p "Are you sure you want to continue? (yes/no): " answer
    
    if [ "$answer" != "yes" ]; then
        print_info "Restore cancelled."
        exit 0
    fi
    
    print_info "Dropping existing database..."
    dropdb -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" "$DB_NAME" --if-exists
    
    print_info "Creating new database..."
    createdb -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" "$DB_NAME"
    
    print_info "Restoring from backup..."
    
    # Detect backup format and restore accordingly
    if [[ "$BACKUP_FILE" == *.dump ]]; then
        print_info "Restoring from custom format backup..."
        pg_restore -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" "$BACKUP_FILE"
    elif [[ "$BACKUP_FILE" == *.sql ]]; then
        print_info "Restoring from SQL backup..."
        psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" < "$BACKUP_FILE"
    else
        print_error "Unknown backup format. Use .sql or .dump file."
        exit 1
    fi
    
    print_info "Restore completed successfully!"
}

# Main execution
main() {
    echo "========================================"
    echo "Bağlan Oto Care Database Restore"
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
            --backup-file)
                BACKUP_FILE="$2"
                shift 2
                ;;
            --help)
                echo "Usage: $0 [options]"
                echo ""
                echo "Options:"
                echo "  --db-name NAME       Database name (default: baglan_oto_care)"
                echo "  --db-user USER       Database user (default: postgres)"
                echo "  --db-host HOST       Database host (default: localhost)"
                echo "  --db-port PORT       Database port (default: 5432)"
                echo "  --backup-file FILE   Path to backup file (required)"
                echo "  --help               Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
    
    validate_backup
    restore_database
    
    print_info "All done!"
    print_info "Database '$DB_NAME' has been restored successfully."
}

main "$@"
