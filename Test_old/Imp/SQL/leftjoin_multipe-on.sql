exec sp_executesql N'SELECT 
    [Distinct1].[C1] AS [C1], 
    [Distinct1].[Name] AS [Name], 
    [Distinct1].[SubjectId] AS [SubjectId], 
    [Distinct1].[C2] AS [C2], 
    [Distinct1].[HavePractical] AS [HavePractical], 
    [Distinct1].[HaveTheory] AS [HaveTheory]
    FROM ( SELECT DISTINCT 
        [Project1].[SubjectId] AS [SubjectId], 
        [Project1].[Name] AS [Name], 
        1 AS [C1], 
        CASE WHEN ( EXISTS (SELECT 
            1 AS [C1]
            FROM [dbo].[ClassSubject] AS [Extent3]
            WHERE ([Project1].[SubjectId] = [Extent3].[SubjectId]) AND ([Extent3].[SchoolYearId] = @p__linq__1) AND ([Extent3].[ClassId] = @p__linq__2)
        )) THEN cast(1 as bit) ELSE cast(0 as bit) END AS [C2], 
        [Project1].[HaveTheory] AS [HaveTheory], 
        [Project1].[HavePractical] AS [HavePractical]
        FROM ( SELECT 
            [Extent1].[SubjectId] AS [SubjectId], 
            [Extent1].[Name] AS [Name], 
            [Extent2].[HaveTheory] AS [HaveTheory], 
            [Extent2].[HavePractical] AS [HavePractical]
            FROM  [dbo].[Subject] AS [Extent1]
            LEFT OUTER JOIN [dbo].[ClassSubject] AS [Extent2] ON ([Extent1].[SubjectId] = [Extent2].[SubjectId]) AND (@p__linq__0 = [Extent2].[ClassId])
        )  AS [Project1]
    )  AS [Distinct1]',N'@p__linq__0 int,@p__linq__1 int,@p__linq__2 int',@p__linq__0=1,@p__linq__1=1,@p__linq__2=1

	--var subjects =  (from s in context.Subjects
 --                                join cs in context.ClassSubjects on
 --                                new { s.SubjectId, classId = model.ClassId } equals new { cs.SubjectId, classId = cs.ClassId } into classSub
 --                                from CS in classSub.DefaultIfEmpty()
 --                                select new ClassSubjectOutputModel
 --                               {
 --                                   SubjectName = s.Name,
 --                                   SubjectId = s.SubjectId,
 --                                   IsSelected = s.ClassSubjects.Any(cs=> cs.SchoolYearId == model.SchoolYearId && cs.ClassId == model.ClassId),
 --                                   HavePractical = CS.HavePractical,
 --                                   HaveTheory = CS.HaveTheory ,
 --                               }).Distinct().ToList();