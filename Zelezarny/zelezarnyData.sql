USE [master]
GO
/****** Object:  Database [zavod]    Script Date: 28.11.2024 12:01:22 ******/
CREATE DATABASE [zavod]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zavod', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zavod.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zavod_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\zavod_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [zavod] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zavod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zavod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zavod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zavod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zavod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zavod] SET ARITHABORT OFF 
GO
ALTER DATABASE [zavod] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [zavod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zavod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zavod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zavod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zavod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zavod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zavod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zavod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zavod] SET  ENABLE_BROKER 
GO
ALTER DATABASE [zavod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zavod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zavod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zavod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zavod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zavod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zavod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zavod] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [zavod] SET  MULTI_USER 
GO
ALTER DATABASE [zavod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zavod] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zavod] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zavod] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zavod] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zavod] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [zavod] SET QUERY_STORE = OFF
GO
USE [zavod]
GO
/****** Object:  Table [dbo].[cinnost]    Script Date: 28.11.2024 12:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cinnost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](20) NULL,
	[pocet_hodin] [int] NULL,
	[datum] [date] NOT NULL,
	[zam_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oddeleni]    Script Date: 28.11.2024 12:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oddeleni](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](20) NOT NULL,
	[zam_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zam]    Script Date: 28.11.2024 12:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jmeno] [varchar](20) NOT NULL,
	[prijmeni] [varchar](20) NOT NULL,
	[mzda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cinnost] ON 
GO
INSERT [dbo].[cinnost] ([id], [nazev], [pocet_hodin], [datum], [zam_id]) VALUES (1, N'kovani', 4, CAST(N'2024-03-01' AS Date), 1)
GO
INSERT [dbo].[cinnost] ([id], [nazev], [pocet_hodin], [datum], [zam_id]) VALUES (2, N'ucetnictvi', 3, CAST(N'2024-03-05' AS Date), 4)
GO
INSERT [dbo].[cinnost] ([id], [nazev], [pocet_hodin], [datum], [zam_id]) VALUES (5, N'vededni', 4, CAST(N'2024-01-03' AS Date), 2)
GO
SET IDENTITY_INSERT [dbo].[cinnost] OFF
GO
SET IDENTITY_INSERT [dbo].[oddeleni] ON 
GO
INSERT [dbo].[oddeleni] ([id], [nazev], [zam_id]) VALUES (1, N'kancelare', 2)
GO
INSERT [dbo].[oddeleni] ([id], [nazev], [zam_id]) VALUES (2, N'dilna', 1)
GO
INSERT [dbo].[oddeleni] ([id], [nazev], [zam_id]) VALUES (3, N'kancelare', 4)
GO
SET IDENTITY_INSERT [dbo].[oddeleni] OFF
GO
SET IDENTITY_INSERT [dbo].[zam] ON 
GO
INSERT [dbo].[zam] ([id], [jmeno], [prijmeni], [mzda]) VALUES (1, N'Emil', N'Zatopek', 200)
GO
INSERT [dbo].[zam] ([id], [jmeno], [prijmeni], [mzda]) VALUES (2, N'Oscar', N'Piastri', 500)
GO
INSERT [dbo].[zam] ([id], [jmeno], [prijmeni], [mzda]) VALUES (4, N'Charles ', N'Leclerc', 300)
GO
SET IDENTITY_INSERT [dbo].[zam] OFF
GO
ALTER TABLE [dbo].[cinnost]  WITH CHECK ADD FOREIGN KEY([zam_id])
REFERENCES [dbo].[zam] ([id])
GO
ALTER TABLE [dbo].[oddeleni]  WITH CHECK ADD FOREIGN KEY([zam_id])
REFERENCES [dbo].[zam] ([id])
GO
ALTER TABLE [dbo].[cinnost]  WITH CHECK ADD CHECK  (([nazev]='vededni' OR [nazev]='cnc stroj' OR [nazev]='ucetnictvi' OR [nazev]='svareni' OR [nazev]='kovani'))
GO
ALTER TABLE [dbo].[cinnost]  WITH CHECK ADD CHECK  (([pocet_hodin]>(0)))
GO
ALTER TABLE [dbo].[oddeleni]  WITH CHECK ADD CHECK  (([nazev]='dilna' OR [nazev]='vedeni' OR [nazev]='kancelare'))
GO
USE [master]
GO
ALTER DATABASE [zavod] SET  READ_WRITE 
GO
