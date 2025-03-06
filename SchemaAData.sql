USE [master]
GO
/****** Object:  Database [lepsiFirma]    Script Date: 06.03.2025 11:32:43 ******/
CREATE DATABASE [lepsiFirma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lepsiFirma', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lepsiFirma.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lepsiFirma_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\lepsiFirma_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [lepsiFirma] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lepsiFirma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lepsiFirma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lepsiFirma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lepsiFirma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lepsiFirma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lepsiFirma] SET ARITHABORT OFF 
GO
ALTER DATABASE [lepsiFirma] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [lepsiFirma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lepsiFirma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lepsiFirma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lepsiFirma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lepsiFirma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lepsiFirma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lepsiFirma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lepsiFirma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lepsiFirma] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lepsiFirma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lepsiFirma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lepsiFirma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lepsiFirma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lepsiFirma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lepsiFirma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lepsiFirma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lepsiFirma] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lepsiFirma] SET  MULTI_USER 
GO
ALTER DATABASE [lepsiFirma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lepsiFirma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lepsiFirma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lepsiFirma] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lepsiFirma] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lepsiFirma] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [lepsiFirma] SET QUERY_STORE = OFF
GO
USE [lepsiFirma]
GO
/****** Object:  UserDefinedFunction [dbo].[spocti_dan]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[spocti_dan](
	@cena_ks decimal,
	@dan_procenta decimal
)
returns decimal as
begin
	declare @dan decimal;
	set @dan = (@cena_ks/100)*@dan_procenta;

	return @dan;
end;
GO
/****** Object:  UserDefinedFunction [dbo].[spocti_danFloat]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[spocti_danFloat](
	@cena_ks decimal,
	@dan_procenta decimal
)
returns float as
begin
	declare @dan float;
	set @dan = (@cena_ks/100)*@dan_procenta;

	return @dan;
end;
GO
/****** Object:  Table [dbo].[dodavatel]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dodavatel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dodavka]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dodavka](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dodavatel_id] [int] NULL,
	[zbozi_id] [int] NULL,
	[pocet] [int] NULL,
	[cena_celk] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zbozi]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zbozi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazev] [varchar](30) NULL,
	[cena_ks] [decimal](18, 0) NULL,
	[dan_procenta] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[dodavatel] ON 
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (1, N'adam')
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (2, N'bohumil')
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (3, N'cyril')
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (4, N'denis')
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (5, N'evzen')
GO
INSERT [dbo].[dodavatel] ([id], [nazev]) VALUES (6, N'frantisek')
GO
SET IDENTITY_INSERT [dbo].[dodavatel] OFF
GO
SET IDENTITY_INSERT [dbo].[dodavka] ON 
GO
INSERT [dbo].[dodavka] ([id], [dodavatel_id], [zbozi_id], [pocet], [cena_celk]) VALUES (1, 1, 1, 40, NULL)
GO
INSERT [dbo].[dodavka] ([id], [dodavatel_id], [zbozi_id], [pocet], [cena_celk]) VALUES (2, 2, 2, 77, NULL)
GO
INSERT [dbo].[dodavka] ([id], [dodavatel_id], [zbozi_id], [pocet], [cena_celk]) VALUES (3, 1, 3, 50, NULL)
GO
INSERT [dbo].[dodavka] ([id], [dodavatel_id], [zbozi_id], [pocet], [cena_celk]) VALUES (4, 2, 1, 40, CAST(920 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[dodavka] OFF
GO
SET IDENTITY_INSERT [dbo].[zbozi] ON 
GO
INSERT [dbo].[zbozi] ([id], [nazev], [cena_ks], [dan_procenta]) VALUES (1, N'jablko', CAST(23 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)))
GO
INSERT [dbo].[zbozi] ([id], [nazev], [cena_ks], [dan_procenta]) VALUES (2, N'pomerance', CAST(37 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)))
GO
INSERT [dbo].[zbozi] ([id], [nazev], [cena_ks], [dan_procenta]) VALUES (3, N'hrusky', CAST(25 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)))
GO
INSERT [dbo].[zbozi] ([id], [nazev], [cena_ks], [dan_procenta]) VALUES (4, N'meloun', CAST(54 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[zbozi] OFF
GO
ALTER TABLE [dbo].[dodavka]  WITH CHECK ADD FOREIGN KEY([dodavatel_id])
REFERENCES [dbo].[dodavatel] ([id])
GO
ALTER TABLE [dbo].[dodavka]  WITH CHECK ADD FOREIGN KEY([zbozi_id])
REFERENCES [dbo].[zbozi] ([id])
GO
ALTER TABLE [dbo].[zbozi]  WITH CHECK ADD CHECK  (([cena_ks]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[pridej_dodavku]    Script Date: 06.03.2025 11:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pridej_dodavku] @zbozi_nazev varchar(30), @pocet int, @dodavatel_nazev varchar(50)
as
begin
	declare @id_zbozi int;
	set @id_zbozi = (select zbozi.id from zbozi where zbozi.nazev = @zbozi_nazev);
	declare @id_dodavatel int;
	set @id_dodavatel = (select dodavatel.id from dodavatel where dodavatel.nazev = @dodavatel_nazev);
	declare @celkCena decimal;
	declare @cena_ks int;
	set @cena_ks = (select zbozi.cena_ks from zbozi where zbozi.nazev = @zbozi_nazev);
	set @celkCena = @pocet*@cena_ks;
	insert into dodavka(zbozi_id, dodavatel_id, pocet, cena_celk) values(@id_zbozi,@id_dodavatel, @pocet, @celkCena);
end;
GO
USE [master]
GO
ALTER DATABASE [lepsiFirma] SET  READ_WRITE 
GO
