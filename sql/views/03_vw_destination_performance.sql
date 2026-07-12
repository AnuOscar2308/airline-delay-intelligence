-- This view will support:
-- 1. Worst-performing destinations
-- 2. Highest-volume destinations
-- 3. Average and median delay comparison
-- 4. Destination risk analysis
CREATE OR REPLACE VIEW vw_destination_performance AS

SELECT
    destination_airport,

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
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (
            ORDER BY departure_delay_minutes
        )::NUMERIC,
        2
    ) AS median_departure_delay_minutes,

    ROUND(
        AVG(taxi_out_minutes),
        2
    ) AS average_taxi_out_minutes,

    MAX(departure_delay_minutes)
        AS maximum_departure_delay_minutes,

    SUM(total_cause_delay_minutes)
        AS total_delay_cause_minutes

FROM flight_operations

GROUP BY destination_airport;