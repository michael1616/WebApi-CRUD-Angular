USE [master]
GO
/****** Object:  Database [CRUDNET7]    Script Date: 28/11/2024 4:05:54 p. m. ******/
CREATE DATABASE [CRUDNET7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUDNET7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUDNET7.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUDNET7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUDNET7_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CRUDNET7] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUDNET7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUDNET7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUDNET7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUDNET7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUDNET7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUDNET7] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUDNET7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUDNET7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUDNET7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUDNET7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUDNET7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUDNET7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUDNET7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUDNET7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUDNET7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUDNET7] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CRUDNET7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUDNET7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUDNET7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUDNET7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUDNET7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUDNET7] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CRUDNET7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUDNET7] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUDNET7] SET  MULTI_USER 
GO
ALTER DATABASE [CRUDNET7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUDNET7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUDNET7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUDNET7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUDNET7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUDNET7] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRUDNET7', N'ON'
GO
ALTER DATABASE [CRUDNET7] SET QUERY_STORE = ON
GO
ALTER DATABASE [CRUDNET7] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CRUDNET7]
GO
/****** Object:  User [landcruiser]    Script Date: 28/11/2024 4:05:55 p. m. ******/
CREATE USER [landcruiser] FOR LOGIN [landcruiser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [landcruiser]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [landcruiser]
GO
/****** Object:  UserDefinedTableType [dbo].[ValueKeyFilterType]    Script Date: 28/11/2024 4:05:55 p. m. ******/
CREATE TYPE [dbo].[ValueKeyFilterType] AS TABLE(
	[keyTable] [nvarchar](200) NULL,
	[valueTable] [nvarchar](200) NULL
)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/11/2024 4:05:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[CellPhone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Capital] [nvarchar](200) NOT NULL,
	[State] [bit] NOT NULL,
 CONSTRAINT [PK_Country_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewTable]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewTable](
	[keyTable] [nvarchar](200) NULL,
	[valueTable] [nvarchar](200) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230204000637_CreacionBD', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230204001805_ModificacionColumnaDate', N'7.0.2')
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Phone], [CellPhone], [Email], [CreateDate]) VALUES (1, N'Michael', N'2085666', N'3014567804', N'michael1@gmail.com', CAST(N'2023-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Contacts] ([Id], [Name], [Phone], [CellPhone], [Email], [CreateDate]) VALUES (4, N'Pablo Carmona', N'4567650', N'315678900', N'pabloMontoya0@gmail.com', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Contacts] ([Id], [Name], [Phone], [CellPhone], [Email], [CreateDate]) VALUES (5, N'Benedicto XVl', N'3333331', N'4566678880', N'bene230@hotmail.com', CAST(N'2023-02-05T17:00:24.5260103' AS DateTime2))
INSERT [dbo].[Contacts] ([Id], [Name], [Phone], [CellPhone], [Email], [CreateDate]) VALUES (6, N'San Pablo', N'123123123', N'324234234234', N'san@gmail.com', CAST(N'2024-06-06T15:42:02.7069297' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (1, N'Colombia', N'Bogota', 1)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (2, N'Brasil', N'Brasilia ', 1)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (3, N'Paraguay', N'Asunción ', 0)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (4, N'Perú', N'Lima ', 0)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (5, N'Nigeria', N'Abuya ', 1)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (6, N'Francia', N'París', 1)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (7, N'Japón', N'Tokio', 0)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (8, N'Israel', N'Jerusalén', 1)
INSERT [dbo].[Country] ([Id], [Name], [Capital], [State]) VALUES (9, N'Bolivia', N'Cielo', 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
/****** Object:  StoredProcedure [dbo].[paGetCountries]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paGetCountries]
 @pageNumber INT,
 @pageSize INT,
 @GeneralFilter NVARCHAR(MAX) NULL,
 @Filters ValueKeyFilterType READONLY,
 @TotalRecords INT OUTPUT,
 @orderBy NVARCHAR(100),
 @orderDir NVARCHAR(4)
AS

SET NOCOUNT ON

DECLARE @sql NVARCHAR(MAX);
DECLARE @SQLFirts NVARCHAR(MAX);

IF OBJECT_ID(N'tempdb..#tempFilter') IS NOT NULL
BEGIN
DROP TABLE #tempfILTER
END

CREATE TABLE #tempFilter(keyTable NVARCHAR(200), valueTable NVARCHAR(200));

CREATE TABLE #tempTable(Id INT, Name NVARCHAR(200), Capital NVARCHAR(200), State BIT, rnd INT);

INSERT INTO #tempFilter
SELECT * FROM @Filters;

DECLARE @Name NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'Name');
DECLARE @Capital NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'Capital');
DECLARE @State NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'State');

IF @orderDir = 'ASC' OR @orderDir = 'DESC'
   BEGIN

   SET @SQLFirts = 'INSERT INTO #tempTable (Id, Name, Capital, State, rnd)
    SELECT Id, Name, Capital, State,ROW_NUMBER() OVER(ORDER BY '
           + QUOTENAME(@orderBy) + N' ' + @orderDir + N') AS rn
    FROM Country WHERE (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)';

EXEC sys.sp_executesql @SQLFirts, N'@GeneralFilter NVARCHAR(MAX), @Name NVARCHAR(MAX), @Capital NVARCHAR(MAX), @State NVARCHAR(MAX)',
                    @GeneralFilter = @GeneralFilter, @Name = @Name, @Capital = @Capital, @State = @State;

SET @TotalRecords = (SELECT MAX(rnd) FROM #tempTable);

SET @sql = N'SELECT Id, Name, Capital, State, rn AS IdRow
FROM (
    SELECT Id, Name, Capital, State,ROW_NUMBER() OVER(ORDER BY '
           + QUOTENAME(@orderBy) + N' ' + @orderDir + N') AS rn
    FROM Country WHERE (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)
    ) t
WHERE rn > (@pageNumber-1) * @pageSize
        AND rn <= @pageNumber * @pageSize AND (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)
ORDER BY ' + QUOTENAME(@orderBy) + N' ' + @orderDir;

EXEC sys.sp_executesql @sql, N'@pageNumber int, @pageSize int, @GeneralFilter NVARCHAR(MAX), @Name NVARCHAR(MAX), @Capital NVARCHAR(MAX), @State NVARCHAR(MAX)',
                   @pageNumber = @pageNumber, @pageSize = @pageSize, @GeneralFilter = @GeneralFilter, @Name = @Name, @Capital = @Capital, @State = @State;


   END


				 
GO
/****** Object:  StoredProcedure [dbo].[spPaginationCountry]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
	-- Módulo:							Actualizacion de datos
	-- Resultado:						1. Lista con todos los registros de la tabla [ActualizacionDatos]
	-- Fecha programación:				09/02/2024
	-- Fecha actualización:				09/02/2024
	-- Autor:							Csar hoyos.
	-- =============================================================================================================================================== -- 

	-- Parametros Entrada:
	-- =============================================================================================================================================== -- 
	-- Parametro:	@pQueryBuild		= Cadena de texto con la condicion Dinamica (Debe empezar con AND + Condición)
	-- Parametro:	@pPageIndex			= Indice(Pagina) del Paginador
	-- Parametro:	@pPageSize			= Tamaño de la pagina
	-- Parametro:	@pColumnName		= Nombre de la Columna por la cual se ordenara
	-- Parametro:	@pColumnOrder		= Direccion por la cual se ordenara la columna (asc ó desc)
	-- Parametro:	@pFilter			= Condicion con la cual se filtrara (Esta debe empezar con "AND" + la condicion (Id is not null)).
	-- =============================================================================================================================================== -- 
		
	-- Parametros Dinamicos: 
	-- =============================================================================================================================================== -- 
	-- Parametro:	@SQLQuery			= Cadena de Texto en la cual armaremos toda la consulta a ejecutarse.
	-- Parametro:	@ParamDefinition	= Cadena de texto donde declararemos los parametros que usaremos internamente en el @SQLQuery.
	-- =============================================================================================================================================== -- 
	
	-- Datos Salida:
	-- =============================================================================================================================================== -- 
	-- Parametro:	@pPageCount			= Entero que expresa cuantas paginas tiene la busqueda.
	-- Parametro:	@pTotalCount		= Entero que expresa el total de los registros de la busqueda.
	-- =============================================================================================================================================== -- 

-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
CREATE PROCEDURE [dbo].[spPaginationCountry]
	@pQueryBuild	NVARCHAR(MAX) = NULL,
	@pPageIndex		INT,
	@pPageSize		INT,
	@pColumnName	NVARCHAR(250),
	@pColumnOrder	NVARCHAR(250),
	@pFilter		NVARCHAR(MAX),
	@pPageCount		INT OUT,
	@pTotalCount	INT	OUT	

AS
-- =================================================================================================================================================== -- 
	-- =============================================================================================================================================== -- 
    -- Configuraciones para generar el Result con EntityFramework
	-- =============================================================================================================================================== -- 
		SET NOCOUNT ON
		SET FMTONLY OFF;
		SET XACT_ABORT ON
	-- =============================================================================================================================================== -- 
	-- Parametros Dinamicos:
	-- =============================================================================================================================================== -- 
		DECLARE		@SQLQuery			AS NVARCHAR(MAX);
		DECLARE		@ParamDefinition	AS NVARCHAR(2000);
	-- =============================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
BEGIN
-- =================================================================================================================================================== -- 
	
	-- =============================================================================================================================================== -- 
	-- Acción 1: Creamos temporal para almacenar el total de registros que cumplen con el criterio de consulta.
	-- =============================================================================================================================================== -- 
		
		-- Validamos exisencia de temporal
		IF	object_id('tempdb..#temp') IS NOT NULL
			BEGIN 
				DROP TABLE #temp
			END

		-- Creamos temporal
		CREATE TABLE #temp([Total] [int] NULL)

		-- Cremos string query para consultar el total de registros.
		SET @SQLQuery ='Insert #temp (Total) SELECT COUNT(1) FROM Country AS C2 WHERE 1 = 1 '+ @pQueryBuild + @pFilter +' '

	-- =============================================================================================================================================== -- 
	-- Acción 2: Se crea una tabla temporal donde se guardaran los registros.
	-- =============================================================================================================================================== -- 
			
		-- Validamos exisencia de temporal
		IF	object_id('tempdb..#tempTable') IS NOT NULL
			BEGIN 
				DROP TABLE #tempTable
			END

		-- Creamos temporal
		CREATE TABLE #tempTable([RowID] INT NULL, [Id] INT NULL, [Name] NVARCHAR(200) NULL, [Capital] NVARCHAR(200) NULL, [State] BIT NULL);
			

	-- =============================================================================================================================================== -- 
	-- Acción 3: Creamos el Query Dinamico.
	-- =============================================================================================================================================== -- 

		SET @SQLQuery +='INSERT INTO #tempTable ([RowID], [Id], [Name], [Capital], [State])
						SELECT	[RowID], [Id], [Name], [Capital], [State]
						FROM (	SELECT ROW_NUMBER()Over(ORDER BY C2.['+ @pColumnName +'] ' + @pColumnOrder +') As RowID, 
									   C2.[Id],C2.[Name],C2.[Capital],C2.[State]
								FROM (	SELECT	CO.Id, CO.Name, CO.Capital, CO.State
										FROM Country CO
									 ) AS C2
								WHERE 1 = 1 '+ @pQueryBuild + @pFilter +' 
							) AS C1
						WHERE RowID 
						BETWEEN ('+CAST(@pPageSize As nvarchar(10))+' * ('+CAST(@pPageIndex As nvarchar(10))+' -1) + 1) 
						AND 
						('+CAST(@pPageIndex As nvarchar(10))+' * '+CAST(@pPageSize As nvarchar(10))+')
						ORDER BY ';

	-- =============================================================================================================================================== -- 
	-- Acción 4: Al Query Dinamico le agregamos el Order By.
	-- =============================================================================================================================================== -- 

		SET @SQLQuery = @SQLQuery + @pColumnName + ' ' +@pColumnOrder;

	-- =============================================================================================================================================== -- 
	-- Acción 5: Declaramos los paremetros que usaremos en el Query Dinamico.
	-- =============================================================================================================================================== -- 

		--SET @ParamDefinition =  '';

	-- =============================================================================================================================================== -- 
	-- Acción 6: Ejecutamos el SQL con el Query Dinamico.
	-- =============================================================================================================================================== -- 

		EXEC sp_Executesql     
					@SQLQuery
					--@ParamDefinition

	-- =============================================================================================================================================== -- 
	-- Acción 7: obtener la cantidad de registros en la tabla.
	-- =============================================================================================================================================== -- 
		
		SET @pTotalCount = ISNULL((Select Total From #temp), 0) ;

	-- =============================================================================================================================================== -- 
	-- Acción 8: Se obtiene la totalidad de paginas.
	-- =============================================================================================================================================== -- 

		SET @pPageCount =	CASE 
								WHEN (@pTotalCount % @pPageSize = 0) 
								THEN @pTotalCount / @pPageSize 
								ELSE @pTotalCount / @pPageSize + 1 
							END 

	-- =============================================================================================================================================== -- 
	-- Acción 9: Se obtiene la consulta de la pagina.
	-- =============================================================================================================================================== -- 

		SELECT	[RowID],[Id], [Name], [Capital], [State]
		FROM  #tempTable AS Tmp

	-- =============================================================================================================================================== -- 
END
-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
GO
/****** Object:  StoredProcedure [dbo].[spPaginationCountryV2]    Script Date: 28/11/2024 4:05:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
	-- Módulo:							Actualizacion de datos
	-- Resultado:						1. Lista con todos los registros de la tabla [ActualizacionDatos]
	-- Fecha programación:				09/02/2024
	-- Fecha actualización:				09/02/2024
	-- Autor:							Csar hoyos.
	-- =============================================================================================================================================== -- 

	-- Parametros Entrada:
	-- =============================================================================================================================================== -- 
	-- Parametro:	@pQueryBuild		= Cadena de texto con la condicion Dinamica (Debe empezar con AND + Condición)
	-- Parametro:	@pPageIndex			= Indice(Pagina) del Paginador
	-- Parametro:	@pPageSize			= Tamaño de la pagina
	-- Parametro:	@pColumnName		= Nombre de la Columna por la cual se ordenara
	-- Parametro:	@pColumnOrder		= Direccion por la cual se ordenara la columna (asc ó desc)
	-- Parametro:	@pFilter			= Condicion con la cual se filtrara (Esta debe empezar con "AND" + la condicion (Id is not null)).
	-- =============================================================================================================================================== -- 
		
	-- Parametros Dinamicos: 
	-- =============================================================================================================================================== -- 
	-- Parametro:	@SQLQuery			= Cadena de Texto en la cual armaremos toda la consulta a ejecutarse.
	-- Parametro:	@ParamDefinition	= Cadena de texto donde declararemos los parametros que usaremos internamente en el @SQLQuery.
	-- =============================================================================================================================================== -- 
	
	-- Datos Salida:
	-- =============================================================================================================================================== -- 
	-- Parametro:	@pPageCount			= Entero que expresa cuantas paginas tiene la busqueda.
	-- Parametro:	@pTotalCount		= Entero que expresa el total de los registros de la busqueda.
	-- =============================================================================================================================================== -- 

-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
CREATE PROCEDURE [dbo].[spPaginationCountryV2]
	@pPageIndex		INT,
	@pPageSize		INT,
	@pColumnName	NVARCHAR(250),
	@pColumnOrder	NVARCHAR(250),
	@pTotalCount	INT	OUT,
	@GeneralFilter NVARCHAR(MAX) NULL,
	@Filters ValueKeyFilterType READONLY

AS
-- =================================================================================================================================================== -- 
	-- =============================================================================================================================================== -- 
    -- Configuraciones para generar el Result con EntityFramework
	-- =============================================================================================================================================== -- 
		SET NOCOUNT ON
		SET FMTONLY OFF;
		SET XACT_ABORT ON
	-- =============================================================================================================================================== -- 
	-- Parametros Dinamicos:
	-- =============================================================================================================================================== -- 
		DECLARE		@SQLQuery1			AS NVARCHAR(MAX);
		DECLARE		@SQLQuery2			AS NVARCHAR(MAX);
		DECLARE     @SQLQuery           AS NVARCHAR(MAX);
		DECLARE		@ParamDefinition	AS NVARCHAR(2000);
	-- =============================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
BEGIN
-- =================================================================================================================================================== -- 
	
	-- =============================================================================================================================================== -- 
	-- Acción 1: Creamos temporal para almacenar el total de registros que cumplen con el criterio de consulta.
	-- =============================================================================================================================================== -- 
		
		-- Validamos exisencia de temporal
		IF	object_id('tempdb..#temp') IS NOT NULL
			BEGIN 
				DROP TABLE #temp
			END

		-- Creamos temporal
		CREATE TABLE #temp([Total] [int] NULL)

		CREATE TABLE #tempFilter(keyTable NVARCHAR(200), valueTable NVARCHAR(200));

		INSERT INTO #tempFilter
		SELECT * FROM @Filters;

		DECLARE @Name NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'Name');
		DECLARE @Capital NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'Capital');
		DECLARE @State NVARCHAR(MAX) = (SELECT TOP 1 ValueTable FROM #tempFilter WHERE keyTable = 'State');

		-- Cremos string query para consultar el total de registros.
		SET @SQLQuery1 ='Insert #temp (Total) SELECT COUNT(1) FROM Country AS C2 WHERE (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL) '

	

	-- =============================================================================================================================================== -- 
	-- Acción 2: Se crea una tabla temporal donde se guardaran los registros.
	-- =============================================================================================================================================== -- 
			
		-- Validamos exisencia de temporal
		IF	object_id('tempdb..#tempTable') IS NOT NULL
			BEGIN 
				DROP TABLE #tempTable
			END

		-- Creamos temporal
		CREATE TABLE #tempTable([RowID] BIGINT NULL, [Id] INT NULL, [Name] NVARCHAR(200) NULL, [Capital] NVARCHAR(200) NULL, [State] BIT NULL);
			

	-- =============================================================================================================================================== -- 
	-- Acción 3: Creamos el Query Dinamico.
	-- =============================================================================================================================================== -- 

		SET @SQLQuery1 +='INSERT INTO #tempTable ([RowID], [Id], [Name], [Capital], [State])
						SELECT	[RowID], [Id], [Name], [Capital], [State]
						FROM (SELECT ROW_NUMBER()Over(ORDER BY C2.['+ @pColumnName +'] ' + @pColumnOrder +') As RowID, 
									   C2.[Id],C2.[Name],C2.[Capital],C2.[State] ';
								
								
	SET @SQLQuery2 = 'FROM (SELECT CO.Id, CO.Name, CO.Capital, CO.State
										FROM Country CO WHERE (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)) AS C2
								WHERE (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)) AS C1
						WHERE RowID 
						BETWEEN ('+CAST(@pPageSize As nvarchar(10))+' * ('+CAST(@pPageIndex As nvarchar(10))+' -1) + 1) 
						AND 
						('+CAST(@pPageIndex As nvarchar(10))+' * '+CAST(@pPageSize As nvarchar(10))+') AND (@GeneralFilter IS NOT NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL AND 
													   Name LIKE ''%''+@GeneralFilter+''%'' OR
													   Capital LIKE ''%''+@GeneralFilter+''%'' OR
													   CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@GeneralFilter+''%''

					   OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NOT NULL AND Name LIKE ''%''+@Name+''%'' AND
					                                                             Capital LIKE ''%''+@Capital+''%'' AND
																				 CASE WHEN State = 1 THEN ''Active'' ELSE ''Disabled'' END LIKE ''%''+@State+''%''
                       OR @GeneralFilter IS NULL AND (SELECT TOP 1 keyTable FROM #tempFilter rt) IS NULL)
						ORDER BY ';
	
	-- =============================================================================================================================================== -- 
	-- Acción 4: Al Query Dinamico le agregamos el Order By.
	-- =============================================================================================================================================== -- 
	    SET @SQLQuery = @SQLQuery1 + @SQLQuery2;

		SET @SQLQuery = @SQLQuery + @pColumnName + ' ' +@pColumnOrder;

	-- =============================================================================================================================================== -- 
	-- Acción 5: Declaramos los paremetros que usaremos en el Query Dinamico.
	-- =============================================================================================================================================== -- 

		SET @ParamDefinition =  '@GeneralFilter NVARCHAR(MAX), @Name NVARCHAR(MAX), @Capital NVARCHAR(MAX), @State NVARCHAR(MAX)';


	-- =============================================================================================================================================== -- 
	-- Acción 6: Ejecutamos el SQL con el Query Dinamico.
	-- =============================================================================================================================================== -- 

		EXEC sp_Executesql     
					@SQLQuery,
					@ParamDefinition,
                    @GeneralFilter,
					@Name,
					@Capital,
					@State;

			
	-- =============================================================================================================================================== -- 
	-- Acción 7: obtener la cantidad de registros en la tabla.
	-- =============================================================================================================================================== -- 
		
		SET @pTotalCount = ISNULL((Select Total From #temp), 0) ;

	-- =============================================================================================================================================== -- 
	-- Acción 8: Se obtiene la totalidad de paginas.
	-- =============================================================================================================================================== -- 

		--SET @pPageCount =	CASE 
		--						WHEN (@pTotalCount % @pPageSize = 0) 
		--						THEN @pTotalCount / @pPageSize 
		--						ELSE @pTotalCount / @pPageSize + 1 
		--					END 

	-- =============================================================================================================================================== -- 
	-- Acción 9: Se obtiene la consulta de la pagina.
	-- =============================================================================================================================================== -- 

		SELECT	[RowID],[Id], [Name], [Capital], [State]
		FROM  #tempTable AS Tmp

	-- =============================================================================================================================================== -- 
END
-- =================================================================================================================================================== -- 
-- =================================================================================================================================================== -- 
GO
USE [master]
GO
ALTER DATABASE [CRUDNET7] SET  READ_WRITE 
GO
