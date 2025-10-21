# Entity Relationship Diagram

## Database Schema Overview

This document describes the entity relationships in the Bağlan Oto Care database.

## Main Entities and Relationships

### Customer → Vehicle (One-to-Many)
A customer can own multiple vehicles.
- Customer.id → Vehicle.customer_id

### Customer → Appointment (One-to-Many)
A customer can have multiple appointments.
- Customer.id → Appointment.customer_id

### Vehicle → Appointment (One-to-Many)
A vehicle can have multiple appointments.
- Vehicle.id → Appointment.vehicle_id

### Service → Appointment (One-to-Many)
A service can be booked in multiple appointments.
- Service.id → Appointment.service_id

### Employee → Appointment (One-to-Many)
An employee can handle multiple appointments.
- Employee.id → Appointment.employee_id

### Appointment → Work Order (One-to-One)
Each appointment generates one work order.
- Appointment.id → Work_Order.appointment_id

### Work Order → Work Order Parts (One-to-Many)
A work order can include multiple parts.
- Work_Order.id → Work_Order_Parts.work_order_id

### Parts → Work Order Parts (One-to-Many)
A part can be used in multiple work orders.
- Parts.id → Work_Order_Parts.part_id

### Work Order → Invoice (One-to-One)
Each work order generates one invoice.
- Work_Order.id → Invoice.work_order_id

### Vehicle → Maintenance History (One-to-Many)
A vehicle has a maintenance history with multiple records.
- Vehicle.id → Maintenance_History.vehicle_id

## Visual Representation

```
┌─────────────┐
│  CUSTOMERS  │
└──────┬──────┘
       │
       │ 1:N
       │
       ├──────────────────────┐
       │                      │
       ▼                      ▼
┌─────────────┐        ┌──────────────┐
│  VEHICLES   │        │ APPOINTMENTS │◄─────┐
└──────┬──────┘        └──────┬───────┘      │
       │                      │               │
       │ 1:N                  │ 1:1           │ N:1
       │                      │               │
       ▼                      ▼               │
┌──────────────────┐   ┌─────────────┐  ┌────────────┐
│ MAINTENANCE_     │   │ WORK_ORDERS │  │  SERVICES  │
│ HISTORY          │   └──────┬──────┘  └────────────┘
└──────────────────┘          │
                              │ 1:N          ┌───────────┐
                              │              │ EMPLOYEES │
                              ▼              └─────┬─────┘
                       ┌─────────────────┐         │
                       │ WORK_ORDER_     │         │ N:1
                       │ PARTS           │         │
                       └────────┬────────┘         │
                                │                  │
                                │ N:1              │
                                │                  │
                                ▼                  │
                          ┌─────────┐             │
                          │  PARTS  │             │
                          └─────────┘             │
                                                  │
       ┌──────────────────────────────────────────┘
       │
       ▼
┌─────────────┐
│ APPOINTMENTS│
└──────┬──────┘
       │ 1:1
       │
       ▼
┌─────────────┐
│ WORK_ORDERS │
└──────┬──────┘
       │ 1:1
       │
       ▼
┌─────────────┐
│  INVOICES   │
└─────────────┘
```

## Cascade Behaviors

### ON DELETE CASCADE
- Customers → Vehicles: Delete customer removes all their vehicles
- Customers → Appointments: Delete customer removes all their appointments
- Vehicles → Appointments: Delete vehicle removes all its appointments
- Vehicles → Maintenance History: Delete vehicle removes all its history
- Appointments → Work Orders: Delete appointment removes work order
- Work Orders → Work Order Parts: Delete work order removes parts records
- Work Orders → Invoices: Delete work order removes invoice

### ON DELETE RESTRICT
- Services → Appointments: Cannot delete service if appointments exist
- Parts → Work Order Parts: Cannot delete part if used in work orders

### ON DELETE SET NULL
- Employees → Appointments: Delete employee sets appointment.employee_id to NULL
- Work Orders → Maintenance History: Delete work order sets maintenance_history.work_order_id to NULL

## Supporting Tables

### System Settings
Standalone table for application configuration.

### Audit Log
Tracks changes across all tables. Uses JSONB for flexibility.

### Schema Version
Tracks database migration history.

## Data Types

### Primary Keys
All tables use UUID primary keys for:
- Better scalability
- Distributed system support
- Security (non-sequential)

### Timestamps
All timestamps include timezone information (TIMESTAMP WITH TIME ZONE).

### Money
Financial values use DECIMAL(10, 2) for precision.

### Text vs VARCHAR
- VARCHAR with length limits for fixed-format data (names, codes)
- TEXT for unlimited length data (notes, descriptions)

## Indexes

Indexes are created on:
- All foreign keys for join performance
- Commonly queried fields (status, dates, active flags)
- Unique identifiers (license_plate, VIN, part_number)

## Constraints

### Check Constraints
- appointment_times: end_time > start_time

### Unique Constraints
- customers.email
- vehicles.license_plate
- vehicles.vin
- parts.part_number
- invoices.invoice_number
- employees.email

## Future Considerations

Potential additions for future versions:
1. User authentication and authorization tables
2. Payment transaction history
3. Customer loyalty program
4. Parts supplier management
5. Employee scheduling
6. Service package bundles
7. Marketing campaigns
8. Customer feedback/reviews
