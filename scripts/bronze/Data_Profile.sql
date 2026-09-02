/* ==============================
   DRIVERS TABLE PROFILING
   ============================== */

-- Row Count
SELECT COUNT(*) AS total_rows FROM bronze.drivers;
SELECT COUNT(DISTINCT driverid) AS unique_driver_ids FROM bronze.drivers;

-- Driver Codes
SELECT DISTINCT code FROM bronze.drivers;
SELECT COUNT(DISTINCT code) AS total_unique_codes FROM bronze.drivers; -- Expect ~101

-- Nationalities
SELECT DISTINCT nationality FROM bronze.drivers;

-- Driver References
SELECT DISTINCT driverref FROM bronze.drivers;

-- Duplicate DOB Check
SELECT COUNT(dob) AS total_dob FROM bronze.drivers;
SELECT COUNT(DISTINCT dob) AS unique_dob FROM bronze.drivers;


/* ==============================
   RACES TABLE PROFILING
   ============================== */

-- Row Count
SELECT COUNT(*) AS total_races FROM bronze.races;
SELECT COUNT(DISTINCT raceid) AS unique_race_ids FROM bronze.races;

-- RaceId Uniqueness
SELECT raceid, COUNT(*) 
FROM bronze.races 
GROUP BY raceid 
HAVING COUNT(*) > 1;

-- Year-Round Consistency
SELECT year, round, COUNT(*) 
FROM bronze.races 
GROUP BY year, round 
HAVING COUNT(*) > 1;

-- Year Range Check (1950–2026)
SELECT DISTINCT year 
FROM bronze.races
ORDER BY year DESC;

-- Null Checks
SELECT 
  SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS missing_year,
  SUM(CASE WHEN round IS NULL THEN 1 ELSE 0 END) AS missing_round,
  SUM(CASE WHEN circuitid IS NULL THEN 1 ELSE 0 END) AS missing_circuit,
  SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
  SUM(CASE WHEN time IS NULL THEN 1 ELSE 0 END) AS missing_time -- Expect ~731 nulls
FROM bronze.races;

-- Date Consistency (Session Order: FP1 < FP2 < FP3 < Quali < Race)
SELECT raceid, fp1_date, fp2_date, fp3_date, quali_date, date
FROM bronze.races
WHERE NOT (fp1_date <= fp2_date 
       AND fp2_date <= fp3_date 
       AND fp3_date <= quali_date 
       AND quali_date <= date);

-- Sprint Date Check (Sprint must be before Race)
SELECT raceid, sprint_date, date 
FROM bronze.races 
WHERE sprint_date IS NOT NULL 
  AND sprint_date >= date;

-- Max Round Per Year
SELECT year, MAX(round) AS max_round 
FROM bronze.races 
GROUP BY year
ORDER BY max_round;

-- Duplicate Race Names
SELECT year, name, COUNT(*) 
FROM bronze.races 
GROUP BY year, name 
HAVING COUNT(*) > 1;

-- Referential Integrity (Circuits)
SELECT r.circuitid 
FROM bronze.races AS r 
LEFT JOIN bronze.circuits AS c 
       ON r.circuitid = c.circuitid 
WHERE c.circuitid IS NULL;

-- Total Grand Prix Per Year
SELECT year, COUNT(name) AS total_grandprix_events
FROM bronze.races
GROUP BY year 
ORDER BY total_grandprix_events DESC;

-- Races in 2026
SELECT * 
FROM bronze.races
WHERE EXTRACT(YEAR FROM date) = 2026 
ORDER BY date DESC;
