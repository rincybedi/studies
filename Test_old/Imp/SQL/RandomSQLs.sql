SELECT current_timestamp;
SELECT GETDATE();
SELECT GETUTCDATE();
SELECT DATEPART(MONTH, '2017/08/25 08:36') AS DatePartInt;
SELECT DATEname(month, '2017/08/25 08:36') AS DatePartInt;

select ascii(9)

--SELECT 'One' + ',' + 'Two' + ',' + 'Three' + ',' + 12345
--GO
SELECT CONCAT('One', ',', 'Two', ',', 'Three', ',', 12345)

--null handling
SELECT 'One' + ',' + 'Two' + ',' + 'Three' + ',' + NULL + 12345
GO
SELECT CONCAT('One', ',', 'Two', ',', 'Three', ',', NULL, 12345)
GO

SELECT STUFF('One match', 5, 0, 'day ')
GO
SELECT STUFF('One match', 5, 4, 'day ')
GO

select CONVERT(int, CONVERT(CHAR(8),GETDATE(),112))
SELECT FLOOR((CAST (GetDate() AS INTEGER) - CAST('19951212' AS INTEGER)) / 365.25) AS Age

SELECT 
    a, 
    b, 
    COUNT(*) occurrences
FROM t1
GROUP BY
    a, 
    b
HAVING 
    COUNT(*) > 1;

	raiserror('oops',1,1);