 
/*1) Write a query to rank order the following table in MySQL by votes, display the rank as one of thecolumns.
CREATE TABLE votes ( name CHAR(10), votes INT ); 
INSERT INTO votes VALUES 
('Smith',10), ('Jones',15), ('White',20), ('Black',40), ('Green',50), ('Brown',20);
*/
  

SET @rownum = 0; 

SELECT *,(@rownum := @rownum + 1) AS rank from votes order by votes


/*
2)
Write a function to capitalize the first letter of a word in a given string;
Example:   initcap(UNITED   states   Of   AmERIca   )   =   United   States   Of   America
*/



DROP FUNCTION IF EXISTS ucfirst;
 
DELIMITER $$
CREATE FUNCTION ucfirst(str_value TEXT)
RETURNS TEXT
BEGIN
    return CONCAT(ucase(substr(str_value, 1,1)), lcase(substr(str_value, 2)));
END;
$$
DELIMITER ;
