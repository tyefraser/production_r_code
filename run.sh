#!/bin/bash

# Set environment variables (replace these with your actual details)
DB_HOST="your_db_host"
DB_PORT="your_db_port"
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_db_name"

# Run the R script with arguments
Rscript src/main.R --host "$DB_HOST" --port "$DB_PORT" --user "$DB_USER" --password "$DB_PASSWORD" --dbname "$DB_NAME"
