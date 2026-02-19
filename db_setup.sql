---  testing start
ALTER DATABASE AarhusSpaceProgram
SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

-- Switch context to master database
USE master
GO


DROP DATABASE IF EXISTS AarhusSpaceProgram
GO
---- testing end


-- 1. Setup

-- Create the database
CREATE DATABASE AarhusSpaceProgram
GO

-- Use database
USE AarhusSpaceProgram
GO

-- 2. Create tables
-- Department
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
)
GO


-- Staff and children
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    HiringDate DATE NOT NULL
)
GO


CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    DepartmentID INT NOT NULL,
    CONSTRAINT FK_Manager_Staff FOREIGN KEY (ManagerID) REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_Manager_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON UPDATE CASCADE ON DELETE NO ACTION
)
GO


CREATE TABLE Astronaut (
    AstronautID INT PRIMARY KEY,
    Rank VARCHAR(255) NOT NULL,
    Paygrade VARCHAR(2) NOT NULL,
    ExpSimHours INT DEFAULT 0,
    ExpSpaceHours INT DEFAULT 0,
    CONSTRAINT FK_Astronaut_Staff FOREIGN KEY (AstronautID) REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO


CREATE TABLE Scientist (
    ScientistID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Specialty VARCHAR(255) NOT NULL,
    CONSTRAINT FK_Scientist_Staff FOREIGN KEY (ScientistID) REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO


-- AstroObject and children
CREATE TABLE AstroObject(
    AstroObjectID INT PRIMARY KEY,
    AstroObjectName VARCHAR(255) NOT NULL,
    DistanceValue INT NOT NULL,
    BodyType VARCHAR(50) NOT NULL,
    CONSTRAINT CK_AstroObject_BodyType CHECK (BodyType IN ('Planet', 'Moon'))
)
GO


CREATE TABLE Planet (
    PlanetID INT PRIMARY KEY,
    PlanetType VARCHAR(255) NOT NULL,
    CONSTRAINT CK_Planet_PlanetType CHECK (PlanetType IN ('GasGiant', 'RockyPlanet')),
    CONSTRAINT FK_Planet_AstroObject FOREIGN KEY (PlanetID) REFERENCES AstroObject(AstroObjectID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO


CREATE TABLE Moon (
    MoonID INT PRIMARY KEY,
    PlanetID INT,
    CONSTRAINT FK_Moon_AstroObject FOREIGN KEY (MoonID) REFERENCES AstroObject(AstroObjectID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_Moon_Planet FOREIGN KEY (PlanetID) REFERENCES Planet(PlanetID) ON UPDATE NO ACTION ON DELETE NO ACTION 
)
GO


-- Rocket
CREATE TABLE Rocket (
    RocketID INT PRIMARY KEY,
    ModelName VARCHAR(255) NOT NULL,
    PayloadCapacity INT NOT NULL,
    CrewCapacity INT NOT NULL,
    FuelCapacity INT NOT NULL,
    NumberOfStages INT NOT NULL,
    RocketWeight INT NOT NULL
)
GO


-- Launchpad
CREATE TABLE Launchpad (
    LaunchpadID INT PRIMARY KEY,
    LaunchpadLocation VARCHAR(255) NOT NULL,
    MaxSupportedWeight INT NOT NULL,
    CurrentStatus VARCHAR(255) NOT NULL
)
GO


-- Mission
CREATE TABLE Mission (
    MissionID INT PRIMARY KEY,
    MissionName VARCHAR(255) NOT NULL,
    MissionType VARCHAR(255) NOT NULL,
    MissionStatus VARCHAR(255) NOT NULL,
    PlannedDuration INT NOT NULL,
    PlannedLaunchDate DATE NOT NULL,
    LaunchpadID INT NOT NULL,
    RocketID INT NOT NULL,
    ManagerID INT NOT NULL,
    TargetAstroObjectID INT NOT NULL, -- Added for practicality in task D
    CONSTRAINT FK_Mission_Launchpad FOREIGN KEY (LaunchpadID) REFERENCES Launchpad(LaunchpadID) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT FK_Mission_Rocket FOREIGN KEY (RocketID) REFERENCES Rocket(RocketID) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT FK_Mission_Manager FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT FK_Mission_TargetAstroObject FOREIGN KEY (TargetAstroObjectID) REFERENCES AstroObject(AstroObjectID) ON UPDATE CASCADE ON DELETE NO ACTION -- New FK
)
GO


-- Junction tables
CREATE TABLE MissionAstronaut (
    MissionID INT NOT NULL,
    AstronautID INT NOT NULL,
    PRIMARY KEY (MissionID, AstronautID),
    CONSTRAINT FK_MissionAstronaut_Mission FOREIGN KEY (MissionID) REFERENCES Mission(MissionID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_MissionAstronaut_Astronaut FOREIGN KEY (AstronautID) REFERENCES Astronaut(AstronautID) ON UPDATE NO ACTION ON DELETE NO ACTION 
)
GO


CREATE TABLE MissionScientist (
    MissionID INT NOT NULL,
    ScientistID INT NOT NULL,
    PRIMARY KEY (MissionID, ScientistID),
    CONSTRAINT FK_MissionScientist_Mission FOREIGN KEY (MissionID) REFERENCES Mission(MissionID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_MissionScientist_Scientist FOREIGN KEY (ScientistID) REFERENCES Scientist(ScientistID) ON UPDATE NO ACTION ON DELETE NO ACTION
)
GO

