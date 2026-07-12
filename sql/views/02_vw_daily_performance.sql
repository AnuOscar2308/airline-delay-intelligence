--This view will support:
--1. Daily delay trend
--2. Average delay over time
--3. Weekend versus weekday performance
--4. Monthly trend analysis

CREATE OR REPLACE VIEW vw_daily_performance AS

SELECT
    flight_date,
    flight_year,
    flight_month,
    flight_month_name,
    flight_day_name,
    is_weekend,

    COUNT(*) AS total_flights,

    COUNT(*) FILTER (
        WHERE is_departure_delayed = TRUE
    ) AS delayed_flights,

    COUNT(*) FILTER (
        WHERE is_early_departure = TRUE
    ) AS early_departure_flights,

    COUNT(*) FILTER (
        WHERE is_on_time = TRUE
    ) AS on_time_flights,

    ROUND(
        100.0
        * COUNT(*) FILTER (
            WHERE is_departure_delayed = TRUE
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS delay_rate_percent,

    ROUND(
        AVG(departure_delay_minutes),
        2
    ) AS average_departure_delay_minutes,

    ROUND(
        AVG(taxi_out_minutes),
        2
    ) AS average_taxi_out_minutes,

    SUM(total_cause_delay_minutes)
        AS total_delay_cause_minutes

FROM flight_operations

GROUP BY
    flight_date,
    flight_year,
    flight_month,
    flight_month_name,
    flight_day_name,
    is_weekend;