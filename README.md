# 🏎️ F1 Race Traces Analytics

## 📌 Project Overview

**F1 Race Traces Analytics** is a data analytics project focused on exploring and analyzing Formula 1 racing data.

The project uses multiple CSV datasets containing information about Formula 1 races, race results, drivers, constructors, and racing circuits. The objective is to understand the relationships between these datasets and extract meaningful insights about Formula 1 performance, teams, drivers, and races.

This project serves as a practical data analytics exercise involving:

* Data understanding
* Data exploration
* Data cleaning
* Data profiling
* Data integration
* SQL analysis
* Business question solving

---

## 📂 Dataset

The project contains Formula 1 data stored in CSV files.

### Main Datasets

| Dataset            | Description                                                                            |
| ------------------ | -------------------------------------------------------------------------------------- |
| `races.csv`        | Contains information about Formula 1 races, including race names, seasons, and dates.  |
| `results.csv`      | Contains race results, including driver positions, points, laps, and finishing status. |
| `drivers.csv`      | Contains information about Formula 1 drivers.                                          |
| `constructors.csv` | Contains information about Formula 1 constructor teams.                                |
| `circuits.csv`     | Contains information about Formula 1 racing circuits and locations.                    |

---

## 🔗 Data Relationships

The datasets are connected using IDs that represent the relationships between races, drivers, constructors, and circuits.

```text
                    CIRCUITS
                       │
                       │ circuitId
                       ▼
                     RACES
                       │
                       │ raceId
                       ▼
                    RESULTS
                    /      \
                   /        \
            driverId      constructorId
               ▼              ▼
            DRIVERS      CONSTRUCTORS
```

### Relationship Explanation

* A **Circuit** can host multiple races.
* A **Race** contains multiple race results.
* A **Driver** can participate in multiple races.
* A **Constructor** can have multiple drivers and race results.
* The **Results** dataset acts as the central fact table connecting races, drivers, and constructors.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Understand the structure of Formula 1 datasets.
* Identify relationships between multiple datasets.
* Perform data quality checks.
* Analyze driver performance.
* Analyze constructor performance.
* Analyze race results across different seasons.
* Explore racing circuits and locations.
* Practice solving business questions using SQL.
* Build a structured analytics project for my data portfolio.

---

## 🛠️ Technologies Used

* **SQL**
* **PostgreSQL**
* **CSV Datasets**
* **GitHub**

---

## 📊 Example Analysis Areas

This project can be used to answer questions such as:

* Which driver has won the most races?
* Which constructor has achieved the highest number of wins?
* Which drivers have scored the most points?
* Which circuits have hosted the most races?
* How has driver performance changed across seasons?
* Which constructors performed best in a particular season?
* Who are the top-performing drivers based on race results?
* How many races were conducted in each season?

---

## 📁 Project Structure

```text
F1-Race-Traces-Analytics/
│
├── data/
│   ├── races.csv
│   ├── results.csv
│   ├── drivers.csv
│   ├── constructors.csv
│   └── circuits.csv
│
├── sql/
│   ├── data_exploration.sql
│   ├── data_quality_checks.sql
│   ├── driver_analysis.sql
│   ├── constructor_analysis.sql
│   └── business_questions.sql
│
└── README.md
```

---

## 🚀 Learning Goals

Through this project, I am practicing how to work with a real-world relational dataset and transform raw CSV data into meaningful analytical insights.

This project demonstrates my ability to:

* Understand raw datasets.
* Identify primary and foreign key relationships.
* Work with multiple related tables.
* Write SQL queries for business analysis.
* Perform aggregations and filtering.
* Use joins to combine datasets.
* Analyze data using window functions and other SQL techniques.
* Document my analytical workflow.

---

## 📈 Project Status

🚧 **Currently in Progress**

The project will continue to evolve as I explore more business questions and apply advanced SQL concepts.
