 
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

DROP FUNCTION IF EXISTS split;
DELIMITER $$
CREATE FUNCTION split(line TEXT, id TEXT) 
RETURNS TEXT
BEGIN
  SET @oldString := line;
  SET @returnString := "";
 
  tokenLoop: LOOP
 
    SET @splitPoint := LOCATE("|", @oldString);
 
    IF @splitPoint = 0 THEN
      SET @returnString := CONCAT(CONCAT(@returnString,CONCAT(id,", ")), SUBSTRING(@oldString, 1, @splitPoint));
      LEAVE tokenLoop;
    END IF;
 

    SET @returnString := CONCAT(CONCAT(@returnString,CONCAT(id,", ")), SUBSTRING(@oldString, 1, @splitPoint));
    SET @oldString := SUBSTRING(@oldString, @splitPoint , LENGTH(@oldString));
  END LOOP tokenLoop;
 
  RETURN @returnString;
END;
$$
DELIMITER ;



/*
I   have   a   table   for   bugs   from   a   bug   tracking   software;   let’s   call   the   table   “bugs”.

The   table   has   four   columns   (id,   open_date,   close_date,   severity).   On   any   given   day   

a   bug   is   open   if   the   open_date   is   on   or   before   that   day   and   close_date   is   after   

that   day.   For   example,   a   bug   is   open   on   “2012-01-01”,   if   it’s   created   on   or   

before   “2012-01-01”   and   closed   on   or   after   “2012-01-02”.   I   want   a   SQL   to   show   

number   of   bugs   open   for   a   range   of   dates.

*/


CREATE TABLE bug (id INT,   open_date DATE,   close_date DATE,   severity INT);
