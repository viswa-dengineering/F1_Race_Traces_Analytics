/* ==========================================
   LOAD DATA INTO BRONZE TABLES
   ========================================== */

-- =========================
-- DRIVERS
-- =========================
COPY bronze.drivers
FROM 'C:\Program Files\PostgreSQL\18\data\archive\drivers.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- =========================
-- RACES
-- =========================
COPY bronze.races
FROM 'C:\Program Files\PostgreSQL\18\data\archive\races.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- =========================
-- CONSTRUCTORS
-- =========================
COPY bronze.constructors
FROM 'C:\Program Files\PostgreSQL\18\data\archive\constructors.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- =========================
-- RESULTS
-- =========================
COPY bronze.results
FROM 'C:\Program Files\PostgreSQL\18\data\archive\results.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- =========================
-- CIRCUITS
-- =========================
COPY bronze.circuits
FROM 'C:\Program Files\PostgreSQL\18\data\archive\circuits.csv'
DELIMITER ','
CSV HEADER
NULL '\N';
