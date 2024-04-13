CREATE DEFINER=`root`@`localhost` PROCEDURE `query8`()
BEGIN
 -- Drop temporary table if it exists
DROP TEMPORARY TABLE IF EXISTS topstates;

-- Create temporary table
CREATE TEMPORARY TABLE IF NOT EXISTS topstates (
    state VARCHAR(255),
    topstate FLOAT
);

-- Insert data into topstates
INSERT INTO topstates
SELECT state, ROUND(AVG(literacy), 0) AS avg_literacy_ratio 
FROM project.data1 
GROUP BY state 
ORDER BY avg_literacy_ratio DESC
LIMIT 3;

-- Select top 3 rows from topstates
SELECT * FROM topstates ORDER BY topstate DESC;

-- Drop temporary table if it exists
DROP TEMPORARY TABLE IF EXISTS bottomstates;

-- Create temporary table
CREATE TEMPORARY TABLE IF NOT EXISTS bottomstates (
    state VARCHAR(255),
    bottomstate FLOAT
);

-- Insert data into bottomstates
INSERT INTO bottomstates
SELECT state, ROUND(AVG(literacy), 0) AS avg_literacy_ratio 
FROM project.data1 
GROUP BY state 
ORDER BY avg_literacy_ratio ASC
LIMIT 3;

-- Select top 3 rows from bottomstates
SELECT * FROM bottomstates ORDER BY bottomstate ASC;

-- Union operation
SELECT * FROM (
    SELECT * FROM topstates ORDER BY topstate DESC LIMIT 3
) AS a
UNION
SELECT * FROM (
    SELECT * FROM bottomstates ORDER BY bottomstate ASC LIMIT 3
) AS b;

END