from pathlib import Path
import os

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError


# ---------------------------------------------------------
# Project paths
# ---------------------------------------------------------
PROJECT_ROOT = Path(__file__).resolve().parents[1]
CSV_PATH = PROJECT_ROOT / "data" / "processed" / "flights_clean.csv"
ENV_PATH = PROJECT_ROOT / ".env"

load_dotenv(ENV_PATH)


# ---------------------------------------------------------
# Database configuration
# ---------------------------------------------------------
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")


required_variables = {
    "DB_HOST": DB_HOST,
    "DB_NAME": DB_NAME,
    "DB_USER": DB_USER,
    "DB_PASSWORD": DB_PASSWORD,
}

missing_variables = [
    name for name, value in required_variables.items() if not value
]

if missing_variables:
    raise ValueError(
        "Missing database environment variables: "
        + ", ".join(missing_variables)
    )


DATABASE_URL = (
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
    f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)


# ---------------------------------------------------------
# Expected PostgreSQL columns
# ---------------------------------------------------------
database_columns = [
    "carrier_code",
    "flight_date",
    "flight_number",
    "tail_number",
    "destination_airport",
    "scheduled_departure_time",
    "actual_departure_time",
    "scheduled_elapsed_minutes",
    "actual_elapsed_minutes",
    "departure_delay_minutes",
    "wheels_off_time",
    "taxi_out_minutes",
    "carrier_delay_minutes",
    "weather_delay_minutes",
    "nas_delay_minutes",
    "security_delay_minutes",
    "late_aircraft_delay_minutes",
    "flight_year",
    "flight_month",
    "flight_month_name",
    "flight_day",
    "flight_day_name",
    "is_weekend",
    "scheduled_departure_hour",
    "scheduled_departure_minute",
    "scheduled_departure_period",
    "is_departure_delayed",
    "is_early_departure",
    "is_on_time",
    "delay_category",
    "total_cause_delay_minutes",
]


def convert_time_column(series: pd.Series) -> pd.Series:
    """
    Convert values such as '8:39' or '08:39' into Python time objects.
    Invalid or missing values become None.
    """
    parsed = pd.to_datetime(
        series,
        format="%H:%M",
        errors="coerce"
    )

    return parsed.dt.time.where(parsed.notna(), None)


def main() -> None:
    if not CSV_PATH.exists():
        raise FileNotFoundError(
            f"Cleaned CSV was not found at: {CSV_PATH}"
        )

    print(f"Reading data from: {CSV_PATH}")

    df = pd.read_csv(CSV_PATH)

    print(f"Rows read: {len(df):,}")
    print(f"Columns read: {len(df.columns)}")

    missing_columns = [
        column for column in database_columns
        if column not in df.columns
    ]

    if missing_columns:
        raise ValueError(
            "The cleaned CSV is missing required columns: "
            + ", ".join(missing_columns)
        )

    # Keep only columns that belong in the PostgreSQL table.
    # This removes temporary helper columns created in the notebook.
    df = df[database_columns].copy()

    # Convert date.
    df["flight_date"] = pd.to_datetime(
        df["flight_date"],
        errors="coerce"
    ).dt.date

    # Convert time fields.
    time_columns = [
        "scheduled_departure_time",
        "actual_departure_time",
        "wheels_off_time",
    ]

    for column in time_columns:
        df[column] = convert_time_column(df[column])

    # Remove rows without required identifying information.
    before_count = len(df)
    print("\nRequired-column null counts:")
    print(
        df[
            [
                "carrier_code",
                "flight_date",
                "destination_airport"
            ]
        ].isna().sum()
    )

    print("\nSample required-column values:")
    print(
        df[
            [
                "carrier_code",
                "flight_date",
                "destination_airport"
            ]
        ].head(10)
    )
    df = df.dropna(
        subset=[
            "carrier_code",
            "flight_date",
            "destination_airport",
        ]
    )

    removed_count = before_count - len(df)

    if removed_count:
        print(f"Removed {removed_count:,} invalid rows.")

    engine = create_engine(
        DATABASE_URL,
        pool_pre_ping=True
    )

    try:
        with engine.begin() as connection:
            # Clear existing rows so the script can be rerun safely.
            connection.execute(
                text("TRUNCATE TABLE flight_operations RESTART IDENTITY;")
            )

            df.to_sql(
                name="flight_operations",
                con=connection,
                if_exists="append",
                index=False,
                method="multi",
                chunksize=1000,
            )

            loaded_count = connection.execute(
                text("SELECT COUNT(*) FROM flight_operations;")
            ).scalar_one()

        print("Data loaded successfully.")
        print(f"Rows loaded into PostgreSQL: {loaded_count:,}")

    except SQLAlchemyError as error:
        print("Database load failed.")
        raise error

    finally:
        engine.dispose()


if __name__ == "__main__":
    main()