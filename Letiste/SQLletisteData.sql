USE [master]
GO
/****** Object:  Database [letiste]    Script Date: 28.11.2024 11:25:25 ******/
CREATE DATABASE [letiste]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'letiste', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\letiste.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'letiste_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\letiste_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [letiste] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [letiste].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [letiste] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [letiste] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [letiste] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [letiste] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [letiste] SET ARITHABORT OFF 
GO
ALTER DATABASE [letiste] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [letiste] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [letiste] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [letiste] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [letiste] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [letiste] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [letiste] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [letiste] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [letiste] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [letiste] SET  ENABLE_BROKER 
GO
ALTER DATABASE [letiste] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [letiste] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [letiste] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [letiste] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [letiste] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [letiste] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [letiste] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [letiste] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [letiste] SET  MULTI_USER 
GO
ALTER DATABASE [letiste] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [letiste] SET DB_CHAINING OFF 
GO
ALTER DATABASE [letiste] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [letiste] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [letiste] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [letiste] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [letiste] SET QUERY_STORE = OFF
GO
USE [letiste]
GO
/****** Object:  Table [dbo].[let]    Script Date: 28.11.2024 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[let](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datum] [date] NULL,
	[porucha] [bit] NULL,
	[delka_letu] [int] NULL,
	[pilot_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pilot]    Script Date: 28.11.2024 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pilot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [varchar](20) NOT NULL,
	[prijmeni] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[let] ON 
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (2, CAST(N'2023-06-02' AS Date), 0, 1, 1)
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (4, CAST(N'2023-08-04' AS Date), 0, 2, 2)
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (5, CAST(N'2023-09-20' AS Date), 1, 1, 3)
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (6, CAST(N'2023-12-12' AS Date), 0, 4, 2)
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (7, CAST(N'2024-11-05' AS Date), 1, 2, 3)
GO
INSERT [dbo].[let] ([id], [datum], [porucha], [delka_letu], [pilot_id]) VALUES (8, CAST(N'2024-11-07' AS Date), 0, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[let] OFF
GO
SET IDENTITY_INSERT [dbo].[pilot] ON 
GO
INSERT [dbo].[pilot] ([id], [jmeno], [prijmeni]) VALUES (1, N'Havel', N'Palik')
GO
INSERT [dbo].[pilot] ([id], [jmeno], [prijmeni]) VALUES (2, N'Emil', N'Zatopil')
GO
INSERT [dbo].[pilot] ([id], [jmeno], [prijmeni]) VALUES (3, N'Otto', N'Usjef')
GO
SET IDENTITY_INSERT [dbo].[pilot] OFF
GO
ALTER TABLE [dbo].[let]  WITH CHECK ADD FOREIGN KEY([pilot_id])
REFERENCES [dbo].[pilot] ([id])
GO
ALTER TABLE [dbo].[let]  WITH CHECK ADD CHECK  (([delka_letu]>(0)))
GO
USE [master]
GO
ALTER DATABASE [letiste] SET  READ_WRITE 
GO
