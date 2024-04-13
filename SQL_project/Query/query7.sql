CREATE DEFINER=`root`@`localhost` PROCEDURE `query7`()
BEGIN
   select state,round(avg(sex_ratio),0) avg_sex_ratio from dataset1 group by state order by avg_sex_ratio asc 
   limit 3;
END