USE [master]
GO
/****** Object:  Database [Remember]    Script Date: 23/10/2020 09:50:17 ******/
CREATE DATABASE [Remember]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Remember', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Remember.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Remember_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Remember_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Remember] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Remember].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Remember] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Remember] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Remember] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Remember] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Remember] SET ARITHABORT OFF 
GO
ALTER DATABASE [Remember] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Remember] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Remember] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Remember] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Remember] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Remember] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Remember] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Remember] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Remember] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Remember] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Remember] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Remember] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Remember] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Remember] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Remember] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Remember] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Remember] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Remember] SET RECOVERY FULL 
GO
ALTER DATABASE [Remember] SET  MULTI_USER 
GO
ALTER DATABASE [Remember] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Remember] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Remember] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Remember] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Remember] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Remember', N'ON'
GO
ALTER DATABASE [Remember] SET QUERY_STORE = OFF
GO
USE [Remember]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23/10/2020 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[codeCategory] [int] IDENTITY(1,1) NOT NULL,
	[nameCategory] [nvarchar](30) NULL,
 CONSTRAINT [PK__Categori__D41A01F603317E3D] PRIMARY KEY CLUSTERED 
(
	[codeCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_to_shop]    Script Date: 23/10/2020 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_to_shop](
	[codeCTS] [int] IDENTITY(1,1) NOT NULL,
	[codeShop] [int] NOT NULL,
	[codeCategory] [int] NOT NULL,
 CONSTRAINT [PK__Category__9EEB588C07020F21] PRIMARY KEY CLUSTERED 
(
	[codeCTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Searches]    Script Date: 23/10/2020 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Searches](
	[codeSearch] [int] IDENTITY(1,1) NOT NULL,
	[codeUser] [int] NOT NULL,
	[nameProduct] [nvarchar](30) NULL,
	[codeCategory] [int] NOT NULL,
	[status] [int] NOT NULL,
	[codeShop] [int] NULL,
	[distance] [int] NULL,
 CONSTRAINT [PK__Searches__DAB09389108B795B] PRIMARY KEY CLUSTERED 
(
	[codeSearch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 23/10/2020 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[codeShop] [int] IDENTITY(1,1) NOT NULL,
	[nameShop] [nvarchar](20) NOT NULL,
	[passwordShop] [varchar](4) NOT NULL,
	[phoneShop] [varchar](10) NULL,
	[mailShop] [nvarchar](30) NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[fromHour] [varchar](5) NULL,
	[toHour] [varchar](5) NULL,
	[addressString] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Shops__709F00427F60ED59] PRIMARY KEY CLUSTERED 
(
	[codeShop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23/10/2020 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[codeUser] [int] IDENTITY(1,1) NOT NULL,
	[nameUser] [nvarchar](20) NOT NULL,
	[phoneUser] [varchar](10) NULL,
	[mailUser] [nvarchar](30) NOT NULL,
	[passwordUser] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Users__66CA1DB50CBAE877] PRIMARY KEY CLUSTERED 
(
	[codeUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (1, N'בגדי נשים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (2, N'בגדי ילדים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (3, N'כלי נגינה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (4, N'מכשירי כתיבה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (5, N'אוכל')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (6, N'מוצרי מזון')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (7, N'כלי בית')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (8, N'כלי גינה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (9, N'מוצרי אפייה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (10, N'תכשיטים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (12, N'אומנות')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (13, N'אופניים וציוד רכיבה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (14, N'אספנות')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (15, N'ביגוד ואופנה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (16, N'חגים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (17, N'יודאיקה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (18, N'כלי נגינה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (19, N'כלי עבודה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (20, N'כלים סנטריים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (21, N'לבית ולמשפחה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (22, N'לגינה ולחצר')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (23, N'לתינוק ולילד')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (24, N'מוצרי חשמל')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (25, N'מוצרי טבק')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (26, N'מחשבים וציוד נלווה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (27, N'מנויים וכרטיסים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (28, N'מצלמות וצילום')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (29, N'סטוקים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (30, N'סטריאו ובידור')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (31, N'סלולרי')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (32, N'ספורט ימי ')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (33, N'ציוד למטייל ולמתגייס')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (34, N'ציוד לעסקים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (35, N'ציוד רפואי\סיעודי')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (36, N'קונסולות משחק')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (37, N'קוסמטיקה וטיפוח')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (38, N'ריהוט')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (40, N'מוצרי חלב')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (41, N'יד שניה')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (42, N'שעונים ותכשיטים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (43, N'תיירות ונופש')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (44, N'פרחים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (45, N'בגדי גברים')
GO
INSERT [dbo].[Categories] ([codeCategory], [nameCategory]) VALUES (46, N'בגדי תינוקים')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Category_to_shop] ON 
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (6, 14, 26)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (7, 14, 30)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (8, 14, 31)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (9, 14, 28)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (13, 16, 4)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (14, 16, 12)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (15, 16, 29)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (21, 18, 1)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (22, 18, 2)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (23, 18, 10)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (24, 18, 15)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (25, 18, 23)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (44, 17, 5)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (45, 17, 6)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (46, 17, 9)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (47, 17, 29)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (48, 17, 40)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (49, 17, 4)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (50, 17, 16)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (51, 17, 44)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (79, 11, 7)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (80, 11, 8)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (81, 11, 19)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (87, 15, 5)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (88, 15, 6)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (89, 15, 9)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (90, 15, 40)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (91, 15, 44)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (93, 2, 17)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (94, 13, 3)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (95, 13, 30)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (108, 19, 5)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (113, 1, 9)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (114, 1, 8)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (115, 21, 5)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (116, 21, 4)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (117, 22, 2)
GO
INSERT [dbo].[Category_to_shop] ([codeCTS], [codeShop], [codeCategory]) VALUES (118, 22, 46)
GO
SET IDENTITY_INSERT [dbo].[Category_to_shop] OFF
GO
SET IDENTITY_INSERT [dbo].[Searches] ON 
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (1, 2, N'וניל', 9, 1, 1, NULL)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (2, 1, N'שמן', 9, 1, 1, NULL)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (3, 1, N'סוכר', 8, 1, 1, NULL)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (4, 2, N'מלח', 9, 0, NULL, NULL)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (40, 1, N'לחם', 5, 1, 21, 735)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (41, 1, N'עפרון', 4, 1, 17, 1559)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (42, 1, N'כובע', 2, 1, 18, 2304)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (43, 1, N'מקלדת', 26, 0, NULL, 1990)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (44, 1, N'uu', 8, 1, 1, 2480)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (45, 1, N'qq', 2, 1, 18, 2402)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (46, 1, N'az', 15, 1, 18, 2186)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (47, 1, N'1122', 1, 2, NULL, 2520)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (48, 1, N'3', 1, 1, 18, 2500)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (49, 1, N'zx', 5, 0, NULL, 50)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (50, 1, N'z', 2, 1, 18, 2245)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (51, 1, N'קפוצון', 2, 1, 22, 4284)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (52, 1, N'מכנסיים', 2, 1, 22, 2578)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (53, 1, N'כובע', 2, 1, 22, 2578)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (54, 1, N'לל', 2, 2, 18, 2578)
GO
INSERT [dbo].[Searches] ([codeSearch], [codeUser], [nameProduct], [codeCategory], [status], [codeShop], [distance]) VALUES (55, 1, N'חח', 2, 2, 18, 2418)
GO
SET IDENTITY_INSERT [dbo].[Searches] OFF
GO
SET IDENTITY_INSERT [dbo].[Shops] ON 
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (1, N'מלכי נגינה', N'123', N'0556789223', N'malka789223@gmail.com', 32.0884274, 34.836800499999981, N'08:00', N'18:30', N'הושע 14, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (2, N'שרי', N'450', N'0556789223', N'sari0556772365@gmail.com', 32.0819798, 34.832418899999993, N'10:00', N'13:30', N'הרב דסלר 10, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (4, N'malka greenwald', N'1111', N'0556772365', N'hiigf@gmail.com', 12, 12, N'null', NULL, N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (7, N'yeloow', N'147', N'0258025825', N'y@gmail.com', 66, 22, NULL, NULL, N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (8, N'יש', N'222', N'0258745874', N'yesh@gmail.com', 56455.1254, 565.323, NULL, NULL, N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (10, N'כל בו', N'1234', N'023959955', N'1234@gmail.com', 8253.86568, 8523.66, N'05:00', N'07:00', N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (11, N'טמבור', N'369', N'0528547896', N't@gmail.com', 32.086637, 34.829819999999927, N'07:00', N'17:00', N'רבי עקיבא 65, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (12, N'בגדים לכל', N'4444', N'0502587458', N'b@gmail.com', 9848.256, 595.95959, N'10:00', N'22:00', N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (13, N'מוזיקלי', N'4747', N'036154785', N'm@gmail.com', 32.4718343, 34.995714700000008, N'15:00', N'17:30', N'רחוב ירושלים 5, פרדס חנה כרכור, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (14, N'סלולרכל', N'9999', N'036478596', N's@gmail.com', 12852.8555, 485325, N'10:00', N'15:30', N'aa')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (15, N'מכולת אלי', N'9696', N'0504187458', N'eli@gmail.com', 32.0820479, 34.831475899999987, N'06:00', N'16:30', N'הרב דסלר 3, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (16, N'לגן ולמורה', N'321', N'036198745', N'citygan@gmail.com', 32.0799384, 34.832990099999961, N'11:00', N'21:00', N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (17, N'נתיב החסד', N'8888', N'0528746696', N'native@gmail.com', 32.082249400000009, 34.838375499999984, N'07:30', N'21:30', N'הרב מלצר 15, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (18, N'בזאר שטראוס', N'000', N'0521478521', N'shtraus@gmail.com', 32.0867993, 34.830027599999994, N'11:00', N'23:00', N'a')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (19, N'איזה יופי', N'457', N'5470527625', N'89u8@gmail.com', 32.332954, 34.86228159999996, NULL, NULL, N'החשמונאים 12, נתניה, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (21, N'מכולת הושע', N'999', N'067483738', N'hoshoa@gmail.com', 32.0885047, 34.835883599999988, NULL, NULL, N'הושע 2, בני ברק, ישראל')
GO
INSERT [dbo].[Shops] ([codeShop], [nameShop], [passwordShop], [phoneShop], [mailShop], [latitude], [longitude], [fromHour], [toHour], [addressString]) VALUES (22, N'תינוקי', N'9090', N'0473827167', N'tinoki@co.il', 32.0877026, 34.835782999999992, NULL, NULL, N'הרב ש"ך 24, בני ברק, ישראל')
GO
SET IDENTITY_INSERT [dbo].[Shops] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([codeUser], [nameUser], [phoneUser], [mailUser], [passwordUser]) VALUES (1, N'sari', N'0556772365', N'sari0556772365@gmail.com', N'123')
GO
INSERT [dbo].[Users] ([codeUser], [nameUser], [phoneUser], [mailUser], [passwordUser]) VALUES (2, N'malki', N'0556789223', N'malka789223@gmail.com', N'456')
GO
INSERT [dbo].[Users] ([codeUser], [nameUser], [phoneUser], [mailUser], [passwordUser]) VALUES (3, N'גילה', N'0527689574', N'gila@gmail.com', N'123456')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Category_to_shop]  WITH CHECK ADD  CONSTRAINT [fk_constraint1] FOREIGN KEY([codeShop])
REFERENCES [dbo].[Shops] ([codeShop])
GO
ALTER TABLE [dbo].[Category_to_shop] CHECK CONSTRAINT [fk_constraint1]
GO
ALTER TABLE [dbo].[Category_to_shop]  WITH CHECK ADD  CONSTRAINT [fk_constraint2] FOREIGN KEY([codeCategory])
REFERENCES [dbo].[Categories] ([codeCategory])
GO
ALTER TABLE [dbo].[Category_to_shop] CHECK CONSTRAINT [fk_constraint2]
GO
ALTER TABLE [dbo].[Searches]  WITH CHECK ADD  CONSTRAINT [fk_constraint5] FOREIGN KEY([codeCategory])
REFERENCES [dbo].[Categories] ([codeCategory])
GO
ALTER TABLE [dbo].[Searches] CHECK CONSTRAINT [fk_constraint5]
GO
ALTER TABLE [dbo].[Searches]  WITH CHECK ADD  CONSTRAINT [fk_constraint6] FOREIGN KEY([codeUser])
REFERENCES [dbo].[Users] ([codeUser])
GO
ALTER TABLE [dbo].[Searches] CHECK CONSTRAINT [fk_constraint6]
GO
ALTER TABLE [dbo].[Searches]  WITH CHECK ADD  CONSTRAINT [fk_constraint7] FOREIGN KEY([codeShop])
REFERENCES [dbo].[Shops] ([codeShop])
GO
ALTER TABLE [dbo].[Searches] CHECK CONSTRAINT [fk_constraint7]
GO
USE [master]
GO
ALTER DATABASE [Remember] SET  READ_WRITE 
GO
