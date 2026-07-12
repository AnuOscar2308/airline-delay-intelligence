CREATE OR REPLACE VIEW vw_departure_time_performance AS

SELECT
    scheduled_departure_hour,
    scheduled_departure_period,

    COUNT(*) AS total_flights,

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
    ) AS average_taxi_out_minutes

FROM flight_operations

GROUP BY
    scheduled_departure_hour,
    scheduled_departure_period;