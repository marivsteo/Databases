Lab 3. Altering the Database - assigned: week 6; due: week 8<br>
Sometimes, after you design a database, you need to change its structure.<br> 
Unfortunately, the changes aren’t correct every time, so they must be reverted.<br> 
Your task is to create a versioning mechanism that allows you to easily move from one version of the database to another.<br><br>

Write SQL scripts that:<br><br>

a. modify the type of a column;<br>
b. add / remove a column;<br>
c. add / remove a DEFAULT constraint;<br>
d. add / remove a primary key;<br>
e. add / remove a candidate key;<br>
f. add / remove a foreign key;<br>
g. create / remove a table.<br><br>

For each of the scripts above, write another one that reverts the operation. <br>
Create a new table that holds the current version of the database schema. <br>
For simplicity, the version is assumed to be an integer number.<br>
Place each of the scripts in a stored procedure. <br>
Use a simple, intuitive naming convention.<br>
Write another stored procedure that receives as a parameter a version number and brings the database to that version.<br>
