/* ==========================================
   SCHEMA CREATION
   ========================================== */
CREATE SCHEMA bronze;

/* ==========================================
   TABLE: CIRCUITS
   ========================================== */
CREATE TABLE bronze.circuits (
    circuitId   INT PRIMARY KEY,
    circuitRef  VARCHAR(50),
    name        VARCHAR(100),
    location    VARCHAR(100),
    country     VARCHAR(50),
    lat         DECIMAL(9,6),
    lng         DECIMAL(9,6),
    alt         INT,
    url         TEXT
);

/* ==========================================
   TABLE: RACES
   ========================================== */
CREATE TABLE bronze.races (
    raceId      INT PRIMARY KEY,
    year        INT,
    round       INT,
    circuitId   INT,
    name        VARCHAR(100),
    date        DATE,
    time        TIME,
    url         TEXT,
    fp1_date    DATE,
    fp1_time    TIME,
    fp2_date    DATE,
    fp2_time    TIME,
    fp3_date    DATE,
    fp3_time    TIME,
    quali_date  DATE,
    quali_time  TIME,
    sprint_date DATE,
    sprint_time TIME
);

/* ==========================================
   TABLE: DRIVERS
   ========================================== */
CREATE TABLE bronze.drivers (
    driverId    INT PRIMARY KEY,
    driverRef   VARCHAR(50),
    number      INT,
    code        VARCHAR(10),
    forename    VARCHAR(50),
    surname     VARCHAR(50),
    dob         DATE,
    nationality VARCHAR(50),
    url         TEXT
);

/* ==========================================
   TABLE: CONSTRUCTORS
   ========================================== */
CREATE TABLE bronze.constructors (
    constructorId   INT PRIMARY KEY,
    constructorRef  VARCHAR(50),
    name            VARCHAR(100),
    nationality     VARCHAR(50),
    url             TEXT
);

/* ==========================================
   TABLE: RESULTS
   ========================================== */
CREATE TABLE bronze.results (
    resultId        INT PRIMARY KEY,
    raceId          INT REFERENCES bronze.races(raceId),
    driverId        INT REFERENCES bronze.drivers(driverId),
    constructorId   INT REFERENCES bronze.constructors(constructorId),
    number          INT,
    grid            INT,
    position        INT,
    positionText    VARCHAR(10),
    positionOrder   INT,
    points          DECIMAL(5,2),
    laps            INT,
    time            VARCHAR(50),
    milliseconds    BIGINT,
    fastestLap      INT,
    rank            INT,
    fastestLapTime  VARCHAR(20),
    fastestLapSpeed DECIMAL(6,3),
    statusId        INT
);
