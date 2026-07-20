# Tableau Dashboard Documentation

# Delta MSP Departure Operations Intelligence

## Overview

The **Delta MSP Departure Operations Intelligence Dashboard** provides an executive-level view of departure performance for Delta Airlines flights originating from **Minneapolis–Saint Paul International Airport (MSP)**.

The dashboard combines Python-based data preparation, PostgreSQL analytics views, SQL transformations, and Tableau visualizations to monitor operational performance, identify delay trends, and understand the primary contributors to flight delays.

---

# Dashboard Objectives

The dashboard is designed to answer the following business questions:

- How many flights operated during the selected period?
- What percentage of flights departed late?
- What is the airline's overall on-time performance?
- How have delay rates changed over time?
- Which destinations experience the highest departure delay rates?
- During which departure period are delays most common?
- What are the primary causes of departure delays?
- How does monthly operational performance compare across the reporting period?

---

# Key Performance Indicators (KPIs)

The executive scorecards summarize the overall operational performance of Delta departures from MSP.

| KPI                         | Description                                                                                     |
| --------------------------- | ----------------------------------------------------------------------------------------------- |
| **Total Flights**           | Total number of scheduled departures included in the analysis.                                  |
| **Delay Rate (%)**          | Percentage of flights departing more than 15 minutes after their scheduled departure time.      |
| **On-Time Performance (%)** | Percentage of flights departing within 15 minutes of their scheduled departure time or earlier. |
| **Average Departure Delay** | Average departure delay (minutes) across all flights.                                           |
| **Average Taxi-Out Time**   | Average taxi-out duration from gate departure to wheels-off.                                    |

---

# Dashboard Visualizations

## 1. 7-Day Average Delay Rate

**Chart Type:** Line Chart

Displays the rolling seven-day average departure delay rate to smooth daily fluctuations and highlight long-term operational trends.

**Business Value**

- Identifies sustained periods of operational disruption.
- Highlights seasonal or recurring delay patterns.
- Supports trend analysis for airline operations.

---

## 2. Top Delayed Destinations

**Chart Type:** Horizontal Bar Chart

Ranks destination airports according to their average departure delay rate.

**Business Value**

- Identifies destinations with consistently poor departure performance.
- Helps prioritize operational investigations.
- Supports route-level performance analysis.

---

## 3. Delay Rate by Departure Period

**Chart Type:** Pie Chart

Displays the distribution of departure delays across four scheduled departure periods:

- Morning
- Afternoon
- Evening
- Night

**Business Value**

- Identifies which portions of the day experience the highest delay rates.
- Supports departure scheduling analysis.
- Provides an executive overview of operational timing patterns.

---

## 4. Monthly Delay Performance

**Chart Type:** Clustered Column Chart

Compares the number of delayed flights against total scheduled flights for each month.

**Business Value**

- Evaluates monthly operational consistency.
- Identifies months with elevated delay volumes.
- Enables high-level operational benchmarking.

---

## 5. Percentage of Total Delay Minutes by Cause

**Chart Type:** Horizontal Bar Chart

Displays the contribution of each operational delay category to the total delay minutes.

Delay categories include:

- Carrier
- National Aviation System (NAS)
- Late Aircraft Arrival
- Weather
- Security

**Business Value**

- Identifies the primary drivers of operational delays.
- Helps distinguish controllable versus external delay factors.
- Supports operational improvement initiatives.

---

# Business Rules

## Delay Definition

A flight is classified as **Delayed** when:

> Departure Delay > 15 minutes

This definition follows the standard reporting methodology used by the U.S. Department of Transportation (DOT) for airline on-time performance.

---

# Data Source

The dataset contains Delta Airlines departure operations originating from Minneapolis–Saint Paul International Airport (MSP).

Key attributes include:

- Flight Number
- Flight Date
- Tail Number
- Destination Airport
- Scheduled Departure Time
- Actual Departure Time
- Taxi-Out Time
- Departure Delay
- Delay Cause Breakdown

---

# Insights Supported

The dashboard enables users to:

- Monitor overall departure reliability.
- Track delay performance over time.
- Identify the most delay-prone destinations.
- Understand operational performance by departure period.
- Analyze monthly flight performance.
- Quantify the contribution of different delay causes.
