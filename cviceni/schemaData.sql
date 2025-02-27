USE [master]
GO
/****** Object:  Database [restaurace]    Script Date: 27.02.2025 11:57:29 ******/
CREATE DATABASE [restaurace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restaurace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restaurace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restaurace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restaurace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [restaurace] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restaurace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restaurace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restaurace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restaurace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restaurace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restaurace] SET ARITHABORT OFF 
GO
ALTER DATABASE [restaurace] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [restaurace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restaurace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restaurace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restaurace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restaurace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restaurace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restaurace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restaurace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restaurace] SET  ENABLE_BROKER 
GO
ALTER DATABASE [restaurace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restaurace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restaurace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restaurace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restaurace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restaurace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restaurace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restaurace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [restaurace] SET  MULTI_USER 
GO
ALTER DATABASE [restaurace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restaurace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restaurace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restaurace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restaurace] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [restaurace] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [restaurace] SET QUERY_STORE = OFF
GO
USE [restaurace]
GO
/****** Object:  Table [dbo].[profese]    Script Date: 27.02.2025 11:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profese](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[osoba]    Script Date: 27.02.2025 11:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[osoba](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prijmeni] [varchar](20) NOT NULL,
	[jmeno] [varchar](20) NOT NULL,
	[plat] [int] NULL,
	[profese_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[seznam_zam]    Script Date: 27.02.2025 11:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[seznam_zam] as 
select prijmeni, jmeno, prof.nazev 
from osoba inner join profese as prof on profese_id = prof.id
group by prof.nazev, prijmeni, jmeno;
GO
SET IDENTITY_INSERT [dbo].[osoba] ON 
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (1, N'noris', N'lando', 604419200, 1)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (2, N'hulkenberg', N'nico', 27056, 3)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (3, N'bottas', N'valtteri', 54653, 2)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (4, N'alonso', N'fernando', 37056, 2)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (5, N'verstappen', N'max', 24565, 3)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (6, N'hadjar', N'isack', 97566, 1)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (7, N'piastri', N'oscar', 104685, 1)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (8, N'colapinto', N'franco', 47568, 2)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (9, N'stanek', N'roman', 18945, 3)
GO
INSERT [dbo].[osoba] ([id], [prijmeni], [jmeno], [plat], [profese_id]) VALUES (10, N'leclerc', N'charles', 78433, 2)
GO
SET IDENTITY_INSERT [dbo].[osoba] OFF
GO
SET IDENTITY_INSERT [dbo].[profese] ON 
GO
INSERT [dbo].[profese] ([id], [nazev]) VALUES (1, N'Kuchař')
GO
INSERT [dbo].[profese] ([id], [nazev]) VALUES (2, N'Číšník')
GO
INSERT [dbo].[profese] ([id], [nazev]) VALUES (3, N'Skladník')
GO
SET IDENTITY_INSERT [dbo].[profese] OFF
GO
ALTER TABLE [dbo].[osoba]  WITH CHECK ADD FOREIGN KEY([profese_id])
REFERENCES [dbo].[profese] ([id])
GO
/****** Object:  StoredProcedure [dbo].[pridani_osoby]    Script Date: 27.02.2025 11:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pridani_osoby] @prijmeni varchar(20), @jmeno varchar(20), @plat int, @profese_id int
as 
begin 
	insert into osoba(prijmeni, jmeno, plat, profese_id) values(@prijmeni, @jmeno, @plat, @profese_id);
end
GO
/****** Object:  StoredProcedure [dbo].[zmena_platu]    Script Date: 27.02.2025 11:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zmena_platu] @prijmeni varchar(20), @jmeno varchar(20), @procenta_plat decimal
as
begin
	update osoba set plat= plat + plat*@procenta_plat where prijmeni =@prijmeni AND jmeno=@jmeno;
end
GO
USE [master]
GO
ALTER DATABASE [restaurace] SET  READ_WRITE 
GO
