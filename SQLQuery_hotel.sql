-- Show Datas from All Tables 
select * from dbo.['2018$']
select * from dbo.['2019$']
select * from dbo.['2020$']

-- make a Union to union tables together
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']

-- create a temporary table
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
-- 
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select * from hotels
*/
-- 
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select (stays_in_weekend_nights + stays_in_week_nights) as tot_of_nights from hotels
*/
--
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select (stays_in_weekend_nights + stays_in_week_nights) * adr as revenue_nights from hotels
*/
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select arrival_date_year ,
((stays_in_weekend_nights + stays_in_week_nights) * adr) as revenue from hotels
*/
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select arrival_date_year ,
sum((stays_in_weekend_nights + stays_in_week_nights) * adr) as revenue from hotels
group by arrival_date_year
*/
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select arrival_date_year , hotel_type, 
sum((stays_in_weekend_nights + stays_in_week_nights) * adr) as revenue from hotels
group by arrival_date_year , hotel_type 
*/
/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select arrival_date_year , hotel_type, 
round(sum((stays_in_weekend_nights + stays_in_week_nights) * adr),2) as revenue from hotels
group by arrival_date_year , hotel_type 
*/

-- select * from dbo.market_segment$

-- Merge Market_segment table with a 2018,2019,2020 tables
-- This Query Will write in PowerBi query To link sql with powerBi
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)
select * from hotels 
left join market_segment$
on hotels.market_segment = market_segment$.market_segment 
left join meal_cost$
on hotels.meal = meal_cost$.meal
