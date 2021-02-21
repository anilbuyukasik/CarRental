USE [CarRental]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 21.02.2021 10:25:50 ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 21.02.2021 10:25:50 ******/
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
/****** Object:  Table [dbo].[Colors]    Script Date: 21.02.2021 10:25:50 ******/
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
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (1, N'Chevrolet')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (2, N'Mercedes')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3, N'Wolkswagen')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4, N'Fiat')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (5, N'Ford')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (6, N'Suzuki')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (1, 1, 1, N'Impala', 1967, 120.0000, N'Retro')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (2, 1, 1, N'Aveo', 2000, 100.0000, N'Sedan')
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (3, 2, 2, N'AMG', 2000, 250.0000, N'C Serisi')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2, N'Red')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3, N'Yellow')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (4, N'Blue')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1002, N'Gray1')
SET IDENTITY_INSERT [dbo].[Colors] OFF
