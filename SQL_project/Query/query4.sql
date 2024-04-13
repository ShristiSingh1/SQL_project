CREATE DEFINER=`root`@`localhost` PROCEDURE `query4`()
BEGIN
    select state,round(avg(sex_ratio),0) avg_sex_ratio from dataset1 group by state order by avg_sex_ratio desc;
END