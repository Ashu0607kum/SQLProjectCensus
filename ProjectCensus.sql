select *
from ProjectCensus.dbo.data1;
select *
from ProjectCensus.dbo.data2;

--count total count----
select count(*) from ProjectCensus..data1
select count(*) from ProjectCensus..data2

---data set for jharkhand and bihar
select * from ProjectCensus..data1 where state in ('jharkhand','bihar')

---population of india
select sum(population) as population from ProjectCensus..data2

--avg growth
select avg(growth)*100 as AVGGROWTH from ProjectCensus..data1;

---AVG growth of entire state
select state,avg(growth)*100 as state_growth from projectcensus..data1
group by state
;

--AVG_sex ratio
select state,ROUND(avg(SEX_RATIO ),0) as state_growth from projectcensus..data1
group by state 
ORDER BY state_growth desc;

---Avg literacy rate
select state,ROUND(avg(literacy ),0) as literacy from projectcensus..data1
group by state 
having ROUND(avg(literacy ),0)>90
ORDER BY literacy desc;

---top 3 state avg growth rate
select top 3 state, avg(growth)*100 as AVGGROWTH from ProjectCensus..data1
group by state
order by AVGGROWTH desc;

-----top 3 state avg sex_ratio
select top 3. round(avg(sex_ratio),0) as ratio from ProjectCensus..data1
group by state
order by ratio desc;

-----bottom 3 state showing lowest sex ratio
select top 3 state, round(avg(sex_ratio),0)  avg_sex_ratio  from ProjectCensus..data1
group by state
order by avg_sex_ratio asc;

 ----top and bottom 3 states in literacy state--

 drop table if exists #topstates
 create table #topstates(
 state nvarchar(255),
 topstates float
 );


 insert into #topstates
 select state, round(avg(literacy),0) avg_literacy_ratio from ProjectCensus..data1 group by 
 state order by avg_literacy_ratio desc;

 select top 3 * from #topstates order by #topstates.topstates desc;

 ---bottom 3 states showing lowest sex_ratio

 drop table if exists #bottomstates
 create table #bottomstates(
 state nvarchar(255),
 bottomstates float
 );


 insert into #bottomstates
 select state, round(avg(literacy),0) avg_literacy_ratio from ProjectCensus..data1 group by 
 state order by avg_literacy_ratio desc;

 select top 3 * from #bottomstates order by #bottomstates.bottomstates asc;

 ---Union operator (combine both result)
 select *from (
 select top 3 * from #topstates order by #topstates.topstates desc) a

 union

 select *from (
select top 3 *from #bottomstates order by #bottomstates.bottomstates asc) b;

---states starting with letter a
select distinct state from ProjectCensus..data1 where lower(state) like 'a%' or lower(state) like 'b%'

---state stating with 'a' and end with 'm'--
select distinct state from ProjectCensus..data1 where lower(state) like 'a%' and lower(state) like '%m'










