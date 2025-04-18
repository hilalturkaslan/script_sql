USE [master]
GO
/****** Object:  Database [NORTHWND]    Script Date: 03/04/2025 17:33:55 ******/
CREATE DATABASE [NORTHWND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NORTHWND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NORTHWND.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NORTHWND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NORTHWND_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NORTHWND] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NORTHWND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NORTHWND] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NORTHWND] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NORTHWND] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NORTHWND] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NORTHWND] SET ARITHABORT OFF 
GO
ALTER DATABASE [NORTHWND] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NORTHWND] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NORTHWND] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NORTHWND] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NORTHWND] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NORTHWND] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NORTHWND] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NORTHWND] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NORTHWND] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NORTHWND] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NORTHWND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NORTHWND] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NORTHWND] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NORTHWND] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NORTHWND] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NORTHWND] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NORTHWND] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NORTHWND] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NORTHWND] SET  MULTI_USER 
GO
ALTER DATABASE [NORTHWND] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NORTHWND] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NORTHWND] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NORTHWND] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NORTHWND] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NORTHWND] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NORTHWND] SET QUERY_STORE = OFF
GO
USE [NORTHWND]
GO
/****** Object:  Table [dbo].[order_details$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details$](
	[orderid] [float] NULL,
	[productid] [float] NULL,
	[unitprice] [float] NULL,
	[quantity] [float] NULL,
	[discount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders$](
	[orderid] [float] NULL,
	[customerid] [nvarchar](255) NULL,
	[employeeid] [float] NULL,
	[orderdate] [datetime] NULL,
	[requireddate] [datetime] NULL,
	[shippeddate] [datetime] NULL,
	[shipvia] [float] NULL,
	[freight] [float] NULL,
	[shipname] [nvarchar](255) NULL,
	[shipaddress] [nvarchar](255) NULL,
	[shipcity] [nvarchar](255) NULL,
	[shipregion] [nvarchar](255) NULL,
	[shippostalcode] [nvarchar](255) NULL,
	[shipcountry] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[nrt_sales]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[nrt_sales] AS
SELECT 
    od.orderid,
    od.productid,
    od.quantity,
    od.unitprice,
    od.discount,
    o.customerid,
    o.orderdate,
    o.shipcountry
FROM [order_details$] od
INNER JOIN orders$ o ON od.orderid = o.orderid
GO
/****** Object:  Table [dbo].[categories$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories$](
	[categoryid] [float] NULL,
	[categoryname] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[picture] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers$](
	[customerid] [nvarchar](255) NULL,
	[companyname] [nvarchar](255) NULL,
	[contactname] [nvarchar](255) NULL,
	[contacttitle] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[region] [nvarchar](255) NULL,
	[postalcode] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees$](
	[employeeid] [float] NULL,
	[lastname] [nvarchar](255) NULL,
	[firstname] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[titleofcourtesy] [nvarchar](255) NULL,
	[birthdate] [datetime] NULL,
	[hiredate] [datetime] NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[region] [nvarchar](255) NULL,
	[postalcode] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[homephone] [nvarchar](255) NULL,
	[extension] [nvarchar](255) NULL,
	[photo] [nvarchar](255) NULL,
	[notes] [nvarchar](max) NULL,
	[reportsto] [float] NULL,
	[photopath] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products$](
	[productid] [float] NULL,
	[productname] [nvarchar](255) NULL,
	[supplierid] [float] NULL,
	[categoryid] [float] NULL,
	[quantityperunit] [nvarchar](255) NULL,
	[unitprice] [float] NULL,
	[unitsinstock] [float] NULL,
	[unitsonorder] [float] NULL,
	[reorderlevel] [float] NULL,
	[discontinued] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region$](
	[regionid] [float] NULL,
	[regiondescription] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippers$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippers$](
	[shipperid] [float] NULL,
	[companyname] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers$]    Script Date: 03/04/2025 17:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers$](
	[supplierid] [float] NULL,
	[companyname] [nvarchar](255) NULL,
	[contactname] [nvarchar](255) NULL,
	[contacttitle] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[region] [nvarchar](255) NULL,
	[postalcode] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[homepage] [nvarchar](255) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [NORTHWND] SET  READ_WRITE 
GO
