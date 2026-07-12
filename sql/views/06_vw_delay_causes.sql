-- This view will support:
-- Delay-cause bar chart
-- Delay-cause percentage breakdown
-- Delay cause by destination
-- Delay cause over time
CREATE OR REPLACE VIEW vw_delay_causes AS

SELECT
    flight_date,
    destination_airport,
    scheduled_departure_period,
    'Carrier' AS delay_cause,
    carrier_delay_minutes AS delay_minutes

FROM flight_operations

UNION ALL

SELECT
    flight_date,
    destination_airport,
    scheduled_departure_period,
    'Weather' AS delay_cause,
    weather_delay_minutes AS delay_minutes

FROM flight_operations

UNION ALL

SELECT
    flight_date,
    destination_airport,
    scheduled_departure_period,
    'National Aviation System' AS delay_cause,
    nas_delay_minutes AS delay_minutes

FROM flight_operations

UNION ALL

SELECT
    flight_date,
    destination_airport,
    scheduled_departure_period,
    'Security' AS delay_cause,
    security_delay_minutes AS delay_minutes

FROM flight_operations

UNION ALL

SELECT
    flight_date,
    destination_airport,
    scheduled_departure_period,
    'Late Aircraft Arrival' AS delay_cause,
    late_aircraft_delay_minutes AS delay_minutes

FROM flight_operations;