# src/main.R

library(DBI)
library(RPostgres)
library(optparse)

# Define command-line arguments
option_list <- list(
  make_option(c("-H", "--host"), type="character", default=NULL, help="Database host", metavar="character"),
  make_option(c("-P", "--port"), type="integer", default=NULL, help="Database port", metavar="integer"),
  make_option(c("-u", "--user"), type="character", default=NULL, help="Database user", metavar="character"),
  make_option(c("-p", "--password"), type="character", default=NULL, help="Database password", metavar="character"),
  make_option(c("-d", "--dbname"), type="character", default=NULL, help="Database name", metavar="character")
)

# Parse command-line arguments
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# Function to execute SQL files in a given order
run_sql_files <- function(conn, sql_files) {
  for (sql_file in sql_files) {
    cat(paste("Running", sql_file, "\n"))
    sql <- readLines(sql_file)
    dbExecute(conn, paste(sql, collapse = "\n"))
  }
}

# Establish a connection to the database
conn <- dbConnect(RPostgres::Postgres(),
                  host = opt$host,
                  port = opt$port,
                  user = opt$user,
                  password = opt$password,
                  dbname = opt$dbname)

# List of SQL files to be executed in order
sql_files <- list.files(path = "scripts", pattern = "\\.sql$", full.names = TRUE)
sql_files <- sort(sql_files)  # Ensure files are run in alphabetical order

# Run the SQL files
run_sql_files(conn, sql_files)

# Close the connection
dbDisconnect(conn)
