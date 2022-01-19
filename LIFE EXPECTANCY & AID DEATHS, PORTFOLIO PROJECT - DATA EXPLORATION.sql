/*

LIFE EXPECTANCY, DEATHS FROM AIDS, AND DEATHS FROM AIDS BY AGE Data Exploration 



Skills used: ROUNDING , ALIASES, ORDERING, CONDITIONAL FILTERING DIRECT COMPARISONS, CREATING TABLES, AGGREGATION FUNCTIONS, JOINING CONDITIONALS, INNER JOIN, FILTERING AGGREGATIONS, LOGIC STATEMENTS


*/



— — ROUND THE # OF DEATHS FROM AIDS TO THE NEAREST INTEGER:


SELECT * FROM "deaths-from-aids-ihme"
round("Deaths - HIV/AIDS - Sex: Both - Age: All Ages (Number)")



— — ROUND THE # OF DEATHS FROM AIDS FROM UNDER 5, 5-14, 14-49 TO THE NEAREST INTEGER:


SELECT "Entity",
       "Code",
       "Year",
       round("Deaths - HIV/AIDS - Sex: Both - Age: Under 5 (Rate)")
       AS "DEATHS FROM AIDS UNDER 5",
       round("Deaths - HIV/AIDS - Sex: Both - Age: 5-14 years (Rate)")
       AS "DEATHS FROM AIDS 5-14",
       round("Deaths - HIV/AIDS - Sex: Both - Age: 15-49 years (Rate)")
       AS "DEATHS FROM AIDS 15-49"
FROM "hiv-death-rates-by-age"



— — ORDER FROM GREATEST TO LEAST LIFE EXPECTANCY:

SELECT *
FROM "life-expectancy"
ORDER BY "Life expectancy" DESC



— — SHOW LIFE EXPECTANCY IN UNITED STATES:


SELECT “ENTITY”, 
       “CODE”
       “YEAR”
       “LIFE EXPECTANCY”
  FROM “LIFE-EXPECTANCY”
  WHERE “ENTITY” LIKE ‘United States’
  ORDER 1,2



— — SHOW LIFE EXPECTANCY IN UNITED STATES FROM 1999-2019:


SELECT “ENTITY”, 
       “CODE”
       “YEAR”
       “LIFE EXPECTANCY”
  FROM “LIFE-EXPECTANCY”
  WHERE “ENTITY” LIKE ‘United States’ AND
  "Year" Between '1999' AND '2019'



— — SHOW THE MINIMUM, MAXIMUM, AND AVERAGE LIFE EXPECTANCY OF ALL TIME

SELECT MAX("Life expectancy") as max_life_expectancy,
Min("Life expectancy") as min_life_expectancy,
       AVG("Life expectancy") as AVG_life_expectancy
FROM "life-expectancy"



— — CREATE TABLE WITH LIFE EXPECTANCY IN UNITED STATES FROM 1999-2019:

CREATE TABLE US_LIFE_EXPECTANCY AS
SELECT *
FROM "life-expectancy"
WHERE "Entity" Like 'United States' and
      "Year" BETWEEN '1999' AND '2019'



— — INNER JOIN TABLES “LIFE EXPECTANCY” AND “DEATHS FROM AIDS IHME” 


SELECT *
FROM "life-expectancy"
JOIN "deaths-from-aids-ihme" "d-f-a-i"
    on "life-expectancy"."Year" = "d-f-a-i"."Year"



— — SHOW LIFE EXPECTANCIES GREATER THAN 80:


SELECT *
FROM "life-expectancy"
WHERE "Life expectancy" > 80



— — SHOW YES OR NO IF LIFE EXPECTANCY IS GREATER THAN 80:

SELECT "Entity",
       "Code",
       "Year",
       "Life expectancy",
       CASE WHEN "Life expectancy" > 80 THEN 'YES' ELSE 'NO'
END AS GreaterThan80
FROM "life-expectancy"
