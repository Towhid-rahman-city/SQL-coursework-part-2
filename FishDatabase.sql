/*
Student name: Mohammed Towhidur Rahman
Student ID: 240009853
*/


/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE FishSpecies (
    SpeciesID INT AUTO_INCREMENT PRIMARY KEY,
    CommonName VARCHAR(50),
    ScientificName VARCHAR(100),
    AverageSize FLOAT
);

CREATE TABLE FishingLocation (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(50),
    Region VARCHAR(50),
    WaterType VARCHAR(20)
);

CREATE TABLE FishLure (
    LureID INT AUTO_INCREMENT PRIMARY KEY,
    LureName VARCHAR(50),
    LureType VARCHAR(50)
);

CREATE TABLE Fisher (
    FisherID INT AUTO_INCREMENT PRIMARY KEY,
    FisherName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    ContactInfo VARCHAR(100)
);

CREATE TABLE FishRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    FishID INT,
    DateCaught DATE,
    Weight FLOAT,
    Length FLOAT,
    FisherID INT,
    LocationID INT,
    SpeciesID INT,
    FOREIGN KEY (FisherID) REFERENCES Fisher(FisherID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES FishingLocation(LocationID),
    FOREIGN KEY (SpeciesID) REFERENCES FishSpecies(SpeciesID)
);


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO FishSpecies (CommonName, ScientificName, AverageSize) VALUES
    ('Bass', 'Micropterus salmoides', 4.0),
    ('Trout', 'Oncorhynchus mykiss', 3.5),
    ('Salmon', 'Salmo salar', 4.5),
    ('Catfish', 'Ictalurus punctatus', 3.0),
    ('Pike', 'Esox lucius', 6.0),
    ('Perch', 'Perca fluviatilis', 1.5),
    ('Tuna', 'Thunnus thynnus', 8.0),
    ('Mackerel', 'Scomber scombrus', 2.0),
    ('Carp', 'Cyprinus carpio', 5.0),
    ('Snapper', 'Lutjanus campechanus', 4.8);

INSERT INTO FishingLocation (LocationName, Region, WaterType) VALUES
    ('Lake Superior', 'North', 'Freshwater'),
    ('Amazon Basin', 'South', 'Freshwater'),
    ('Great Barrier Reef', 'East', 'Saltwater'),
    ('Lake Tahoe', 'West', 'Freshwater'),
    ('Yellowstone River', 'North', 'Freshwater'),
    ('Bristol Channel', 'West', 'Saltwater'),
    ('Mississippi River', 'South', 'Freshwater'),
    ('Gulf of Mexico', 'South', 'Saltwater'),
    ('Lake Victoria', 'Africa', 'Freshwater'),
    ('Pacific Ocean', 'Global', 'Saltwater');

INSERT INTO FishLure (LureName, LureType) VALUES
    ('Spinnerbait', 'Metal'),
    ('Worm', 'Plastic'),
    ('Crankbait', 'Hard Plastic'),
    ('Jig', 'Weighted'),
    ('Topwater', 'Surface'),
    ('Swimbait', 'Imitation'),
    ('Popper', 'Surface'),
    ('Spoon', 'Metal'),
    ('Soft Plastic', 'Flexible'),
    ('Bucktail Jig', 'Hair');

INSERT INTO Fisher (FisherName, Gender, Age, ContactInfo) VALUES
    ('Fisher1', 'Male', 28, NULL),
    ('Fisher2', 'Female', 32, 'jane.smith@example.com'),
    ('Fisher3', 'Male', 40, 'bob.johnson@example.com'),
    ('Fisher4', 'Female', 26, NULL),
    ('Fisher5', 'Male', 35, 'chris.green@example.com'),
    ('Fisher6', 'Female', 30, 'anna.brown@example.com'),
    ('Fisher7', 'Male', 45, NULL),
    ('Fisher8', 'Female', 24, 'lucy.gray@example.com'),
    ('Fisher9', 'Male', 29, 'harry.black@example.com'),
    ('Fisher10', 'Female', 27, 'sophia.blue@example.com');

INSERT INTO FishRecord (FishID, DateCaught, Weight, Length, FisherID, LocationID, SpeciesID) VALUES
    (1, '2024-05-12', 5.2, 24, 1, 1, 1),
    (2, '2024-06-18', 4.1, 22, 2, 2, 2),
    (3, '2024-07-20', 6.3, 26, 3, 3, 3),
    (4, '2024-08-15', 3.4, 20, 4, 4, 4),
    (5, '2024-09-10', 2.8, 18, 5, 5, 5),
    (6, '2024-10-05', 7.5, 28, 6, 6, 6),
    (7, '2024-11-01', 1.9, 15, 7, 7, 7),
    (8, '2024-11-15', 8.2, 30, 8, 8, 8),
    (9, '2024-12-01', 5.0, 23, 9, 9, 9),
    (10, '2024-12-10', 4.9, 22, 10, 10, 10);

INSERT INTO FishRecord (FishID, DateCaught, Weight, Length, FisherID, LocationID, SpeciesID)
VALUES
    (1, '2024-05-12', 5.2, 24, 1, 1, 1),
    (2, '2024-06-18', 4.5, 23, 2, 1, 2),
    (3, '2024-07-20', 6.0, 26, 3, 1, 3),
    (4, '2024-08-15', 3.4, 20, 4, 1, 4),
    (5, '2024-09-10', 4.8, 22, 5, 1, 5),
    (6, '2024-10-05', 7.0, 28, 6, 1, 6),
    (7, '2024-11-01', 5.5, 25, 7, 1, 7),
    (8, '2024-11-15', 6.8, 30, 8, 1, 8),
    (9, '2024-12-07', 5.4, 25, 9, 1, 9),
    (10, '2024-12-19', 4.9, 22, 10, 1, 10);
                     

/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1)Change the average size of the fish species with the common name 'Bass' to 4.2 in the FishSpecies table. */

UPDATE FishSpecies SET AverageSize = 4.2 WHERE CommonName = 'Bass';

/* 2)Update the location name from 'Amazon River' to 'Amazon Basin' in the FishingLocation table. */

UPDATE FishingLocation SET LocationName = 'Amazon Basin' WHERE LocationName = 'Amazon River';


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/

/* 1)Retrieve all fish species with their average size */

SELECT CommonName, AverageSize
FROM FishSpecies;

/* 2) List all fish caught by a specific fisher (FisherID = 1) */

SELECT FishID, DateCaught, Weight, Length 
FROM FishRecord
WHERE FisherID = 1;

/* 3) Find fish species caught in a specific location ('Amazon Basin') */

SELECT DISTINCT f.CommonName
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
WHERE l.LocationName = 'Amazon Basin';

/* 4) Total number of fish caught by each fisher */

SELECT FisherID, COUNT(*) AS FishCaught
FROM FishRecord
GROUP BY FisherID;

/* 5) Retrieve fish species caught in both 'Freshwater' and 'Saltwater' locations */

SELECT DISTINCT f.CommonName
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
WHERE l.WaterType = 'Freshwater'
UNION
SELECT DISTINCT f.CommonName
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
WHERE l.WaterType = 'Saltwater';

/* 6) Find fishers who caught fish heavier than the average weight in 'Lake Superior' */

SELECT f.FisherName
FROM Fisher f
WHERE f.FisherID IN (
    SELECT r.FisherID
    FROM FishRecord r
    JOIN FishingLocation l ON r.LocationID = l.LocationID
    WHERE l.LocationName = 'Lake Superior'
    GROUP BY r.FisherID
    HAVING AVG(r.Weight) > (
        SELECT AVG(Weight)
        FROM FishRecord
        JOIN FishingLocation
        ON FishRecord.LocationID = FishingLocation.LocationID
        WHERE FishingLocation.LocationName = 'Lake Superior'
    )
);

/* 7) Show the fish species and the average weight of fish caught at each location where the average weight is greater than 4 */

SELECT l.LocationName, f.CommonName, AVG(r.Weight) AS AvgWeight
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
GROUP BY l.LocationName, f.CommonName
HAVING AVG(r.Weight) > 4;

/* 8) Retrieve all fishers whose contact information is missing (NULL) */

SELECT FisherName
FROM Fisher
WHERE ContactInfo IS NULL;


/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Removes all fish records from the FishRecord table where the fish were caught before January 1, 2023. */

DELETE FROM FishRecord WHERE DateCaught < '2023-01-01';

/* 2) Deletes the fisher named 'Bob Johnson' from the Fisher table. */

DELETE FROM Fisher WHERE FisherName = 'Fisher7';


/* SECTION 6 - DROP TABLES */

DROP TABLE FishRecord;
DROP TABLE Fisher;
DROP TABLE FishLure;
DROP TABLE FishingLocation;
DROP TABLE FishSpecies;
