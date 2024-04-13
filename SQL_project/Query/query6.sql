CREATE DEFINER=`root`@`localhost` PROCEDURE `query6`()
BEGIN
   select state,avg(growth)*100 avg_growth from dataset1 group by state order by avg_growth desc limit 3;

END