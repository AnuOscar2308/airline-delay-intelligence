# SQL Analytics Layer

The PostgreSQL analytics layer transforms the detailed
`flight_operations` table into curated views for Tableau.

## Views

### vw_executive_summary

Provides overall flight volume, delay rate, on-time performance,
average delay, taxi-out time, and analysis date range.

### vw_daily_performance

Supports time-series analysis of delay volume, delay rate,
average delay, and operational performance.

### vw_destination_performance

Provides destination-level traffic and delay metrics.

### vw_flight_performance

Identifies recurring flight numbers with consistently poor or
strong departure performance.

### vw_aircraft_performance

Provides aircraft-level operational statistics by tail number.
Results must not be interpreted as evidence that an aircraft
caused a delay.

### vw_delay_causes

Transforms delay causes into a long format for Tableau.

### vw_departure_time_performance

Supports analysis of delay patterns by scheduled departure hour
and time-of-day period.
