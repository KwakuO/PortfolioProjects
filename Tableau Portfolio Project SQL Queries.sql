Queries used for Tableau Project

*/


1.

— — Show Average Life Expectancy In The World From 1770 to 2019 (Line Graph)

SELECT *
FROM "life-expectancy"
WHERE "Entity" = 'World' AND
      "Year" IN (1770, 1820, 1870, 1913, 1970, 2019)


2.

— — Show Life Expectancy In Africa, Asia, Australia, Europe, Americas In 2019 (Bar Graph)

SELECT *
FROM "life-expectancy"
WHERE "Entity" IN ('Africa', 'Asia', 'Australia', 'Europe',
                  'Americas') AND
      "Year" = 2019


3.

— — Show Percentage Of HIV/AID Deaths Of Each Age Group, Per 100,000 People In Africa In 2009 (Pie Chart)

Select "Entity",
       "Year",
       "Deaths - HIV/AIDS - Sex: Both - Age: Under 5 (Rate)",
       "Deaths - HIV/AIDS - Sex: Both - Age: 5-14 years (Rate)",
       "Deaths - HIV/AIDS - Sex: Both - Age: 15-49 years (Rate)",
       "Deaths - HIV/AIDS - Sex: Both - Age: 50-69 years (Rate)",
       "Deaths - HIV/AIDS - Sex: Both - Age: 70+ years (Rate)"
FROM "hiv-death-rates-by-age"
WHERE "Entity" = 'Africa' AND
      "Year" = 2009


4.

— — Show Life Expectancy In Every Country In North America In 2019 (Bar Graph)

SELECT *
FROM "life-expectancy"
WHERE "Entity" IN ('Guatemala', 'El Salvador', 'Honduras',
                   'Costa Rica', 'Panama', 'Cuba', 'Jamaica',
                  'Grenada', 'Trinidad and Tobago',
                   'Saint Vincent and the Grenadines',
                   'Barbados', 'Martinique', 'Dominica',
                  'Montserrat', 'Antigua and Barbuda',
                  'Saint Kitts and Nevis',
                   'British Virgin Islands', 'Puerto Rico',
                  'Dominican Republic', 'Haiti',
                  'Bermuda', 'United States', 'Mexico',
                  'Canada', 'Greenland', 'Belize',
                  'Nicaragua', 'Bahamas') AND
      "Year" = 2019
