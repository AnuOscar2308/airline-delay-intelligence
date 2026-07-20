# Business Insights Report

## Delta MSP Departure Operations Intelligence

## Executive Summary

This analysis evaluates Delta Airlines departure performance for flights originating from Minneapolis–Saint Paul International Airport between January 1, 2026 and June 30, 2026.

The dataset contains 24,716 flight departures. Overall, 16.74% of flights departed more than 15 minutes late, while on-time performance was 83.26%.

Carrier-related delays represented the largest share of total recorded delay minutes, followed by National Aviation System delays and late-arriving aircraft.

---

## Key Performance Indicators

| Metric                  |        Result |
| ----------------------- | ------------: |
| Total Flights           |        24,716 |
| Departure Delay Rate    |        16.74% |
| On-Time Performance     |        83.26% |
| Average Departure Delay |  8.47 minutes |
| Average Taxi-Out Time   | 17.84 minutes |

A flight is classified as delayed when its departure delay exceeds 15 minutes.

---

## Insight 1: Delay performance improved after early-year peaks

The seven-day average delay rate was highest during portions of January, February, and March.

The dashboard shows several peaks approaching or exceeding 30% during the first quarter. From April onward, the delay rate became more stable and generally remained below the earlier peaks.

### Business interpretation

The pattern may indicate seasonal operational pressure during the winter months. However, this dataset does not contain detailed weather observations, airport congestion levels, or staffing information, so the reason for the early-year peaks cannot be confirmed from flight data alone.

### Recommended action

Compare high-delay dates with:

- MSP weather observations
- Deicing activity
- Airport traffic volume
- Crew and aircraft availability
- National Airspace System advisories

---

## Insight 2: Carrier delays are the largest contributor

Carrier-related issues accounted for approximately 54.25% of total recorded delay minutes.

The next-largest contributors were:

- National Aviation System: 25.71%
- Late Aircraft Arrival: 15.70%
- Weather: 4.30%
- Security: 0.04%

### Business interpretation

More than half of recorded delay minutes were attributed to factors generally categorized as being within the airline's operational control.

Carrier delays can include:

- Aircraft servicing
- Maintenance
- Crew availability
- Baggage loading
- Cleaning
- Fueling
- Operational decision-making

### Recommended action

Break carrier delays into more detailed operational subcategories when additional data becomes available. This would help determine whether delays are primarily associated with aircraft turnaround, crew scheduling, maintenance, or gate operations.

---

## Insight 3: National Aviation System delays remain material

National Aviation System delays represented approximately 25.71% of total delay minutes.

These delays may result from:

- Air traffic congestion
- Airport capacity constraints
- Ground stops
- Air traffic control restrictions
- Non-extreme weather conditions affecting the airspace system

### Business interpretation

These factors are not always directly controllable by the airline, but their impact may be reduced through schedule planning, operational buffers, and proactive passenger communication.

### Recommended action

Evaluate whether NAS delays are concentrated around particular:

- Departure hours
- Destination airports
- Days of the week
- High-traffic travel periods

---

## Insight 4: Certain destinations have substantially higher delay rates

The dashboard identifies the following destinations among the highest-delay routes:

| Destination | Delay Rate |
| ----------- | ---------: |
| PSC         |     30.00% |
| MSO         |     26.70% |
| SFO         |     25.27% |
| BIS         |     24.50% |
| MCO         |     22.39% |
| ANC         |     22.28% |
| PIT         |     21.79% |

### Business interpretation

High destination-level delay rates do not necessarily mean the destination airport caused the delay. Since the analysis measures departure performance from MSP, the result may reflect:

- Flight scheduling
- Aircraft rotations
- departure time
- Seasonal service
- Downstream operational constraints
- Small sample sizes

### Recommended action

Before ranking routes operationally, apply a minimum-flight threshold and review:

- Total flight volume
- Median delay
- Delay cause composition
- Scheduled departure period
- Recurring flight number performance

---

## Insight 5: Delay exposure varies by departure period

The departure-period visualization shows that delay rates are not distributed equally across morning, afternoon, evening, and night operations.

Afternoon and evening departures account for a substantial share of the departure-period delay measure.

### Business interpretation

Delays can accumulate throughout the operating day because aircraft and crews often serve multiple scheduled flights. A delay earlier in the aircraft rotation may affect later departures.

### Recommended action

Compare departure periods using:

- Delay rate
- Total flights
- Average departure delay
- Late-aircraft delay minutes
- Flight-number reliability

A line or bar chart by scheduled departure hour should also be retained for detailed operational analysis because it represents time-based progression more clearly than a pie chart.

---

## Insight 6: Monthly delay counts should be interpreted with flight volume

Monthly delayed-flight totals vary alongside the number of scheduled flights.

A month with more delayed flights may also have substantially higher total flight volume. Therefore, delayed-flight counts alone should not be used to compare monthly performance.

### Recommended action

Use both:

- Delayed-flight count
- Monthly delay rate

The delay rate provides a normalized performance measure, while the count represents the total operational impact.

---

## Overall Recommendations

1. Investigate carrier-delay subcategories because carrier-related issues account for the majority of recorded delay minutes.
2. Compare first-quarter delay peaks with weather and airport operations data.
3. Review high-delay destinations only after applying a minimum-flight threshold.
4. Analyze late-aircraft delay by departure hour to determine whether delays accumulate during the day.
5. Track monthly delay rate alongside delayed-flight volume.
6. Add destination geography and flight-volume context to strengthen route-level interpretation.
7. Build automated refresh and validation processes before using the dashboard operationally.

---

## Conclusion

Delta's MSP departure operations achieved an on-time performance rate of 83.26% during the analyzed period.

The strongest improvement opportunity appears to be carrier-related delay reduction, while NAS and late-aircraft delays also represent meaningful operational exposure.

The dashboard provides a foundation for identifying when and where delays occur. Additional weather, aircraft rotation, staffing, and airport congestion data would be required to establish causal explanations.
