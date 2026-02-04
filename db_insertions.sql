USE AarhusSpaceProgram;
GO


-- Insert Staff (10)
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (1, 'Jane Doe', '2020-03-10');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (2, 'John Smith', '2019-11-20');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (3, 'Maria Gomez', '2021-07-01');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (4, 'Alex Ivanov', '2022-01-25');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (5, 'Susan Lee', '2020-09-12');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (6, 'Omar Hassan', '2023-04-18');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (7, 'Emily Chen', '2021-02-08');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (8, 'David Wilson', '2022-08-30');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (9, 'Sarah Kim', '2019-05-05');
INSERT INTO Staff (StaffID, EmployeeName, HiringDate) VALUES (10, 'Michael Brown', '2023-10-01');
GO 


-- Insert Departments
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (1, 'Mission Control');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (2, 'Research & Development');
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (3, 'Astronaut Corps');
GO


-- Define Managers (2)
INSERT INTO Manager (ManagerID, DepartmentID) VALUES (1, 1); 
INSERT INTO Manager (ManagerID, DepartmentID) VALUES (2, 2); 
GO


-- Define Astronauts (5)
INSERT INTO Astronaut (AstronautID, Rank, Paygrade, ExpSimHours, ExpSpaceHours, AstronautRoleDescription)
VALUES (3, 'Commander', 'O5', 2500, 1200, 'Experienced mission commander and space shuttle veteran.'); 
INSERT INTO Astronaut (AstronautID, Rank, Paygrade, ExpSimHours, ExpSpaceHours, AstronautRoleDescription)
VALUES (4, 'Pilot', 'O4', 1800, 800, 'Primary pilot for long-duration deep-space missions.');     
INSERT INTO Astronaut (AstronautID, Rank, Paygrade, ExpSimHours, ExpSpaceHours, AstronautRoleDescription)
VALUES (5, 'Flight Engineer', 'O3', 1500, 500, 'Specialist in spacecraft systems and in-flight repairs.');  
INSERT INTO Astronaut (AstronautID, Rank, Paygrade, ExpSimHours, ExpSpaceHours, AstronautRoleDescription)
VALUES (8, 'Mission Specialist', 'O3', 1000, 300, 'Expert in scientific payloads and extravehicular activities.'); 
INSERT INTO Astronaut (AstronautID, Rank, Paygrade, ExpSimHours, ExpSpaceHours, AstronautRoleDescription)
VALUES (10, 'Pilot', 'O4', 1900, 750, 'Co-pilot and navigation expert for planetary landings.');    
GO


-- Define Scientists (3)
INSERT INTO Scientist (ScientistID, Title, Specialty, ScientistRoleDescription)
VALUES (6, 'Astrophysicist', 'Exoplanets', 'Leading researcher in exoplanet habitability and atmospheric analysis.');      
INSERT INTO Scientist (ScientistID, Title, Specialty, ScientistRoleDescription)
VALUES (7, 'Planetary Geologist', 'Martian Geology', 'Primary investigator for surface composition and geological history of Mars.'); 
INSERT INTO Scientist (ScientistID, Title, Specialty, ScientistRoleDescription)
VALUES (9, 'Exobiologist', 'Astrochemistry', 'Specializes in the search for extraterrestrial life and chemical biosignatures.');    
GO


-- Insert Astro Objects (4)
INSERT INTO AstroObject (AstroObjectID, AstroObjectName, DistanceValue, BodyType) VALUES (101, 'Mars', 225000000, 'Planet');
INSERT INTO AstroObject (AstroObjectID, AstroObjectName, DistanceValue, BodyType) VALUES (102, 'Jupiter', 778000000, 'Planet');
INSERT INTO AstroObject (AstroObjectID, AstroObjectName, DistanceValue, BodyType) VALUES (103, 'Phobos', 9377, 'Moon');
INSERT INTO AstroObject (AstroObjectID, AstroObjectName, DistanceValue, BodyType) VALUES (104, 'Europa', 671000, 'Moon');
GO


-- Define Planets (2)
INSERT INTO Planet (PlanetID, PlanetType) VALUES (101, 'RockyPlanet');
INSERT INTO Planet (PlanetID, PlanetType) VALUES (102, 'GasGiant');
GO


-- Define Moons
INSERT INTO Moon (MoonID, PlanetID) VALUES (103, 101);
INSERT INTO Moon (MoonID, PlanetID) VALUES (104, 102);
GO


-- Insert Rockets (2)
INSERT INTO Rocket (RocketID, ModelName, PayloadCapacity, CrewCapacity, NumberOfStages, FuelCapacity, RocketWeight)
VALUES (201, 'Falcon Heavy', 63800, 0, 2, 430000, 1420788);
INSERT INTO Rocket (RocketID, ModelName, PayloadCapacity, CrewCapacity, NumberOfStages, FuelCapacity, RocketWeight)
VALUES (202, 'Starship', 100000, 100, 2, 1200000, 5000000); 
GO


-- Insert Launchpads (2)
INSERT INTO Launchpad (LaunchpadID, LaunchpadLocation, MaxSupportedWeight, CurrentStatus)
VALUES (301, 'Cape Canaveral, LC-39A', 5000000, 'Operational');
INSERT INTO Launchpad (LaunchpadID, LaunchpadLocation, MaxSupportedWeight, CurrentStatus)
VALUES (302, 'Vandenberg Space Force Base, SLC-4E', 2000000, 'Maintenance');
GO


-- Insert Missions (3)
INSERT INTO Mission (MissionID, MissionName, MissionType, MissionStatus, PlannedDuration, PlannedLaunchDate, LaunchpadID, RocketID, ManagerID, TargetAstroObjectID)
VALUES (401, 'Mars Reconnaissance Orbiter 2', 'Orbit', 'Planned', 730, '2026-07-20', 301, 201, 1, 101); 

INSERT INTO Mission (MissionID, MissionName, MissionType, MissionStatus, PlannedDuration, PlannedLaunchDate, LaunchpadID, RocketID, ManagerID, TargetAstroObjectID)
VALUES (402, 'Jupiter Moon Lander', 'Landing', 'Active', 1095, '2025-03-10', 301, 202, 2, 104); 

INSERT INTO Mission (MissionID, MissionName, MissionType, MissionStatus, PlannedDuration, PlannedLaunchDate, LaunchpadID, RocketID, ManagerID, TargetAstroObjectID)
VALUES (403, 'Phobos Sample Return', 'Landing', 'Planned', 500, '2027-01-05', 302, 201, 1, 103);
GO


-- Requirement: 1 mission where there is 2+ astronauts
INSERT INTO MissionAstronaut (MissionID, AstronautID) VALUES (401, 3); 
INSERT INTO MissionAstronaut (MissionID, AstronautID) VALUES (401, 4); 
INSERT INTO MissionAstronaut (MissionID, AstronautID) VALUES (401, 5);
GO 
-- Other missions needs atronauts too 
INSERT INTO MissionAstronaut (MissionID, AstronautID) VALUES (402, 8);
INSERT INTO MissionAstronaut (MissionID, AstronautID) VALUES (403, 10); 
GO


-- Requirement: 1 scientists works at at least 2 missions + all missions need a scientist (assumption)
INSERT INTO MissionScientist (MissionID, ScientistID) VALUES (401, 6);
INSERT INTO MissionScientist (MissionID, ScientistID) VALUES (402, 7); 
INSERT INTO MissionScientist (MissionID, ScientistID) VALUES (403, 6); 
GO
