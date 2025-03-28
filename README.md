# Airline Passenger Satisfaction Analysis


![Airline image](https://github.com/user-attachments/assets/10ac2ccf-b8a1-4a23-a7ab-cb51aa0e624b)

## Table of Contents

- [Introduction](#Introduction)
- [Dataset Overview](#Data-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning-and-Transformation)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)

- ## Introduction
The Airline company relies on data to gain deeper understanding of customer satisfaction in order to enhance service quality, optimize passenger experience, improve brand loyalty and help the company make informed decisions. 
SQL was used to query and analyze passenger feedback to identify key drivers of satisfaction and dissatisfaction across different customer segments.

## Dataset Overview
The dataset includes the following columns:
- ID: Unique passenger identifier.
- Gender: Gender of the passenger (Female/Male).
- Age: Age of the passenger.
- Customer Type: Type of airline customer (First-time/Returning).
- Type of Travel: Purpose of the flight (Business/Personal).
- Class: Travel class in the airplane for the passenger seat.
- Flight Distance: Flight distance in miles.
- Departure Delay: Flight departure delay in minutes.
- Arrival Delay: Flight arrival delay in minutes.
- Departure and Arrival Time Convenience: Satisfaction level with the convenience of the flight departure and arrival times from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Ease of Online Booking: Satisfaction level with the online booking experience from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Check-in Service: Satisfaction level with the check-in service from 1 (lowest) to 5 (highest) 0 means "not applicable".
- Online Boarding: Satisfaction level with the online boarding experience from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Gate Location: Satisfaction level with the gate location in the airport from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- On-board Service: Satisfaction level with the on-boarding service in the airport from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Seat Comfort: Satisfaction level with the comfort of the airplane seat from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Leg Room Service: Satisfaction level with the leg room of the airplane seat from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Cleanliness: Satisfaction level with the cleanliness of the airplane from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Food and Drink: Satisfaction level with the food and drinks on the airplane from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- In-flight Service: Satisfaction level with the in-flight service from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- In-flight Wifi Service: Satisfaction level with the in-flight Wifi service from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- In-flight Entertainment: Satisfaction level with the in-flight entertainment from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Baggage Handling: Satisfaction level with the baggage handling from the airline from 1 (lowest) to 5 (highest) - 0 means "not applicable".
- Satisfaction: Overall satisfaction level with the airline (Satisfied/Neutral or unsatisfied).

## Project Objective
SQL Queries & Insights: Answering the key business questions.
Power BI Dashboard: Data visualization of satisfaction trends and customer profiles.

Key Business Questions to Solve:
1. Overall Passenger Satisfaction Trends
- What percentage of airline passengers are satisfied?
- Does satisfaction vary by customer type (e.g., first-time vs. returning customers)?
- How does satisfaction differ across types of travel (e.g., Business vs. Leisure)?
2. Customer Segmentation & Profile Analysis
- What is the typical profile of a repeating airline passenger?
- Do returning passengers show higher satisfaction than new customers?
- How do satisfaction levels vary by gender and age group?
3. Flight Patterns & Their Impact on Satisfaction
- Does flight distance affect customer preferences or behavior?
- How do departure and arrival delays influence satisfaction?
- Are certain travel classes (Economy, Business, First Class) associated with higher satisfaction?
4. Factors Contributing to Satisfaction & Dissatisfaction
- Which service areas (e.g., Check-in, Online Boarding, Seat Comfort) contribute most to satisfaction?
- What factors lead to dissatisfaction (e.g., Baggage handling, In-flight service, WiFi, Food & Drink)?
- Is there a relationship between cleanliness ratings and overall satisfaction?
5. Operational Efficiency & Service Improvements
- Which airline services (Online Booking, Check-in, Gate Location, In-flight Service, Entertainment) have the lowest ratings?
- Can we identify specific flight routes or schedules with higher dissatisfaction rates?

![Screenshot 2025-03-28 110833](https://github.com/user-attachments/assets/e2663223-e5de-443a-a5bf-b767f6755cfc)

## Data Cleaning and Transformation 
I started by renaming the table name from Airlinepassengersatisfaction to Airline_Passenger_satisafaction
```sql
Rename table airlinepassengersatisfaction to airline_passenger_satisfaction;
```
- Rename columns to the right format
- Rename column Customer Type to Customer_Type
```sql
Alter table airline_passenger_satisfaction
Rename column `Customer Type` to Customer_Type;
```
- Rename column Type of travel to Type of Travel
```sql
Alter table airline_passenger_satisfaction
Rename column `Type of Travel` to Type_of_Travel;
```
- Rename column Flight_Distance to Flight_Distance
```sql
Alter table airline_passenger_satisfaction
Rename column `Flight Distance` to Flight_Distance;
```
- Rename column Departure Delay to Departure_Delay
```sql 
Alter table airline_passenger_satisfaction
Rename column `Departure Delay` to Departure_Delay;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Arrival Delay` to Arrival_Delay;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Departure and Arrival Time Convenience` to Departure_and_Arrival_Time_Convenience;
```

```sql 
Alter table airline_passenger_satisfaction
Rename column `Ease of Online Booking` to Ease_of_Online_Booking;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Check-in Service` to Check_in_Service;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Online Boarding` to Online_boarding;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Gate Location` to Gate_Location;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `On-board Service` to On_board_Service;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Seat Comfort` to Seat_Comfort;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Leg Room Service` to Leg_Room_Service;
```

```sql
Alter table airline_passenger_satisfaction
Rename column `Food and Drink` to Food_and_Drink;
```

```sql 
Alter table airline_passenger_satisfaction
Rename column `In-flight Service` to In_Flight_Service;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `In-flight Wifi Service` to In_Flight_Wifi_Service;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `In-flight Entertainment` to In_Flight_Entertainment;
```
```sql
Alter table airline_passenger_satisfaction
Rename column `Baggage Handling` to Baggage_Handling;
```

- Change Date column Data type

```sql
Alter table airline_passenger_satisfaction
Modify column ID int;
```

```sql
Alter table airline_passenger_satisfaction
Modify column Age int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Flight_Distance int;
```

```sql 
Alter table airline_passenger_satisfaction
Modify column Departure_Delay int;
```

```sql
Alter table airline_passenger_satisfaction
Modify column Arrival_Delay int;
```

```sql
Alter table airline_passenger_satisfaction
Modify column Departure_and_Arrival_Time_Convenience int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Ease_of_Online_Booking int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Check_in_Service int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Online_boarding Int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Gate_Location int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column On_board_Service int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Seat_Comfort int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Leg_Room_Service int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Cleanliness int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Food_and_Drink int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column In_Flight_Service int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column In_Flight_Wifi_Service int;
```
```
Alter table airline_passenger_satisfaction
Modify column In_Flight_Entertainment int;
```
```sql
Alter table airline_passenger_satisfaction
Modify column Baggage_Handling int;
```
- Handling Missing Data in Column Arrival_Delay
- There are Null Values in the Column
```sql
Update airline_passenger_satisfaction
Set Arrival_Delay = 0
where Arrival_delay = "";
```
- Null values were replaced with 0 in Arrival delay column.
- Remove Duplicate rows(Rows that have same Value)
```sql
Select ID, Gender, Age, Customer_Type, Flight_Distance, Arrival_Delay, Seat_Comfort, Cleanliness, In_flight_wifi_service, Satisfaction, count(*) from airline_passenger_satisfaction
group by ID, Gender, Age, Customer_Type, Flight_Distance, Arrival_Delay, Seat_Comfort, Cleanliness, In_flight_wifi_service, Satisfaction
having count (*) > 1;
````
- This Dataset has no Duplicate.

## Data Exploration and Insights

- Exploratory Analysis
1. What’s the total number of Airline passengers?
INSIGHTS: 129,880.

2. What’s the total number of Male and Female passengers?
INSIGHTS: Male 63,981, Female 65,899.

3. MAXIMUM and MINIMUM Flight Distance
INSIGHTS: 4,983 Miles, 31Miles.

4. What’s the count of customer type?
INSIGHTS: First-time Passengers 23,780, Returning 106,100.

5. What’s the count of Travel Type?
INSIGHTS: Business 89,693, Personal 40,187.
6. Count of Travel Class
INSIGHTS: Business 62,160, Economy 58,309, Economy Plus 9,41.
7. Count of Age group
INSIGHTS: Middle_Aged Adult 53,602, Young Adult 51,883, Older Adult 12,215, Child 4,794, Teenager 7,386.
 
- Key Business Questions 
1. Overall Passenger Satisfaction Trends
- What percentage of airline passengers are satisfied?
INSIGHTS: Satisfied, 43.45%.

- Does satisfaction vary by customer type (e.g., first-time vs. returning customers)?
INSIGHTS: Result shows that satisfaction levels vary between first-time and returning customers. First-time passengers and returning Passengers show higher dissatisfaction levels, with 18,080 and 55,372 count of dissatisfied customers, respectively.

- How does satisfaction differ across types of travel (e.g., Business vs. Leisure)?
INSIGHTS: Satisfaction levels vary significantly between business and personal travelers. Business travelers are more satisfied (52,356) than dissatisfied (37,337). 

2. Customer Segmentation & Profile Analysis
-- Do returning passengers show higher satisfaction than new customers?
INSIGHTS: Yes, Returning passengers 50,728 vs First-time passengers 5,700.

- How do satisfaction levels vary by gender and age group?
INSIGHTS:  Male Middle-Aged Adults: 15,401 satisfied vs. 11,192 dissatisfied.
Female Middle-Aged Adults: 15,522 satisfied vs. 11,487 dissatisfied.
Female Young Adults: 9,973 satisfied vs. 16,613 dissatisfied, Male Young Adults: 9,986 satisfied vs. 15,311 dissatisfied.
Male Older Adults: 1,663 satisfied vs. 4,402 dissatisfied, Female Older Adults: 1,643 satisfied vs. 4,507 dissatisfied.
In general, female passengers tend to be more dissatisfied than male passengers across most age groups, particularly in: Young Adults (16,613 dissatisfied vs. 9,973 satisfied for females), Older Adults (4,507 dissatisfied vs. 1,643 satisfied for females).

3. Flight Patterns & Their Impact on Satisfaction
- Does flight distance affect customer preferences or behavior?
INSIGHTS: Short distance flights Customers are more dissatisfied (33,330) than satisfied (16,922).
Medium distance flights Customers are more likely to be satisfied (18,012) than neutral or dissatisfied (11,027). Long Distance Flights there's a much higher number of satisfied customers (7,947) compared to dissatisfied or neutral customers (2,311). Very short distance flights a high number of dissatisfied or neutral customers (26,759) compared to satisfied customers (13,517). Likewise very long distance a very low number of both dissatisfied or neutral customers (25) and satisfied customers (30).

- How do departure and arrival delays influence satisfaction?
INSIGHTS: Longer delays (above 10 minutes) seem to cause a stronger likelihood of passengers being dissatisfied. Out of the passengers with delays of over 10 minutes, 28,708 (more than half) are Neutral or Dissatisfied. However, 17,176 are still satisfied, which indicates that even with significant delays, a portion of passengers may still be satisfied.
Shorter delays (0-10 minutes) tend to result in more passengers remaining satisfied. Despite having a delay, the number of passengers who remain satisfied (39,252) is relatively high compared to those who are Neutral or Dissatisfied (44,744).

- Are certain travel classes (Economy, Business, First Class) associated with higher satisfaction?
INSIGHTS: Business is associated with higher satisfaction having the highest satisfaction count 43,166.

4. Factors Contributing to Satisfaction & Dissatisfaction                                   
- Which service areas (e.g., Check-in, Online Boarding, Seat Comfort) contribute most to satisfaction?
INSIGHTS: Top 5 services that contribute to the overall satisfied passengers In-fights service 81,389, Baggage handling 80,639, Seat comfort 72,914, In-flight entertainment 68,335, On-board service 68,195.
- What factors lead to dissatisfaction (e.g., Baggage handling, In-flight service, Wi-Fi, Food & Drink)?
INSIGHTS: Top 5 services that contribute to the overall dissatisfied passengers In-Flight_Wifi_Service 54,648, Ease_of_Online_Booking 51,937, Gate Location 46,287, Food_and_Drink 43,434, Departure_and_arrival_time_Convenience 40,943.

- Is there a relationship between cleanliness ratings and overall satisfaction?
INSIGHTS: Cleanliness is a Significant Factor for Satisfaction:
Low Cleanliness Ratings: Neutral or Dissatisfied: 29,270 passengers vs Satisfied: 7,572 passengers.
High Cleanliness Ratings: Neutral or Dissatisfied: 26,798 passengers vs Satisfied: 35,587 passengers.
Average Cleanliness Ratings: Neutral or Dissatisfied: 17,370 passengers vs Satisfied: 13,269 passengers.

5. Can we identify specific flight routes or schedules with higher dissatisfaction rates?
INSIGHTS: Medium distance flights show the highest number of dissatisfied passengers (18,012).
Short Distance Flights Have High Dissatisfaction, But Not as Much as Medium Distance:
Short distance flights still contribute significantly to dissatisfaction (16,922), though this is lower than medium distance.

## RECOMMENDATION
Recommendations Based on the Analysis of Passenger Satisfaction
1. Improve Service Quality for First-Time and Returning Passengers
First-Time Passengers: Since 18,080 first-time passengers reported dissatisfaction, airlines should focus on setting accurate expectations through clear communication and offering enhanced customer service for newcomers. This could involve tailored welcome experiences and better pre-flight information.
Returning Passengers: With 55,372 returning passengers dissatisfied, it’s essential to maintain consistency in service quality. This could include loyalty programs, personalized services, and ensuring that frequent flyers feel valued, addressing any issues with declining service standards.

2. Cater to Business and Personal Travelers:
Business Travelers: Business travelers (52,356 satisfied vs. 37,337 dissatisfied) are more focused on efficiency, reliability, and service quality. To enhance their satisfaction, airlines should prioritize offering punctual flights, smooth check-in processes, priority boarding, and premium services like more comfortable seating or better in-flight amenities for business class.
Personal Travelers: Personal travelers show greater dissatisfaction (36,115 dissatisfied vs. 4,072 satisfied). Airlines should focus on improving the value proposition for this group, considering factors like pricing, perceived value, and leisure-oriented services. Offering more affordable options, bundled services, and special packages could better meet their expectations.

3. Target Satisfaction in Specific Age Groups:
Middle-Aged Adults: This group shows the highest levels of satisfaction (male: 15,401 satisfied vs. 11,192 dissatisfied; female: 15,522 satisfied vs. 11,487 dissatisfied). To maintain this, airlines should continue focusing on service consistency, comfort, and value. Tailoring marketing and loyalty programs to this demographic can further enhance satisfaction.
Young Adults: There’s a mixed sentiment with young adults, as 16,613 females and 15,311 males report dissatisfaction. This may stem from higher expectations and sensitivity to pricing. Airlines should offer value-driven services like discounts, exclusive offers, and improved entertainment options to appeal to younger passengers.
Older Adults: Older adults show considerable dissatisfaction (male: 4,402 dissatisfied vs. 1,663 satisfied; female: 4,507 dissatisfied vs. 1,643 satisfied). To address their concerns, airlines should enhance accessibility features (e.g., priority seating, easier boarding), improve comfort, and ensure that the airline meets the specific needs of older passengers, such as clear signage and dedicated assistance.


4. Address Gender Differences in Satisfaction:
Females: In general, female passengers tend to be more dissatisfied, especially in the young adult (16,613 dissatisfied) and older adult (4,507 dissatisfied) categories. Airlines could focus on providing more tailored services and enhancing comfort to improve female passenger satisfaction. Offering targeted campaigns and addressing specific concerns like accessibility and seat comfort can improve their overall experience.
Males: While male passengers are slightly more satisfied overall, attention should still be given to the dissatisfaction in specific age groups, such as young and older adults, through targeted service improvements.
•	

5. Enhance Short and Medium-Haul Flight Experiences:
Short Distance Flights: With significant dissatisfaction (33,330 dissatisfied vs. 16,922 satisfied), airlines should focus on improving the overall experience for passengers on short flights. This could include addressing overcrowding by optimizing seat configurations, improving in-flight service with additional amenities (even on shorter flights), and enhancing comfort.
Medium Distance Flights: Medium-haul flights show more satisfaction (18,012 satisfied vs. 11,027 dissatisfied), but there’s still room for improvement. Airlines could offer more comfortable seating, better food options, and enhanced in-flight entertainment. Improving punctuality and reducing delays on these flights would also help increase satisfaction.


6. Reduce Impact of Delays:
Short Delays (0-10 minutes): Passengers show higher tolerance for short delays (39,252 satisfied vs. 44,744 neutral/dissatisfied), but airlines should still
focus on minimizing delays. Transparent communication during delays, offering small compensations or amenities like snacks or drinks, and ensuring better
customer service during wait times can help maintain a positive experience.
Long Delays (over 10 minutes): Longer delays have a significant negative impact on satisfaction (28,708 neutral/dissatisfied). Airlines should invest in better operational practices to reduce delays, improve the efficiency of airport operations, and ensure that passengers are promptly informed about delays. Offering compensation or alternative solutions, such as hotel stays or meal vouchers, would help mitigate dissatisfaction.


7. Focus on Flight Patterns:
Very Short Distance Flights: These flights show high dissatisfaction (26,759 dissatisfied vs. 13,517 satisfied). Airlines should address common pain points such as cramped seating and limited amenities by offering more spacious seating options or improving the in-flight experience with additional services like Wi-Fi or entertainment.
Very Long Distance Flights: With a low number of both dissatisfied (25) and satisfied (30) passengers, this could be due to the unique nature of these flights. Airlines should ensure that services meet the special needs of ultra-long-haul passengers, such as offering extra comfort, better in-flight entertainment, and more personalized care for a better experience.


8. Improve Customer Service Training and Communication:
Clear Communication During Delays: As delays, especially long ones, have a significant impact on passenger satisfaction, airlines should invest in staff training to improve communication with passengers. Offering clear, concise, and consistent information about delays or cancellations can help mitigate frustration. Ensuring staff is proactive in offering assistance and managing customer expectations during stressful moments will significantly improve overall satisfaction.
Personalized Service for Frequent Passengers: Given the number of returning passengers expressing dissatisfaction, there’s a need for more personalized customer service. Implementing technology like CRM systems that can track passenger preferences and history can enable flight attendants and staff to provide a more tailored experience for loyal passengers.

9. Enhance In-Flight Experience:
Increased Focus on In-Flight Entertainment and Connectivity: For both young and older adults who are generally dissatisfied with their in-flight experience, enhancing entertainment options (such as more movie choices, music, or games) and providing free Wi-Fi or more affordable options for connectivity can elevate their experience. Ensuring that all passengers, especially on longer flights, have access to high-quality entertainment can increase satisfaction.
Upgrade Seat Comfort for All Flight Lengths: It’s evident that seating comfort remains a critical factor, particularly on shorter and very short-distance flights. Airlines should consider offering more spacious seating arrangements, even for budget-conscious travelers, or provide seat upgrades for a more comfortable journey.

10. Pricing Strategy and Value Proposition:
Flexible Pricing and Offers: Given the dissatisfaction of personal travelers, many of whom are dissatisfied with the perceived value of their tickets, airlines should consider offering more dynamic pricing models, seasonal discounts, or loyalty-based discounts. Offering value-added services such as free checked luggage or free seat selections on budget-friendly tickets can make a significant difference.
Tailored Bundling for Personal Travelers: Airlines should offer bundles that combine flights, accommodation, and experiences for personal travelers, especially those seeking leisure options. This would provide better perceived value, while also helping to maintain competitive pricing.


11. Improve Accessibility and Support for Older Passengers:
Dedicated Services for Older Passengers: The dissatisfaction among older adults highlights the need for airlines to implement dedicated services for passengers who require assistance. This could include a dedicated customer service line, additional in-flight support, or priority boarding and seating arrangements.
Health and Safety Features for Older Adults: Airlines should ensure that the physical and emotional comfort of older passengers is prioritized. This can include more comfortable and ergonomic seating, better restrooms, and more frequent checks from flight attendants to ensure the well-being of senior passengers during the flight.
•	

12. Improve Cleanliness and Hygiene Standards:
Emphasize Cleanliness and Hygiene Across All Flights: Given the general concerns about comfort and service, maintaining high hygiene standards can contribute positively to passenger satisfaction. Airlines should invest in high-quality cleaning procedures for both seats and common areas. This is particularly important for personal travelers, where cleanliness impacts their overall perception of value.
Sanitization Measures Post-Pandemic: Even as the world recovers from the pandemic, ensuring visible and ongoing sanitization of high-touch areas, offering personal sanitizing kits, and making passengers feel safe can alleviate concerns and improve satisfaction.


13. Address Environmental Concerns:
Sustainability Practices: With growing awareness of environmental impacts, passengers are increasingly concerned with the sustainability efforts of airlines. Airlines can boost satisfaction by investing in more eco-friendly practices, such as reducing plastic waste, offering carbon-offset programs, or using more sustainable aviation fuels. Demonstrating a commitment to sustainability could appeal to both younger adults and environmentally-conscious travelers.


## Conclusion

In conclusion, improving passenger satisfaction requires a holistic approach, addressing the diverse needs of different passenger groups and flight types. Airlines must prioritize service consistency, clear communication, and tailored experiences, especially for first-time and returning passengers, as well as business and personal travelers. By focusing on key demographics like middle-aged adults, young adults, and older adults, airlines can craft more personalized and relevant services that directly address areas of dissatisfaction. Additionally, ensuring high-quality in-flight experiences, reducing delays, enhancing seat comfort, and improving entertainment options are crucial to meeting passengers' expectations.

Adopting a flexible pricing strategy and offering value-driven packages for personal travelers will enhance perceived value and increase satisfaction, while sustainability practices and a commitment to environmental responsibility will resonate with eco-conscious travelers. Investments in accessibility, cleanliness, and hygiene will improve comfort and safety for all passengers, particularly older adults.

Finally, enhancing customer service through better training, improved communication during delays, and leveraging technology for personalization will create a more engaging and satisfying travel experience. By focusing on these recommendations, airlines can significantly improve passenger satisfaction, foster loyalty, and establish a reputation for consistently delivering exceptional service.


