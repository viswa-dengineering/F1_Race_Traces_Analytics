-- Example: Load drivers.csv
COPY bronze.drivers
FROM 'C:\Program Files\PostgreSQL\18\data\archive\drivers.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- Example: Load races.csv
COPY bronze.races
FROM 'C:\Program Files\PostgreSQL\18\data\archive\races.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- Example: Load constructors.csv
COPY bronze.constructors
FROM 'C:\Program Files\PostgreSQL\18\data\archive\constructors.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- Example: Load results.csv
COPY bronze.results
FROM 'C:\Program Files\PostgreSQL\18\data\archive\results.csv'
DELIMITER ','
CSV HEADER
NULL '\N';

-- Example: Load circuits.csv
COPY bronze.circuits
FROM 'C:\Program Files\PostgreSQL\18\data\archive\circuits.csv'
DELIMITER ','
CSV HEADER
NULL '\N';
