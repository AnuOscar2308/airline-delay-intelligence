# PostgreSQL Database Setup

## Database

`airline_delay_db`

## Main Table

`flight_operations`

## Purpose

The table stores cleaned and feature-engineered Delta departure records originating from Minneapolis–Saint Paul International Airport.

## Data Flow

1. Raw BTS CSV is stored locally.
2. Python and Pandas clean and transform the records.
3. The processed CSV is loaded into PostgreSQL.
4. SQL views will provide curated datasets for Tableau.
5. Tableau will connect to PostgreSQL for reporting and analysis.

## Security

Database credentials are stored locally in a `.env` file. The `.env` file and source CSV files are excluded from GitHub.
