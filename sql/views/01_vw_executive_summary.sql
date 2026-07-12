--This view will supply Tableau KPI cards.
CREATE OR REPLACE VIEW vw_executive_summary AS

SELECT
    COUNT(*) AS total_flights,

    COUNT(*) FILTER (
        WHERE is_departure_delayed = TRUE
    ) AS delayed_flights,

    COUNT(*) FILTER (
        WHERE is_on_time = TRUE
    ) AS on_time_flights,

    COUNT(*) FILTER (
        WHERE is_early_departure = TRUE
    ) AS early_departure_flights,

    ROUND(
        100.0
        * COUNT(*) FILTER (
            WHERE is_departure_delayed = TRUE
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS delay_rate_percent,

    ROUND(
        100.0
        * COUNT(*) FILTER (
            WHERE is_on_time = TRUE
               OR is_early_departure = TRUE
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS on_time_performance_percent,

    ROUND(
        AVG(departure_delay_minutes),
        2
    ) AS average_departure_delay_minutes,

    ROUND(
        AVG(taxi_out_minutes),
        2
    ) AS average_taxi_out_minutes,

    MAX(departure_delay_minutes)
        AS maximum_departure_delay_minutes,

    MIN(flight_date) AS first_flight_date,

    MAX(flight_date) AS last_flight_date

FROM flight_operations;