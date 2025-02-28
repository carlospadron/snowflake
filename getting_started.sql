ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION = 'ANY_REGION';

CREATE OR REPLACE DATABASE sf_tuts;

SELECT CURRENT_DATABASE(), CURRENT_SCHEMA();

CREATE OR REPLACE TABLE emp_basic (
   first_name STRING ,
   last_name STRING ,
   email STRING ,
   streetaddress STRING ,
   city STRING ,
   start_date DATE
   );

CREATE OR REPLACE WAREHOUSE sf_tuts_wh WITH
   WAREHOUSE_SIZE='X-SMALL'
   AUTO_SUSPEND = 60
   AUTO_RESUME = TRUE
   INITIALLY_SUSPENDED=TRUE;

SELECT CURRENT_WAREHOUSE();

CREATE OR REPLACE STAGE sf_tuts.public.emp_basic;

PUT file:///home/carlos/Documents/snowflake/getting-started/employees0*.csv @emp_basic;

LIST @sf_tuts.public.emp_basic;
--or
LIST @emp_basic;

COPY INTO emp_basic
  FROM @emp_basic
  FILE_FORMAT = (type = csv field_optionally_enclosed_by='"')
  PATTERN = '.*employees0[1-5].csv.gz'
  ON_ERROR = 'skip_file';


SELECT * FROM SF_TUTS.PUBLIC.EMP_BASIC LIMIT 10;

INSERT INTO emp_basic VALUES
   ('Clementine','Adamou','cadamou@sf_tuts.com','10510 Sachs Road','Klenak','2017-9-22') ,
   ('Marlowe','De Anesy','madamouc@sf_tuts.co.uk','36768 Northfield Plaza','Fangshan','2017-1-26');

SELECT email FROM emp_basic WHERE email LIKE '%.uk';

SELECT first_name, last_name, DATEADD('day',90,start_date) FROM emp_basic WHERE start_date <= '2017-01-01';

DROP DATABASE IF EXISTS sf_tuts;

DROP WAREHOUSE IF EXISTS sf_tuts_wh;