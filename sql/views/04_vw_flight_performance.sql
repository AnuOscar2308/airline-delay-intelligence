CREATE OR REPLACE VIEW vw_flight_performance AS

SELECT
    flight_number,
    destination_airport,
    scheduled_departure_time,
    scheduled_departure_hour,
    scheduled_departure_period,

    COUNT(*) AS total_operated_flights,

    COUNT(*) FILTER (
        WHERE is_departure_delayed = TRUE
    ) AS delayed_flights,

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

    MAX(departure_delay_minutes)
        AS maximum_departure_delay_minutes

FROM flight_operations

GROUP BY
    flight_number,
    destination_airport,
    scheduled_departure_time,
    scheduled_departure_hour,
    scheduled_departure_period;