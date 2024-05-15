-- * if want to start the postgreSQL using the cmd then run the command as 
psql -h localhost -p 5432 -U postgres test 


-- to create a table use the command  in the sql Shell
CREATE TABLE table_name (
    id type_of_ID (INT) NOT NULL PRIMARY KEY, 
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    mobli_number INT(200) NOT NULL,
    country_name VARCHAR(200) NOT NULL
);

--  TO ADD THE DATA INTO THE CREATED TABLE USE THE COMMAND AS 
INSERT INTO table_name(id, first_name, last_name, mobile_number, country_name) value(1,'ashish', 'singh', '+919876543210', 'India');
-- this would be the first row of the created table data , if one wants to to add more or have a file 
-- which contain the row of data 
 \i 'path of the sql data file'

-- TO PRINT THE CRATED TABLE
SELECT *
FROM table_name;  -- it would print the all the data of the table 

-- IF ONE WANTS TO PRINT ANY ROW ONLY THEN USE THE COMMAND AS 
SELECT column_title 
FROM table_name; 


-- IF WATNS TO PRINT MORE THAT ONE ROW THEN AS A COMMA AFTER EACH COLUMN_TITLE LIKE, 
SELECT column_title1, column_title2... 
FROM table_name;


-- ORDER BY
-- TO PRINT THE TABLE IN THE ACENDING OF DECENDING ORDER USE THE COMMANDA AS
SELECT * 
FROM table_name 
ORDER BY choose_tilte ASC; -- acs for the acending order and decs for the decending order 


-- DISTINCT
-- to get the unique elements from the table column
SELECT DISTINCT first_name 
FROM person 
ORDER BY first_name desc; 



-- WHERE
--  to get the rows with the some particular words from the table_name = person ;
SELECT *
FROM person 
WHERE gender='FEMALE';

SELECT *
FROM person 
WHERE gender='FEMALE' AND (country_of_birht='Poland' OR country_of_birth='India');


-- OFFSET
--  To select the certain number of row in between the table 
SELECT * 
FROM person
OFFSET 5 
FETCH  FIRST 10 ROW ONLY;


-- IN
-- to select the multiple elements 
SELECT* 
FROM person
WHERE country_of_birth IN
('Russia', 'Poland','Brazil', 'India', 'Iran');


-- BETWEEN AND, ans ORDER BY
-- applied multiple filter on the table data to access required 
SELECT *
FROM person
WHERE country_of_birth
BETWEEN 'China' AND 'Japan'
AND date_of_birth
BETWEEN '2023-07-01' AND '2024-07-01'
AND gender='Female'
ORDER BY country_of_birth;



-- LIKE ans ILIKE
-- to select the elemets which contains some specific words like
--  to find all the email which ends with .com or  @google.com or .nitrkl.ac.in or anything
SELECT *
FROM person
WHERE email LIKE '%mit.edu'
    AND gender = 'Female'
    AND country_of_birth = 'France';


-- also if we wants thet the email should be the of the lenght x followed by @specific.domain then 
SELECT *
FROM person
WHERE email LIKE '_________@%google.com'
    AND gender = 'Female';

--  selecting the country_of_birth starting with the letter J
SELECT *
FROM person
WHERE country_of_birth LIKE 'J%'
-- NOTE: TO AVOID THE CASE SENSTIVITY USE THE ILIKE INSTEAD OF THE LIKE
SELECT *
FROM person
WHERE country_of_birth ILIKE 'j%'



-- GROUP BY, COUNT, adding CONDITIONS --
-- to group the element on the basis of something common , like there we get the count of all the people who born in same country.
SELECT  country_of_birth, 
COUNT(*)  
FROM person 
GROUP  BY country_of_birth 
ORDER BY country_of_birth;

--  adding more conditon 
SELECT  country_of_birth, 
COUNT(*)  
FROM person 
GROUP  BY country_of_birth 
HAVING COUNT(*)>10 AND COUNT(*)<=30  -- ADD CONDITOON HERE 
ORDER BY country_of_birth;





