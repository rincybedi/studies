.--search for a text in all SPs of a db
SELECT name
FROM   sys.procedures
WHERE  Object_definition(object_id) LIKE '%UNION%'

select * from  [dbo].[FN_AlphaCPQ_SplitDelimitedInts]('1,2,3,' , ',') 
----------
exec sp_helpindex AlphaCPQ_Project // find index on table 
exec sp_helptext // these are called system stored procs
create INDEX IX_Student_Name
On Student(Name asc)
-------------
Create table Student(
Id int Primary Key,
Name nvarchar(200)
);
INSERT into Student values('Rinu');
--------------
DECLARE @string CHAR(21)  
SET @string = 'Robin'  
SELECT @string AS 'String', DATALENGTH(@string) AS 'Datalength' , LEN(@string) AS 'Len'  


https://www.c-sharpcorner.com/UploadFile/cda5ba/difference-between-char-nchar-varchar-and-nvarchar-data-ty/
https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqlcommand.executereader?view=netframework-4.8
https://www.mssqltips.com/sqlservertip/1556/differences-between-sql-server-temporary-tables-and-table-variables/
https://stackoverflow.com/questions/807909/how-can-i-compare-time-in-sql-server
https://docs.microsoft.com/en-us/sql/t-sql/data-types/decimal-and-numeric-transact-sql?view=sql-server-2017

For temp table - refer [AlphaCPQ_GetProductById]

Linq TO SQL Left join
https://www.tutlane.com/tutorial/linq/linq-to-sql-left-outer-join

for while loop - [AlphaCPQ_GetProductSearchFiltersForOptionValuesSearchMode]

SOLID Principles
https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa
http://dotnetfreakblog.blogspot.com/

DYNAMIC VS VAR
https://www.c-sharpcorner.com/UploadFile/b1df45/var-vs-dynamic-keywords-in-C-Sharp/?authorFollow=true-b1df45-article&name=jasminder-singh2

CTE
https://www.essentialsql.com/introduction-common-table-expressions-ctes/

Deleting duplicate records using CTEs
https://www.c-sharpcorner.com/UploadFile/d1028b/delete-duplicate-records-from-table-using-cte

Partition By 
https://www.c-sharpcorner.com/blogs/rownumber-function-with-partition-by-clause-in-sql-server1

Merge
https://www.mssqltips.com/sqlservertip/1704/using-merge-in-sql-server-to-insert-update-and-delete-at-the-same-time/
http://www.sqlservertutorial.net/sql-server-basics/sql-server-merge/


https://www.quora.com/What-is-the-difference-between-%E2%80%98any%E2%80%99-%E2%80%98all%E2%80%99-and-%E2%80%98exists%E2%80%99-in-SQL
