# MySQL Database Triggers Project

## Overview
This project demonstrates the use of **MySQL triggers** to automate tasks and enforce business rules on database operations. Triggers are created for **INSERT, UPDATE, and DELETE** events to ensure data consistency, validation, and automatic notifications.

## Features

1. **Before Insert Trigger**  
   - Validates data before insertion.  
   - Example: Ensures age cannot be negative by automatically setting invalid ages to 0.

2. **After Insert Trigger**  
   - Performs actions after a new record is inserted.  
   - Example: Sends a reminder message to users missing their date of birth.

3. **Before Update Trigger**  
   - Modifies data before updates to enforce rules.  
   - Example: Adjusts salary values based on specific conditions before saving.

4. **Before Delete Trigger**  
   - Captures deleted records for audit purposes.  
   - Example: Inserts deleted salary records into a history table to maintain logs.

## Tables Used
- `customers` – Stores basic customer information.  
- `customers1` – Stores customer details with DOB validation.  
- `message` – Stores automated messages for missing information.  
- `employees` – Stores employee details with salary rules.  
- `salary` – Stores employee salaries.  
- `salarydel` – Keeps history of deleted salary records for auditing.

## Purpose
- Enforce **data integrity** automatically.  
- Reduce manual intervention for routine checks.  
- Track **historical changes** and maintain **audit trails**.  
- Demonstrate practical examples of **BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, and BEFORE DELETE** triggers in MySQL.

## Learning Outcome
- Understand trigger syntax and usage in MySQL.  
- Learn how to perform **automatic validation, auditing, and notifications** using triggers.  
- Apply triggers to real-world database scenarios to ensure **data reliability and consistency**.
