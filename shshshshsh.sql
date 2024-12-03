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

/* FishSpecies */
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

/* FishingLocation */
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

/* FishLure */
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

/* Fisher */
INSERT INTO Fisher (FisherName, Gender, Age, ContactInfo) VALUES
    ('John Doe', 'Male', 28, NULL),
    ('Jane Smith', 'Female', 32, 'jane.smith@example.com'),
    ('Bob Johnson', 'Male', 40, 'bob.johnson@example.com'),
    ('Emily Davis', 'Female', 26, NULL),
    ('Chris Green', 'Male', 35, 'chris.green@example.com'),
    ('Anna Brown', 'Female', 30, 'anna.brown@example.com'),
    ('Tom White', 'Male', 45, NULL),
    ('Lucy Gray', 'Female', 24, 'lucy.gray@example.com'),
    ('Harry Black', 'Male', 29, 'harry.black@example.com'),
    ('Sophia Blue', 'Female', 27, 'sophia.blue@example.com');

/* FishRecord */
INSERT INTO FishRecord (FishID, DateCaught, Weight, Length, FisherID, LocationID, SpeciesID) VALUES
    (1, '2023-05-12', 5.2, 24, 1, 1, 1),
    (2, '2023-06-18', 4.1, 22, 2, 2, 2),
    (3, '2023-07-20', 6.3, 26, 3, 3, 3),
    (4, '2023-08-15', 3.4, 20, 4, 4, 4),
    (5, '2023-09-10', 2.8, 18, 5, 5, 5),
    (6, '2023-10-05', 7.5, 28, 6, 6, 6),
    (7, '2023-11-01', 1.9, 15, 7, 7, 7),
    (8, '2023-11-15', 8.2, 30, 8, 8, 8),
    (9, '2023-12-01', 5.0, 23, 9, 9, 9),
    (10, '2023-12-10', 4.9, 22, 10, 10, 10);
    
    
-- Insert Fish Records for Lake Superior
INSERT INTO FishRecord (FishID, DateCaught, Weight, Length, FisherID, LocationID, SpeciesID)
VALUES
    (1, '2023-05-12', 5.2, 24, 1, 1, 1),  -- Bass caught by Fisher 1
    (2, '2023-06-18', 4.5, 23, 2, 1, 2),  -- Trout caught by Fisher 2
    (3, '2023-07-20', 6.0, 26, 3, 1, 3),  -- Salmon caught by Fisher 3
    (4, '2023-08-15', 3.4, 20, 4, 1, 4),  -- Catfish caught by Fisher 4
    (5, '2023-09-10', 4.8, 22, 5, 1, 5),  -- Pike caught by Fisher 5
    (6, '2023-10-05', 7.0, 28, 6, 1, 6),  -- Perch caught by Fisher 6
    (7, '2023-11-01', 5.5, 25, 7, 1, 7),  -- Tuna caught by Fisher 7
    (8, '2023-11-15', 6.8, 30, 8, 1, 8);  -- Mackerel caught by Fisher 8


/* SECTION 3 - UPDATE STATEMENTS */
UPDATE FishSpecies SET AverageSize = 4.2 WHERE CommonName = 'Bass';
UPDATE FishingLocation SET LocationName = 'Amazon Basin' WHERE LocationName = 'Amazon River';

/* SECTION 4 - SELECT STATEMENTS */

/* Query 1: Retrieve all fish species with their average size */
SELECT CommonName, AverageSize
FROM FishSpecies;


/* Query 2: List all fish records for FisherID = 1 */
SELECT FishID, DateCaught, Weight, Length 
FROM FishRecord
WHERE FisherID = 1;


/* Query 3: List fish records caught in a specific location (e.g., Amazon Basin) */
SELECT DISTINCT f.CommonName
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
WHERE l.LocationName = 'Amazon Basin';


/* Query 4: Total fish caught by each fisher */
SELECT FisherID, COUNT(*) AS FishCaught
FROM FishRecord
GROUP BY FisherID;


/* Query 5: Fish caught in 'Saltwater' locations */
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


/* Query 6: Average weight of fish caught in each region */
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



/* Query 7: Show the fish species and the average weight of fish caught at each location where the average weight is greater than 4 */
SELECT l.LocationName, f.CommonName, AVG(r.Weight) AS AvgWeight
FROM FishRecord r
JOIN FishSpecies f ON r.SpeciesID = f.SpeciesID
JOIN FishingLocation l ON r.LocationID = l.LocationID
GROUP BY l.LocationName, f.CommonName
HAVING AVG(r.Weight) > 4;


/* Query 8: Retrieve all fishers whose contact information is missing (NULL) */
SELECT FisherName
FROM Fisher
WHERE ContactInfo IS NULL;


/* SECTION 5 - DELETE ROWS */
DELETE FROM FishRecord WHERE DateCaught < '2023-01-01';
DELETE FROM Fisher WHERE FisherName = 'Bob Johnson';

/* SECTION 6 - DROP TABLES */
DROP TABLE FishRecord;
DROP TABLE Fisher;
DROP TABLE FishLure;
DROP TABLE FishingLocation;
DROP TABLE FishSpecies;
