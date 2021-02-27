USE [master]
GO
/****** Object:  Database [CarRental]    Script Date: 27.02.2021 11:18:23 ******/
CREATE DATABASE [CarRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarRental', FILENAME = N'C:\Users\ANIL\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\CarRental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarRental_log', FILENAME = N'C:\Users\ANIL\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\CarRental.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRental] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [CarRental] SET ANSI_NULLS ON 
GO
ALTER DATABASE [CarRental] SET ANSI_PADDING ON 
GO
ALTER DATABASE [CarRental] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [CarRental] SET ARITHABORT ON 
GO
ALTER DATABASE [CarRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRental] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [CarRental] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [CarRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRental] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [CarRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRental] SET RECOVERY FULL 
GO
ALTER DATABASE [CarRental] SET  MULTI_USER 
GO
ALTER DATABASE [CarRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarRental]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[ImagePath] [varchar](100) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cars](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NULL,
	[ColorId] [int] NULL,
	[CarName] [varchar](50) NULL,
	[ModelYear] [int] NULL,
	[DailyPrice] [money] NULL,
	[Description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[UserId] [int] NULL,
	[CompanyName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[CustomerId] [int] NULL,
	[RentDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 27.02.2021 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (1, N'Chevrolet')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (2, N'Mercedes')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3, N'Wolkswagen')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4, N'Fiat')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (5, N'Ford')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (6, N'Suzuki')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 1, N'C:\Users\ANIL\source\repos\CarRental\Images\f9450bf6e5234b29b9d4ce883acd4ccc-2-27-2021.jpg', CAST(N'2021-02-27 10:18:02.947' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 1, N'C:\Users\ANIL\source\repos\CarRental\Images\1f8159f18a7d4b3e82a3bcb786a54a70-2-27-2021.jpg', CAST(N'2021-02-27 10:20:23.027' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 1, N'C:\Users\ANIL\source\repos\CarRental\Images\2f5437f5552b459e9615396c15428986-2-27-2021.jpg', CAST(N'2021-02-27 10:20:36.397' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 1, N'C:\Users\ANIL\source\repos\CarRental\Images\55acedadd7ee448cac46ca71dc20f8a9-2-27-2021.jpg', CAST(N'2021-02-27 10:58:12.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (1, 1, 1, N'Impala', 1967, 120.0000, N'Retro')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (2, 1, 1, N'Aveo', 2000, 100.0000, N'Sedan')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (3, 2, 2, N'AMG', 2000, 250.0000, N'C Serisi')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (1001, 2, 1, N'AMG', 2000, 250.0000, N'C Serisi')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (2001, 2, 1, N'AMG2', 2000, 250.0000, N'C Serisi')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2, N'Red')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3, N'Yellow')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (4, N'Blue')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1002, N'Gray1')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (1, 1, 1, CAST(N'2021-02-20 00:00:00.000' AS DateTime), CAST(N'2021-02-22 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
USE [master]
GO
ALTER DATABASE [CarRental] SET  READ_WRITE 
GO
