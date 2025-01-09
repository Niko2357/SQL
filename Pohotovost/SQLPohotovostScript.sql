USE [master]
GO
/****** Object:  Database [pohotovost]    Script Date: 21.11.2024 11:59:35 ******/
CREATE DATABASE [pohotovost]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pohotovost', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pohotovost.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pohotovost_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pohotovost_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pohotovost] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pohotovost].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pohotovost] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pohotovost] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pohotovost] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pohotovost] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pohotovost] SET ARITHABORT OFF 
GO
ALTER DATABASE [pohotovost] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pohotovost] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pohotovost] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pohotovost] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pohotovost] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pohotovost] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pohotovost] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pohotovost] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pohotovost] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pohotovost] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pohotovost] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pohotovost] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pohotovost] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pohotovost] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pohotovost] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pohotovost] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pohotovost] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pohotovost] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pohotovost] SET  MULTI_USER 
GO
ALTER DATABASE [pohotovost] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pohotovost] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pohotovost] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pohotovost] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pohotovost] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pohotovost] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pohotovost] SET QUERY_STORE = OFF
GO
USE [pohotovost]
GO
/****** Object:  Table [dbo].[lekar]    Script Date: 21.11.2024 11:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lekar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [char](20) NOT NULL,
	[prijmeni] [char](20) NOT NULL,
	[licence] [int] NULL,
	[obor_id] [int] NULL,
	[atestace] [nchar](4) NULL,
 CONSTRAINT [PK__lekar__3213E83F6E41FFAB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[obor]    Script Date: 21.11.2024 11:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pacient]    Script Date: 21.11.2024 11:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pacient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [char](20) NOT NULL,
	[prijmeni] [char](20) NOT NULL,
	[dat_nar] [date] NOT NULL,
	[mesto] [char](20) NOT NULL,
	[email] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zakrok]    Script Date: 21.11.2024 11:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakrok](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datum] [date] NOT NULL,
	[diagnoza] [char](20) NOT NULL,
	[delka_min] [int] NULL,
	[pacient_id] [int] NOT NULL,
	[lekar_id] [int] NOT NULL,
 CONSTRAINT [PK__zakrok__3213E83FF50A8DF8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[lekar] ON 
GO
INSERT [dbo].[lekar] ([id], [jmeno], [prijmeni], [licence], [obor_id], [atestace]) VALUES (1, N'Jan                 ', N'Novak               ', 1, 1, N'AII ')
GO
SET IDENTITY_INSERT [dbo].[lekar] OFF
GO
SET IDENTITY_INSERT [dbo].[obor] ON 
GO
INSERT [dbo].[obor] ([id], [nazev]) VALUES (2, N'fyzioterapie        ')
GO
INSERT [dbo].[obor] ([id], [nazev]) VALUES (1, N'neurologie          ')
GO
INSERT [dbo].[obor] ([id], [nazev]) VALUES (5, N'patologie           ')
GO
INSERT [dbo].[obor] ([id], [nazev]) VALUES (4, N'pediatrie           ')
GO
INSERT [dbo].[obor] ([id], [nazev]) VALUES (3, N'urologie            ')
GO
SET IDENTITY_INSERT [dbo].[obor] OFF
GO
SET IDENTITY_INSERT [dbo].[pacient] ON 
GO
INSERT [dbo].[pacient] ([id], [jmeno], [prijmeni], [dat_nar], [mesto], [email]) VALUES (1, N'Rastislav           ', N'Elinaef             ', CAST(N'1983-12-12' AS Date), N'Praha               ', N'ras@mail.cz')
GO
INSERT [dbo].[pacient] ([id], [jmeno], [prijmeni], [dat_nar], [mesto], [email]) VALUES (7, N'Emil                ', N'Novy                ', CAST(N'2000-06-04' AS Date), N'Praha               ', N'emil@mail.cz')
GO
INSERT [dbo].[pacient] ([id], [jmeno], [prijmeni], [dat_nar], [mesto], [email]) VALUES (8, N'Pavel               ', N'Palik               ', CAST(N'2003-09-07' AS Date), N'Brno                ', N'pavel@mail.cz')
GO
INSERT [dbo].[pacient] ([id], [jmeno], [prijmeni], [dat_nar], [mesto], [email]) VALUES (11, N'Tom                 ', N'Redl                ', CAST(N'1989-02-09' AS Date), N'Ostrava             ', N'tom@mail.cz')
GO
INSERT [dbo].[pacient] ([id], [jmeno], [prijmeni], [dat_nar], [mesto], [email]) VALUES (12, N'Ota                 ', N'Bedl                ', CAST(N'2006-06-03' AS Date), N'Olomouc             ', N'ota@mail.cz')
GO
SET IDENTITY_INSERT [dbo].[pacient] OFF
GO
/****** Object:  Index [UQ__lekar__A4E6D7C029B4A2D0]    Script Date: 21.11.2024 11:59:35 ******/
ALTER TABLE [dbo].[lekar] ADD  CONSTRAINT [UQ__lekar__A4E6D7C029B4A2D0] UNIQUE NONCLUSTERED 
(
	[licence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__obor__F075EBB4A6C09DC2]    Script Date: 21.11.2024 11:59:35 ******/
ALTER TABLE [dbo].[obor] ADD UNIQUE NONCLUSTERED 
(
	[nazev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[lekar]  WITH CHECK ADD  CONSTRAINT [FK__lekar__obor_id__3B75D760] FOREIGN KEY([obor_id])
REFERENCES [dbo].[pacient] ([id])
GO
ALTER TABLE [dbo].[lekar] CHECK CONSTRAINT [FK__lekar__obor_id__3B75D760]
GO
ALTER TABLE [dbo].[zakrok]  WITH CHECK ADD  CONSTRAINT [FK__zakrok__lekar_id__440B1D61] FOREIGN KEY([lekar_id])
REFERENCES [dbo].[lekar] ([id])
GO
ALTER TABLE [dbo].[zakrok] CHECK CONSTRAINT [FK__zakrok__lekar_id__440B1D61]
GO
ALTER TABLE [dbo].[zakrok]  WITH CHECK ADD  CONSTRAINT [FK__zakrok__pacient___4316F928] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacient] ([id])
GO
ALTER TABLE [dbo].[zakrok] CHECK CONSTRAINT [FK__zakrok__pacient___4316F928]
GO
ALTER TABLE [dbo].[lekar]  WITH CHECK ADD  CONSTRAINT [CK__lekar__prijmeni__3A81B327] CHECK  ((len([prijmeni])>=(3)))
GO
ALTER TABLE [dbo].[lekar] CHECK CONSTRAINT [CK__lekar__prijmeni__3A81B327]
GO
ALTER TABLE [dbo].[pacient]  WITH CHECK ADD CHECK  (([email] like '%@%.%'))
GO
ALTER TABLE [dbo].[zakrok]  WITH CHECK ADD  CONSTRAINT [CK__zakrok__delka_mi__4222D4EF] CHECK  (([delka_min]>(0)))
GO
ALTER TABLE [dbo].[zakrok] CHECK CONSTRAINT [CK__zakrok__delka_mi__4222D4EF]
GO
USE [master]
GO
ALTER DATABASE [pohotovost] SET  READ_WRITE 
GO
