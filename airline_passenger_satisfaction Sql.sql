Create database My_Project;

Select * from airlinepassengersatisfaction;
Truncate airlinepassengersatisfaction;

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\airlinepassengersatisfaction.CSV"
INTO TABLE airlinepassengersatisfaction
FIELDS TERMINATED BY ","
ENCLOSED BY ""
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

Rename table airlinepassengersatisfaction to airline_passenger_satisfaction;
Select * from airline_passenger_satisfaction;

-- Data cleaning
-- Rename Column name to the right format

Alter table airline_passenger_satisfaction
Rename column `Customer Type` to Customer_Type;

Alter table airline_passenger_satisfaction
Rename column `Type of Travel` to Type_of_Travel;

Alter table airline_passenger_satisfaction
Rename column `Flight Distance` to Flight_Distance;

Alter table airline_passenger_satisfaction
Rename column `Departure Delay` to Departure_Delay;

Alter table airline_passenger_satisfaction
Rename column `Arrival Delay` to Arrival_Delay;

Alter table airline_passenger_satisfaction
Rename column `Departure and Arrival Time Convenience` to Departure_and_Arrival_Time_Convenience;

Alter table airline_passenger_satisfaction
Rename column `Ease of Online Booking` to Ease_of_Online_Booking;

Alter table airline_passenger_satisfaction
Rename column `Check-in Service` to Check_in_Service;

Alter table airline_passenger_satisfaction
Rename column `Online Boarding` to Online_boarding;

Alter table airline_passenger_satisfaction
Rename column `Gate Location` to Gate_Location;

Alter table airline_passenger_satisfaction
Rename column `On-board Service` to On_board_Service;

Alter table airline_passenger_satisfaction
Rename column `Seat Comfort` to Seat_Comfort;

Alter table airline_passenger_satisfaction
Rename column `Leg Room Service` to Leg_Room_Service;

Alter table airline_passenger_satisfaction
Rename column `Food and Drink` to Food_and_Drink;

Alter table airline_passenger_satisfaction
Rename column `In-flight Service` to In_Flight_Service;

Alter table airline_passenger_satisfaction
Rename column `In-flight Wifi Service` to In_Flight_Wifi_Service;

Alter table airline_passenger_satisfaction
Rename column `In-flight Entertainment` to In_Flight_Entertainment;

Alter table airline_passenger_satisfaction
Rename column `Baggage Handling` to Baggage_Handling;

-- Data Cleaning
-- Change Data type  
select * from airline_passenger_satisfaction;

Alter table airline_passenger_satisfaction
Modify column ID int;

Alter table airline_passenger_satisfaction
Modify column Age int;

Alter table airline_passenger_satisfaction
Modify column Flight_Distance int;

Alter table airline_passenger_satisfaction
Modify column Departure_Delay int;

-- Handling Missing Data in Column Arrival_Delay
-- There are Null Values in the Column
Set SQL_SAFE_UPDATES=0;
Update airline_passenger_satisfaction
Set Arrival_Delay = 0
where Arrival_delay = "";

Select * from airline_passenger_satisfaction;

Alter table airline_passenger_satisfaction
Modify column Arrival_Delay int;

Alter table airline_passenger_satisfaction
Modify column Departure_and_Arrival_Time_Convenience int;

Alter table airline_passenger_satisfaction
Modify column Ease_of_Online_Booking int;

Alter table airline_passenger_satisfaction
Modify column Check_in_Service int;

Alter table airline_passenger_satisfaction
Modify column Online_boarding Int;

Alter table airline_passenger_satisfaction
Modify column Gate_Location int;

Alter table airline_passenger_satisfaction
Modify column On_board_Service int;

Alter table airline_passenger_satisfaction
Modify column Seat_Comfort int;

Alter table airline_passenger_satisfaction
Modify column Leg_Room_Service int;

Alter table airline_passenger_satisfaction
Modify column Cleanliness int;

Alter table airline_passenger_satisfaction
Modify column Food_and_Drink int;

Alter table airline_passenger_satisfaction
Modify column In_Flight_Service int;

Alter table airline_passenger_satisfaction
Modify column In_Flight_Wifi_Service int;

Alter table airline_passenger_satisfaction
Modify column In_Flight_Entertainment int;

Alter table airline_passenger_satisfaction
Modify column Baggage_Handling int;

-- Data Cleaning
-- Remove Duplicate rows(Rows that have same Value)

Select ID, Gender, Age, Customer_Type, Flight_Distance, Arrival_Delay, Seat_Comfort, Cleanliness, In_flight_wifi_service, Satisfaction, count(*) from airline_passenger_satisfaction
group by ID, Gender, Age, Customer_Type, Flight_Distance, Arrival_Delay, Seat_Comfort, Cleanliness, In_flight_wifi_service, Satisfaction
having count(*) > 1;

-- This Dataset has no Duplicate

-- Exploratory Analysis

-- Total Airline passengers
Select count(id) as Total_passengers from airline_passenger_satisfaction;

-- Gender Count
Select Gender, count(id) as Total_number_of_passengers from airline_passenger_satisfaction
where Gender = "Male"
group by Gender;

Select count(id) as Total_number_of_passengers from airline_passenger_satisfaction
where Gender = "Female";

-- MAX and MIN Flight Distance 
Select concat(max(Flight_Distance)," ", "M") as Longest_Flight_distance from airline_passenger_satisfaction;

Select concat(min(Flight_Distance)," ", "M") as Shortest_Flight_distance from airline_passenger_satisfaction;

-- Count of customer type
Select customer_type, count(Customer_Type) as Number_of_customer_type from airline_passenger_satisfaction
Group by Customer_Type;

Select Type_of_Travel, count(Type_of_Travel) as Total_Type_of_Travel from airline_passenger_satisfaction
Group by Type_of_Travel;
 
 -- Count of Travel Class
Select Class, count(Class) as Total_number_of_class from airline_passenger_satisfaction
Group by Class;

-- Count of Age group 
Select Age_group, count(age_group) as Count_of_Age_group from airline_passenger_satisfaction
Group by Age_Group;
 

-- Key Business Questions to Solve:
-- 1. Overall Passenger Satisfaction Trends
-- What percentage of airline passengers are satisfied?
Select ID, Satisfaction from airline_passenger_satisfaction;
With CTE as(Select Satisfaction, Count(ID) as Count_of_Passenger, (Select count(ID) from airline_passenger_satisfaction) as Overall_Passenger from airline_passenger_satisfaction
Group by Satisfaction)
Select Satisfaction, Concat(Round((Count_of_Passenger/Overall_Passenger)*100,2),"%") as Percentage_of_customer_Satisfaction from CTE
Where Satisfaction = "Satisfied";

Select ID, Satisfaction from airline_passenger_satisfaction;
With CTE as(Select Satisfaction, Count(ID) as Count_of_Passenger, (Select count(ID) from airline_passenger_satisfaction) as Overall_Passenger from airline_passenger_satisfaction
Group by Satisfaction)
Select Satisfaction, Concat(Round((Count_of_Passenger/Overall_Passenger)*100,2),"%") as Percentage_of_customer_Satisfaction from CTE
Where Satisfaction = "Neutral or Dissatisfied";

Select ID, Satisfaction from airline_passenger_satisfaction;
With CTE as(Select Satisfaction, Count(ID) as Count_of_Passenger, (Select count(ID) from airline_passenger_satisfaction) as Overall_Passenger from airline_passenger_satisfaction
Group by Satisfaction)
Select Satisfaction, Concat(Round((Count_of_Passenger/Overall_Passenger)*100,2),"%") as Percentage_of_customer_Satisfaction from CTE;
-- Percentage of dissatisfied passengers is higher than satisfied passengers

-- Does satisfaction vary by customer type (e.g., first-time vs. returning customers)?
Select Customer_Type, Satisfaction, count(satisfaction) as No_of_Satisfaction from airline_passenger_satisfaction 
group by Customer_Type, Satisfaction
Order by Customer_Type Asc;
-- Result shows that satisfaction levels vary between first-time and returning customers.
-- First time customers and returning customers shows higher dissatisfaction levels

 
-- How does satisfaction differ across types of travel (e.g., Business vs. Leisure)?
Select Type_of_Travel, Satisfaction, count(satisfaction) as No_of_Satisfaction from airline_passenger_satisfaction 
group by Type_of_Travel, Satisfaction
Order by Type_of_Travel Asc;
-- Result shows that passengers that travel for Business are more satisfied while passengers that travel for personal are Dissatisfied than satisfied

-- 2. Customer Segmentation & Profile Analysis
-- What is the typical profile of a repeating airline passenger?
Select * from airline_passenger_satisfaction
Where Customer_Type = "Returning";

-- Do returning passengers show higher satisfaction than new customers?
Select Customer_Type, count(satisfaction) as No_of_Satisfaction from airline_passenger_satisfaction 
Where satisfaction = "Satisfied"
group by Customer_Type
Order by Customer_Type Asc;
-- Result shows that  Returning customers are more Satisfied than First timers 

-- How do satisfaction levels vary by gender and age group?
Select Age from airline_passenger_satisfaction;
Alter Table airline_passenger_satisfaction
Add column Age_Group Text After Age;

Select max(Age), Min(Age) from airline_passenger_satisfaction;
Update airline_passenger_satisfaction
Set Age_Group = Case when Age between 7 and 12 then "Child"
                when age between  13 and 19 then "Teenager"
				when age between 20 and 39 then "Young Adult"
                when age between 40 and 59 then "Middle_Aged Adult"
                when age between 60 and 85 then "Older Adult" end;
Select * from airline_passenger_satisfaction;		

Select Gender, Age_Group, Satisfaction, count(satisfaction) as No_of_Satisfaction from airline_passenger_satisfaction
group by Gender, Age_Group, Satisfaction
order by Age_group;

-- 3. Flight Patterns & Their Impact on Satisfaction
-- Does flight distance affect customer preferences or behavior?

Alter table airline_passenger_satisfaction
add column Flight_distance_category text after flight_distance;

Update airline_passenger_satisfaction
Set Flight_Distance_category = Case when Flight_Distance between 0 and 500 then "Very short distance"
									when Flight_Distance between 501 and 1500 then "Short distance"
									when Flight_Distance between 1501 and 3000 then "Medium distance"
                                    when Flight_Distance between 3001 and 4500 then "Long distance"
                                    else "Very long distance" end;
                                    
Select Flight_Distance_category, Satisfaction, count(satisfaction) as no_of_satisfaction from airline_passenger_satisfaction
group by flight_distance_category, Satisfaction
order by Flight_Distance_category;

-- How do departure and arrival delays influence satisfaction?
Alter table airline_passenger_satisfaction
add column Flight_Delay int after Arrival_Delay;

Set SQL_SAFE_UPDATES = 0;
Update airline_passenger_satisfaction
Set Flight_Delay = Departure_Delay + Arrival_Delay;


With Cte  as(Select Satisfaction, Case when Flight_delay between 0 and 10 then "Satisfied(0-10 minutes delay)" 
										else "Dissatisfied(above 10minutes delay)" end as Flight_Delay from airline_passenger_satisfaction)
(select Flight_Delay, Satisfaction, count(Satisfaction) as No_of_satisfaction from CTe
group by Flight_Delay, Satisfaction
order by Flight_Delay);

select * from airline_passenger_satisfaction;

-- Are certain travel classes (Economy, Business, First Class) associated with higher satisfaction?
select Class, count(satisfaction)as No_of_satisfaction from airline_passenger_satisfaction
Where Satisfaction = "Satisfied"
group by Class
order by No_of_satisfaction desc;
-- Business is associated with higher_satisfaction


-- 4. Factors Contributing to Satisfaction & Dissatisfaction                                   
-- Which service areas (e.g., Check-in, Online Boarding, Seat Comfort) contribute most to satisfaction?
With CTE as (Select Satisfaction, Case when Departure_and_Arrival_Time_Convenience = 0  then "Not Applicable"
											when Departure_and_Arrival_Time_Convenience <=2 then "Low"
                                            when Departure_and_Arrival_Time_Convenience = 3 then "Average"
                                            when Departure_and_Arrival_Time_Convenience between 4 and 5 then "High" 
                                            end as Departure_and_arrival_time_Convenience_Rating from airline_passenger_satisfaction)
 Select Departure_and_Arrival_Time_Convenience_rating, count(Departure_and_Arrival_Time_Convenience_Rating) as No_of_satisfaction from CTE
where Departure_and_Arrival_Time_Convenience_Rating = "High"
group by Departure_and_Arrival_Time_Convenience_Rating;                                        ;

With CTE as (Select Satisfaction, Case when Ease_of_online_booking = 0  then "Not Applicable"
											when  Ease_of_online_booking <=2 then "Low"
                                            when Ease_of_online_booking = 3 then "Average"
                                            when Ease_of_online_booking between 4 and 5 then "High" 
                                            end as Ease_of_Online_Booking_Rating from airline_passenger_satisfaction)
Select Ease_of_Online_Booking_Rating, count(Ease_of_Online_Booking_Rating) as No_of_satisfaction from CTE 
where Ease_of_Online_Booking_Rating = "High"
group by Ease_of_Online_Booking_Rating;


with CTe as (select Satisfaction, Case when Check_in_service = 0  then "Not Applicable"
							        when check_in_service <=2 then "Low"
									when Check_in_service = 3 then "Average"
									when Check_in_service between 4 and 5 then "High" 
                                    end as Check_in_Service_Rating from airline_passenger_satisfaction)
Select Check_in_Service_Rating, count(Check_in_Service_Rating) as No_of_satisfaction from CTE 
where Check_in_Service_rating = "High"
group by Check_in_service_Rating;


with CTE as (select Satisfaction, Case when Online_Boarding = 0  then "Not Applicable"
								  when Online_boarding <=2 then "Low"
								  when Online_boarding = 3 then "Average"
								  when Online_boarding between 4 and 5 then "High" 
                                  end as Online_boarding_Rating from airline_passenger_satisfaction)
Select Online_boarding_Rating, count(Online_boarding_rating) as Online_boarding_Rating
from CTE
where Online_boarding_rating = "High"
group by Online_boarding_rating;


with CTE as (select Satisfaction, Case when Gate_Location = 0  then "Not Applicable"
							        when Gate_Location <=2 then "Low"
									when Gate_Location = 3 then "Average"
									when Gate_Location between 4 and 5 then "High" 
								    end as Gate_Location_Rating from airline_passenger_satisfaction)
Select Gate_Location_Rating, count(Gate_Location_Rating) as No_of_satisfaction
from CTE
where Gate_Location_Rating = "High"
group by Gate_Location_Rating;

With CTE as (select Satisfaction,  Case when On_board_service = 0  then "Not Applicable"
							        when On_board_service <=2 then "Low"
									when On_board_service = 3 then "Average"
									when On_board_service between 4 and 5 then "High" 
                                    end as On_board_Service_Rating from airline_passenger_satisfaction)
Select On_board_Service_Rating, count(On_board_Service_rating) as No_of_satisfaction
from CTE 
where On_board_Service_rating = "High"
group by On_board_service_rating;

with CTE as(select Satisfaction, Case when Seat_Comfort = 0  then "Not Applicable"
							   when Seat_Comfort <=2 then "Low"
							   when Seat_comfort = 3 then "Average"
							   when Seat_comfort between 4 and 5 then "High" 
                               end as Seat_Comfort_Rating from airline_passenger_satisfaction)
Select Seat_Comfort_Rating, count(Seat_Comfort_Rating) as No_of_satisfaction
from CTE  
where Seat_Comfort_Rating = "High"
group by Seat_Comfort_Rating;


With CTE as( select Satisfaction, Case when Leg_room_service = 0  then "Not Applicable"
							           when Leg_room_service <=2 then "Low"
									   when Leg_room_service = 3 then "Average"
									   when Leg_room_service between 4 and 5 then "High" 
                                       end as Leg_Room_Service_Rating from airline_passenger_satisfaction)
Select Leg_Room_Service_Rating, count(Leg_Room_Service_Rating) as No_of_satisfaction
from CTE
where Leg_Room_Service_Rating = "High"
group by Leg_Room_Service_Rating;

With CTE as (select Satisfaction, Case when Cleanliness = 0  then "Not Applicable"
							  when Cleanliness <=2 then "Low"
							  when Cleanliness = 3 then "Average"
							  when Cleanliness between 4 and 5 then "High" 
                              end as Cleanliness_Rating from airline_passenger_satisfaction)
Select Cleanliness_Rating, count(Cleanliness_Rating) as No_of_satisfaction
from CTE 
where Cleanliness_Rating = "High"
group by Cleanliness_Rating;

With CTE as (select Satisfaction, Case when Food_and_Drink = 0  then "Not Applicable"
								 when Food_and_Drink <=2 then "Low"
								 when Food_and_Drink = 3 then "Average"
								 when Food_and_Drink between 4 and 5 then "High" 
                                 end as Food_and_Drink_Rating from airline_passenger_satisfaction)
Select Food_and_Drink_Rating, count(Food_and_Drink_Rating) as No_of_satisfaction
from CTE
where Food_and_Drink_Rating = "High"
group by Food_and_Drink_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Service = 0  then "Not Applicable"
							        when In_Flight_service <=2 then "Low"
									when In_flight_Service = 3 then "Average"
									when In_flight_Service between 4 and 5 then "High" 
                                    end as In_Flight_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Service_Rating, count(In_Flight_Service_Rating) as No_of_satisfaction
from CTE 
where In_Flight_Service_Rating = "High"
group by In_Flight_Service_Rating;


With CTE as (select Satisfaction, Case when In_Flight_Wifi_service = 0  then "Not Applicable"
							             when In_Flight_Wifi_Service <=2 then "Low"
									     when In_Flight_Wifi_Service = 3 then "Average"
										 when In_flight_Wifi_service between 4 and 5 then "High" 
                                         end as In_Flight_Wifi_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Wifi_Service_Rating, count(In_Flight_Wifi_Service_Rating) as No_of_satisfaction
from CTE
where In_Flight_Wifi_Service_Rating = "High"
group by In_Flight_Wifi_Service_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Entertainment = 0  then "Not Applicable"
						                  when In_Flight_entertainment <=2 then "Low"
									      when In_Flight_Entertainment = 3 then "Average"
										  when In_Flight_Entertainment between 4 and 5 then "High" 
                                          end as In_Flight_Entertainment_Rating from airline_passenger_satisfaction)
Select In_Flight_Entertainment_Rating, count(In_Flight_Entertainment_Rating) as No_of_satisfaction
from CTE
where In_Flight_Entertainment_Rating = "High"
group by In_Flight_Entertainment_Rating;

With CTE as (select Satisfaction, Case when Baggage_Handling = 0  then "Not Applicable"
								   when Baggage_Handling <=2 then "Low"
								   when Baggage_Handling = 3 then "Average"
								   when Baggage_Handling between 4 and 5 then "High" 
                                   end as Baggage_Handling_Rating from airline_passenger_satisfaction)
Select Baggage_Handling_Rating, count(Baggage_Handling_Rating) as No_of_satisfaction
from CTE
where Baggage_Handling_Rating = "High"
group by Baggage_Handling_Rating;

-- Top 5 services that contribute to the overall satisfied passengers In fights service 81389, baggage handling 80639, Seat comfort 72914, in flight entertainment 68335
-- on board service 68195

-- What factors lead to dissatisfaction (e.g., Baggage handling, In-flight service, WiFi, Food & Drink)?
With CTE as (Select Satisfaction, Case when Departure_and_Arrival_Time_Convenience = 0  then "Not Applicable"
											when Departure_and_Arrival_Time_Convenience <=2 then "Low"
                                            when Departure_and_Arrival_Time_Convenience = 3 then "Average"
                                            when Departure_and_Arrival_Time_Convenience between 4 and 5 then "High" 
                                            end as Departure_and_arrival_time_Convenience_Rating from airline_passenger_satisfaction)
 Select Departure_and_Arrival_Time_Convenience_rating, count(Departure_and_Arrival_Time_Convenience_Rating) as No_of_satisfaction from CTE
where Departure_and_Arrival_Time_Convenience_Rating = "Low"
group by Departure_and_Arrival_Time_Convenience_Rating;                                        ;

With CTE as (Select Satisfaction, Case when Ease_of_online_booking = 0  then "Not Applicable"
											when  Ease_of_online_booking <=2 then "Low"
                                            when Ease_of_online_booking = 3 then "Average"
                                            when Ease_of_online_booking between 4 and 5 then "High" 
                                            end as Ease_of_Online_Booking_Rating from airline_passenger_satisfaction)
Select Ease_of_Online_Booking_Rating, count(Ease_of_Online_Booking_Rating) as No_of_satisfaction from CTE 
where Ease_of_Online_Booking_Rating = "Low"
group by Ease_of_Online_Booking_Rating;


with CTe as (select Satisfaction, Case when Check_in_service = 0  then "Not Applicable"
							        when check_in_service <=2 then "Low"
									when Check_in_service = 3 then "Average"
									when Check_in_service between 4 and 5 then "High" 
                                    end as Check_in_Service_Rating from airline_passenger_satisfaction)
Select Check_in_Service_Rating, count(Check_in_Service_Rating) as No_of_satisfaction from CTE 
where Check_in_Service_rating = "Low"
group by Check_in_service_Rating;


with CTE as (select Satisfaction, Case when Online_Boarding = 0  then "Not Applicable"
								  when Online_boarding <=2 then "Low"
								  when Online_boarding = 3 then "Average"
								  when Online_boarding between 4 and 5 then "High" 
                                  end as Online_boarding_Rating from airline_passenger_satisfaction)
Select Online_boarding_Rating, count(Online_boarding_rating) as Online_boarding_Rating
from CTE
where Online_boarding_rating = "Low"
group by Online_boarding_rating;


with CTE as (select Satisfaction, Case when Gate_Location = 0  then "Not Applicable"
							        when Gate_Location <=2 then "Low"
									when Gate_Location = 3 then "Average"
									when Gate_Location between 4 and 5 then "High" 
								    end as Gate_Location_Rating from airline_passenger_satisfaction)
Select Gate_Location_Rating, count(Gate_Location_Rating) as No_of_satisfaction
from CTE
where Gate_Location_Rating = "Low"
group by Gate_Location_Rating;

With CTE as (select Satisfaction,  Case when On_board_service = 0  then "Not Applicable"
							        when On_board_service <=2 then "Low"
									when On_board_service = 3 then "Average"
									when On_board_service between 4 and 5 then "High" 
                                    end as On_board_Service_Rating from airline_passenger_satisfaction)
Select On_board_Service_Rating, count(On_board_Service_rating) as No_of_satisfaction
from CTE 
where On_board_Service_rating = "Low"
group by On_board_service_rating;

with CTE as(select Satisfaction, Case when Seat_Comfort = 0  then "Not Applicable"
							   when Seat_Comfort <=2 then "Low"
							   when Seat_comfort = 3 then "Average"
							   when Seat_comfort between 4 and 5 then "High" 
                               end as Seat_Comfort_Rating from airline_passenger_satisfaction)
Select Seat_Comfort_Rating, count(Seat_Comfort_Rating) as No_of_satisfaction
from CTE  
where Seat_Comfort_Rating = "Low"
group by Seat_Comfort_Rating;


With CTE as( select Satisfaction, Case when Leg_room_service = 0  then "Not Applicable"
							           when Leg_room_service <=2 then "Low"
									   when Leg_room_service = 3 then "Average"
									   when Leg_room_service between 4 and 5 then "High" 
                                       end as Leg_Room_Service_Rating from airline_passenger_satisfaction)
Select Leg_Room_Service_Rating, count(Leg_Room_Service_Rating) as No_of_satisfaction
from CTE
where Leg_Room_Service_Rating = "Low"
group by Leg_Room_Service_Rating;

With CTE as (select Satisfaction, Case when Cleanliness = 0  then "Not Applicable"
							  when Cleanliness <=2 then "Low"
							  when Cleanliness = 3 then "Average"
							  when Cleanliness between 4 and 5 then "High" 
                              end as Cleanliness_Rating from airline_passenger_satisfaction)
Select Cleanliness_Rating, count(Cleanliness_Rating) as No_of_satisfaction
from CTE 
where Cleanliness_Rating = "Low"
group by Cleanliness_Rating;

With CTE as (select Satisfaction, Case when Food_and_Drink = 0  then "Not Applicable"
								 when Food_and_Drink <=2 then "Low"
								 when Food_and_Drink = 3 then "Average"
								 when Food_and_Drink between 4 and 5 then "High" 
                                 end as Food_and_Drink_Rating from airline_passenger_satisfaction)
Select Food_and_Drink_Rating, count(Food_and_Drink_Rating) as No_of_satisfaction
from CTE
where Food_and_Drink_Rating = "Low"
group by Food_and_Drink_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Service = 0  then "Not Applicable"
							        when In_Flight_service <=2 then "Low"
									when In_flight_Service = 3 then "Average"
									when In_flight_Service between 4 and 5 then "High" 
                                    end as In_Flight_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Service_Rating, count(In_Flight_Service_Rating) as No_of_satisfaction
from CTE 
where In_Flight_Service_Rating = "Low"
group by In_Flight_Service_Rating;


With CTE as (select Satisfaction, Case when In_Flight_Wifi_service = 0  then "Not Applicable"
							             when In_Flight_Wifi_Service <=2 then "Low"
									     when In_Flight_Wifi_Service = 3 then "Average"
										 when In_flight_Wifi_service between 4 and 5 then "High" 
                                         end as In_Flight_Wifi_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Wifi_Service_Rating, count(In_Flight_Wifi_Service_Rating) as No_of_satisfaction
from CTE
where In_Flight_Wifi_Service_Rating = "Low"
group by In_Flight_Wifi_Service_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Entertainment = 0  then "Not Applicable"
						                  when In_Flight_entertainment <=2 then "Low"
									      when In_Flight_Entertainment = 3 then "Average"
										  when In_Flight_Entertainment between 4 and 5 then "High" 
                                          end as In_Flight_Entertainment_Rating from airline_passenger_satisfaction)
Select In_Flight_Entertainment_Rating, count(In_Flight_Entertainment_Rating) as No_of_satisfaction
from CTE
where In_Flight_Entertainment_Rating = "Low"
group by In_Flight_Entertainment_Rating;

With CTE as (select Satisfaction, Case when Baggage_Handling = 0  then "Not Applicable"
								   when Baggage_Handling <=2 then "Low"
								   when Baggage_Handling = 3 then "Average"
								   when Baggage_Handling between 4 and 5 then "High" 
                                   end as Baggage_Handling_Rating from airline_passenger_satisfaction)
Select Baggage_Handling_Rating, count(Baggage_Handling_Rating) as No_of_satisfaction
from CTE
where Baggage_Handling_Rating = "Low"
group by Baggage_Handling_Rating;

-- Is there a relationship between cleanliness ratings and overall satisfaction?
With CTE as (select Satisfaction, Case when Cleanliness = 0  then "Not Applicable"
							  when Cleanliness <=2 then "Low"
							  when Cleanliness = 3 then "Average"
							  when Cleanliness between 4 and 5 then "High" 
                              end as Cleanliness_Rating from airline_passenger_satisfaction)
select Cleanliness_rating,Satisfaction, Count(Cleanliness_rating) as No_of_ratings from CTE
group by Cleanliness_rating ,Satisfaction
order by Cleanliness_rating desc;


-- 5. Operational Efficiency & Service Improvements

-- Do long delays at departure or arrival correlate with lower satisfaction?

-- Which airline services (Online Booking, Check-in, Gate Location, In-flight Service, Entertainment) have the lowest ratings?
With CTE as (Select Satisfaction, Case when Departure_and_Arrival_Time_Convenience = 0  then "Not Applicable"
											when Departure_and_Arrival_Time_Convenience <=2 then "Low"
                                            when Departure_and_Arrival_Time_Convenience = 3 then "Average"
                                            when Departure_and_Arrival_Time_Convenience between 4 and 5 then "High" 
                                            end as Departure_and_arrival_time_Convenience_Rating from airline_passenger_satisfaction)
 Select Departure_and_Arrival_Time_Convenience_rating, count(Departure_and_Arrival_Time_Convenience_Rating) as No_of_satisfaction from CTE
where Departure_and_Arrival_Time_Convenience_Rating = "Low"
group by Departure_and_Arrival_Time_Convenience_Rating;                                        ;

With CTE as (Select Satisfaction, Case when Ease_of_online_booking = 0  then "Not Applicable"
											when  Ease_of_online_booking <=2 then "Low"
                                            when Ease_of_online_booking = 3 then "Average"
                                            when Ease_of_online_booking between 4 and 5 then "High" 
                                            end as Ease_of_Online_Booking_Rating from airline_passenger_satisfaction)
Select Ease_of_Online_Booking_Rating, count(Ease_of_Online_Booking_Rating) as No_of_satisfaction from CTE 
where Ease_of_Online_Booking_Rating = "Low"
group by Ease_of_Online_Booking_Rating;


with CTe as (select Satisfaction, Case when Check_in_service = 0  then "Not Applicable"
							        when check_in_service <=2 then "Low"
									when Check_in_service = 3 then "Average"
									when Check_in_service between 4 and 5 then "High" 
                                    end as Check_in_Service_Rating from airline_passenger_satisfaction)
Select Check_in_Service_Rating, count(Check_in_Service_Rating) as No_of_satisfaction from CTE 
where Check_in_Service_rating = "Low"
group by Check_in_service_Rating;


with CTE as (select Satisfaction, Case when Online_Boarding = 0  then "Not Applicable"
								  when Online_boarding <=2 then "Low"
								  when Online_boarding = 3 then "Average"
								  when Online_boarding between 4 and 5 then "High" 
                                  end as Online_boarding_Rating from airline_passenger_satisfaction)
Select Online_boarding_Rating, count(Online_boarding_rating) as Online_boarding_Rating
from CTE
where Online_boarding_rating = "Low"
group by Online_boarding_rating;


with CTE as (select Satisfaction, Case when Gate_Location = 0  then "Not Applicable"
							        when Gate_Location <=2 then "Low"
									when Gate_Location = 3 then "Average"
									when Gate_Location between 4 and 5 then "High" 
								    end as Gate_Location_Rating from airline_passenger_satisfaction)
Select Gate_Location_Rating, count(Gate_Location_Rating) as No_of_satisfaction
from CTE
where Gate_Location_Rating = "Low"
group by Gate_Location_Rating;

With CTE as (select Satisfaction,  Case when On_board_service = 0  then "Not Applicable"
							        when On_board_service <=2 then "Low"
									when On_board_service = 3 then "Average"
									when On_board_service between 4 and 5 then "High" 
                                    end as On_board_Service_Rating from airline_passenger_satisfaction)
Select On_board_Service_Rating, count(On_board_Service_rating) as No_of_satisfaction
from CTE 
where On_board_Service_rating = "Low"
group by On_board_service_rating;

with CTE as(select Satisfaction, Case when Seat_Comfort = 0  then "Not Applicable"
							   when Seat_Comfort <=2 then "Low"
							   when Seat_comfort = 3 then "Average"
							   when Seat_comfort between 4 and 5 then "High" 
                               end as Seat_Comfort_Rating from airline_passenger_satisfaction)
Select Seat_Comfort_Rating, count(Seat_Comfort_Rating) as No_of_satisfaction
from CTE  
where Seat_Comfort_Rating = "Low"
group by Seat_Comfort_Rating;


With CTE as( select Satisfaction, Case when Leg_room_service = 0  then "Not Applicable"
							           when Leg_room_service <=2 then "Low"
									   when Leg_room_service = 3 then "Average"
									   when Leg_room_service between 4 and 5 then "High" 
                                       end as Leg_Room_Service_Rating from airline_passenger_satisfaction)
Select Leg_Room_Service_Rating, count(Leg_Room_Service_Rating) as No_of_satisfaction
from CTE
where Leg_Room_Service_Rating = "Low"
group by Leg_Room_Service_Rating;

With CTE as (select Satisfaction, Case when Cleanliness = 0  then "Not Applicable"
							  when Cleanliness <=2 then "Low"
							  when Cleanliness = 3 then "Average"
							  when Cleanliness between 4 and 5 then "High" 
                              end as Cleanliness_Rating from airline_passenger_satisfaction)
Select Cleanliness_Rating, count(Cleanliness_Rating) as No_of_satisfaction
from CTE 
where Cleanliness_Rating = "Low"
group by Cleanliness_Rating;

With CTE as (select Satisfaction, Case when Food_and_Drink = 0  then "Not Applicable"
								 when Food_and_Drink <=2 then "Low"
								 when Food_and_Drink = 3 then "Average"
								 when Food_and_Drink between 4 and 5 then "High" 
                                 end as Food_and_Drink_Rating from airline_passenger_satisfaction)
Select Food_and_Drink_Rating, count(Food_and_Drink_Rating) as No_of_satisfaction
from CTE
where Food_and_Drink_Rating = "Low"
group by Food_and_Drink_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Service = 0  then "Not Applicable"
							        when In_Flight_service <=2 then "Low"
									when In_flight_Service = 3 then "Average"
									when In_flight_Service between 4 and 5 then "High" 
                                    end as In_Flight_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Service_Rating, count(In_Flight_Service_Rating) as No_of_satisfaction
from CTE 
where In_Flight_Service_Rating = "Low"
group by In_Flight_Service_Rating;


With CTE as (select Satisfaction, Case when In_Flight_Wifi_service = 0  then "Not Applicable"
							             when In_Flight_Wifi_Service <=2 then "Low"
									     when In_Flight_Wifi_Service = 3 then "Average"
										 when In_flight_Wifi_service between 4 and 5 then "High" 
                                         end as In_Flight_Wifi_Service_Rating from airline_passenger_satisfaction)
Select In_Flight_Wifi_Service_Rating, count(In_Flight_Wifi_Service_Rating) as No_of_satisfaction
from CTE
where In_Flight_Wifi_Service_Rating = "Low"
group by In_Flight_Wifi_Service_Rating;

With CTE as (Select Satisfaction, Case when In_Flight_Entertainment = 0  then "Not Applicable"
						                  when In_Flight_entertainment <=2 then "Low"
									      when In_Flight_Entertainment = 3 then "Average"
										  when In_Flight_Entertainment between 4 and 5 then "High" 
                                          end as In_Flight_Entertainment_Rating from airline_passenger_satisfaction)
Select In_Flight_Entertainment_Rating, count(In_Flight_Entertainment_Rating) as No_of_satisfaction
from CTE
where In_Flight_Entertainment_Rating = "Low"
group by In_Flight_Entertainment_Rating;

With CTE as (select Satisfaction, Case when Baggage_Handling = 0  then "Not Applicable"
								   when Baggage_Handling <=2 then "Low"
								   when Baggage_Handling = 3 then "Average"
								   when Baggage_Handling between 4 and 5 then "High" 
                                   end as Baggage_Handling_Rating from airline_passenger_satisfaction)
Select Baggage_Handling_Rating, count(Baggage_Handling_Rating) as No_of_satisfaction
from CTE
where Baggage_Handling_Rating = "Low"
group by Baggage_Handling_Rating;

-- Can we identify specific flight routes or schedules with higher dissatisfaction rates?
select Flight_distance_category, Count(satisfaction) as No_of_satisfaction from airline_passenger_satisfaction
where satisfaction = "Satisfied"
group by Flight_distance_category;


Select round(avg(Departure_and_arrival_time_convenience),2)as Avg_rate from airline_passenger_satisfaction;
Select round(avg(Ease_of_online_booking),2) as Avg_rate from airline_passenger_satisfaction;
Select round(avg(Check_in_service),2) as Avg_check_in_service from airline_passenger_satisfaction;
Select round(avg(Online_boarding),2) as Avg_Online_Boarding from airline_passenger_satisfaction;
Select round(avg(Gate_Location),2) as Avg_Gate_Location from airline_passenger_satisfaction;
Select round(avg(On_board_service),2) as Avg_On_board_service from airline_passenger_satisfaction;
Select round(avg(Seat_Comfort),2) as Avg_Seat_Comfort from airline_passenger_satisfaction;
Select round(avg(Leg_Room_service),2) as Avg_Leg_Room_service from airline_passenger_satisfaction;
Select round(avg(Cleanliness),2) as Avg_cleanliness from airline_passenger_satisfaction;
Select round(avg(Food_and_Drink),2) as Avg_Food_and_Drink from airline_passenger_satisfaction;
Select round(avg(In_flight_service),2) as Avg_Inflight_service from airline_passenger_satisfaction;
Select round(avg(In_flight_Wifi_service),2) as Avg_In_Flight_Wifi_service from airline_passenger_satisfaction;
Select round(avg(In_flight_Entertainment),2) as Avg_In_Flight_Entertainment from airline_passenger_satisfaction;
Select round(avg(Baggage_Handling),2) as Avg_Baggage_Handling from airline_passenger_satisfaction;

