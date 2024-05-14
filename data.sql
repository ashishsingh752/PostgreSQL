CREATE TABLE ashish (
    id BIGSERIAL NOT NULL PRIMARY KEY, 
    first_name VARCHAR(100) NOT NULL, 
    last_name VARCHAR(100) NOT NULL
);
 
INSERT INTO ashish (id, first_name, last_name) VALUES (1, 'ashish', 'singh');
