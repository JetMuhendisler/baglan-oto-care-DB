#!/bin/bash

# Bağlan Oto Care Database Setup Script
# This script sets up the PostgreSQL database for the application

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

# Function to check if PostgreSQL is installed
check_postgresql() {
    if ! command -v psql &> /dev/null; then
        print_error "PostgreSQL is not installed. Please install PostgreSQL first."
        exit 1
    fi
    print_info "PostgreSQL is installed."
}

# Function to create database
create_database() {
    print_info "Creating database: $DB_NAME"
    
    # Check if database already exists
    if psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -lqt | cut -d \| -f 1 | grep -qw "$DB_NAME"; then
        print_warning "Database '$DB_NAME' already exists."
        read -p "Do you want to drop and recreate it? (yes/no): " answer
        if [ "$answer" == "yes" ]; then
            print_info "Dropping existing database..."
            dropdb -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" "$DB_NAME"
            print_info "Creating new database..."
            createdb -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" "$DB_NAME"
        else
            print_info "Using existing database."
        fi
    else
        createdb -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" "$DB_NAME"
        print_info "Database created successfully."
    fi
}

# Function to run migrations
run_migrations() {
    print_info "Running database migrations..."
    
    cd "$(dirname "$0")/.."
    
    # Run initial migration
    psql -U "$DB_USER" -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -f migrations/001_create_initial_schema.sql
    
    print_info "Migrations completed successfully."
}

# Function to display connection information
show_connection_info() {
    print_info "Database setup completed!"
    echo ""
    echo "Connection details:"
    echo "  Database: $DB_NAME"
    echo "  Host: $DB_HOST"
    echo "  Port: $DB_PORT"
    echo "  User: $DB_USER"
    echo ""
    echo "Connection string:"
    echo "  postgresql://$DB_USER@$DB_HOST:$DB_PORT/$DB_NAME"
    echo ""
}

# Main execution
main() {
    echo "========================================"
    echo "Bağlan Oto Care Database Setup"
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
            --help)
                echo "Usage: $0 [options]"
                echo ""
                echo "Options:"
                echo "  --db-name NAME    Database name (default: baglan_oto_care)"
                echo "  --db-user USER    Database user (default: postgres)"
                echo "  --db-host HOST    Database host (default: localhost)"
                echo "  --db-port PORT    Database port (default: 5432)"
                echo "  --help            Show this help message"
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
    
    check_postgresql
    create_database
    run_migrations
    show_connection_info
}

main "$@"
