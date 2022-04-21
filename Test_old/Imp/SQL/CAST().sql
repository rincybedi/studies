DECLARE @Z char(30)  
SELECT @Z=current_timestamp  
select @Z ,  CAST (@Z as date) as result

DECLARE @A varchar(2)  
DECLARE @B varchar(2)  
DECLARE @C varchar(2)  
set @A=25  
set @B=15  
set @C=33  
Select @A + @B + @C  as Result
Select CAST(@A as int) + CAST(@B as int) +CAST (@C as int) as Result 