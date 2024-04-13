CREATE DEFINER=`root`@`localhost` PROCEDURE `query11`()
BEGIN
select c.state,sum(literate_people) total_literate_pop,sum(illiterate_people) total_lliterate_pop from 
(select d.district,d.state,round(d.literacy_ratio*d.population,0) literate_people,
round((1-d.literacy_ratio)* d.population,0) illiterate_people from
(select a.district,a.state,a.literacy/100 literacy_ratio,b.population from dataset1 a 
inner join dataset2 b on a.district=b.district) d) c
group by c.state;
END