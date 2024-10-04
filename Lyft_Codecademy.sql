DROP DATABASE IF EXISTS Lyft;
CREATE DATABASE Lyft;
USE Lyft;


CREATE TABLE trips (
id INT,
date TEXT,
pickup TEXT,
dropoff TEXT,
rider_id INT,
car_id INT,
type TEXT,
cost INT,
PRIMARY KEY (id)
);

CREATE TABLE riders (
id INT,
first TEXT,
last TEXT,
username TEXT,
rating INT,
total_trips INT,
referred INT,
PRIMARY KEY (id)
);

CREATE TABLE riders2 (
id INT,
first TEXT,
last TEXT,
username TEXT,
rating INT,
total_trips INT,
referred INT,
PRIMARY KEY (id)
);

CREATE TABLE cars (
id INT,
model TEXT,
OS TEXT,
status TEXT,
trips_completed INT,
PRIMARY KEY (id)
);

INSERT INTO trips (id, date, pickup, dropoff, rider_id, car_id, type, cost)
VALUE 
(1001, "2017-12-05", "06:45", "07:10", 102, 1, "X", 28.66),
(1002, "2017-12-05", "08:00", "08:15", 101, 3, "POOL", 9.11),
(1003, "2017-12-05", "09:30", "09:50", 104, 4, "X", 24.98),
(1004, "2017-12-05", "13:40", "14:05", 105, 1, "X", 31.27),
(1005, "2017-12-05", "15:15", "16:00", 103, 2, "POOL", 18.95),
(1006, "2017-12-05", "18:20", "18:55", 101, 3, "XL", 78.52)
;

INSERT INTO riders (id, first, last, username, rating, total_trips, referred)
VALUE 
(101, "Sonny", "Li", "@sonnynomnom", 4.66, 352, NULL),
(102, "Laura", "Breiman", "@lauracle", 4.99, 687, 101),
(103, "Kassa", "Korley", "@kassablanca", 4.63, 42, NULL),
(104, "Yakov", "Kagan", "@yakovkagan", 4.52, 1910, 103)
;

INSERT INTO riders2 (id, first, last, username, rating, total_trips, referred)
VALUE 
(105, "Zach", "Sims", "@zsims", 4.85, 787, NULL),
(106, "Eric", "Vaught", "@posturelol", 4.96, 54, 101),
(107, "Jilly", "Beans", "@jillkuzmin", 4.7, 32, 101)
;

INSERT INTO cars (id, model, OS, status, trips_completed)
VALUE 
(1, "Ada", "Ryzac", "active", 82),
(2, "Ada", "Ryzac", "active", 30),
(3, "Turing XL", "Ryzac", "active", 164),
(4, "Akira", "Finux", "maintenance", 22)
;