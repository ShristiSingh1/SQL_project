CREATE DEFINER=`root`@`localhost` PROCEDURE `query9`()
BEGIN
 select distinct state from dataset1 where lower(state) like 'a%' or lower(state) like 'b%';

select distinct state from dataset1 where lower(state) like 'a%' and lower(state) like '%m';

END