# Weather Observation Station 20

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

A *[median](https://en.wikipedia.org/wiki/Median)* is defined as a number separating the higher half of a data set from the lower half. Query the *median* of the *Northern Latitudes* (*LAT\_N*) from **STATION** and round your answer to $4$ decimal places. 


**Input Format**

The **STATION** table is described as follows:

<img src="https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg" title="Station.jpg" />

where *LAT\_N* is the northern latitude and *LONG\_W* is the western longitude. 

**Constraints**

 

**Output Format**

## Solution

**Language:** SQL  
**Runtime:** N/A  
**Memory:** N/A  
**Submitted:** 2026-10-01T14:25:38.174Z  

```sql
/*
Enter your query here.
*/
WITH Numbered AS (
  SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
         COUNT(*) OVER () AS total
  FROM STATION
)
SELECT ROUND(AVG(LAT_N), 4) AS median
FROM Numbered
WHERE rn IN (FLOOR((total + 1) / 2.0), CEIL((total + 1) / 2.0));

```

---

[View on HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-20/problem)