USE [CargoSelectorDB]
GO
/****** Object:  Schema [HangFire]    Script Date: 10.10.2024 13:46:44 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.10.2024 13:46:44 ******/
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
/****** Object:  Table [dbo].[CarrierConfigurations]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierConfigurations](
	[CarrierConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierMaxDesi] [int] NOT NULL,
	[CarrierMinDesi] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
	[CarrierId] [int] NOT NULL,
 CONSTRAINT [PK_CarrierConfigurations] PRIMARY KEY CLUSTERED 
(
	[CarrierConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrierReports]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierReports](
	[CarrierReportId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
	[CarrierReportDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CarrierReports] PRIMARY KEY CLUSTERED 
(
	[CarrierReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[CarrierId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](50) NOT NULL,
	[CarrierIsActive] [bit] NOT NULL,
	[CarrierPlusDesiCost] [int] NOT NULL,
	[CarrierConfigurationId] [int] NOT NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDesi] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderCarrierCost] [decimal](18, 2) NOT NULL,
	[CarrierId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 10.10.2024 13:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010083516_mig1', N'6.0.35')
GO
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] ON 

INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarrierId]) VALUES (1, 10, 20, CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarrierId]) VALUES (2, 21, 30, CAST(30.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarrierId]) VALUES (3, 31, 40, CAST(50.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarrierId]) VALUES (4, 41, 50, CAST(5.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[CarrierConfigurations] ([CarrierConfigurationId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost], [CarrierId]) VALUES (7, 90, 100, CAST(20.00 AS Decimal(18, 2)), 4)
SET IDENTITY_INSERT [dbo].[CarrierConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[CarrierReports] ON 

INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (1, 1, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-10-10T12:38:10.8330000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (2, 2, CAST(90.00 AS Decimal(18, 2)), CAST(N'2024-10-10T12:38:10.8330000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (3, 3, CAST(640.00 AS Decimal(18, 2)), CAST(N'2024-10-10T12:38:10.8330000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportDate]) VALUES (4, 4, CAST(491.00 AS Decimal(18, 2)), CAST(N'2024-10-10T12:38:10.8330000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CarrierReports] OFF
GO
SET IDENTITY_INSERT [dbo].[Carriers] ON 

INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (1, N'Taşıyı 1', 1, 20, 1)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (2, N'Taşıyı 2', 1, 20, 2)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (3, N'Taşıyı 3', 1, 60, 3)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost], [CarrierConfigurationId]) VALUES (4, N'Taşıyı 4', 1, 8, 4)
SET IDENTITY_INSERT [dbo].[Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (6, 15, CAST(N'2024-10-10T12:03:22.6910877' AS DateTime2), CAST(110.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (7, 50, CAST(N'2024-10-10T12:03:33.2512156' AS DateTime2), CAST(77.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (8, 36, CAST(N'2024-10-10T12:30:26.8144814' AS DateTime2), CAST(350.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (9, 55, CAST(N'2024-10-10T12:30:34.1257697' AS DateTime2), CAST(117.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (10, 65, CAST(N'2024-10-10T12:30:41.8464598' AS DateTime2), CAST(197.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (11, 100, CAST(N'2024-10-10T12:31:13.7451205' AS DateTime2), CAST(100.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (12, 35, CAST(N'2024-10-10T12:33:55.1484057' AS DateTime2), CAST(290.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Orders] ([OrderId], [OrderDesi], [OrderDate], [OrderCarrierCost], [CarrierId]) VALUES (13, 24, CAST(N'2024-10-10T12:34:06.0931079' AS DateTime2), CAST(90.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 39, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-10', 39, CAST(N'2024-11-10T09:31:26.437' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-10-08', 15, CAST(N'2024-10-11T08:59:24.130' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-10-09', 24, CAST(N'2024-10-11T09:31:26.437' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Counter] ON 

INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 118)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-10', 1, CAST(N'2024-11-10T09:38:11.177' AS DateTime), 119)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-10-09', 1, CAST(N'2024-10-11T09:38:11.177' AS DateTime), 120)
SET IDENTITY_INSERT [HangFire].[Counter] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'CreatedAt', N'2024-10-10T08:40:09.8076971Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'Cron', N'* * * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'Job', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":"[]"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'LastExecution', N'2024-10-10T09:38:09.2309115Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'LastJobId', N'40', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'NextExecution', N'2024-10-10T09:39:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:GenerateCarrierReportJob', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 3, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:41:10.157' AS DateTime), CAST(N'2024-10-11T08:41:10.583' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (2, 6, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:42:10.267' AS DateTime), CAST(N'2024-10-11T08:42:10.293' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 9, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:43:10.320' AS DateTime), CAST(N'2024-10-11T08:43:10.350' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 12, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:44:10.387' AS DateTime), CAST(N'2024-10-11T08:44:10.410' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (5, 15, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:45:10.457' AS DateTime), CAST(N'2024-10-11T08:45:10.483' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (6, 18, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:46:10.520' AS DateTime), CAST(N'2024-10-11T08:46:10.553' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 21, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:47:10.583' AS DateTime), CAST(N'2024-10-11T08:47:10.607' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (8, 24, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:48:10.630' AS DateTime), CAST(N'2024-10-11T08:48:10.657' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (9, 27, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:49:10.690' AS DateTime), CAST(N'2024-10-11T08:49:10.727' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10, 30, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:50:10.777' AS DateTime), CAST(N'2024-10-11T08:50:10.827' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (11, 33, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:51:10.847' AS DateTime), CAST(N'2024-10-11T08:51:10.897' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (12, 36, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:52:10.893' AS DateTime), CAST(N'2024-10-11T08:52:10.930' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (13, 39, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:56:13.673' AS DateTime), CAST(N'2024-10-11T08:56:16.770' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (14, 42, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:57:13.897' AS DateTime), CAST(N'2024-10-11T08:57:13.970' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (15, 45, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T08:59:21.570' AS DateTime), CAST(N'2024-10-11T08:59:24.137' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (16, 61, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:00:07.007' AS DateTime), CAST(N'2024-10-11T09:05:07.083' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (17, 50, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:01:27.803' AS DateTime), CAST(N'2024-10-11T09:01:30.463' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (18, 53, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:02:13.100' AS DateTime), CAST(N'2024-10-11T09:02:13.173' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (19, 56, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:03:13.170' AS DateTime), CAST(N'2024-10-11T09:03:13.190' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20, 59, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:04:13.213' AS DateTime), CAST(N'2024-10-11T09:04:13.257' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (21, 64, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:05:13.267' AS DateTime), CAST(N'2024-10-11T09:05:13.287' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (22, 67, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:06:13.340' AS DateTime), CAST(N'2024-10-11T09:06:13.387' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (23, 70, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:07:13.407' AS DateTime), CAST(N'2024-10-11T09:07:13.447' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (24, 73, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:08:13.470' AS DateTime), CAST(N'2024-10-11T09:08:13.513' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (25, 76, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:09:13.513' AS DateTime), CAST(N'2024-10-11T09:09:13.553' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (26, 79, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:10:13.567' AS DateTime), CAST(N'2024-10-11T09:10:13.603' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (27, 82, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:11:13.630' AS DateTime), CAST(N'2024-10-11T09:11:13.653' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (28, 85, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:12:13.663' AS DateTime), CAST(N'2024-10-11T09:12:13.703' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (29, 88, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:13:13.720' AS DateTime), CAST(N'2024-10-11T09:13:13.763' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30, 91, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:14:13.770' AS DateTime), CAST(N'2024-10-11T09:14:13.803' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (31, 94, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:15:13.820' AS DateTime), CAST(N'2024-10-11T09:15:13.863' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (32, 97, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:16:13.870' AS DateTime), CAST(N'2024-10-11T09:16:13.897' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (33, 100, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:17:13.937' AS DateTime), CAST(N'2024-10-11T09:17:13.980' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (34, 103, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:18:13.987' AS DateTime), CAST(N'2024-10-11T09:18:14.030' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (35, 106, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:27:53.627' AS DateTime), CAST(N'2024-10-11T09:27:53.663' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (36, 109, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:28:08.683' AS DateTime), CAST(N'2024-10-11T09:28:08.720' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (37, 112, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:29:08.753' AS DateTime), CAST(N'2024-10-11T09:29:20.130' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (38, 115, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:30:08.823' AS DateTime), CAST(N'2024-10-11T09:30:11.030' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (39, 118, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:31:08.887' AS DateTime), CAST(N'2024-10-11T09:31:26.437' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (40, 121, N'Succeeded', N'{"Type":"BusinessLayer.Abstract.ICarrierReportService, BusinessLayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReport","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2024-10-10T09:38:09.250' AS DateTime), CAST(N'2024-10-11T09:38:11.180' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'Time', N'1728549670')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'Time', N'1728549730')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'Time', N'1728549790')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'Time', N'1728549850')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'Time', N'1728549910')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'Time', N'1728549970')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'Time', N'1728550030')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'Time', N'1728550090')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'Time', N'1728550150')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'Time', N'1728550210')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'Time', N'1728550270')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'Time', N'1728550330')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'Time', N'1728550573')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (14, N'Time', N'1728550633')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (15, N'Time', N'1728550761')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'Time', N'1728550806')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (17, N'Time', N'1728550887')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (18, N'Time', N'1728550933')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (19, N'Time', N'1728550993')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20, N'Time', N'1728551053')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (21, N'Time', N'1728551113')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (22, N'Time', N'1728551173')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (23, N'Time', N'1728551233')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (24, N'Time', N'1728551293')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (25, N'Time', N'1728551353')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (26, N'Time', N'1728551413')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (27, N'Time', N'1728551473')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (28, N'Time', N'1728551533')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (29, N'Time', N'1728551593')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30, N'Time', N'1728551653')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (31, N'Time', N'1728551713')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (32, N'Time', N'1728551773')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (33, N'Time', N'1728551833')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (34, N'Time', N'1728551893')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (35, N'Time', N'1728552473')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (36, N'Time', N'1728552488')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (37, N'Time', N'1728552548')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (38, N'Time', N'1728552608')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (39, N'Time', N'1728552668')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'RecurringJobId', N'"GenerateCarrierReportJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (40, N'Time', N'1728553089')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-mdrtu7j:15968:359b0621-d95f-43b8-a7fc-85e3f5ce1d6a', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2024-10-10T09:37:23.8896223Z"}', CAST(N'2024-10-10T09:38:24.103' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-mdrtu7j:15968:792df18c-d191-4f42-acef-afad41cff4e2', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2024-10-10T09:37:24.5023919Z"}', CAST(N'2024-10-10T09:38:24.533' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-mdrtu7j:21692:52839124-853d-4815-a6dc-25ea75bf3625', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2024-10-10T09:33:40.910804Z"}', CAST(N'2024-10-10T09:35:10.947' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-mdrtu7j:21692:851a9ee9-6ee8-4bd0-8ca6-5efc5d57c787', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2024-10-10T09:33:40.256611Z"}', CAST(N'2024-10-10T09:35:10.467' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1728553140, N'GenerateCarrierReportJob', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:41:10.187' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:41:10.1766466Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Processing', NULL, CAST(N'2024-10-10T08:41:10.330' AS DateTime), N'{"StartedAt":"2024-10-10T08:41:10.2243533Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"989ed03d-0780-4366-92e4-06ba05be7833"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Succeeded', NULL, CAST(N'2024-10-10T08:41:10.580' AS DateTime), N'{"SucceededAt":"2024-10-10T08:41:10.5716696Z","PerformanceDuration":"232","Latency":"181"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 2, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:42:10.273' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:42:10.2718575Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 2, N'Processing', NULL, CAST(N'2024-10-10T08:42:10.283' AS DateTime), N'{"StartedAt":"2024-10-10T08:42:10.2820518Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"3d4b4763-3f42-4323-8d56-d03f7ba43127"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 2, N'Succeeded', NULL, CAST(N'2024-10-10T08:42:10.293' AS DateTime), N'{"SucceededAt":"2024-10-10T08:42:10.2924388Z","PerformanceDuration":"7","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 3, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:43:10.323' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:43:10.3247335Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 3, N'Processing', NULL, CAST(N'2024-10-10T08:43:10.337' AS DateTime), N'{"StartedAt":"2024-10-10T08:43:10.3354061Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"dcf6a096-aedc-4dff-9ad5-5cd72a763434"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 3, N'Succeeded', NULL, CAST(N'2024-10-10T08:43:10.350' AS DateTime), N'{"SucceededAt":"2024-10-10T08:43:10.3464204Z","PerformanceDuration":"4","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 4, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:44:10.397' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:44:10.3952759Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 4, N'Processing', NULL, CAST(N'2024-10-10T08:44:10.407' AS DateTime), N'{"StartedAt":"2024-10-10T08:44:10.4051433Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"06dfb27f-1421-4aa5-9066-ec81e3934694"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 4, N'Succeeded', NULL, CAST(N'2024-10-10T08:44:10.410' AS DateTime), N'{"SucceededAt":"2024-10-10T08:44:10.4093011Z","PerformanceDuration":"2","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 5, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:45:10.460' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:45:10.4614022Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 5, N'Processing', NULL, CAST(N'2024-10-10T08:45:10.473' AS DateTime), N'{"StartedAt":"2024-10-10T08:45:10.4725206Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"3d4ddc82-1ee5-4963-97f0-5bf2403b68be"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 5, N'Succeeded', NULL, CAST(N'2024-10-10T08:45:10.483' AS DateTime), N'{"SucceededAt":"2024-10-10T08:45:10.4815930Z","PerformanceDuration":"3","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 6, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:46:10.527' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:46:10.5278981Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 6, N'Processing', NULL, CAST(N'2024-10-10T08:46:10.540' AS DateTime), N'{"StartedAt":"2024-10-10T08:46:10.5390056Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"a0e1e272-e126-4b7a-acc2-6a0233002547"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 6, N'Succeeded', NULL, CAST(N'2024-10-10T08:46:10.553' AS DateTime), N'{"SucceededAt":"2024-10-10T08:46:10.5491061Z","PerformanceDuration":"7","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 7, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:47:10.593' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:47:10.5917580Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 7, N'Processing', NULL, CAST(N'2024-10-10T08:47:10.603' AS DateTime), N'{"StartedAt":"2024-10-10T08:47:10.6020786Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"ba225f38-088f-4752-9435-c7c1ab720fa2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 7, N'Succeeded', NULL, CAST(N'2024-10-10T08:47:10.607' AS DateTime), N'{"SucceededAt":"2024-10-10T08:47:10.6068194Z","PerformanceDuration":"2","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (22, 8, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:48:10.640' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:48:10.6390138Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23, 8, N'Processing', NULL, CAST(N'2024-10-10T08:48:10.653' AS DateTime), N'{"StartedAt":"2024-10-10T08:48:10.6506237Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"b4e9e82d-0a87-4194-9385-7a975bfd5408"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24, 8, N'Succeeded', NULL, CAST(N'2024-10-10T08:48:10.657' AS DateTime), N'{"SucceededAt":"2024-10-10T08:48:10.6549631Z","PerformanceDuration":"2","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (25, 9, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:49:10.700' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:49:10.6995562Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (26, 9, N'Processing', NULL, CAST(N'2024-10-10T08:49:10.713' AS DateTime), N'{"StartedAt":"2024-10-10T08:49:10.7114318Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"8a28f7c2-479e-4377-b0a1-2a67dbf0d299"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (27, 9, N'Succeeded', NULL, CAST(N'2024-10-10T08:49:10.727' AS DateTime), N'{"SucceededAt":"2024-10-10T08:49:10.7230680Z","PerformanceDuration":"3","Latency":"29"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (28, 10, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:50:10.783' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:50:10.7825762Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (29, 10, N'Processing', NULL, CAST(N'2024-10-10T08:50:10.803' AS DateTime), N'{"StartedAt":"2024-10-10T08:50:10.7994305Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"fa399dee-6ae1-4f41-9f69-ec666fd9348c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (30, 10, N'Succeeded', NULL, CAST(N'2024-10-10T08:50:10.827' AS DateTime), N'{"SucceededAt":"2024-10-10T08:50:10.8191837Z","PerformanceDuration":"8","Latency":"33"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (31, 11, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:51:10.850' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:51:10.8504746Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (32, 11, N'Processing', NULL, CAST(N'2024-10-10T08:51:10.867' AS DateTime), N'{"StartedAt":"2024-10-10T08:51:10.8640913Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"670612bb-0389-4f83-bb7d-8c12ab5b5c5b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33, 11, N'Succeeded', NULL, CAST(N'2024-10-10T08:51:10.897' AS DateTime), N'{"SucceededAt":"2024-10-10T08:51:10.8913378Z","PerformanceDuration":"20","Latency":"23"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 12, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:52:10.897' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:52:10.8967876Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (35, 12, N'Processing', NULL, CAST(N'2024-10-10T08:52:10.907' AS DateTime), N'{"StartedAt":"2024-10-10T08:52:10.9069961Z","ServerId":"desktop-mdrtu7j:3060:afb79624-7271-4aad-9ce2-b2af140fbe70","WorkerId":"cda9b64f-64b7-4780-945f-00ad3be811bf"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (36, 12, N'Succeeded', NULL, CAST(N'2024-10-10T08:52:10.930' AS DateTime), N'{"SucceededAt":"2024-10-10T08:52:10.9263545Z","PerformanceDuration":"17","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (37, 13, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:56:13.707' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:56:13.6965980Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (38, 13, N'Processing', NULL, CAST(N'2024-10-10T08:56:14.017' AS DateTime), N'{"StartedAt":"2024-10-10T08:56:13.8437807Z","ServerId":"desktop-mdrtu7j:2140:7bf1f7e5-bc5d-43e8-b558-e4edfa86ac5d","WorkerId":"1b22a382-3ee0-43cb-8082-1f4990c97685"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (39, 13, N'Succeeded', NULL, CAST(N'2024-10-10T08:56:16.767' AS DateTime), N'{"SucceededAt":"2024-10-10T08:56:16.7525963Z","PerformanceDuration":"2727","Latency":"352"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (40, 14, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:57:13.900' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:57:13.8992291Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (41, 14, N'Processing', NULL, CAST(N'2024-10-10T08:57:13.910' AS DateTime), N'{"StartedAt":"2024-10-10T08:57:13.9094811Z","ServerId":"desktop-mdrtu7j:2140:7bf1f7e5-bc5d-43e8-b558-e4edfa86ac5d","WorkerId":"dce1ccb9-ac30-4284-9f5f-31b25d0d7d12"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (42, 14, N'Succeeded', NULL, CAST(N'2024-10-10T08:57:13.970' AS DateTime), N'{"SucceededAt":"2024-10-10T08:57:13.9669875Z","PerformanceDuration":"55","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (43, 15, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T08:59:21.610' AS DateTime), N'{"EnqueuedAt":"2024-10-10T08:59:21.6017776Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (44, 15, N'Processing', NULL, CAST(N'2024-10-10T08:59:22.107' AS DateTime), N'{"StartedAt":"2024-10-10T08:59:21.9612965Z","ServerId":"desktop-mdrtu7j:2064:bf2f7a28-0243-4597-b39c-e5f50571fb7c","WorkerId":"74376b0f-a0e9-4b53-ae10-30b865479429"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (45, 15, N'Succeeded', NULL, CAST(N'2024-10-10T08:59:24.133' AS DateTime), N'{"SucceededAt":"2024-10-10T08:59:24.1264484Z","PerformanceDuration":"2010","Latency":"545"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (46, 16, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:00:07.010' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:00:07.0097488Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (47, 16, N'Processing', NULL, CAST(N'2024-10-10T09:00:07.023' AS DateTime), N'{"StartedAt":"2024-10-10T09:00:07.0224879Z","ServerId":"desktop-mdrtu7j:2064:bf2f7a28-0243-4597-b39c-e5f50571fb7c","WorkerId":"6106693f-720e-46a7-9ead-a3ef97bf2650"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (60, 16, N'Processing', NULL, CAST(N'2024-10-10T09:05:07.043' AS DateTime), N'{"StartedAt":"2024-10-10T09:05:07.0423207Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"b19f4273-199a-4050-b1f6-a42ce2a25fd8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (61, 16, N'Succeeded', NULL, CAST(N'2024-10-10T09:05:07.083' AS DateTime), N'{"SucceededAt":"2024-10-10T09:05:07.0810153Z","PerformanceDuration":"32","Latency":"300041"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (48, 17, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:01:27.850' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:01:27.8347349Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (49, 17, N'Processing', NULL, CAST(N'2024-10-10T09:01:28.193' AS DateTime), N'{"StartedAt":"2024-10-10T09:01:28.0530203Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"1c59fdf5-1a2b-47e5-8b87-8e1d3ca262ac"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (50, 17, N'Succeeded', NULL, CAST(N'2024-10-10T09:01:30.460' AS DateTime), N'{"SucceededAt":"2024-10-10T09:01:30.4528947Z","PerformanceDuration":"2248","Latency":"401"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (51, 18, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:02:13.107' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:02:13.1071466Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (52, 18, N'Processing', NULL, CAST(N'2024-10-10T09:02:13.120' AS DateTime), N'{"StartedAt":"2024-10-10T09:02:13.1195392Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"26131302-3f22-4fdc-83c3-d3a31ad239e0"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (53, 18, N'Succeeded', NULL, CAST(N'2024-10-10T09:02:13.173' AS DateTime), N'{"SucceededAt":"2024-10-10T09:02:13.1700505Z","PerformanceDuration":"44","Latency":"25"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (54, 19, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:03:13.173' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:03:13.1722134Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (55, 19, N'Processing', NULL, CAST(N'2024-10-10T09:03:13.183' AS DateTime), N'{"StartedAt":"2024-10-10T09:03:13.1809295Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"8425bdf1-7a45-4ea0-bf26-44c98f2b1142"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (56, 19, N'Succeeded', NULL, CAST(N'2024-10-10T09:03:13.190' AS DateTime), N'{"SucceededAt":"2024-10-10T09:03:13.1898838Z","PerformanceDuration":"6","Latency":"13"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (57, 20, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:04:13.223' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:04:13.2222735Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (58, 20, N'Processing', NULL, CAST(N'2024-10-10T09:04:13.233' AS DateTime), N'{"StartedAt":"2024-10-10T09:04:13.2312483Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"7112e03e-f8ea-4322-8c1a-cb028f6298d2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (59, 20, N'Succeeded', NULL, CAST(N'2024-10-10T09:04:13.257' AS DateTime), N'{"SucceededAt":"2024-10-10T09:04:13.2546986Z","PerformanceDuration":"20","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (62, 21, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:05:13.277' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:05:13.2759403Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (63, 21, N'Processing', NULL, CAST(N'2024-10-10T09:05:13.283' AS DateTime), N'{"StartedAt":"2024-10-10T09:05:13.2811332Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"59142acb-f590-4e4d-9eb4-dc0dfd4bf04c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (64, 21, N'Succeeded', NULL, CAST(N'2024-10-10T09:05:13.287' AS DateTime), N'{"SucceededAt":"2024-10-10T09:05:13.2869311Z","PerformanceDuration":"4","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (65, 22, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:06:13.350' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:06:13.3495776Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (66, 22, N'Processing', NULL, CAST(N'2024-10-10T09:06:13.363' AS DateTime), N'{"StartedAt":"2024-10-10T09:06:13.3604686Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"bf0f5f94-298c-4d60-b4bf-4395f716cbfe"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (67, 22, N'Succeeded', NULL, CAST(N'2024-10-10T09:06:13.387' AS DateTime), N'{"SucceededAt":"2024-10-10T09:06:13.3823063Z","PerformanceDuration":"19","Latency":"22"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (68, 23, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:07:13.413' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:07:13.4147554Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (69, 23, N'Processing', NULL, CAST(N'2024-10-10T09:07:13.423' AS DateTime), N'{"StartedAt":"2024-10-10T09:07:13.4236357Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"f94b00a9-78da-4f02-bdc3-e0789bdb4799"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (70, 23, N'Succeeded', NULL, CAST(N'2024-10-10T09:07:13.447' AS DateTime), N'{"SucceededAt":"2024-10-10T09:07:13.4468891Z","PerformanceDuration":"21","Latency":"18"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (71, 24, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:08:13.473' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:08:13.4737406Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (72, 24, N'Processing', NULL, CAST(N'2024-10-10T09:08:13.487' AS DateTime), N'{"StartedAt":"2024-10-10T09:08:13.4835078Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"96896e30-3674-434e-a6c0-221f038ab389"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (73, 24, N'Succeeded', NULL, CAST(N'2024-10-10T09:08:13.513' AS DateTime), N'{"SucceededAt":"2024-10-10T09:08:13.5125916Z","PerformanceDuration":"26","Latency":"16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (74, 25, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:09:13.517' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:09:13.5180855Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (75, 25, N'Processing', NULL, CAST(N'2024-10-10T09:09:13.530' AS DateTime), N'{"StartedAt":"2024-10-10T09:09:13.5301493Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"b77ea68e-3a4e-43d2-a12d-7e86e65be6bd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (76, 25, N'Succeeded', NULL, CAST(N'2024-10-10T09:09:13.553' AS DateTime), N'{"SucceededAt":"2024-10-10T09:09:13.5532521Z","PerformanceDuration":"21","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (77, 26, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:10:13.570' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:10:13.5692812Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (78, 26, N'Processing', NULL, CAST(N'2024-10-10T09:10:13.580' AS DateTime), N'{"StartedAt":"2024-10-10T09:10:13.5795924Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"d88168ab-1d0a-41f4-a57c-54dab1e352a2"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (79, 26, N'Succeeded', NULL, CAST(N'2024-10-10T09:10:13.603' AS DateTime), N'{"SucceededAt":"2024-10-10T09:10:13.6025541Z","PerformanceDuration":"21","Latency":"14"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (80, 27, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:11:13.633' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:11:13.6325367Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (81, 27, N'Processing', NULL, CAST(N'2024-10-10T09:11:13.647' AS DateTime), N'{"StartedAt":"2024-10-10T09:11:13.6448858Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"56d12b97-f9a5-4d8b-82f0-7c651fb6332a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (82, 27, N'Succeeded', NULL, CAST(N'2024-10-10T09:11:13.653' AS DateTime), N'{"SucceededAt":"2024-10-10T09:11:13.6527150Z","PerformanceDuration":"5","Latency":"17"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (83, 28, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:12:13.673' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:12:13.6718150Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (84, 28, N'Processing', NULL, CAST(N'2024-10-10T09:12:13.683' AS DateTime), N'{"StartedAt":"2024-10-10T09:12:13.6805813Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"a166e039-53cd-4f19-a976-e194a1529330"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (85, 28, N'Succeeded', NULL, CAST(N'2024-10-10T09:12:13.703' AS DateTime), N'{"SucceededAt":"2024-10-10T09:12:13.7019096Z","PerformanceDuration":"19","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (86, 29, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:13:13.727' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:13:13.7278033Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (87, 29, N'Processing', NULL, CAST(N'2024-10-10T09:13:13.740' AS DateTime), N'{"StartedAt":"2024-10-10T09:13:13.7392372Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"da4ec8e1-07a3-49aa-a7d2-2397909607fe"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (88, 29, N'Succeeded', NULL, CAST(N'2024-10-10T09:13:13.763' AS DateTime), N'{"SucceededAt":"2024-10-10T09:13:13.7591351Z","PerformanceDuration":"18","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (89, 30, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:14:13.773' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:14:13.7736244Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (90, 30, N'Processing', NULL, CAST(N'2024-10-10T09:14:13.787' AS DateTime), N'{"StartedAt":"2024-10-10T09:14:13.7842571Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"8f59ce7d-9255-43fb-b486-b4b22fed2628"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (91, 30, N'Succeeded', NULL, CAST(N'2024-10-10T09:14:13.803' AS DateTime), N'{"SucceededAt":"2024-10-10T09:14:13.7984275Z","PerformanceDuration":"7","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (92, 31, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:15:13.830' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:15:13.8293052Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (93, 31, N'Processing', NULL, CAST(N'2024-10-10T09:15:13.840' AS DateTime), N'{"StartedAt":"2024-10-10T09:15:13.8397513Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"48643837-c1f6-4242-b488-5f23fe6000b8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (94, 31, N'Succeeded', NULL, CAST(N'2024-10-10T09:15:13.863' AS DateTime), N'{"SucceededAt":"2024-10-10T09:15:13.8633877Z","PerformanceDuration":"21","Latency":"21"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (95, 32, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:16:13.877' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:16:13.8772115Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (96, 32, N'Processing', NULL, CAST(N'2024-10-10T09:16:13.890' AS DateTime), N'{"StartedAt":"2024-10-10T09:16:13.8874077Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"7ac80ab3-4020-41ff-9b49-fdf1f80e2c2b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (97, 32, N'Succeeded', NULL, CAST(N'2024-10-10T09:16:13.897' AS DateTime), N'{"SucceededAt":"2024-10-10T09:16:13.8954406Z","PerformanceDuration":"5","Latency":"19"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (98, 33, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:17:13.947' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:17:13.9451969Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (99, 33, N'Processing', NULL, CAST(N'2024-10-10T09:17:13.957' AS DateTime), N'{"StartedAt":"2024-10-10T09:17:13.9554003Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"1d51f3a8-e504-4b03-ac0c-7bbec9f778b0"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (100, 33, N'Succeeded', NULL, CAST(N'2024-10-10T09:17:13.980' AS DateTime), N'{"SucceededAt":"2024-10-10T09:17:13.9786878Z","PerformanceDuration":"21","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (101, 34, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:18:13.993' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:18:13.9940656Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (102, 34, N'Processing', NULL, CAST(N'2024-10-10T09:18:14.007' AS DateTime), N'{"StartedAt":"2024-10-10T09:18:14.0050855Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"2d4dccc2-f765-4eda-8b8a-75503c0054cb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (103, 34, N'Succeeded', NULL, CAST(N'2024-10-10T09:18:14.030' AS DateTime), N'{"SucceededAt":"2024-10-10T09:18:14.0293905Z","PerformanceDuration":"22","Latency":"20"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (104, 35, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:27:53.637' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:27:53.6358849Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (105, 35, N'Processing', NULL, CAST(N'2024-10-10T09:27:53.650' AS DateTime), N'{"StartedAt":"2024-10-10T09:27:53.6462277Z","ServerId":"desktop-mdrtu7j:8876:e7aab5ef-004b-4985-a59b-ba9b8013de3f","WorkerId":"ff691564-1669-4ea7-9e6e-9c11c3b30f70"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (106, 35, N'Succeeded', NULL, CAST(N'2024-10-10T09:27:53.663' AS DateTime), N'{"SucceededAt":"2024-10-10T09:27:53.6627101Z","PerformanceDuration":"7","Latency":"27"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (107, 36, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:28:08.690' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:28:08.6911389Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (108, 36, N'Processing', NULL, CAST(N'2024-10-10T09:28:08.703' AS DateTime), N'{"StartedAt":"2024-10-10T09:28:08.7019999Z","ServerId":"desktop-mdrtu7j:8876:46b345b4-6374-4b63-b0ae-aae4a5b26c9c","WorkerId":"3f4794cb-c7e3-4ee2-a996-da2c9c0ddf3b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (109, 36, N'Succeeded', NULL, CAST(N'2024-10-10T09:28:08.720' AS DateTime), N'{"SucceededAt":"2024-10-10T09:28:08.7157708Z","PerformanceDuration":"7","Latency":"25"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (110, 37, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:29:08.757' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:29:08.7573298Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (111, 37, N'Processing', NULL, CAST(N'2024-10-10T09:29:08.773' AS DateTime), N'{"StartedAt":"2024-10-10T09:29:08.7676528Z","ServerId":"desktop-mdrtu7j:8876:46b345b4-6374-4b63-b0ae-aae4a5b26c9c","WorkerId":"e795554b-d84e-4dff-9e93-b5df4a50a629"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (112, 37, N'Succeeded', NULL, CAST(N'2024-10-10T09:29:20.130' AS DateTime), N'{"SucceededAt":"2024-10-10T09:29:20.1259953Z","PerformanceDuration":"11346","Latency":"26"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (113, 38, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:30:08.830' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:30:08.8289101Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (114, 38, N'Processing', NULL, CAST(N'2024-10-10T09:30:08.843' AS DateTime), N'{"StartedAt":"2024-10-10T09:30:08.8404295Z","ServerId":"desktop-mdrtu7j:8876:46b345b4-6374-4b63-b0ae-aae4a5b26c9c","WorkerId":"1b234e49-8e1d-43a2-bf9e-76b5eabbc642"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (115, 38, N'Succeeded', NULL, CAST(N'2024-10-10T09:30:11.030' AS DateTime), N'{"SucceededAt":"2024-10-10T09:30:11.0281911Z","PerformanceDuration":"2180","Latency":"24"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (116, 39, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:31:08.890' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:31:08.8888741Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (117, 39, N'Processing', NULL, CAST(N'2024-10-10T09:31:08.900' AS DateTime), N'{"StartedAt":"2024-10-10T09:31:08.8994258Z","ServerId":"desktop-mdrtu7j:8876:46b345b4-6374-4b63-b0ae-aae4a5b26c9c","WorkerId":"5b541e5d-ffa5-4557-97bd-92887ba97c23"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (118, 39, N'Succeeded', NULL, CAST(N'2024-10-10T09:31:26.437' AS DateTime), N'{"SucceededAt":"2024-10-10T09:31:26.4346606Z","PerformanceDuration":"17532","Latency":"15"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (119, 40, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-10T09:38:09.277' AS DateTime), N'{"EnqueuedAt":"2024-10-10T09:38:09.2676746Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (120, 40, N'Processing', NULL, CAST(N'2024-10-10T09:38:09.330' AS DateTime), N'{"StartedAt":"2024-10-10T09:38:09.2974043Z","ServerId":"desktop-mdrtu7j:15968:359b0621-d95f-43b8-a7fc-85e3f5ce1d6a","WorkerId":"478df32a-e3fa-4207-a061-1c9378e56a70"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (121, 40, N'Succeeded', NULL, CAST(N'2024-10-10T09:38:11.177' AS DateTime), N'{"SucceededAt":"2024-10-10T09:38:11.1696897Z","PerformanceDuration":"1835","Latency":"84"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
ALTER TABLE [dbo].[CarrierReports]  WITH CHECK ADD  CONSTRAINT [FK_CarrierReports_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrierReports] CHECK CONSTRAINT [FK_CarrierReports_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[Carriers]  WITH CHECK ADD  CONSTRAINT [FK_Carriers_CarrierConfigurations_CarrierConfigurationId] FOREIGN KEY([CarrierConfigurationId])
REFERENCES [dbo].[CarrierConfigurations] ([CarrierConfigurationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carriers] CHECK CONSTRAINT [FK_Carriers_CarrierConfigurations_CarrierConfigurationId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Carriers_CarrierId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
