exec sp_executesql N'SELECT 
    [Distinct1].[C1] AS [C1], 
    [Distinct1].[Name] AS [Name], 
    [Distinct1].[SubjectId] AS [SubjectId], 
    [Distinct1].[C2] AS [C2], 
    [Distinct1].[C3] AS [C3], 
    [Distinct1].[C4] AS [C4], 
    [Distinct1].[C5] AS [C5], 
    [Distinct1].[C6] AS [C6], 
    [Distinct1].[C7] AS [C7], 
    [Distinct1].[C8] AS [C8], 
    [Distinct1].[C9] AS [C9]
    FROM ( SELECT DISTINCT 
        [Extent1].[SubjectId] AS [SubjectId], 
        [Extent3].[Name] AS [Name], 
        1 AS [C1], 
        CASE WHEN ([Extent2].[ExamDate] IS NULL) THEN SysDateTime() ELSE  CAST( [Extent2].[ExamDate] AS datetime2) END AS [C2], 
        CASE WHEN ([Extent2].[HavePractical] = 1) THEN [Extent2].[HavePractical] ELSE cast(0 as bit) END AS [C3], 
        CASE WHEN ([Extent2].[HaveTheory] = 1) THEN [Extent2].[HaveTheory] ELSE cast(0 as bit) END AS [C4], 
        CASE WHEN ([Extent2].[TheoryPassMarks] IS NULL) THEN cast(0 as decimal(18)) ELSE [Extent2].[TheoryPassMarks] END AS [C5], 
        CASE WHEN ([Extent2].[TheoryFullMarks] IS NULL) THEN cast(0 as decimal(18)) ELSE [Extent2].[TheoryFullMarks] END AS [C6], 
        CASE WHEN ([Extent2].[PracticalPassMarks] IS NULL) THEN cast(0 as decimal(18)) ELSE [Extent2].[PracticalPassMarks] END AS [C7], 
        CASE WHEN ([Extent2].[PracticalFullMarks] IS NULL) THEN cast(0 as decimal(18)) ELSE [Extent2].[PracticalFullMarks] END AS [C8], 
        CASE WHEN ([Extent2].[ExamClassSubjectId] > 0) THEN cast(1 as bit) ELSE cast(0 as bit) END AS [C9]
        FROM   [dbo].[ClassSubject] AS [Extent1]
        LEFT OUTER JOIN [dbo].[ExamClassSubject] AS [Extent2] ON ([Extent1].[ClassSubjectId] = [Extent2].[ClassSubjectId]) AND (@p__linq__0 = [Extent2].[ExamId])
        INNER JOIN [dbo].[Subject] AS [Extent3] ON [Extent1].[SubjectId] = [Extent3].[SubjectId]
        WHERE ([Extent1].[ClassId] = @p__linq__1) AND ([Extent1].[SchoolYearId] = @p__linq__2)
    )  AS [Distinct1]',N'@p__linq__0 int,@p__linq__1 int,@p__linq__2 int',@p__linq__0=1,@p__linq__1=1,@p__linq__2=1



	--var subjects =  (from s in context.Subjects
 --                                join cs in context.ClassSubjects on
 --                                new { s.SubjectId, classId = model.ClassId } equals new { cs.SubjectId, classId = cs.ClassId } into classSub
 --                                from CS in classSub.DefaultIfEmpty()
 --                                select new ClassSubjectOutputModel
 --                               {
 --                                   SubjectName = s.Name,
 --                                   SubjectId = s.SubjectId,
 --                                   HavePractical = CS.HavePractical,
 --                                   HaveTheory = CS.HaveTheory ,
 --                               }).Distinct().ToList();