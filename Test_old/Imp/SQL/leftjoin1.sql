exec sp_executesql N'SELECT 
    [Project4].[SubjectId] AS [SubjectId], 
    [Project4].[C4] AS [C1], 
    [Project4].[SubjectId1] AS [SubjectId1], 
    [Project4].[Name] AS [Name], 
    [Project4].[C1] AS [C2], 
    [Project4].[C2] AS [C3], 
    [Project4].[C3] AS [C4]
    FROM ( SELECT 
        [Distinct1].[SubjectId] AS [SubjectId], 
        [Project3].[SubjectId] AS [SubjectId1], 
        [Project3].[Name] AS [Name], 
        [Project3].[C1] AS [C1], 
        [Project3].[C2] AS [C2], 
        [Project3].[C3] AS [C3], 
        CASE WHEN ([Project3].[SubjectId] IS NULL) THEN CAST(NULL AS int) ELSE 1 END AS [C4]
        FROM   (SELECT DISTINCT 
            [Extent1].[SubjectId] AS [SubjectId]
            FROM  [dbo].[Subject] AS [Extent1]
            LEFT OUTER JOIN [dbo].[ClassSubject] AS [Extent2] ON [Extent1].[SubjectId] = [Extent2].[SubjectId] ) AS [Distinct1]
        LEFT OUTER JOIN  (SELECT 
            [Extent3].[SubjectId] AS [SubjectId], 
            [Extent3].[Name] AS [Name], 
            CASE WHEN ( EXISTS (SELECT 
                1 AS [C1]
                FROM [dbo].[ClassSubject] AS [Extent5]
                WHERE ([Extent3].[SubjectId] = [Extent5].[SubjectId]) AND ([Extent5].[SchoolYearId] = @p__linq__0) AND ([Extent5].[ClassId] = @p__linq__1)
            )) THEN cast(1 as bit) ELSE cast(0 as bit) END AS [C1], 
            CASE WHEN ([Extent4].[HavePractical] = 1) THEN [Extent4].[HavePractical] ELSE cast(0 as bit) END AS [C2], 
            CASE WHEN ([Extent4].[HaveTheory] = 1) THEN [Extent4].[HaveTheory] ELSE cast(0 as bit) END AS [C3]
            FROM  [dbo].[Subject] AS [Extent3]
            LEFT OUTER JOIN [dbo].[ClassSubject] AS [Extent4] ON [Extent3].[SubjectId] = [Extent4].[SubjectId] ) AS [Project3] ON [Distinct1].[SubjectId] = [Project3].[SubjectId]
    )  AS [Project4]
    ORDER BY [Project4].[SubjectId] ASC, [Project4].[C4] ASC',N'@p__linq__0 int,@p__linq__1 int',@p__linq__0=1,@p__linq__1=5

	  --var subjects =  (from s in context.Subjects
      --                           join cs in context.ClassSubjects on s.SubjectId equals cs.SubjectId into classSub
      --                           from CS in classSub.DefaultIfEmpty()
      --                           select new ClassSubjectOutputModel
      --                          {
      --                              SubjectName = s.Name,
      --                              SubjectId = s.SubjectId,
      --                              IsSelected = s.ClassSubjects.Any(cs=> cs.SchoolYearId == model.SchoolYearId && cs.ClassId == model.ClassId),
      --                              HavePractical = CS.HavePractical ? CS.HavePractical : false,
      --                              HaveTheory = CS.HaveTheory ? CS.HaveTheory :false ,
      --                          }).Distinct().ToList();