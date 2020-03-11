Lab 4. Testing the Database - assigned: week 8; due: week 11<br>
After you finished designing your database, the development team is interested in assessing the performance of your design.<br> 
To record different test configurations and results, you create the following relational structure:<br><br>

Tests – holds data about different test configurations;<br>
Tables – holds data about tables that might take part in a test;<br>
TestTables – link table between Tests and Tables (which tables take part in which tests);<br>
Views – holds data about a set of views from the database, used to assess the performance of certain select queries;<br>
TestViews – link table between Tests and Views (which views take part in which tests);<br>
TestRuns – contains data about different test runs; each test run involves:<br><br>

deleting data from tables (all tables associated with the test) – in the order specified by the Position field (table TestTables);<br>
inserting data into tables – reverse deletion order; the number of records to insert is stored in the NoOfRows field (table TestTables);<br>
evaluating views;<br>
TestRunTables – contains performance data for all the tables affected by insert operations;<br>
TestRunViews – contains performance data for every view in every test.<br><br>

Your task is to implement a set of stored procedures for running tests and storing their results. The tests must include at least 3 tables:<br>
	- a table with a single column primary key and no foreign keys;<br>
	- a table with a single column primary key and at least one foreign key;<br>
	- a table with a multicolumn primary key,<br>
and 3 views:<br>
	- a view with a SELECT statement operating on one table;<br>
	- a view with a SELECT statement operating on at least 2 tables;<br>
	- a view with a SELECT statement that has a GROUP BY clause and operates on at least 2 tables.<br>
Obs. The way you implement the stored procedures and / or functions is up to you. <br><br>

Results which allow the system to be extended to new tables / views with minimal or no code at all will be more appreciated.<br> 
The script for creating the above relational structure can be downloaded here: Script_lab4.<br>
