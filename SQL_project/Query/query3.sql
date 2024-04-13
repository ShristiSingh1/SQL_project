CREATE DEFINER=`root`@`localhost` PROCEDURE `query1`()
BEGIN
    SELECT * FROM dataset1 
    WHERE state IN ('Jharkhand', 'Bihar');
END