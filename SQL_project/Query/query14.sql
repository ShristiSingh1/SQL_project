CREATE DEFINER=`root`@`localhost` PROCEDURE `query14`()
BEGIN
select a.* from
(select district,state,literacy,rank() over(partition by state order by literacy desc) rnk from dataset1) a
where a.rnk in (1,2,3) order by state;
END