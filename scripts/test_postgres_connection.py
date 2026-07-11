from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError

DATABASE_URL = (
    "postgresql+psycopg2://airline_admin:"
    "airline@localhost:5432/airline_delay_db"
)

try:
    engine = create_engine(DATABASE_URL)

    with engine.connect() as connection:
        result = connection.execute(
            text("SELECT current_database(), current_user;")
        )

        database_name, username = result.fetchone()

        print("Connection successful")
        print(f"Database: {database_name}")
        print(f"User: {username}")

except SQLAlchemyError as error:
    print("Connection failed")
    print(error)