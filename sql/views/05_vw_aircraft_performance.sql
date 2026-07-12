CREATE OR REPLACE VIEW vw_aircraft_performance AS

SELECT
    tail_number,

    COUNT(*) AS total_flights,

    COUNT(DISTINCT destination_airport)
        AS destinations_served,

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
        AVG(actual_elapsed_minutes
            - scheduled_elapsed_minutes),
        2
    ) AS average_elapsed_time_variance_minutes,

    ROUND(
        AVG(taxi_out_minutes),
        2
    ) AS average_taxi_out_minutes,

    MAX(departure_delay_minutes)
        AS maximum_departure_delay_minutes

FROM flight_operations

WHERE tail_number IS NOT NULL

GROUP BY tail_number;