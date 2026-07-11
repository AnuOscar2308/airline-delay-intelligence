DROP TABLE IF EXISTS flight_operations;

CREATE TABLE flight_operations (
    flight_id BIGSERIAL PRIMARY KEY,

    carrier_code VARCHAR(10) NOT NULL,
    flight_date DATE NOT NULL,
    flight_number INTEGER,
    tail_number VARCHAR(20),
    destination_airport VARCHAR(10) NOT NULL,

    scheduled_departure_time TIME,
    actual_departure_time TIME,
    scheduled_elapsed_minutes INTEGER,
    actual_elapsed_minutes INTEGER,
    departure_delay_minutes INTEGER,

    wheels_off_time TIME,
    taxi_out_minutes INTEGER,

    carrier_delay_minutes INTEGER DEFAULT 0,
    weather_delay_minutes INTEGER DEFAULT 0,
    nas_delay_minutes INTEGER DEFAULT 0,
    security_delay_minutes INTEGER DEFAULT 0,
    late_aircraft_delay_minutes INTEGER DEFAULT 0,

    flight_year INTEGER,
    flight_month INTEGER,
    flight_month_name VARCHAR(20),
    flight_day INTEGER,
    flight_day_name VARCHAR(20),
    is_weekend BOOLEAN,

    scheduled_departure_hour INTEGER,
    scheduled_departure_minute INTEGER,
    scheduled_departure_period VARCHAR(20),

    is_departure_delayed BOOLEAN,
    is_early_departure BOOLEAN,
    is_on_time BOOLEAN,

    delay_category VARCHAR(30),
    total_cause_delay_minutes INTEGER,

    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);