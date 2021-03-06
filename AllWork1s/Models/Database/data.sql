USE [master]
GO
/****** Object:  Database [DataWork]    Script Date: 11/16/2020 10:38:24 AM ******/
CREATE DATABASE [DataWork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataWork', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataWork.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataWork_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataWork_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DataWork] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataWork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataWork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataWork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataWork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataWork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataWork] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataWork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataWork] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DataWork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataWork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataWork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataWork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataWork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataWork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataWork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataWork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataWork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataWork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataWork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataWork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataWork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataWork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataWork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataWork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataWork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataWork] SET  MULTI_USER 
GO
ALTER DATABASE [DataWork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataWork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataWork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataWork] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DataWork]
GO
/****** Object:  User [IIS APPPOOL\tanhuynh]    Script Date: 11/16/2020 10:38:24 AM ******/
CREATE USER [IIS APPPOOL\tanhuynh] FOR LOGIN [IIS APPPOOL\tanhuynh] WITH DEFAULT_SCHEMA=[db_owner]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 11/16/2020 10:38:24 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\tanhuynh]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Body]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Body](
	[body_id] [int] IDENTITY(1,1) NOT NULL,
	[body_title] [nvarchar](100) NULL,
	[body_body] [nvarchar](100) NULL,
	[body_version] [int] NULL,
 CONSTRAINT [PK_Body] PRIMARY KEY CLUSTERED 
(
	[body_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Career]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[career_id] [int] IDENTITY(1,1) NOT NULL,
	[career_name] [nvarchar](300) NULL,
	[career_view] [int] NULL,
	[career_datecreated] [datetime] NULL,
 CONSTRAINT [PK_Career] PRIMARY KEY CLUSTERED 
(
	[career_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cv]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cv](
	[cv_id] [int] IDENTITY(1,1) NOT NULL,
	[cv_fullname] [nvarchar](200) NULL,
	[cv_location] [nvarchar](200) NULL,
	[cv_bird] [datetime] NULL,
	[cv_sex] [int] NULL,
	[cv_phone] [varchar](50) NULL,
	[cv_email] [nvarchar](200) NULL,
	[cv_address] [nvarchar](200) NULL,
	[cv_linkfc] [nvarchar](300) NULL,
	[cv_target] [nvarchar](max) NULL,
	[cv_datebegineducation] [datetime] NULL,
	[cv_dateendeducation] [datetime] NULL,
	[cv_contenteducation] [nvarchar](max) NULL,
	[cv_datebeginexp] [datetime] NULL,
	[cv_dateendexp] [datetime] NULL,
	[cv_contentexp] [nvarchar](max) NULL,
	[cv_datebeginexptwo] [date] NULL,
	[cv_dateendexptwo] [date] NULL,
	[cv_contentexptwo] [nvarchar](max) NULL,
	[cv_datebeginactivate] [datetime] NULL,
	[cv_dateendactivate] [datetime] NULL,
	[cv_contentactivate] [nvarchar](max) NULL,
	[cv_contentcertificate] [nvarchar](max) NULL,
	[cv_contentreward] [nvarchar](max) NULL,
	[cv_english] [nvarchar](max) NULL,
	[cv_IT] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[cv_numbertheme] [int] NULL,
	[cv_yearre] [nvarchar](50) NULL,
	[cv_yearcerti] [nvarchar](50) NULL,
	[cv_schools] [nvarchar](200) NULL,
	[cv_industrystory] [nvarchar](200) NULL,
	[cv_species] [int] NULL,
	[cv_point] [varchar](100) NULL,
	[cv_roleexp] [nvarchar](100) NULL,
	[cv_roleexptwo] [nvarchar](100) NULL,
	[cv_activate] [bit] NULL,
	[cv_option] [bit] NULL,
	[cv_datecreated] [datetime] NULL,
	[career_id] [int] NULL,
	[cv_schoolname] [nvarchar](100) NULL,
	[cv_companyname] [nvarchar](100) NULL,
	[cv_companynametwo] [nvarchar](100) NULL,
	[cv_images] [nvarchar](2000) NULL,
	[cv_theme] [int] NULL,
	[cv_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_Cv] PRIMARY KEY CLUSTERED 
(
	[cv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employer](
	[employer_id] [int] IDENTITY(1,1) NOT NULL,
	[employer_email] [varchar](100) NULL,
	[employer_pass] [varchar](200) NULL,
	[employer_fullname] [varchar](100) NULL,
	[employer_sex] [int] NULL,
	[employer_company] [nvarchar](150) NULL,
	[employer_position] [int] NULL,
	[employer_address] [nvarchar](300) NULL,
	[employer_phone] [varchar](15) NULL,
	[employer_vacancies] [int] NULL,
	[employer_token] [nvarchar](max) NULL,
	[employer_datelogin] [datetime] NULL,
	[employer_datecreated] [datetime] NULL,
	[employer_activate] [bit] NULL,
	[employer_status] [bit] NULL,
	[employer_logo] [nvarchar](max) NULL,
	[employer_specialized] [nvarchar](200) NULL,
	[employer_version] [int] NULL,
	[employer_option] [bit] NULL,
	[employer_personalpage] [bit] NULL,
	[employer_name] [nvarchar](200) NULL,
	[employer_introduce] [nvarchar](max) NULL,
	[employer_favourite] [nvarchar](max) NULL,
	[employer_linkfc] [nvarchar](300) NULL,
	[employer_recruitment] [nvarchar](500) NULL,
	[employer_addressmain] [nvarchar](200) NULL,
	[employer_ifamemapmain] [nvarchar](max) NULL,
	[employer_addresstwo] [nvarchar](200) NULL,
	[employer_ifamemaptwo] [nvarchar](max) NULL,
	[employer_addressthree] [nvarchar](200) NULL,
	[employer_ifamemapthree] [nvarchar](max) NULL,
	[employer_province] [nvarchar](200) NULL,
	[employer_pricemin] [int] NULL,
	[employer_pricemax] [int] NULL,
	[employer_symbol] [nvarchar](50) NULL,
	[employer_recrequirement] [nvarchar](2000) NULL,
	[province_id] [int] NULL,
	[career_id] [int] NULL,
	[employer_limit] [int] NULL,
	[employer_emailcompany] [varchar](100) NULL,
	[employer_banner] [nvarchar](1000) NULL,
	[employer_scale] [int] NULL,
	[employer_bonus] [nvarchar](300) NULL,
	[employer_foundedyear] [int] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[employer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Favourite]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite](
	[favourite_id] [int] IDENTITY(1,1) NOT NULL,
	[favourite_datecreate] [datetime] NULL,
	[work_id] [int] NULL,
	[user_id] [int] NULL,
	[favourite_delete] [bit] NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[favourite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Form]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[form_id] [int] IDENTITY(1,1) NOT NULL,
	[form_name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Layout]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layout](
	[layout_id] [int] IDENTITY(1,1) NOT NULL,
	[ct_1] [nvarchar](max) NULL,
	[ct_2] [nvarchar](max) NULL,
	[ct_3] [nvarchar](max) NULL,
	[ct_4] [nvarchar](max) NULL,
	[ct_5] [nvarchar](max) NULL,
	[ct_6] [nvarchar](max) NULL,
	[ct_7] [nvarchar](max) NULL,
	[ct_8] [nvarchar](max) NULL,
	[ct_9] [nvarchar](max) NULL,
	[ct_10] [nvarchar](max) NULL,
	[ct_11] [nvarchar](max) NULL,
	[ct_12] [nvarchar](max) NULL,
	[ct_13] [nvarchar](max) NULL,
	[ct_14] [nvarchar](max) NULL,
	[ct_15] [nvarchar](max) NULL,
	[ct_16] [nvarchar](max) NULL,
 CONSTRAINT [PK_Layout] PRIMARY KEY CLUSTERED 
(
	[layout_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[like_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[work_id] [int] NULL,
	[like_datecreated] [datetime] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[province_id] [int] IDENTITY(1,1) NOT NULL,
	[province_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Submit]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submit](
	[submit_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[work_id] [int] NULL,
	[submit_datecreated] [datetime] NULL,
	[cv_id] [int] NULL,
	[submit_ViewEm] [bit] NULL,
	[submit_Check] [bit] NULL,
 CONSTRAINT [PK_Submit] PRIMARY KEY CLUSTERED 
(
	[submit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Theme]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[theme_id] [int] IDENTITY(1,1) NOT NULL,
	[cv_id] [int] NULL,
	[theme_datecreate] [int] NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[theme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_login] [varchar](60) NULL,
	[user_pass] [varchar](255) NULL,
	[user_nicename] [varchar](50) NULL,
	[user_email] [varchar](100) NULL,
	[user_datecreated] [datetime] NULL,
	[user_token] [varchar](200) NULL,
	[user_role] [int] NULL,
	[user_datelogin] [datetime] NULL,
	[user_activate] [bit] NULL,
	[user_image] [nvarchar](max) NULL,
	[user_industryloving] [nvarchar](max) NULL,
	[user_skill] [nvarchar](max) NULL,
	[user_interests] [nvarchar](max) NULL,
	[user_view] [bit] NULL,
	[career_id] [int] NULL,
	[user_delete] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Work]    Script Date: 11/16/2020 10:38:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[work_id] [int] IDENTITY(1,1) NOT NULL,
	[work_name] [nvarchar](120) NULL,
	[work_image] [nvarchar](max) NULL,
	[work_deadline] [datetime] NULL,
	[work_description] [nvarchar](max) NULL,
	[work_request] [nvarchar](max) NULL,
	[work_benefit] [nvarchar](max) NULL,
	[work_address] [nvarchar](120) NULL,
	[work_moneyf] [int] NULL,
	[work_moneye] [int] NULL,
	[work_amount] [int] NULL,
	[work_activate] [bit] NULL,
	[work_option] [bit] NULL,
	[work_view] [int] NULL,
	[work_love] [int] NULL,
	[work_map] [nvarchar](max) NULL,
	[work_datecreated] [datetime] NULL,
	[work_dateexpired] [datetime] NULL,
	[work_datesend] [datetime] NULL,
	[work_imagetwo] [nvarchar](max) NULL,
	[work_imgathree] [nvarchar](max) NULL,
	[employer_id] [int] NULL,
	[work_pricemin] [int] NULL,
	[work_pricemax] [int] NULL,
	[work_symbol] [nvarchar](20) NULL,
	[work_sex] [int] NULL,
	[work_format] [bit] NULL,
	[work_yearsofexp] [int] NULL,
	[work_province] [int] NULL,
	[work_ifamemap] [nvarchar](max) NULL,
	[work_note] [nvarchar](max) NULL,
	[work_delete] [bit] NULL,
	[work_spam] [bit] NULL,
	[province_id] [int] NULL,
	[form_id] [int] NULL,
	[career_id] [int] NULL,
	[work_del] [bit] NULL,
	[work_dateupdate] [datetime] NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[work_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Body] ON 

INSERT [dbo].[Body] ([body_id], [body_title], [body_body], [body_version]) VALUES (1, N'Tìm kiếm việc làm nhanh nhất với AllWork1s', N'Hệ thống tìm kiếm việc làm nhanh chóng, dễ sử dụng với bất kỳ nghành nghề nào', 1)
INSERT [dbo].[Body] ([body_id], [body_title], [body_body], [body_version]) VALUES (2, N'Thich thi tim', N'hay z', 2)
SET IDENTITY_INSERT [dbo].[Body] OFF
SET IDENTITY_INSERT [dbo].[Career] ON 

INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (1, N'An toàn lao động', 1, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (2, N'Bán hàng kỹ thuật', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (3, N'Bán lẻ - bán sỉ', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (4, N'Báo chí - truyển hình', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (5, N'Bảo hiểm', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (6, N'Bảo trì - Sữa chữa', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (7, N'Bất động sản', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (8, N'Biên - Biên dịch', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (9, N'Bưu chính viễn thông', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (10, N'Chứng khoán - Vàng - Ngoại tệ', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (11, N'Cơ khí - Chế tạo - Tự động hóa', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (12, N'Công nghệ cao', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (13, N'Công nghệ Ô tô', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (14, N'Công nghệ thông tin', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (15, N'Dầu khí - hóa chất', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (17, N'Dệt may - Da giày', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (18, N'Địa chất - Khoán sản', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (19, N'Dịch vụ khách hàng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (20, N'Điện - Điện tử - Điện lạnh', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (21, N'Điện tử viễn thông', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (22, N'Du lịch', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (23, N'Dược phẩm - Công nghệ sinh học', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (24, N'Giáo dục - Đào tạo', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (25, N'Hàng Cao cấp', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (26, N'Hàng gia dụng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (27, N'Hàng hải', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (28, N'Hàng không', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (29, N'Hàng tiêu dụng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (30, N'Hành chính / Văn phòng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (31, N'Hóa học - Sinh học', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (32, N'Hoạch định - Dự án', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (33, N'In ấn - Xuất bản', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (34, N'IT Phần cứng - Mạng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (35, N'IT Phần mềm', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (36, N'Kế toán - Kiểm toán', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (37, N'Khách sạn - nhà hàng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (38, N'Kiến trúc', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (39, N'Kinh doanh - Bán hàng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (40, N'Logistics', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (41, N'Luật - Pháp lý', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (42, N'Marketing - Truyền thông - Quảng cáo', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (43, N'Môi trường - Xử lý chất thải', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (44, N'Mỹ phẩm - Trang sức', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (45, N'Mỹ thuật - Nghệ thuật - Điện ảnh', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (46, N'Ngân hàng - Tài chính', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (47, N'Nghành nghề khác', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (48, N'NGO - Phi chính phủ - Phi lợi nhuận', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (49, N'Nhân sự', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (50, N'Nông - Lâm - Ngư nghiệp', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (51, N'Phi chính phủ - Phi lợi nhuận', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (52, N'Quản lý chất lượng (QA-QC)', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (53, N'Quản lý điều hành', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (54, N'Sản phẩm công nghiệp', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (55, N'Sản xuất', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (56, N'Spa - Làm đẹp', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (57, N'Tài chính - Đầu tư', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (58, N'Thiết kế đồ họa', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (59, N'Thiết kế nội thất', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (60, N'Thời trang', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (61, N'Thư ký - Trợ lý', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (62, N'Thực phẩm - Đồ uống', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (63, N'Tổ chức sự kiện - Quà tặng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (64, N'Tư vấn', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (65, N'Vận tải - Kho vận', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (66, N'Xây dựng', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (67, N'Xuất nhập khẩu', NULL, NULL)
INSERT [dbo].[Career] ([career_id], [career_name], [career_view], [career_datecreated]) VALUES (68, N'Y tế - Y dược', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Career] OFF
SET IDENTITY_INSERT [dbo].[Cv] ON 

INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (116, N'huynh minh tan', N'Backend', CAST(0x0000AC2A00000000 AS DateTime), 1, N'0924404019', N'huynhminhtan4019@gmail.com', N'25/5 phường Hiệp An', N'https://www.facebook.com/profile.php?id=10000935812525', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', CAST(0x0000AC2A00000000 AS DateTime), CAST(0x0000AC3A00000000 AS DateTime), N'Hoàn thành rất tốt học tập tại trường và điểm rất cao môn website.', CAST(0x0000AC4200000000 AS DateTime), CAST(0x0000AC3000000000 AS DateTime), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x89410B00 AS Date), CAST(0x99410B00 AS Date), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x0000AC3400000000 AS DateTime), CAST(0x0000AC3200000000 AS DateTime), N'-Tập hợp các món quà và phân phát tới người vô gia cư.- Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.
                                                        ', N'-CCNA,Anh văn Illa
                                                        ', N'Nhân viên xuất sắc năm công ty AllWork1s
                                                        ', N'Giao tiếp tốt,...v.v
                                                                ', N'Thành thạo work,excel,...
                                                        ', 13, 1, N'2020', N'2020', N'Đại học AllWork1s', N'CNTT', 1, N'7.0', N'Coder', N'Coder', 1, 1, CAST(0x0000AC2E00000000 AS DateTime), 35, NULL, N'AllWork1s', N'AllWork1s', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, CAST(0x0000AC2E00000000 AS DateTime))
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (141, N'huynh minh tan', N'Backend', CAST(0x0000AC2A00000000 AS DateTime), 1, N'0924404019', N'huynhminhtan4019@gmail.com', N'25/5 phường Hiệp An', N'https://www.facebook.com/profile.php?id=10000935812525', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', CAST(0x0000AC2A00000000 AS DateTime), CAST(0x0000AC3A00000000 AS DateTime), N'2020-09-18 00:00:00.000', CAST(0x0000AC4200000000 AS DateTime), CAST(0x0000AC4200000000 AS DateTime), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x89410B00 AS Date), CAST(0x89410B00 AS Date), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x0000AC3400000000 AS DateTime), CAST(0x0000AC3400000000 AS DateTime), N'-Tập hợp các món quà và phân phát tới người vô gia cư.- Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.
                                                        ', N'-CCNA,Anh văn Illa
                                                        ', N'Nhân viên xuất sắc năm công ty AllWork1s
                                                        ', N'Giao tiếp tốt,...v.v
                                                                ', N'Thành thạo work,excel,...
                                                        ', 13, 1, N'2020', N'2020', N'Đại học AllWork1s', N'CNTT', 1, N'7.0', N'Coder', N'Coder', 1, 1, CAST(0x0000AC2E00000000 AS DateTime), 35, NULL, N'AllWork1s', N'AllWork1s', N'32644928_2062295167425734_7686714948314988544_o.jpg', 2, CAST(0x0000AC2E00000000 AS DateTime))
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (142, N'huynh minh tan', N'Backend', CAST(0x0000AC2A00000000 AS DateTime), 1, N'0924404019', N'huynhminhtan4019@gmail.com', N'25/5 phường Hiệp An', N'https://www.facebook.com/profile.php?id=10000935812525', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', CAST(0x0000AC2A00000000 AS DateTime), CAST(0x0000AC3A00000000 AS DateTime), N'2020-09-18 00:00:00.000', CAST(0x0000AC4200000000 AS DateTime), CAST(0x0000AC4200000000 AS DateTime), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x89410B00 AS Date), CAST(0x89410B00 AS Date), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x0000AC3400000000 AS DateTime), CAST(0x0000AC3400000000 AS DateTime), N'-Tập hợp các món quà và phân phát tới người vô gia cư.- Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.
                                                        ', N'-CCNA,Anh văn Illa
                                                        ', N'Nhân viên xuất sắc năm công ty AllWork1s
                                                        ', N'Giao tiếp tốt,...v.v
                                                                ', N'Thành thạo work,excel,...
                                                        ', 13, 1, N'2020', N'2020', N'Đại học AllWork1s', N'CNTT', 1, N'7.0', N'Coder', N'Coder', 1, 1, CAST(0x0000AC2E00000000 AS DateTime), 35, NULL, N'AllWork1s', N'AllWork1s', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, CAST(0x0000AC2E00000000 AS DateTime))
INSERT [dbo].[Cv] ([cv_id], [cv_fullname], [cv_location], [cv_bird], [cv_sex], [cv_phone], [cv_email], [cv_address], [cv_linkfc], [cv_target], [cv_datebegineducation], [cv_dateendeducation], [cv_contenteducation], [cv_datebeginexp], [cv_dateendexp], [cv_contentexp], [cv_datebeginexptwo], [cv_dateendexptwo], [cv_contentexptwo], [cv_datebeginactivate], [cv_dateendactivate], [cv_contentactivate], [cv_contentcertificate], [cv_contentreward], [cv_english], [cv_IT], [user_id], [cv_numbertheme], [cv_yearre], [cv_yearcerti], [cv_schools], [cv_industrystory], [cv_species], [cv_point], [cv_roleexp], [cv_roleexptwo], [cv_activate], [cv_option], [cv_datecreated], [career_id], [cv_schoolname], [cv_companyname], [cv_companynametwo], [cv_images], [cv_theme], [cv_dateupdate]) VALUES (143, N'huynh minh tan', N'Nhân viên', CAST(0x0000ABE500000000 AS DateTime), 1, N'0867531058', N'quangtran3699@gmail.com', N'25/5 phường Hiệp An', N'https://www.facebook.com/profile.php?id=10000935812525', N'Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.', CAST(0x0000AC5000000000 AS DateTime), CAST(0x0000AC4900000000 AS DateTime), N'2020-09-18 00:00:00.000', CAST(0x0000AC4200000000 AS DateTime), CAST(0x0000AC4F00000000 AS DateTime), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0xA4410B00 AS Date), CAST(0xA1410B00 AS Date), N'- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,...- Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.
                                                                ', CAST(0x0000AC4600000000 AS DateTime), CAST(0x0000AC3300000000 AS DateTime), N'-Tập hợp các món quà và phân phát tới người vô gia cư.- Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.
                                                        ', N'-CCNA,Anh văn Illa
                                                        ', N'Nhân viên xuất sắc năm công ty AllWork1s
                                                        ', N'Giao tiếp tốt,...v.v
                                                                ', N'Thành thạo work,excel,...
                                                        ', 21, 1, N'2020', N'2020', N'Đại học TDMU', N'CNTT', 3, N'9.0', N'Coder', N'Coder', 1, 1, CAST(0x0000AC2E00000000 AS DateTime), 35, NULL, N'AllWork1s', N'AllWork1s', N'32644928_2062295167425734_7686714948314988544_o.jpg', 1, CAST(0x0000AC2E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Cv] OFF
SET IDENTITY_INSERT [dbo].[Employer] ON 

INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (26, N'lg@gmail.com', N'123', NULL, NULL, N'LG Development Center Vietnam', 1, NULL, N'0924404019', NULL, NULL, NULL, CAST(0x0000AC340101CE97 AS DateTime), 1, NULL, N'lg-development-center-vietnam-logo.png', NULL, 3, 1, 1, N'LG', N'<p>With the advent of the Smart Car era, LG hopes to become an innovative partner in vehicle electrification through development of advanced technology components. Vehicle Component Solutions Company (VS) is developing a wide variety of highly competitive products. Our products include In Vehicle Infotainment system such as Telematics, AV Navigation, Display Audio, Integrated Display System, and Advanced Driver Assistant System (ADAS) called ‘intelligent safe’, and other convenient devices. Our company is also focusing on vehicle engineering, to include Powertrain, electronic vehicle Battery Packs, etc. and is providing them to major customers in the world-wide vehicle industry.<br><br>We offer an environment that enables colleagues to demonstrate their capabilities, focus on their work and create value.&nbsp;</p>', N'<p>• 13th month salary + incentive bonus ( total remuneration package: up to 16-month salary);</p><p>• Lunch allowance of VND800,000/month;</p><p>• 5 working days/ week: Mon – Fri;</p><p>•&nbsp;Annual salary review;</p><p>•&nbsp;12 days of annual leave &amp; 7 days of company holidays;</p><p>•&nbsp;On-site &amp; training opportunities in Korea;</p><p>•&nbsp;Staff trip, sporty clubs;</p><p>•&nbsp;Monthly budget for team building activities…</p>', NULL, N'Back end,...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 35, 250, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (27, N'fpt@gmail.com', N'123', NULL, NULL, N'FPT', NULL, NULL, N'0924404019', NULL, NULL, NULL, CAST(0x0000AC340101CE97 AS DateTime), 1, NULL, N'fpt-software-logo.png', N'Phần mềm', 3, 1, 1, N'FPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 35, 250, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (29, N'aia@gmail.com', N'123', NULL, NULL, N'AIA', NULL, NULL, N'0924404019', NULL, NULL, NULL, CAST(0x0000AC340101CE97 AS DateTime), 1, NULL, N'cong-ty-tnhh-bao-hiem-nhan-tho-aia-viet-nam-5bcd8713a72ef_rs.jpg', NULL, 3, 1, 1, N'AIA', N'<p>AIA Việt Nam là thành viên của Tập đoàn AIA - tập đoàn bảo hiểm nhân thọ độc lập, có nguồn gốc châu Á lớn nhất thế giới được niêm yết.</p><p>&nbsp;</p><p>Được thành lập vào năm 2000 với mục tiêu bảo vệ sự phồn thịnh và an toàn tài chính cho người dân Việt Nam, AIA Việt Nam hiện đang là một trong những công ty bảo hiểm nhân thọ hàng đầu và là thương hiệu được khách hàng và công chúng tin cậy.</p>', N'<p>AIA Việt Nam là thành viên của Tập đoàn AIA - tập đoàn bảo hiểm nhân thọ độc lập, có nguồn gốc châu Á lớn nhất thế giới được niêm yết.</p><p>&nbsp;</p><p>Được thành lập vào năm 2000 với mục tiêu bảo vệ sự phồn thịnh và an toàn tài chính cho người dân Việt Nam, AIA Việt Nam hiện đang là một trong những công ty bảo hiểm nhân thọ hàng đầu và là thương hiệu được khách hàng và công chúng tin cậy.</p>', NULL, N'Back end,...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 5, 250, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (30, N'first@gmail.com', N'123', NULL, NULL, N'Công ty TNHH First International - Sàn BĐS', NULL, NULL, N'0924404019', NULL, N'31edbe20-c469-4ecf-9809-ff78f5d0ccd2', NULL, CAST(0x0000AC340109FE52 AS DateTime), 1, NULL, N'cong-ty-tnhh-first-international-san-bds-first-homes-5f3f98c7008a5.jpg', NULL, 3, 1, 1, N'First', N'<p>Chuyên kinh doanh các mặt hàng về mỹ phẩm, chăm sóc sắc đẹp.</p>', N'<p>Chuyên kinh doanh các mặt hàng về mỹ phẩm, chăm sóc sắc đẹp.</p>', NULL, N'Back end,...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 7, 250, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (31, N'anphuquoc@gmail.com', N'123', NULL, NULL, N'Công ty tư vấn dịch vụ visa, du học An Phú', NULL, NULL, N'0924404019', NULL, N'bbdd5b0b-d0d1-4725-aab1-8c43753bda1b', NULL, CAST(0x0000AC34011F9A4C AS DateTime), 1, NULL, N'cty-tnhh-an-phu-quoc-5abca8a2d3b33_rs.jpg', N'Du lịch', 3, 1, 1, N'Tấn ', N'<p>Công ty An Phú Quốc được thành lập từ năm 2003, hoạt động trong lĩnh vực tư vấn giáo dục, thủ tục xin visa, và du lịch quốc tế, là đại diện cho các trường đại học, cao đẳng danh tiếng đến từ các nước như Anh, Pháp, Nhật, Mỹ, Úc, New Zealand và Cannada…An Phú Quốc luôn giữ mối quan hệ thân thiết với đối tác là các trường đại học nước ngoài, để có thể nắm bắt tình hình học tập của sinh viên từ đó cung cấp dịch vụ tư vấn ngày càng hiệu quả hơn.</p><p>Để đáp ứng nhu cầu phát triển trong lĩnh vực tư vấn giáo dục. An Phú Quốc đặt ra mục tiêu xây dựng đội ngũ nhân viên có kỹ năng tư vấn tốt, có nhiệt huyết và tố chất thích hợp với tính chất công việc.</p><p>Công ty An Phú Quốc có chế độ lương thưởng rất cạnh tranh xứng đáng với khả năng làm việc của nhân viên, hướng tới sự gắn bó lâu dài</p>', N'<p>Ngon</p>', NULL, N'Back end,...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 22, 250, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (32, N'alma@gmail.com', N'123', NULL, NULL, N'Công ty TNHH Khu Du Lịch Vịnh Thiên Đường (ALMA)', NULL, NULL, N'0924404019', NULL, N'65a9b31e-3fdd-485c-a3fe-e6edbd0ce739', NULL, CAST(0x0000AC3A00C4C119 AS DateTime), 1, NULL, N'cong-ty-tnhh-khu-du-lich-vinh-thien-duong-alma-591a6f04eae05_rs.jpg', N'Du lịch', 3, 1, 1, N'ALMA', N'<p>Công ty TNHH Khu Du Lịch Vịnh Thiên Đường (ALMA) hoạt động trong lĩnh vực du lịch nghỉ dưỡng. Chính thức ra mắt với công chúng từ năm 2013, trải qua quá trình phát triển, Công ty TNHH Khu Du Lịch Vịnh Thiên Đường – Công ty ALMA bao gồm 4 chi nhánh hoạt động tại các thành phố lớn là Hà Nội (72 Landmark Keangnam và Capital Trần Hưng Đạo), Hồ Chí Minh và Nha Trang với tổng số hơn 1000 nhân sự.&nbsp;&nbsp;<br>&nbsp;</p><p>Với mong muốn mang đến cho các gia đình Việt Nam những phút giây đoàn viên hạnh phúc hằng năm, ngài Igal Ahouvi – Lãnh sự Danh dự Việt Nam tại Israel đã đầu tư xây dựng dự án Khu nghỉ dưỡng ALMA sang trọng bao gồm nhiều tiện ích cao cấp. Thông qua dự án ALMA, Công ty TNHH Khu Du Lịch Vịnh Thiên Đường là đơn vị tiên phong mang đến Việt Nam mô hình “Sở hữu Kỳ nghỉ” nơi các thế hệ gia đình có thể quây quần bên nhau và tận hưởng không gian nghỉ dưỡng đẳng cấp trong suốt nhiều năm&nbsp;</p><p>Sứ mệnh của chúng tôi là mang tới những kỳ nghỉ hạnh phúc trọn đời với tiêu chuẩn quốc tế cho các gia đình Việt Nam thông qua khu nghỉ dưỡng đặc biệt - ALMA.</p><p>VỀ ĐỘI NGŨ NHÂN SỰ</p><p>“Tài sản quý giá nhất của chúng tôi là con người”</p><p>Với vai trò là nhà tiên phong tại Việt Nam trong lĩnh vực Sở hữu kỳ nghỉ, ALMA tự hào là nơi quy tụ các chuyên gia giàu kinh nghiệm đến từ các quốc gia có nền công nghiệp Sở hữu kỳ nghỉ phát triển trên thế giới như Anh, Mỹ, Israel, Italy…</p><p>Sự đa dạng về kinh nghiệm, chuyên môn và văn hóa của đội ngũ nhân viên đã giúp ALMA trở thành đơn vị dẫn đầu tại Việt Nam về quy mô, tính chuyên nghiệp, chất lượng cao cấp, cũng như sự phù hợp của mô hình Sở hữu kỳ nghỉ đối với các gia đình Việt.&nbsp;</p>', N'<p>Mô hình “sở hữu kỳ nghỉ” đã ra đời và phát triển từ những năm 60 của thế kỷ XX, du nhập vào Mỹ trong những năm 70 và đã trở thành một mô hình du lịch phổ biến khắp thế giới với rất nhiều tổ chức trao đổi kỳ nghỉ lớn và sự tham gia của nhiều tập đoàn khách sạn uy tín trên toàn cầu như: Marriott, Hilton,… Tính tới thời điểm hiện nay, đã có hơn 6.000 resort tại 101 quốc gia tham gia vào mô hình nghỉ dưỡng này.<br>Sở Hữu Kỳ Nghỉ là một mô hình nghỉ dưỡng mang lại quyền sở hữu không gian nghỉ dưỡng cho các gia đình vào mỗi kỳ nghỉ cố định hàng năm, trong đó, người sử dụng sẽ sở hữu một hoặc vài tuần nghỉ trong một khu nghỉ dưỡng kéo dài suốt đời dự án.<br><br>ALMA RESORT<br>Toạ lạc tại vị trí đắc địa trên nền diện tích 30ha tại Bãi Dài, một trong những bãi biển đẹp nhất Việt Nam tại Cam Lâm, Khánh Hoà, khu nghỉ dưỡng ALMA tựa như một ốc đảo xanh yên bình với nét kiến trúc đầy ấn tượng mang âm hưởng nhiệt đới.<br>Với sứ mệnh kết nối yêu thương và lan toả những giá trị gia đình hạnh phúc, ALMA là khu nghỉ dưỡng đầu tiên tại Việt Nam được xây dựng và vận hành theo mô hình Sở hữu kỳ nghỉ được ưa chuộng tại nhiều quốc gia trên thế giới. Tại ALMA, các gia đình được tận hưởng đầy đủ các tiện ích của một khu nghỉ dưỡng 5* hướng biển bao gồm hệ thống nhà hàng sang trọng, công viên nước thu nhỏ, rạp chiếu phim, nhà hát ngoài trời, sân golf, trung tâm thể thao, khu vui chơi cho trẻ em, quán bar và hơn thế nữa. Không chỉ dừng lại ở các tiện ích nghỉ dưỡng đa dạng và phong phú, ALMA còn sở hữu gần 600 căn hộ và biệt thự hướng biển bao trọn vẻ đẹp của Bãi Dài nên thơ.</p>', NULL, N'Du lịch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 22, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (33, N'quantran3699@gmail.com', N'123321123', NULL, NULL, N'DKtech', NULL, NULL, N'0867531058', NULL, N'38b28efa-33ec-49f4-a2b6-871f80959a62', NULL, CAST(0x0000AC3F014984D8 AS DateTime), 1, NULL, N'aa1.png', N'Dầu cắt gọt kim loại', 3, NULL, 1, N'khoa', N'<p>Nêu giới thiệu sơ lượt về công ty.</p>', N'<p>Nêu nội dung mà bạn nghĩ ứng viên sẽ thích.</p>', NULL, N'nhân viên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (34, N'vnpt@gmail.com', N'123', NULL, NULL, N'Tập đoàn Bưu chính viễn thông Việt Nam (VNPT)', NULL, NULL, N'0924404019', NULL, N'b09f498f-238d-4d57-b59a-a7e12232e366', NULL, CAST(0x0000AC44013EC131 AS DateTime), 1, NULL, N'10916680.png', N'Viển thông, phần mềm', 3, NULL, 1, N'vnpt', N'<p>Tập đoàn Bưu chính Viễn thông Việt Nam (VNPT) - Nhà cung cấp dịch vụ viễn thông, dịch vụ số hàng đầu Việt Nam - Tập đoàn có danh tiếng về khả năng lãnh đạo, đổi mới chuyên môn xuất sắc. Nhân viên của chúng tôi sử dụng sự sáng tạo và tài năng để phát minh ra những giải pháp mới, đáp ứng nhu cầu mới và cung cấp sản phẩm/dịch vụvụ hiệu quả nhất trong ngành. Với hơn 70 năm xây dựng và phát triển gắn bó trên thị trường Viễn thông Việt NamNam, với 63 tỉnh thành có mạng lưới di động phủ sóng: hơn 20 triệu thuê bao di động, 11 triệu thuê bao băng rộng cố định, 10 triệu thuê bao điện thoại cố định VNPT đặt mục tiêu trở thành nhà cung cấp dịch vụ số hàng đầu Việt Nam và trung tâm dịch vụ Số (Digital Hub) của Châu Á trong những năm tới, để đạt được mục tiêu đó VNPT chuyển dịch nhanh cơ cấu doanh thu từ các dịch vụ viễn thông truyền thống sang dịch vụ số, Công nghệ thông tin VNPT đặt mục tiêu làm nòng cốt để ngành viễn thông và công nghệ thông tin tại Việt Nam phát triển nhanh và bền vững, cạnh tranh và hội nhập kinh tế Quốc tế có hiệu quả</p>', N'<p>Tập đoàn Bưu chính Viễn thông Việt Nam (VNPT) - Nhà cung cấp dịch vụ viễn thông, dịch vụ số hàng đầu Việt Nam - Tập đoàn có danh tiếng về khả năng lãnh đạo, đổi mới chuyên môn xuất sắc. Nhân viên của chúng tôi sử dụng sự sáng tạo và tài năng để phát minh ra những giải pháp mới, đáp ứng nhu cầu mới và cung cấp sản phẩm/dịch vụvụ hiệu quả nhất trong ngành. Với hơn 70 năm xây dựng và phát triển gắn bó trên thị trường Viễn thông Việt NamNam, với 63 tỉnh thành có mạng lưới di động phủ sóng: hơn 20 triệu thuê bao di động, 11 triệu thuê bao băng rộng cố định, 10 triệu thuê bao điện thoại cố định VNPT đặt mục tiêu trở thành nhà cung cấp dịch vụ số hàng đầu Việt Nam và trung tâm dịch vụ Số (Digital Hub) của Châu Á trong những năm tới, để đạt được mục tiêu đó VNPT chuyển dịch nhanh cơ cấu doanh thu từ các dịch vụ viễn thông truyền thống sang dịch vụ số, Công nghệ thông tin VNPT đặt mục tiêu làm nòng cốt để ngành viễn thông và công nghệ thông tin tại Việt Nam phát triển nhanh và bền vững, cạnh tranh và hội nhập kinh tế Quốc tế có hiệu quả</p>', NULL, N'không', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 35, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (42, N'patado@gmail.com', N'123', NULL, NULL, N'CÔNG TY CỔ PHẦN GIÁO DỤC EDUTECH VIỆT NAM', NULL, NULL, N'0924404019', NULL, N'82d7bc86-f49e-4ceb-95c3-5d03416cc352', NULL, CAST(0x0000AC44013EC131 AS DateTime), 1, NULL, N'cong-ty-co-phan-giao-duc-edutech-viet-nam-5f7559d418421 (1).jpg', NULL, 1, 1, 1, N'Patado', N'Hệ thống tiếng anh trực tuyến Patado (Công ty con của Công ty cổ phần giáo dục Edutech Việt Nam)  tiên phong trong việc xây dựng đội ngũ giáo viên Việt Nam 7.5+ IELTS và đạt tiêu chuẩn châu âu về nghiệp vụ sư phạm ” Set thông tin khoảng 15 giáo viên, có nút kéo về 2 bên để xem trực tiếp “', N'HỌC ONLINE GIAO TIẾP VỚI GIÁO VIÊN IELTS 7.5＋

Mô hình lớp học IELTS hiện đại 2 thầy - 1 trò

Với mô hình 2 giáo viên chuyên môn hóa giảng dạy từng nhóm kỹ năng ( Nghe- Nói & Đọc Viết ), học viên được tiếp cận các phong cách

Giáo viên đạt chuẩn 7.5+ IELTS

Đội ngũ 300+ Giáo viên Việt chuẩn Âu đạt 7.5+ IELTS và tối thiểu 3 năm kinh nghiệm luyện thi

Cam kết tài trợ 100% chi phí thi IELTS

Với con số 63,8% học viên vượt mục tiêu ban đầu, Patado tự tin cam kết tài trợ 100% lệ phí thi IELTS trị giá 4.750.000đ nếu học viên không hoàn thành mục tiêu', NULL, NULL, N'21 Đặng Tiến Đông, Đống Đa, Hà Nội', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 24, 10, N'patado@gmail.com', N'Giao-duc-Han-Quoc.jpg', 20000, N'30000000000 triệu', 2010)
INSERT [dbo].[Employer] ([employer_id], [employer_email], [employer_pass], [employer_fullname], [employer_sex], [employer_company], [employer_position], [employer_address], [employer_phone], [employer_vacancies], [employer_token], [employer_datelogin], [employer_datecreated], [employer_activate], [employer_status], [employer_logo], [employer_specialized], [employer_version], [employer_option], [employer_personalpage], [employer_name], [employer_introduce], [employer_favourite], [employer_linkfc], [employer_recruitment], [employer_addressmain], [employer_ifamemapmain], [employer_addresstwo], [employer_ifamemaptwo], [employer_addressthree], [employer_ifamemapthree], [employer_province], [employer_pricemin], [employer_pricemax], [employer_symbol], [employer_recrequirement], [province_id], [career_id], [employer_limit], [employer_emailcompany], [employer_banner], [employer_scale], [employer_bonus], [employer_foundedyear]) VALUES (43, N'shinhan@gmail.com', N'123', NULL, NULL, N'CÔNG TY TÀI CHÍNH TNHH MTV SHINHAN VIỆT NAM', NULL, NULL, N'0924404019', NULL, N'2de5a02c-46f3-4037-8e1c-f5b5469af85d', NULL, CAST(0x0000AC5B012D6191 AS DateTime), 1, NULL, N'fb0c41058f4a20996d6616db1bad9150-5f6017ca919f5.jpg', NULL, 1, 1, 1, N'shinhan', N'Tập đoàn Tài chính Shinhan

Tập đoàn Tài chính Shinhan được xem như tập đoàn tiên phong về việc nắm giữ tài chính tại Hàn Quốc. Tập đoàn được thành lập trên nền tảng của Ngân hàng Shinhan, Quỹ Đầu tư Shinhan và Công ty Quản lý Đầu tư Shinhan.

Chiến lược kinh doanh của Tập đoàn Tài chính Shinhan là cung cấp cho khách hàng dịch vụ đa dạng, tiện lợi và thỏa đáng thông qua sự phân bố chuyên biệt và hiệu quả. Bên cạnh đó, tập đoàn luôn nỗ lực đa dạng hóa phạm vi kinh doanh, cũng như cập nhật những công nghệ tài chính mới nhất để trở thành tập đoàn tài chính dẫn đầu trên quy mô toàn cầu.', N'Tập đoàn Tài chính Shinhan

Tập đoàn Tài chính Shinhan được xem như tập đoàn tiên phong về việc nắm giữ tài chính tại Hàn Quốc. Tập đoàn được thành lập trên nền tảng của Ngân hàng Shinhan, Quỹ Đầu tư Shinhan và Công ty Quản lý Đầu tư Shinhan.

Chiến lược kinh doanh của Tập đoàn Tài chính Shinhan là cung cấp cho khách hàng dịch vụ đa dạng, tiện lợi và thỏa đáng thông qua sự phân bố chuyên biệt và hiệu quả. Bên cạnh đó, tập đoàn luôn nỗ lực đa dạng hóa phạm vi kinh doanh, cũng như cập nhật những công nghệ tài chính mới nhất để trở thành tập đoàn tài chính dẫn đầu trên quy mô toàn cầu.', NULL, NULL, N'Tầng 14&15 Tòa nhà Pico Plaza, số 20 đường Cộng Hòa, Phường 12, Quận Tân Bình, Thành phố Hồ Chí Minh, Việt Nam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, 57, 10, N'shinhan@gmail.com', N'th.jpg', 20000, N'30000000000 triệu', 2012)
SET IDENTITY_INSERT [dbo].[Employer] OFF
SET IDENTITY_INSERT [dbo].[Favourite] ON 

INSERT [dbo].[Favourite] ([favourite_id], [favourite_datecreate], [work_id], [user_id], [favourite_delete]) VALUES (15, CAST(0x0000AC68014B5C12 AS DateTime), 46, 13, 0)
INSERT [dbo].[Favourite] ([favourite_id], [favourite_datecreate], [work_id], [user_id], [favourite_delete]) VALUES (20, CAST(0x0000AC68014CC5B2 AS DateTime), 51, 13, 0)
SET IDENTITY_INSERT [dbo].[Favourite] OFF
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (1, N'Tất cả loại hình')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (2, N'Toàn thời gian')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (3, N'Bán thời gian')
INSERT [dbo].[Form] ([form_id], [form_name]) VALUES (4, N'Thực tập sinh')
SET IDENTITY_INSERT [dbo].[Form] OFF
SET IDENTITY_INSERT [dbo].[Layout] ON 

INSERT [dbo].[Layout] ([layout_id], [ct_1], [ct_2], [ct_3], [ct_4], [ct_5], [ct_6], [ct_7], [ct_8], [ct_9], [ct_10], [ct_11], [ct_12], [ct_13], [ct_14], [ct_15], [ct_16]) VALUES (2, N'Sỡ hữu ngay CV xịn cùng việc làm ước mơ', N'TÌM VIỆC KHÓ - CÓ ALLWORK1S', N'Hoàn thiện hồ sơ xin việc', N'Chuẩn bị hồ sơ xin việc ấn tượng & chuyên nghiệp với Công cụ viết CV số 1 Việt Nam.', N'Chủ động tìm việc', N'Hệ thống gợi ý các công việc phù hợp với CV của bạn, chỉ 1 click để ứng tuyển nhanh chóng.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Layout] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (1, N'An Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (2, N'Bà Rịa - Vũng Tàu
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (3, N'Bắc Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (4, N'Bắc Kạn
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (5, N'Bạc Liêu
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (6, N'Bắc Ninh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (7, N'Bến Tre
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (8, N'Bình Định
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (9, N'Bình Dương
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (10, N'Bình Phước
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (11, N'Bình Thuận
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (12, N'Cà Mau
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (13, N'Cần Thơ
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (14, N'Cao Bằng
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (15, N'Đà Nẵng
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (16, N'Đắk Lắk
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (17, N'Đắk Nông
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (18, N'Điện Biên
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (19, N'Đồng Nai
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (20, N'Đồng Tháp
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (21, N'Gia Lai
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (22, N'Hà Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (23, N'Hà Nam
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (24, N'Hà Nội
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (25, N'Hà Tĩnh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (26, N'Hải Dương
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (27, N'Hải Phòng
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (28, N'Hậu Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (29, N'Hòa Bình
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (30, N'Hưng Yên
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (31, N'Khánh Hòa
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (32, N'Kiên Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (33, N'Kon Tum
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (34, N'Lai Châu
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (35, N'Lâm Đồng
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (36, N'Lạng Sơn
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (37, N'Lào Cai
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (38, N'Long An
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (39, N'Nam Định
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (40, N'Nghệ An
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (41, N'Ninh Bình
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (42, N'Ninh Thuận
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (43, N'Phú Thọ
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (44, N'Phú Yên
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (45, N'Quảng Bình
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (46, N'Quảng Nam
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (47, N'Quảng Ngãi
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (48, N'Quảng Ninh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (49, N'Quảng Trị
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (50, N'Sóc Trăng
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (51, N'Sơn La
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (52, N'Tây Ninh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (53, N'Thái Bình
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (54, N'Thái Nguyên
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (55, N'Thanh Hóa
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (56, N'Thừa Thiên Huế
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (57, N'Tiền Giang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (58, N'Thành phố Hồ Chí Minh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (59, N'Trà Vinh
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (60, N'Tuyên Quang
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (61, N'Vĩnh Long
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (62, N'Vĩnh Phúc
')
INSERT [dbo].[Province] ([province_id], [province_name]) VALUES (63, N'Yên Bái
')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Submit] ON 

INSERT [dbo].[Submit] ([submit_id], [user_id], [work_id], [submit_datecreated], [cv_id], [submit_ViewEm], [submit_Check]) VALUES (27, 13, 59, CAST(0x0000AC690122EC2C AS DateTime), 141, NULL, NULL)
INSERT [dbo].[Submit] ([submit_id], [user_id], [work_id], [submit_datecreated], [cv_id], [submit_ViewEm], [submit_Check]) VALUES (28, 13, 50, CAST(0x0000AC690123013A AS DateTime), 142, NULL, NULL)
INSERT [dbo].[Submit] ([submit_id], [user_id], [work_id], [submit_datecreated], [cv_id], [submit_ViewEm], [submit_Check]) VALUES (29, 13, 48, CAST(0x0000AC690127FD79 AS DateTime), 116, NULL, NULL)
INSERT [dbo].[Submit] ([submit_id], [user_id], [work_id], [submit_datecreated], [cv_id], [submit_ViewEm], [submit_Check]) VALUES (30, 13, 46, CAST(0x0000AC6A00D182A9 AS DateTime), 116, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Submit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (13, NULL, N'123', N'Tanhuynh1999', N'huynhminhtan4019@gmail.com', CAST(0x0000AC28015387B1 AS DateTime), N'af25925d-97aa-4319-912f-33282cc28d4a', 1, CAST(0x0000AC5400F7E6AC AS DateTime), 1, NULL, N'Công nghệ thông tin', N'Code webiste, code c#, fontend, backend ', N'Thích code website, đi chơi', 1, 2, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (19, NULL, N'123', N'123', N'huynhminhtan4019123@gmail.com', CAST(0x0000AC2F00FA599F AS DateTime), N'e2324f2e-6df7-4537-95b5-d7c5b43a1ad9', 1, CAST(0x0000AC4000D19CEC AS DateTime), 1, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (20, NULL, N'123', N't?n', N'laptring@gmail.com', CAST(0x0000AC3B013E8E29 AS DateTime), N'2a8e1939-1d77-4426-ae9b-118b37492fe4', 1, CAST(0x0000AC4000D19CEC AS DateTime), 1, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (21, NULL, N'123', N'Khoa', N'quangtran3699@gmail.com', CAST(0x0000AC3F014B6F75 AS DateTime), N'ed4ea4b9-97e4-43a3-8323-83ef979b42f1', 1, CAST(0x0000AC400100E0EC AS DateTime), 1, NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (22, NULL, N'123', N'tan', N'tanhuynh99@gmail.com', CAST(0x0000AC4000CFDD94 AS DateTime), N'e3f90a05-1de5-4c97-9afa-10028f05e179', 1, CAST(0x0000AC4000D6ABB3 AS DateTime), 1, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (23, NULL, N'123', N'tan', N'tanhuynh1999@gmail.com', CAST(0x0000AC4000D265E9 AS DateTime), N'dc0f65d7-25f2-4c2c-865f-4c51944a9169', 1, CAST(0x0000AC4000D265E9 AS DateTime), 1, NULL, NULL, NULL, NULL, 1, 3, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (24, NULL, N'123', N'T?n', N'tanhuynh999@gmail.com', CAST(0x0000AC4000D6CD10 AS DateTime), N'be2b2e96-68a1-44ce-a4ad-d1fd065959b1', 1, CAST(0x0000AC4601394FD0 AS DateTime), 1, NULL, NULL, NULL, NULL, 1, 13, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (25, NULL, N'123', N'tanhuynh', N'huynhminhtan40@gmail.com', CAST(0x0000AC4B0189A310 AS DateTime), N'8239ecea-2b88-419d-9677-62fcea79dfe1', 1, CAST(0x0000AC4B0189A310 AS DateTime), 1, NULL, NULL, NULL, NULL, 1, 1, 0)
INSERT [dbo].[User] ([user_id], [user_login], [user_pass], [user_nicename], [user_email], [user_datecreated], [user_token], [user_role], [user_datelogin], [user_activate], [user_image], [user_industryloving], [user_skill], [user_interests], [user_view], [career_id], [user_delete]) VALUES (32, N'huynhminhtan4019@gmail.com', N'121212', N't?n hu?nh', N'huynhminhtan12211@gmail.com', CAST(0x0000AC6600B10B70 AS DateTime), NULL, 1, CAST(0x0000AC6600B10B70 AS DateTime), 1, N'62pexels-mark-plötz-2790391.jpg', N'Du lịch', N'Giao tiếp tốt ngoại ngữ', N'Đi chơi, du lịch', 1, 17, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Work] ON 

INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (46, N' Test Engineer - Up to $1500 ', NULL, CAST(0x0000AC4300000000 AS DateTime), N'<p>LG Electronics Vehicle Component Company focuses on eco-friendly automotive components. The VC Company produces high-quality in-car infotainment systems that deliver both information and entertainment on-the-go for many of the world‘s biggest automobile brands.<br><br>We, LG Vehicle Component Solutions Development Center Vietnam (LG VS DCV), conduct core R&amp;D activities, and various product reliability tests in support of our vehicle component business.<br><br>As member of Validation Test&nbsp;team, you will be responsible for&nbsp;testing&nbsp;software for automotive products as below:<br><br>• Software testing car Infotainment including Cluster, AVN-audio video navigation and Telematics;<br>• Analyzing the requirements obtained from customer;<br>• Making test plan;<br>• Mainly concentrating on executing test, updating test cases;<br>• Making test design and test cases;<br>• Reporting and tracking bugs daily;<br>• Working closely with Validation Team;<br>• Co-operating with development team.</p>', N'<p>• Bachelor degree in Information Technology, Computer Science, Computer Engineering, Electronic Engineering, Telecommunication Engineering or equivalent</p><p>• Working&nbsp;experience in software testing;</p><p>• Self-motivated and proactive;</p><p>• Good at solving problems;</p><p>• Good ability to research and quickly adapt to new technical methods;</p><p>• Logical thinking and design analysis ability;</p><p>• Automotive (especially IVI: In Vehicle Infotainment) and ASPICE experience is a plus;</p><p>• Automation test experience is a plus;</p><p>• Good English &amp; MS Office skills.</p><p><i><strong>Highly experienced candidates will be considered for Senior/ Leader positions.</strong></i></p>', N'<p><strong>What we offer:</strong><br><br>• 5 working days/ week: Mon – Fri with flexible time;</p><p>• Lunch allowance of VND 800,000/month;</p><p>• Transportation allowance of VND 500,000/month;</p><p>•&nbsp;Additional healthcare &amp; accident insurance;</p><p>• 13th month salary + incentive bonus ( total remuneration package: up to 16-month salary);</p><p>• Annual salary review;</p><p>• 12 days of annual leave &amp; 7 days of company holidays;</p><p>• On-site &amp; training opportunities in Korea;</p><p>• Staff trip, sporty clubs;</p><p>• Monthly budget for team building activities…</p>', N'Tầng 34, tòa nhà Keangnam Landmark 72, đường Phạm Hùng, Nam Tu Liem, Ha Noi', NULL, NULL, 79, 1, 1, 1, 4, NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 26, 20, 40, N'Triệu', 3, 1, 1, 2, NULL, NULL, 0, NULL, 58, 3, 35, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (47, N'C/C++ Software Engineer ', NULL, CAST(0x0000AC3C00000000 AS DateTime), N'<p>Trung tâm phát triển giải pháp về linh kiện cho xe hơi LG (LG VS DCV) chuyên cung cấp các hệ thống thông tin giải trí chất lương cao trên ô tô cho nhiều thương hiệu ô tô lớn trên toàn thế giới &amp; tiến hành các hoạt động nghiên cứu phát triển và đảm bảo chất lượng cho nhiều sản phẩm của nghiệp vụ sản xuất linh kiện trên xe hơi.&nbsp;<br><br>Là thành viên của bộ phận phát triển phần mềm, bạn sẽ nghiên cứu và phát triển các ứng dụng thông tin giải trí trên ô tô, các hệ thống thông tin dẫn đường (AVN), hệ thống thông tin và cảnh báo về tình trạng xe (Cluster) và các hệ thống viễn thông (Telematics):<br><br>• Phát triển các sản phẩm automotive và các công nghệ liên quan (bao gồm các ứng dụng tương tác với người dùng (HMI Applications), các HMI frameworks, các phương thức giao tiếp giữa HMI framework và middleware phía dưới…);<br>• Đảm bảo phát triển phần mềm đúng hạn và đảm bảo chất lượng của sản phẩm;<br>• Báo cáo công việc với các cấp quản lý.</p>', N'<p>• Tốt nghiệp đại học các chuyên ngành Công nghệ thông tin, Khoa học máy tính, Kỹ thuật máy tính, Điện, Điện tử viễn thông, Toán, Cơ tin và các ngành liên quan đến công nghệ thông tin và phần mềm;<br>• Yêu thích và có mục tiêu phát triển sự nghiệp trong lĩnh vực phần mềm cho ôtô.<br>• Có kinh nghiệm phát triển phần mềm sử dụng ngôn ngữ C++;<br>• Có kiến thức tốt về phân tích, thiết kế và lập trình hướng đối tượng;<br>• Có kinh nghiệm làm việc với các hệ thống phần mềm lớn.<br><br><strong>* Các ứng viên tài năng và có kinh nghiệm tốt sẽ được cân nhắc cho vị trí Senior hoặc Leader.</strong><br>&nbsp;</p>', N'<p>QUYỀN LỢI:</p><p><br>• 5 ngày làm việc/ tuần: từ thứ 2 đến thứ 6 &amp; áp dụng thời gian làm việc linh hoạt;</p><p>• Trợ cấp ăn trưa VND 800,000/ tháng;</p><p>•&nbsp;Trợ cấp đi lại VND 500,000/ tháng;</p><p>•&nbsp;Bảo hiểm sức khỏe &amp; tai nạn;</p><p>• Tháng lương 13 + thưởng thành tích (tổng thu nhập cạnh tranh lên tới 16 tháng lương);</p><p>• Xét tăng lương hàng năm;</p><p>• 12 ngày phép &amp; 7 ngày nghỉ lễ của công ty;</p><p>• Cơ hội làm việc on-site ngắn hoặc dài hạn &amp; cơ hội đào tạo tại Hàn Quốc;</p><p>• Du lịch cùng công ty, các câu lạc bộ thể dục thể thao;</p><p>• Quỹ dành cho hoạt động ngoại khóa hàng tháng…</p>', N'Nam Ky Khoi Nghia, Ngu Hanh Son, Da Nang', NULL, NULL, 79, 1, 1, 2, 2, NULL, CAST(0x0000AC330147B5DA AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 26, 20, 30, N'Triệu', 3, 1, 1, 1, NULL, NULL, 0, NULL, 58, 2, 35, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (48, N' Android Software Engineer - Up to $2000 ', NULL, CAST(0x0000AC3400000000 AS DateTime), N'<p>The LG Electronics Vehicle Component Solutions Company focuses on commercializing autonomous and environmentally responsible automotive components and core solutions based on LG’s proprietary technologies. Its Smart Solutions business includes a diverse lineup of offerings such as infotainment systems (audio video, audio video navigation, etc.), advanced driver assistant system, connectivity and other intelligent products for many of the world‘s biggest automobile brands.<br><br>We, LG Vehicle Component Solutions Development Center Vietnam (VS DCV), conduct core R&amp;D activities, and various product reliability tests in support of our vehicle component business.<br><br>As member of Software Development team, you will be responsible for researching and developing applications for Car Infotainment, AVN (Audio Video Navigation) system, Cluster and Telematics as below:<br><br>• Develop automotive products and technologies (included HMI Applications, HMI frameworks, Protocols to interface with HMI framework and middleware …);<br>• Responsible for software delivery to head quarter;<br>• Generate reports, communicate with local managements and head quarter.</p>', N'<p>• Bachelor degree in Information Technology, Computer Science, Computer Engineering, Electrical Engineering, Telecommunication Engineering, Mathematics, Mechanics and Informatics or equivalent.</p><p>• Strong motivation to develop career in automotive software field.</p><p>• 2+ years’ experience in <strong>Android service application development&nbsp;</strong>using either Java/Kotlin or C++.</p><p>• Having hands-on experiences in using at least one version control tool such as Git, gerrit.</p><p>• Having hands-on experiences in using JIRA, VLM, Collab.</p><p>&nbsp;</p><p>These skills would be considered as an advantage but not the must:</p><p><br><br>• Having experience in AVN (Audio-Video-Navigation) software development.</p><p>• Having experience in developing at Android framework layer.</p><p>• Having experience in Agile project, V-model software development.</p><p>• Having experience in developing at UML.</p><p>• Good communication in English &amp; Vietnamese.</p><p>• Ability to effectively present information to top management, public groups, and/or board of directors.</p>', N'<p>• 5 working days/ week: Mon – Fri with flexible time;</p><p>• Lunch allowance of VND 800,000/month;</p><p>• Transportation allowance of VND 500,000/month;</p><p>•&nbsp;Additional healthcare &amp; accident insurance;</p><p>• 13th month salary + incentive bonus ( total remuneration package: up to 16-month salary);</p><p>• Annual salary review;</p><p>• 12 days of annual leave &amp; 7 days of company holidays;</p><p>• On-site &amp; training opportunities in Korea;</p><p>• Staff trip, sporty clubs;</p><p>• Monthly budget for team building activities…</p>', N'Nam Ky Khoi Nghia, Ngu Hanh Son, Da Nang', NULL, NULL, 79, 1, 1, 3, 1, NULL, CAST(0x0000AC330148197D AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 26, 2, 3, N'$', 3, 1, 1, 1, NULL, NULL, 0, NULL, 58, 1, 35, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (50, N'Test Lead – Signing bonus up to 20M ', NULL, CAST(0x0000AC3400000000 AS DateTime), N'<ul><li>Create and execute testing strategy for each BOT. Consult other teams as needed</li><li>Manage tests cases in the approved tool (TFS/ADO/ADO)</li><li>Map Test Cases to PBIs</li><li>Report and monitor defects</li><li>Validate traceability of RPA BOT requirements to Test Cases, Test Results and Defects</li><li>Support Business Analyst with tracking UAT progress by tracking testing status, issues and defects report</li><li>Facilitate demos to Business Analyst, Functional Lead and Business SMEs</li><li>Create Testing Reports: Daily Testing Status, Test Closure Report once BOT has been successfully delivered</li><li>Comply with ASG QA standards</li></ul>', N'<ul><li>Have at least 3 years experienced working with Test Position</li><li>Have at least 2 years experienced at Test Lead position (or relevant position).</li><li>Certificate in quality assurance is a plus.</li><li>Previous experience in quality assurance or similar field.</li><li>Working knowledge of tools, methods, and concepts of quality assurance.</li><li>Solid knowledge of relevant regulatory standards.</li><li>Good communication skills, both verbal and written.</li><li>Excellent data collection and analysis skills.</li><li>Strong attention to detail.</li></ul>', N'<ul><li>Competitive salary and Award based on performance</li><li>Signing bonus: 10M (Test3), 15M (Test4), 20M (Test5)</li><li>Have opportunity to be promoted to the higher positions</li><li>Work and grow in professional environment</li><li>FPT Care and so many others benefits…</li></ul>', N'Nam Ky Khoi Nghia, Ngu Hanh Son, Da Nang', NULL, NULL, 79, 1, 1, 41, 3, NULL, CAST(0x0000AC3401153944 AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 27, 2000, 3000, N'$', 3, NULL, 0, 1, NULL, NULL, 0, NULL, 58, 2, 35, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (51, N'Nhân Viên Marketing', NULL, CAST(0x0000AC4200000000 AS DateTime), N'<p>• Xây dựng, Quản trị nội dung fan page facebook và website của công ty<br>&nbsp;</p><p>&nbsp;</p><p>• Theo dõi và phản hồi các comment, tin nhắn của Khách hàng trên Facebook</p><p>&nbsp;</p><p>• Nghiên cứu, theo dõi, thực hiện chạy quảng cáo Facebook Ads để đem lại Khách hàng mới cho công ty.</p><p>&nbsp;</p><p>• Liên hệ và theo dõi hợp đồng các chương trình hợp tác với các đối tác</p><p>&nbsp;</p><p>• Một số công việc khác theo yêu cầu của cấp trên</p>', N'<p>• Kỹ năng viết tốt, am hiểu về digital marketing<br>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>• Kỹ năng tin học văn phòng thành thạo và có thể làm việc độc lập</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>• Chăm chỉ, nhanh nhẹn, cẩn thận tỉ mỉ, có tinh thần học hỏi và học hỏi nhanh, có khả năng chịu áp lực công việc cao</p>', N'<p><strong>- Làm việc trong môi trường năng động, chuyên nghiệp có nhiều cơ hội thăng tiến.</strong></p><p><strong>- Cung cấp trang thiết bị đầy đủ để phục vụ công việc.&nbsp;</strong></p><p><strong>- Được đóng BHXH, BHYT, BHTN.&nbsp;</strong></p><p><strong>- Được hưởng các chính sách phúc lợi theo quy định của công ty.&nbsp;</strong></p><p><strong>- Được đào tạo, nâng cao nghiệp vụ thường xuyên.</strong></p>', N'22 Liên Trì, Hoàn Kiếm, Hà Nội ', NULL, NULL, 79, 1, 1, 2, 23, NULL, CAST(0x0000AC34012119D2 AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 31, 6, 15, N'Triệu', 1, NULL, 1, 2, NULL, NULL, 0, NULL, 58, 1, 22, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (54, N'NHÂN VIÊN ĐẶT LỊCH HẸN QUA ĐIỆN THOẠI - TELEMARKETING (THU NHẬP 9-15TR)', NULL, CAST(0x0000AC4200000000 AS DateTime), N'<p>- Gọi điện mời khách đến tham dự chương trình, sự kiện của công ty qua điện thoại theo data có sẵn</p><p>&nbsp;</p><p>- Báo cáo và cập nhật thông tin khách hàng đến Trưởng Bộ Phận.</p><p>&nbsp;</p><p>- Xử lý, theo dõi thông tin khách hàng đến tham dự sự kiện đúng thời gian</p><p>&nbsp;</p><p>- Đảm bảo chỉ tiêu số lượng khách hàng mà công ty đề ra.</p><p>&nbsp;</p><p>- Giờ làm việc: T2 - T7 (9h-17h30, nghỉ trưa 12h-13h30)</p><p>&nbsp;</p><p>- Địa điểm làm việc: Tầng 07, tòa nhà Capital, 109 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội.</p>', N'<p>- Giọng nói dễ nghe, không nói ngọng, nói lắp hay nói tiếng địa phương</p><p>&nbsp;</p><p>- Khả năng giao tiếp và xử lý tình huống tốt</p><p>&nbsp;</p><p>- Ưu tiên đã có kinh nghiệm làm telesales, tư vấn…</p><p>&nbsp;</p><p>- Không yêu cầu về bằng cấp, độ tuổi từ 18-35</p><p>&nbsp;</p><p>- Nhiệt tình, mong muốn làm việc gắn bó lâu dài</p>', N'<p>- Thu nhập từ 9 - 15 triệu / tháng (LCB 6 triệu/tháng + thưởng)</p><p>&nbsp;</p><p>- 19 ngày nghỉ nguyên lương / năm, làm việc theo giờ hành chính (1 ngày làm 7 tiếng), nghỉ Chủ Nhật</p><p>&nbsp;</p><p>- Đóng BH đầy đủ theo luật Lao động.</p><p>&nbsp;</p><p>- Lương thưởng tháng 13 và nhiều chế độ phúc lợi khác (kết hôn, sinh con, tang chế, sinh nhật)</p><p>&nbsp;</p><p>- Du lịch hàng năm</p>', N'Nam Ky Khoi Nghia, Ngu Hanh Son, Da Nang', NULL, NULL, 56, 1, 1, 3, 1, NULL, CAST(0x0000AC3A00C72047 AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 32, 8, 15, N'Triệu', 3, NULL, 2, 1, NULL, NULL, 0, NULL, 24, 3, 22, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (57, N'NHÂN VIÊN TƯ VẤN TÍN DỤNG - TELESALES - QUẬN TÂN BÌNH', NULL, CAST(0x0000AC7000000000 AS DateTime), N'<p>- Gọi tư vấn khách hàng khoản Vay Tiêu Dùng phù hợp (dựa trên data có sẵn được cung cấp)</p><p>+Tư vấn các gói vay tiêu dùng phù hợp cho khách hàng&nbsp;</p><p>+ Hướng dẫn khách hàng gửi hồ sơ theo yêu cầu và các thủ tục giấy tờ liên quan&nbsp;</p><p>+ Giải đáp thắc mắc, hỗ trợ khách hàng&nbsp;</p><p>-Thứ 2 –Thứ 6: 8h30 đến 17h30&nbsp;</p><p>-Thứ 7:8h30 đến 12h&nbsp;</p><p>-Địa chỉ: 20 Cộng Hòa, P.12, Q. Tân Bình</p>', N'<p>- Tinh thần trách nhiệm</p><p>- Chịu được áp lực cao&nbsp;</p><p>- Chuyên cần, chăm chỉ, chịu học hỏi&nbsp;</p><p>- Tỉ mỉ, cẩn thận, trung thực trong khâu lên hồ sơ&nbsp;</p><p>- Nam nữ từ: 18 - 27 tuổi</p>', N'<p>-Thu nhập: 7-10tr bao gồm:</p><p>-Thưởng chuyên cần: 520.000đ/ tháng ( Yêu cầu đi làm đúng và đủ ngày công quy định)&nbsp;</p><p>-Thưởng Quý: Từ 2.000.000 - 3.000.000đ/Quý&nbsp;</p><p>-Thưởng KPI: 1.000.000đ (điều kiện làm từ 3 tháng trở lên)&nbsp;</p><p>-Hoa hồng (1.000.000 đến 9.000.000/ tháng)&nbsp;</p><p>-Được tham gia BHXH, BHYT&nbsp;</p><p>-Tham gia Team Biulding, các hoạt động Công đoàn khác như tập Yoga, Học tiếng Anh,…</p>', N'Tầng 14&15 Tòa nhà Pico Plaza, số 20 đường Cộng Hòa, Phường 12, Quận Tân Bình, Thành phố Hồ Chí Minh, Việt Nam', NULL, NULL, 12, 1, 1, NULL, NULL, NULL, CAST(0x0000AC5B01308860 AS DateTime), NULL, CAST(0x0000AC3301471BAD AS DateTime), NULL, NULL, 43, 1000, 3000, N'$', 3, NULL, 2, NULL, NULL, NULL, 0, NULL, 58, 2, 46, 0, CAST(0x0000AC330147B5DA AS DateTime))
INSERT [dbo].[Work] ([work_id], [work_name], [work_image], [work_deadline], [work_description], [work_request], [work_benefit], [work_address], [work_moneyf], [work_moneye], [work_amount], [work_activate], [work_option], [work_view], [work_love], [work_map], [work_datecreated], [work_dateexpired], [work_datesend], [work_imagetwo], [work_imgathree], [employer_id], [work_pricemin], [work_pricemax], [work_symbol], [work_sex], [work_format], [work_yearsofexp], [work_province], [work_ifamemap], [work_note], [work_delete], [work_spam], [province_id], [form_id], [career_id], [work_del], [work_dateupdate]) VALUES (59, N'NHÂN VIÊN TƯ VẤN ĐẶT LỊCH HẸN - LÀM GIỜ HÀNH CHÍNH (THU NHẬP 9-12TRIỆU)', NULL, CAST(0x0000ACAC00000000 AS DateTime), N'<p>- Gọi điện mời khách đến tham dự chương trình, sự kiện của công ty qua điện thoại theo data có sẵn</p><p>&nbsp;</p><p>- Báo cáo và cập nhật thông tin khách hàng đến Trưởng Bộ Phận.</p><p>&nbsp;</p><p>- Xử lý, theo dõi thông tin khách hàng đến tham dự sự kiện đúng thời gian</p><p>&nbsp;</p><p>- Đảm bảo chỉ tiêu số lượng khách hàng mà công ty đề ra.</p><p>&nbsp;</p><p>- Giờ làm việc: T2 - T7 (9h-17h30, nghỉ trưa 12h-13h30)</p><p>&nbsp;</p><p>- Địa điểm làm việc: Tầng 07, tòa nhà Capital, 109 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội.</p>', N'<p>- Giọng nói dễ nghe, không nói ngọng, nói lắp hay nói tiếng địa phương</p><p>&nbsp;</p><p>- Khả năng giao tiếp và xử lý tình huống tốt</p><p>&nbsp;</p><p>- Ưu tiên đã có kinh nghiệm làm telesales, tư vấn…</p><p>&nbsp;</p><p>- Không yêu cầu về bằng cấp, độ tuổi từ 18-35</p><p>&nbsp;</p><p>- Nhiệt tình, mong muốn làm việc gắn bó lâu dài</p>', N'<p>- Thu nhập từ 9 - 15 triệu / tháng (LCB 6 triệu/tháng + thưởng)</p><p>- 19 ngày nghỉ nguyên lương / năm, làm việc theo giờ hành chính (1 ngày làm 7 tiếng), nghỉ Chủ Nhật</p><p>- Đóng BH đầy đủ theo luật Lao động.</p><p>- Lương thưởng tháng 13 và nhiều chế độ phúc lợi khác (kết hôn, sinh con, tang chế, sinh nhật)</p><p>- Du lịch hàng năm</p>', N'Tầng 7 & 15, tòa nhà Capital Tower, 109 Trần Hưng Đạo, Hà Nội, Việt Nam,', NULL, NULL, 12, 1, 1, 1, 1, NULL, CAST(0x0000AC5F013A5A8C AS DateTime), NULL, NULL, NULL, NULL, 32, 5000000, 9000000, N'Triệu', 3, NULL, 1, NULL, NULL, NULL, 0, NULL, 24, 2, 22, 0, CAST(0x0000AC330147B5DA AS DateTime))
SET IDENTITY_INSERT [dbo].[Work] OFF
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_Career] FOREIGN KEY([career_id])
REFERENCES [dbo].[Career] ([career_id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_Career]
GO
ALTER TABLE [dbo].[Cv]  WITH CHECK ADD  CONSTRAINT [FK_Cv_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Cv] CHECK CONSTRAINT [FK_Cv_User]
GO
ALTER TABLE [dbo].[Employer]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Career] FOREIGN KEY([career_id])
REFERENCES [dbo].[Career] ([career_id])
GO
ALTER TABLE [dbo].[Employer] CHECK CONSTRAINT [FK_Employer_Career]
GO
ALTER TABLE [dbo].[Employer]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Province] FOREIGN KEY([province_id])
REFERENCES [dbo].[Province] ([province_id])
GO
ALTER TABLE [dbo].[Employer] CHECK CONSTRAINT [FK_Employer_Province]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_User]
GO
ALTER TABLE [dbo].[Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[Favourite] CHECK CONSTRAINT [FK_Favourite_Work]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Work]
GO
ALTER TABLE [dbo].[Submit]  WITH CHECK ADD  CONSTRAINT [FK_Submit_Cv] FOREIGN KEY([cv_id])
REFERENCES [dbo].[Cv] ([cv_id])
GO
ALTER TABLE [dbo].[Submit] CHECK CONSTRAINT [FK_Submit_Cv]
GO
ALTER TABLE [dbo].[Submit]  WITH CHECK ADD  CONSTRAINT [FK_Submit_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Submit] CHECK CONSTRAINT [FK_Submit_User]
GO
ALTER TABLE [dbo].[Submit]  WITH CHECK ADD  CONSTRAINT [FK_Submit_Work] FOREIGN KEY([work_id])
REFERENCES [dbo].[Work] ([work_id])
GO
ALTER TABLE [dbo].[Submit] CHECK CONSTRAINT [FK_Submit_Work]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Career] FOREIGN KEY([career_id])
REFERENCES [dbo].[Career] ([career_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Career]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Career] FOREIGN KEY([career_id])
REFERENCES [dbo].[Career] ([career_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Career]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Employer] FOREIGN KEY([employer_id])
REFERENCES [dbo].[Employer] ([employer_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Employer]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Form] FOREIGN KEY([form_id])
REFERENCES [dbo].[Form] ([form_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Form]
GO
ALTER TABLE [dbo].[Work]  WITH CHECK ADD  CONSTRAINT [FK_Work_Province] FOREIGN KEY([province_id])
REFERENCES [dbo].[Province] ([province_id])
GO
ALTER TABLE [dbo].[Work] CHECK CONSTRAINT [FK_Work_Province]
GO
USE [master]
GO
ALTER DATABASE [DataWork] SET  READ_WRITE 
GO
