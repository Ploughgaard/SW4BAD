USE AarhusSpaceProgram
GO

-- Query 1: Mission info
SELECT 
    Mission.MissionName, 
    Mission.PlannedLaunchDate, 
    Staff.EmployeeName AS ManagerName, 
    Rocket.ModelName, 
    Launchpad.LaunchpadLocation, 
    AstroObject.AstroObjectName
FROM 
    Mission 
INNER JOIN Manager ON Mission.ManagerID=Manager.ManagerID
INNER JOIN Staff ON Manager.ManagerID=Staff.StaffID
INNER JOIN Rocket ON Mission.RocketID=Rocket.RocketID
INNER JOIN Launchpad ON Mission.LaunchpadID=Launchpad.LaunchpadID
INNER JOIN AstroObject ON Mission.TargetAstroObjectID=AstroObject.AstroObjectID
GO


-- Query 2: Crew on a mission
SELECT 
    Staff.EmployeeName,
    'Manager' AS Role
FROM 
    Mission
INNER JOIN Manager ON Mission.ManagerID=Manager.ManagerID 
INNER JOIN Staff ON Manager.ManagerID=Staff.StaffID 
WHERE 
    Mission.MissionID = 401

UNION ALL
SELECT 
    Staff.EmployeeName,
    'Astronaut' AS Role
FROM 
    MissionAstronaut
INNER JOIN Mission ON MissionAstronaut.MissionID = Mission.MissionID
INNER JOIN Astronaut ON MissionAstronaut.AstronautID=Astronaut.AstronautID 
INNER JOIN Staff ON Astronaut.AstronautID=Staff.StaffID 
WHERE 
    Mission.MissionID = 401

UNION ALL
SELECT 
    Staff.EmployeeName,
    'Scientist' AS Role
FROM 
    MissionScientist
INNER JOIN Mission ON MissionScientist.MissionID = Mission.MissionID
INNER JOIN Scientist ON MissionScientist.ScientistID=Scientist.ScientistID 
INNER JOIN Staff ON Scientist.ScientistID=Staff.StaffID 
WHERE Mission.MissionID = 401
GO

-- Query 3: active or upcoming missions
SELECT *
FROM Mission
WHERE MissionStatus = 'Active' OR PlannedLaunchDate > GETDATE()
GO

-- Query 4: 
SELECT 
    Mission.MissionName,
    Staff.EmployeeName AS AstronautName
FROM 
    Mission
INNER JOIN MissionAstronaut ON Mission.MissionID = MissionAstronaut.MissionID
INNER JOIN Astronaut ON MissionAstronaut.AstronautID = Astronaut.AstronautID
INNER JOIN Staff ON Astronaut.AstronautID = Staff.StaffID
ORDER BY
    Mission.MissionName, Staff.EmployeeName
GO

-- Query 5: Astronauts per mission
SELECT 
    MissionName,
    COUNT(MissionAstronaut.AstronautID) AS NumberOfAstronauts
FROM 
    Mission
INNER JOIN MissionAstronaut ON Mission.MissionID = MissionAstronaut.MissionID
GROUP BY 
    Mission.MissionID, Mission.MissionName
GO

-- Query 6: Weight launched from each launchpad
SELECT
    Launchpad.LaunchpadID,
    Launchpad.LaunchpadLocation, -- Added for readability
    SUM(Rocket.RocketWeight) AS TotalWeightLaunched
FROM 
    Launchpad
INNER JOIN Mission ON Launchpad.LaunchpadID = Mission.LaunchpadID
INNER JOIN Rocket ON Mission.RocketID = Rocket.RocketID
GROUP BY
    Launchpad.LaunchpadID,
    Launchpad.LaunchpadLocation
GO

