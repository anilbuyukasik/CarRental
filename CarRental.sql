USE [CarRental]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11.04.2021 19:01:29 ******/
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
/****** Object:  Table [dbo].[CarImages]    Script Date: 11.04.2021 19:01:29 ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 11.04.2021 19:01:29 ******/
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
	[FindexPoint] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11.04.2021 19:01:29 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 11.04.2021 19:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 11.04.2021 19:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 11.04.2021 19:01:29 ******/
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
	[TotalPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 11.04.2021 19:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.04.2021 19:01:29 ******/
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
	[PasswordHash] [varbinary](500) NULL,
	[PasswordSalt] [varbinary](500) NULL,
	[Status] [bit] NULL,
	[FindexPoint] [int] NULL,
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
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3, N'Wolksvagen')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4, N'Fiat')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (5, N'Ford')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (6, N'Suzuki')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (1001, N'GMC')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (2001, N'Ferrari')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3001, N'Hyundai')
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4001, N'Mustang')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 1, N'\Images\f9450bf6e5234b29b9d4ce883acd4ccc-2-27-2021.jpg', CAST(N'2021-02-27 10:18:02.947' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 1, N'\Images\1f8159f18a7d4b3e82a3bcb786a54a70-2-27-2021.jpg', CAST(N'2021-02-27 10:20:23.027' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 1, N'\Images\2f5437f5552b459e9615396c15428986-2-27-2021.jpg', CAST(N'2021-02-27 10:20:36.397' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 1, N'\Images\55acedadd7ee448cac46ca71dc20f8a9-2-27-2021.jpg', CAST(N'2021-02-27 10:58:12.003' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1003, 2, N'\Images\7061010573e247d9891148d7b4b47be4-3-21-2021.jpg', CAST(N'2021-03-21 10:13:53.530' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2002, 3, N'\Images\3df45d64599d46e6a575a06b3ec25eed-3-23-2021.jpg', CAST(N'2021-03-23 21:30:23.850' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2003, 1001, N'\Images\28b6eb195d954788925591f2e07820c2-3-23-2021.jpg', CAST(N'2021-03-23 21:30:36.500' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2004, 2001, N'\Images\1eb98ba60fec4b419bb0e3dae4847b45-3-23-2021.jpg', CAST(N'2021-03-23 21:30:46.980' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2005, 3001, N'\Images\e11b9122bd9b43a19facffd03ad52753-3-23-2021.jpg', CAST(N'2021-03-23 21:31:01.570' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (1, 1, 1, N'Impala', 1967, 120.0000, N'Retro', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (2, 1, 1, N'Aveo', 2000, 100.0000, N'Sedan', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (3, 2, 2, N'AMG', 2015, 250.0000, N'-', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (1001, 2, 1, N'Benz S350', 2009, 300.0000, N'S Serisi', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (2001, 3, 4, N'Polo', 2018, 250.0000, N'GTI', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (3001, 4, 1002, N'Egea', 2021, 225.0000, N'Hatchback', NULL)
INSERT [dbo].[Cars] ([CarId], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description], [FindexPoint]) VALUES (4001, 3, 3, N'Golf', 2016, 120.0000, N'GTD', NULL)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2, N'Red')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3, N'Yellow')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (4, N'Blue')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (1002, N'Gray')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (2002, N'Orange')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3002, N'Brown')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (3003, N'Dark Blue')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [UserId], [CompanyName]) VALUES (1, 2003, N'Akbim')
INSERT [dbo].[Customers] ([CustomerId], [UserId], [CompanyName]) VALUES (2, 3004, N'Parla')
INSERT [dbo].[Customers] ([CustomerId], [UserId], [CompanyName]) VALUES (3, 3003, N'Kodlama.io')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'moderator')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'user')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'car.add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (5, N'car.list')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [TotalPrice]) VALUES (1, 1, 1, CAST(N'2021-02-20 00:00:00.000' AS DateTime), CAST(N'2021-02-22 00:00:00.000' AS DateTime), 240.0000)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 2003, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 2003, 4)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3, 2003, 5)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (4, 3003, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (5, 3004, 3)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (6, 3003, 5)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [FindexPoint]) VALUES (2003, N'Anil', N'Büyükasik', N'buyukasik.anil@gmail.com', 0xE5532A9F8094770052B83284E473C0D2B47B96CFFFE6326D41527C4BC7EF7F8CC64918B30DD730FAE8539634A5DB642EF7A29BDBD0045413DAEF1E155AE40C00, 0x7A98B31C260F8BDCBEC37C1284A38871B44FB63CC2CEBC4339356CC5E47C11D580143CDF71917086846F8973B287839C3EA6F5BF14E19F67BBA314E03FDA283A84D0B7F16AA51B60E83F756140B9BA0F291BFF8052261A66EC44C978DC43B65A4F1998B0A331949F473428C602FA6D717307A32805B60111344B1D5C5C45F6C2, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [FindexPoint]) VALUES (3003, N'Engin', N'Demirog', N'engindemirog@gmail.com', 0x97BB7B7B9ECBAE25280D817CC22CA3C46DAC49B84FEC56DB09CA01607A32E6F6414597E9FAB9D0FBF3EE0868097EE20CCA84873F7EE56F34CB8683B8C2FC9355, 0x57B19DE50EB91BF3AB53F92553B21C73DCA534AA47A1F162EC3F68B8CAAF166AFF7FA382810866B92D6590D22F6472E59D92ED0665DF930E06D4F571D440181172B8704C17B3F28548041377892D17D7D82FFB4A3831D64B260519F9612182C9ACA6BBAB3E764BBC8CE0B3BE527E1679FDCCD9985961F86E845BE20A8B21E9C1, 1, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [FindexPoint]) VALUES (3004, N'Nurnilay', N'Pinar', N'ceciliabartoli98@gmail.com', 0x803B33AE06A4A2AFF4283A2BDC7E951716F11C1372CFAA28B08DF76D54A46AE1E5EF75B22B166C986C77B4CA485733A18BA91F7FB8C6378FAE097D768C4CC3CA, 0x9EA922B9C7CB4C357F4ABA269B07BC98AEB7B94804EEB337717B22E22A381B7A8EA80B0C54EA59C0AC3B9F67294D7A45D4B30693FA1D1FADF9DD51EB7738A6CA9CE434959F798074F1FAF02E7E93463CCD597FD761596F6909593F6A554CA6386594FF844B0DD379FF125C4F7BA5787B0798EFB816748B0EF52DD0A145B83C8C, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
