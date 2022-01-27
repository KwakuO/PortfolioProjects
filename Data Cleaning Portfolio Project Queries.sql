/*

Cleaning Data in SQL Queries

*/

Purpose: To Show The Amount of Weeknight and Weekend Stays In Resort Hotel





— — Select Data

SELECT *
FROM hotel_bookings




— — Split Tables Based On Hotel

Create Table resort_hotel AS
SELECT *
FROM hotel_bookings
WHERE hotel = ‘Resort Hotel'

Create Table city_hotel AS
SELECT *
FROM hotel_bookings
WHERE hotel = 'City Hotel'




— — Drop Unnecessary Columns 

Alter TABLE city_hotel
Drop Column hotel

Alter TABLE resort_hotel
Drop Column hotel

ALTER TABLE city_hotel
DROP COLUMN lead_time, 
DROP COLUMN arrival_date_week_number,
DROP COLUMN is_canceled,
DROP COLUMN adults,
DROP COLUMN children,
DROP COLUMN babies,
DROP COLUMN meal,
    DROP COLUMN market_segment,
    DROP COLUMN distribution_channel,
    DROP COLUMN is_repeated_guest,
    DROP COLUMN previous_cancellations,
    DROP COLUMN previous_bookings_not_canceled,
    DROP COLUMN reserved_room_type,
DROP COLUMN assigned_room_type,
DROP COLUMN booking_changes,
DROP COLUMN deposit_type,
    DROP COLUMN agent,
    DROP COLUMN company,
    DROP COLUMN days_in_waiting_list,
    DROP COLUMN customer_type,
    DROP COLUMN adr,
    DROP COLUMN required_car_parking_spaces,
DROP COLUMN total_of_special_requests,
DROP COLUMN reservation_status,
DROP COLUMN reservation_status_date,
DROP COLUMN country

ALTER TABLE resort_hotel
DROP COLUMN lead_time,
DROP COLUMN arrival_date_week_number,
DROP COLUMN is_canceled,
DROP COLUMN adults,
DROP COLUMN children,
DROP COLUMN babies,
DROP COLUMN meal,
    DROP COLUMN market_segment,
    DROP COLUMN distribution_channel,
    DROP COLUMN is_repeated_guest,
    DROP COLUMN previous_cancellations,
    DROP COLUMN previous_bookings_not_canceled,
    DROP COLUMN reserved_room_type,
DROP COLUMN assigned_room_type,
DROP COLUMN booking_changes,
DROP COLUMN deposit_type,
    DROP COLUMN agent,
    DROP COLUMN company,
    DROP COLUMN days_in_waiting_list,
    DROP COLUMN customer_type,
    DROP COLUMN adr,
    DROP COLUMN required_car_parking_spaces,
DROP COLUMN total_of_special_requests,
DROP COLUMN reservation_status,
DROP COLUMN reservation_status_date,
DROP COLUMN country




— — Create Tables For Each Hotel Based On Each Year

Create Table resort_hotel_2015 AS
SELECT *
from resort_hotel
WHERE arrival_date_year = 2015

Create Table resort_hotel_2016 AS
SELECT *
from resort_hotel
WHERE arrival_date_year = 2016

Create Table resort_hotel_2017 AS
SELECT *
from resort_hotel
WHERE arrival_date_year = 2017

Create Table city_hotel_2015 AS
SELECT *
from city_hotel
WHERE arrival_date_year = 2015

Create Table city_hotel_2016 AS
SELECT *
from city_hotel
WHERE arrival_date_year = 2016

Create Table city_hotel_2017 AS
SELECT *
from city_hotel
WHERE arrival_date_year = 2017




— — Create Tables For Each Hotel Based On Each Month and Year

CREATE TABLE resort_hotel_aug2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = 'August'

CREATE TABLE resort_hotel_jul2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘July’

CREATE TABLE resort_hotel_june2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘June’

CREATE TABLE resort_hotel_may2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘May’

CREATE TABLE resort_hotel_apr2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘April’

CREATE TABLE resort_hotel_mar2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘March’

CREATE TABLE resort_hotel_feb2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘February

CREATE TABLE resort_hotel_jan2017 AS
Select *
FROM resort_hotel_2017
Where arrival_date_month = ‘January’

CREATE TABLE resort_hotel_jan2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = ‘January’

CREATE TABLE resort_hotel_feb2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = ‘February’

CREATE TABLE resort_hotel_mar2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'March'

CREATE TABLE resort_hotel_apr2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'April'

CREATE TABLE resort_hotel_May2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'May'

CREATE TABLE resort_hotel_Jun2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'June'

CREATE TABLE resort_hotel_jul2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'July'

CREATE TABLE resort_hotel_aug2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'August'

CREATE TABLE resort_hotel_sep2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'September'

CREATE TABLE resort_hotel_oct2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'October'

CREATE TABLE resort_hotel_nov2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'November'

CREATE TABLE resort_hotel_dec2016 AS
Select *
FROM resort_hotel_2016
Where arrival_date_month = 'December'

CREATE TABLE resort_hotel_jul2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'July'

CREATE TABLE resort_hotel_aug2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'August'

CREATE TABLE resort_hotel_sep2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'September'

CREATE TABLE resort_hotel_oct2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'October'

CREATE TABLE resort_hotel_nov2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'November'

CREATE TABLE resort_hotel_dec2015 AS
Select *
FROM resort_hotel_2015
Where arrival_date_month = 'December'




— — CREATE DATATYPE, MONTH OF YEAR

CREATE TYPE Month_of_Year as ENUM
('July 2015', 'August 2015', 'September 2015', 'October 2015',
    'November 2015', 'December 2015', 'January 2016',
    'February 2016', 'March 2016', 'April 2016',
    'May 2016', 'June 2016', 'July 2016', 'August 2016',
    'September 2016', 'October 2016', 'November 2016',
    'December 2016', 'January 2017', 'February 2017',
    'March 2017', 'April 2017', 'May 2017', 'June 2017',
     'July 2017', 'August 2017')




— — CREATE A NEW TABLE, ADD SUM OF STAYS IN WEEKNIGHTS AND WEEKEND NIGHTS, AND CREATE DATE COLUMN IN RESORT AND CITY HOTEL TABLES

Create Table Resort_Hotel_1
(stays_weekend_nights INT,
stays_weeknights INT, Date Month_of_Year)

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_aug2015

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2189, 5463, ‘August 2015’)

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_sep2015

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2121, 6008, ‘September 2015’)

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_oct2015

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1787, 4508, 'October 2015')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_nov2015

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (941, 3122, 'November 2015')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_dec2015

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1162, 2816, 'December 2015')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_jan2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (600, 1814, 'January 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_feb2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1275, 3169, 'February 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_mar2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1500, 4734, 'March 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_apr2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1984, 5099, 'April 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_may2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2040, 5206, 'May 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_jun2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2089, 5411, 'June 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_jul2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2257, 5634, 'July 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_aug2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2411, 6366, 'August 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_sep2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2122, 5482, 'September 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_oct2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2317, 5390, 'October 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_nov2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1238, 3426, 'November 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_dec2016

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1235, 3399, 'December 2016')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_jan2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1074, 2897, 'January 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_feb2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1447, 3739, 'February 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_mar2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (1952, 5584, 'March 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_apr2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2138, 5325, 'April 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_may2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2169, 5852, 'May 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_june2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2458, 6380, 'June 2017’)

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_jul2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2706, 6736, 'July 2017')

SELECT SUM(stays_in_weekend_nights) as stays_weekend_nights,
       SUM(stays_in_week_nights) as stays_weeknights
FROM resort_hotel_aug2017

Insert Into Resort_Hotel_1 (stays_weekend_nights,
stays_weeknights, Date) VALUES (2577, 6680, 'August 2017')



— — Quality Check



