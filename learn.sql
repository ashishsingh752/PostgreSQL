-- * if want to start the postgreSQL using the cmd then run the command as 
psql -h localhost -p 5432 -U postgres test 


1*
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
SELECT *FROM table_name;  -- it would print the all the data of the table 

-- IF ONE WANTS TO PRINT ANY ROW ONLY THEN USE THE COMMAND AS 
SELECT column_title FROM table_name; 

-- IF WATNS TO PRINT MORE THAT ONE ROW THEN AS A COMMA AFTER EACH COLUMN_TITLE LIKE, 
SELECT column_title1, column_title2... FROM table_name;


-- TO PRINT THE TABLE IN THE ACENDING OF DECENDING ORDER USE THE COMMANDA AS
SELECT * FROM table_name ORDER BY choose_tilte ASC; -- acs for the acending order and decs for the decending order 

-- to get the unique elements from the table column
SELECT DISTINCT first_name FROM person ORDER BY first_name desc; 

--  to get the rows with the some particular words
 SELECT *FROM WHERE gender='FEMALE';
 SELECT *FROM WHERE gender='FEMALE' AND (country_of_birht='Poland' OR country_of_birth='India');
