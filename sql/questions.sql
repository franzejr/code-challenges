 
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


-- Function   to   capitalize   the   first   letter   of   a   word   in   a   given   string

DROP FUNCTION IF EXISTS ucline;
DELIMITER $$
CREATE FUNCTION ucline(line TEXT) 
RETURNS TEXT
BEGIN
  SET @oldString := lcase(line);
  SET @newString := "";
 
  tokenLoop: LOOP
 
    SET @splitPoint := LOCATE(" ", @oldString);
 
    IF @splitPoint = 0 THEN
      SET @newString := CONCAT(@newString, ucfirst(@oldString));
      LEAVE tokenLoop;
    END IF;
 
    SET @newString := CONCAT(@newString, ucfirst(SUBSTRING(@oldString, 1, @splitPoint)));
    SET @oldString := SUBSTRING(@oldString, @splitPoint+1);
  END LOOP tokenLoop;
 
  RETURN @newString;
END;
$$
DELIMITER ;


-- Function to capitalize just the first letter in a word
DROP FUNCTION IF EXISTS ucfirst;
 
DELIMITER $$
CREATE FUNCTION ucfirst(str_value TEXT)
RETURNS TEXT
BEGIN
    return CONCAT(ucase(substr(str_value, 1,1)), substr(str_value, 2));
END;
$$
DELIMITER ;




/*
Write a procedure in MySQL to split a column into rows using a delimiter.
CREATE   TABLE   sometbl   (   ID   INT,   NAME   VARCHAR(50)   );   
INSERT   INTO   sometbl   VALUES      (1,   'Smith'),      (2,   'Julio|Jones|Falcons'),(3,   
'White|Snow'),      (4,   'Paint|It|Red'),      (5,   'Green|Lantern'),      (6,   'Brown|bag');
For   (3),   example   rows   would   look   like   >>   “3,   white”,   “3,   Snow”   …
*/
