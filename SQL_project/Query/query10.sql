CREATE DEFINER=`root`@`localhost` PROCEDURE `query10`()
BEGIN
 SELECT 
    d.state,
    SUM(d.males) AS total_males,
    SUM(d.females) AS total_females
FROM
    (SELECT 
        c.district,
        c.state AS state,
        ROUND(c.population / (c.sex_ratio + 1), 0) AS males,
        ROUND((c.population * c.sex_ratio) / (c.sex_ratio + 1), 0) AS females
    FROM
        (SELECT 
        a.district,
        a.state,
        a.sex_ratio / 1000 AS sex_ratio,
        b.population
    FROM
        dataset1 a
    INNER JOIN dataset2 b ON a.district = b.district) c) d
GROUP BY d.state;

END