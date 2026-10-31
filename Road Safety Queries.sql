-- Exploratory Data Analysis

SET GLOBAL local_infile = 1;

CREATE TABLE road_safety_clean (
    Index_ID VARCHAR(50),
    Accident_Severity VARCHAR(50),
    Accident_Date DATE,
    Light_Conditions VARCHAR(100),
    District_Area VARCHAR(100),
    Number_of_Casualties INT,
    Number_of_Vehicles INT,
    Road_Surface_Conditions VARCHAR(100),
    Road_Type VARCHAR(100),
    Urban_or_Rural_Area VARCHAR(50),
    Weather_Conditions VARCHAR(100),
    Vehicle_Type VARCHAR(100));

LOAD DATA LOCAL INFILE "C:/Users/u/Documents/Data Analytics Project/Road Safety Analysis/Road Safety Clean.csv"
INTO TABLE road_safety_clean
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Index_ID, Accident_Severity, @acc_date, Light_Conditions, District_Area, Number_of_Casualties, Number_of_Vehicles, Road_Surface_Conditions, Road_Type, Urban_or_Rural_Area, Weather_Conditions, Vehicle_Type)
SET Accident_Date = STR_TO_DATE(@acc_date, '%Y-%m-%d');

select *
from road_safety_clean rsc;

select distinct accident_severity
from road_safety_clean rsc; 

select SUM(Number_of_Casualties)
from road_safety_clean rsc;

select count(rsc.Accident_Severity )
from road_safety_clean rsc;

select count(accident_severity), district_area
from road_safety_clean rsc 
group by district_area
order by count(accident_severity) desc;

select count(accident_severity), district_area
from road_safety_clean rsc
where rsc.Accident_Severity like "%Ser%" or rsc.Accident_Severity like "%fat%"
group by district_area
order by count(accident_severity) desc;

select count(rsc.Accident_Severity  ), rsc.Urban_or_Rural_Area 
from road_safety_clean rsc 
group by rsc.Urban_or_Rural_Area 
order by count(rsc.Accident_Severity  ) desc;

select sum(rsc.Number_of_Casualties   ), rsc.District_Area  
from road_safety_clean rsc 
group by rsc.District_Area  
order by sum(rsc.Number_of_Casualties   ) desc;

select count(rsc.Accident_Severity), rsc.Light_Conditions   
from road_safety_clean rsc 
group by rsc.Light_Conditions   
order by count(rsc.Accident_Severity) desc;

select count(rsc.Accident_Severity), rsc.Road_Surface_Conditions    
from road_safety_clean rsc 
group by rsc.Road_Surface_Conditions    
order by count(rsc.Accident_Severity) desc;

select count(rsc.Accident_Severity), rsc.Road_Type     
from road_safety_clean rsc 
group by rsc.Road_Type     
order by count(rsc.Accident_Severity) desc;

select count(rsc.Accident_Severity), rsc.Road_Type     
from road_safety_clean rsc 
group by rsc.Road_Type     
order by count(rsc.Accident_Severity) desc;

select count(rsc.Accident_Severity), rsc.Vehicle_Type      
from road_safety_clean rsc 
group by rsc.Vehicle_Type      
order by count(rsc.Accident_Severity) desc;

select count(rsc.Accident_Severity), rsc.Weather_Conditions       
from road_safety_clean rsc 
group by rsc.Weather_Conditions       
order by count(rsc.Accident_Severity) desc;

 select *
 from road_safety_clean rsc; 








