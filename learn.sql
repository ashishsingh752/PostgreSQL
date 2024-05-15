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


--* ORDER BY
-- TO PRINT THE TABLE IN THE ACENDING OF DECENDING ORDER USE THE COMMANDA AS
SELECT * 
FROM table_name 
ORDER BY choose_tilte ASC; -- acs for the acending order and decs for the decending order 


-- * DISTINCT
-- to get the unique elements from the table column
SELECT DISTINCT first_name 
FROM person 
ORDER BY first_name desc; 



--* WHERE
--  to get the rows with the some particular words from the table_name = person ;
SELECT *
FROM person 
WHERE gender='FEMALE';

SELECT *
FROM person 
WHERE gender='FEMALE' AND (country_of_birht='Poland' OR country_of_birth='India');


--* OFFSET
--  To select the certain number of row in between the table 
SELECT * 
FROM person
OFFSET 5 
FETCH  FIRST 10 ROW ONLY;


-- *IN
-- to select the multiple elements 
SELECT* 
FROM person
WHERE country_of_birth IN
('Russia', 'Poland','Brazil', 'India', 'Iran');


--* BETWEEN AND, ans ORDER BY
-- applied multiple filter on the table data to access required 
SELECT *
FROM person
WHERE country_of_birth
BETWEEN 'China' AND 'Japan'
AND date_of_birth
BETWEEN '2023-07-01' AND '2024-07-01'
AND gender='Female'
ORDER BY country_of_birth;



-- * LIKE ans ILIKE
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



--* GROUP BY, COUNT, adding CONDITIONS --
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



--  Learing In the car table  --- 
-- car table
CREATE TABLE car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(150) NOT NULL,
	model VARCHAR(150) NOT NULL,
	price NUMERIC(19,2) NOT NULL
);

--  we can perform the mathematical operation like sum, avg, max, min 
SELECT 
SUM(price), 
MAX(price), 
AVG(price),
MIN(price)
FROM car;

-- performing some complex mathematical operation on the price 
SELECT 
id, 
make, 
model, 
price, 
ROUND(price*0.1,2), Round((price-(price*.10)),2)  
FROM car;

-- *COALESCE :
--   This is particularly useful when we want to ensure that a 
--   field does not return null but rather a default value or some other field's value if the primary field is null;
SELECT 
COALESCE (email,'email not provided')  -- setting the null field of the emails with the default value 'email not provided';
FROM person;


--* NULLIF(a, b): 
-- It will return the null if the both the number are same i.e. (a==b) so it is used to handle the division of a 
-- number by the zero 
SELECT COALESCE(10/NULLIF(0,0));

--* DATE AND TIME
SELECT NOW(); -- it will give the date and the time with the timezone 
--  to get the time only use the command as 
SELECT NOW()::TIME; -- for the time only 
SELECT NOW()::DATE; -- for the date only
SELECT (NOW() + INTERVAL '10 YEARS')::DATE;  -- DATE AFTER A INTERVAL
SELECT EXTRACT(DAY FROM NOW());

-- NOTE: TO DROP THE PRIMARY KEY 
ALTER TABLE table_name DROP CONSTRAINT contraint_key;  -- contraint key will be obtained by \d table_name , this command will give some primary key ;

--* TO ADD THE CONTRAINT IN THE TABLE USE THE COMMAND AS THE 
ALTER TABLE table_name ADD CONSTRAINT unique_email_address UNIQUE(email);
ALTER TABLE person ADD  UNIQUE(email); -- if we run this command then the unique key name is given by the postgreSQL

--*  command  to drop a row with some specific id 
DELETE FROM table_name WHERE id='define_id';

-- CHECK contraint:
-- this is used to add some check condition while entering the data, let say in a 
-- table in the gender section only the male and the female can be entered and if 
-- someone is entering something else then it shold not take the input 
ALTER TABLE person ADD CONSTRAINT gender_contraint CHECK (gender='Female' OR gender='Male');

--* Update 
UPDATE person
SET
email='theashish752@gmail.com',
first_name='Ashish',
last_name='Singh',
date_of_birth='2002-07-05'
WHERE id=1;

--* ON CONFLICT command:
-- this is used to check when the input data has the conflic the already existing data with the constraint defined 
insert into person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth) 
values (36, 'Wynnie', 'Stappard', 'wstappardz@creativecommons.org', 'Female', '2024/01/24', 'Greece')
ON CONFLICT(id) DO NOTHING
ON CONFLICT(email) DO NOTHING;


-- ADDING RELATIONSHIP BETWEEN TWO TABLES 
create table car (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19, 2) NOT NULL
);

create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(58) NOT NULL,
    last_name VARCHAR(58) NOT NULL,
    gender VARCHAR(7) NOT NULL,
    email VARCHAR(100), 
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car(id),
    UNIQUE(car_id)
);

-- Setting the relation between the person table and the car table 
UPDATE person SET car_id=2 WHERE id=3;

-- *FOREIGN KEY : 
--  1) foreign key is a column or group of columns in a table that 
-- references the primary key or a unique constraint of another table

--  2) It establishes a link between the data in two tables, enforcing a 
-- parent-child relationship  to maintain referential integrity.

-- *Benefits of Foreign Keys:
-- Data Integrity: Protects against inconsistencies by ensuring references are valid.
-- Data Relationships: Models relationships between tables, making data management more organized.
-- Prevents Invalid Data: Stops insertions that violate the foreign key constraint.


-- *INNER JOIN
-- Inner joins two table in which the foreign key and the primary key is found in both the tables 
SELECT *
FROM table_a 
JOIN table_b ON table_a.<foreign_key_column_name> = table_b.id;

-- LEFT JOIN
-- It gives all the elements of the table_A and all the elements of the table_B which have their primary key as the forein key in the table a
SELECT table_A.*, table_B.*
FROM table_A
LEFT JOIN table_B ON table_A.b_id = table_B.id;

--* NOTE: 
-- If any element of the table B is refered as the foreign key to the table A and we try to 
--  delete that element from the table B , it would result into error. 
-- To delete that element from the table B . first remove the referece of that element 
-- from the table A and then perform the delete operation in the table B.

-- To extract the data in a .csv formate use the command as 
\copy (SELECT *FROM person LEFT JOIN car ON person.car_id=car.id) TO 'file_location\file_name.csv' DELIMITER ',' CSV HEADER;
