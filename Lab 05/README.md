Lab 5. Indexes - assigned: week 11; due: week 12<br>
Work on 3 tables of the form Ta(aid, a2, …), Tb(bid, b2, …), Tc(cid, aid, bid, …), where:<br>
	- aid, bid, cid, a2, b2 are integers;<br>
	- the primary keys are underlined;<br>
	- a2 is UNIQUE in Ta;<br>
	- aid and bid are foreign keys in Tc, referencing the corresponding primary keys in Ta and Tb, respectively.<br><br>

a. Write queries on Ta such that their execution plans contain the following operators:<br>
	- clustered index scan;<br>
	- clustered index seek;<br>
	- nonclustered index scan;<br>
	- nonclustered index seek;<br>
	- key lookup.<br><br>

b. Write a query on table Tb with a WHERE clause of the form WHERE b2 = value and analyze its execution plan. <br>
Create a nonclustered index that can speed up the query. <br>
Recheck the query’s execution plan (operators, SELECT’s estimated subtree cost).<br><br>

c. Create a view that joins at least 2 tables. <br>
Check whether existing indexes are helpful; if not, reassess existing indexes / examine the cardinality of the tables.<br>
