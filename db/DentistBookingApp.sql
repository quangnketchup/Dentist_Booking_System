USE [master]
GO
/****** Object:  Database [DentistBookingApp]    Script Date: 6/4/2022 2:48:40 AM ******/
CREATE DATABASE [DentistBookingApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DentistBookingApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TIENLE\MSSQL\DATA\DentistBookingApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DentistBookingApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TIENLE\MSSQL\DATA\DentistBookingApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DentistBookingApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentistBookingApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentistBookingApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentistBookingApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentistBookingApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentistBookingApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentistBookingApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentistBookingApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DentistBookingApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentistBookingApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentistBookingApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentistBookingApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentistBookingApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentistBookingApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentistBookingApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentistBookingApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentistBookingApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DentistBookingApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentistBookingApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentistBookingApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentistBookingApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentistBookingApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentistBookingApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentistBookingApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentistBookingApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DentistBookingApp] SET  MULTI_USER 
GO
ALTER DATABASE [DentistBookingApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentistBookingApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentistBookingApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentistBookingApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DentistBookingApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentistBookingApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DentistBookingApp] SET QUERY_STORE = OFF
GO
USE [DentistBookingApp]
GO
/****** Object:  Table [dbo].[tblAdministrators]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdministrators](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[adminName] [varchar](50) NULL,
	[gmail] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[roleID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingDetails]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDetails](
	[BookingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[expectedFee] [int] NULL,
	[bookingDate] [date] NULL,
	[bookingID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
	[slotID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookings]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookings](
	[bookingID] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL,
	[patientID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscounts]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscounts](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[percentDiscount] [int] NULL,
	[status] [int] NULL,
	[image] [nvarchar](max) NULL,
	[createDate] [date] NULL,
	[expiredDate] [date] NULL,
	[adminID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDoctors]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoctors](
	[doctorID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[gender] [varchar](10) NULL,
	[gmail] [varchar](50) NOT NULL,
	[phone] [int] NULL,
	[image] [nvarchar](max) NULL,
	[status] [int] NULL,
	[roleID] [varchar](10) NOT NULL,
	[workDayID] [int] NOT NULL,
	[serviceTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatientFeedbacks]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatientFeedbacks](
	[serviceFeedBackID] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL,
	[content] [nvarchar](max) NULL,
	[dateFeedback] [date] NULL,
	[patientID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[serviceFeedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatients]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatients](
	[patientID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[gmail] [varchar](50) NOT NULL,
	[phone] [int] NULL,
	[address] [nvarchar](max) NULL,
	[gender] [varchar](10) NULL,
	[status] [int] NULL,
	[roleID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServices]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServices](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[serviceName] [nvarchar](max) NOT NULL,
	[servicePrice] [float] NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[adminID] [int] NOT NULL,
	[serviceTypeID] [int] NOT NULL,
 CONSTRAINT [PK__tblServi__4550733FA56F2763] PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServiceTypes]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServiceTypes](
	[serviceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[serviceTypeName] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[adminID] [int] NOT NULL,
 CONSTRAINT [PK__tblServi__FB4CEA1932C51784] PRIMARY KEY CLUSTERED 
(
	[serviceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSlots]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlots](
	[slotID] [int] NOT NULL,
	[hour] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWorkDays]    Script Date: 6/4/2022 2:48:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkDays](
	[workDayID] [int] IDENTITY(1,1) NOT NULL,
	[workDay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[workDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdministrators] ON 
GO
INSERT [dbo].[tblAdministrators] ([adminID], [adminName], [gmail], [password], [roleID]) VALUES (1, N'Quang ', N'quangnguyen2022@gmail.com', N'123', N'AD')
GO
INSERT [dbo].[tblAdministrators] ([adminID], [adminName], [gmail], [password], [roleID]) VALUES (2, N'Tu', N'tunguyen2022@gmail.com', N'123', N'AD')
GO
INSERT [dbo].[tblAdministrators] ([adminID], [adminName], [gmail], [password], [roleID]) VALUES (3, N'Hieu', N'hieutran2022@gmail.com', N'123', N'AD')
GO
SET IDENTITY_INSERT [dbo].[tblAdministrators] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBookingDetails] ON 
GO
INSERT [dbo].[tblBookingDetails] ([BookingDetailID], [expectedFee], [bookingDate], [bookingID], [doctorID], [slotID], [serviceID]) VALUES (6, 30000000, CAST(N'2022-05-25' AS Date), 3, 39, 1, 32)
GO
INSERT [dbo].[tblBookingDetails] ([BookingDetailID], [expectedFee], [bookingDate], [bookingID], [doctorID], [slotID], [serviceID]) VALUES (8, 40000000, CAST(N'2022-06-04' AS Date), 4, 40, 2, 34)
GO
INSERT [dbo].[tblBookingDetails] ([BookingDetailID], [expectedFee], [bookingDate], [bookingID], [doctorID], [slotID], [serviceID]) VALUES (9, 2000000, CAST(N'2022-06-01' AS Date), 5, 57, 3, 8)
GO
INSERT [dbo].[tblBookingDetails] ([BookingDetailID], [expectedFee], [bookingDate], [bookingID], [doctorID], [slotID], [serviceID]) VALUES (10, 1500000, CAST(N'2022-06-02' AS Date), 6, 52, 1, 28)
GO
INSERT [dbo].[tblBookingDetails] ([BookingDetailID], [expectedFee], [bookingDate], [bookingID], [doctorID], [slotID], [serviceID]) VALUES (11, 800000, CAST(N'2022-06-02' AS Date), 7, 46, 4, 6)
GO
SET IDENTITY_INSERT [dbo].[tblBookingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBookings] ON 
GO
INSERT [dbo].[tblBookings] ([bookingID], [status], [patientID]) VALUES (3, 1, 8)
GO
INSERT [dbo].[tblBookings] ([bookingID], [status], [patientID]) VALUES (4, 1, 9)
GO
INSERT [dbo].[tblBookings] ([bookingID], [status], [patientID]) VALUES (5, 1, 10)
GO
INSERT [dbo].[tblBookings] ([bookingID], [status], [patientID]) VALUES (6, 1, 12)
GO
INSERT [dbo].[tblBookings] ([bookingID], [status], [patientID]) VALUES (7, 1, 14)
GO
SET IDENTITY_INSERT [dbo].[tblBookings] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDiscounts] ON 
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (7, N'Niềng răng trong suốt', N'Ưu đãi cực thấp - chỉ trong 2 tháng', 30, 1, N'https://thammyhanquoc.vn/wp-content/uploads/2019/12/nieng-rang-invisalign-1.jpg', CAST(N'2022-05-01' AS Date), CAST(N'2022-07-01' AS Date), 1)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (10, N'Răng sứ Titan', N'Phục hồi răng giá ưu đãi , 50% chi phí ', 50, 1, N'https://suckhoe123.vn/uploads/blog/2021_04/giam-gia-len-den-2025cho-tat-ca-cac-dich-vu-trong-rang-su.png', CAST(N'2022-06-04' AS Date), CAST(N'2022-08-01' AS Date), 1)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (12, N'Trám răng ', N'Giảm giá lên đến 25% cho tất cả dịch vụ trám răng', 25, 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59iTz8v5Bq_6SwLiOXkNnAZjsSalIgNvINBwIXPYnh708Z6r0UzfIDtXUQJR8olBFFdQ&usqp=CAU', CAST(N'2022-06-04' AS Date), CAST(N'2022-07-01' AS Date), 2)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (25, N'Bọc răng sứ thẩm mỹ', N'Ưu đãi 20% cho 30 khách hàng đăng kí ngày hôm nay', 30, 1, N'https://nhakhoadongnam.com/wp-content/uploads/2020/11/boc-rang-su.webp', CAST(N'2022-06-03' AS Date), CAST(N'2022-07-01' AS Date), 2)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (16, N'Tẩy trắng răng', N'Giảm giá 15% dịch vụ tẩy trắng răng', 15, 1, N'https://benhvienranghammatsg.vn/wp-content/uploads/2020/07/z1963018146106_85de26d1aa8448cf73a8b7a7208d01a5.jpg', CAST(N'2022-06-04' AS Date), CAST(N'2022-07-15' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[tblDiscounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDoctors] ON 
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (36, N'Nguyen Huu Doan', N'123', N'Male', N'doannguyen2022@gmail.com', 95445663, N'https://tnaclinic.com/wp-content/uploads/2016/05/Untitled-3.png', 1, N'DR', 2, 1)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (38, N'Doàn Thanh Tung', N'123', N'Male', N'trungdoan2022@gmail.com', 372248438, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWLmiSXdvagaI8T_l84KRGUzr-gPUC2uRkEeHUUQbVRri-QhGzy6Xz6oL6x9mnWlpIZPw&usqp=CAU', 1, N'DR', 1, 1)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (39, N'Le Trung Hieu', N'123', N'Male', N'hieule2022@gmail.com', 982527982, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwFyixQUYNgimBdHs_C8iIRVmamalB34_RXvBwjPafQL4xDhvmdTpGFyIat7IVc2z3mQM&usqp=CAU', 1, N'DR', 1, 2)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (40, N'Pham Thanh Xuan ', N'123', N'Female', N'xuanpham2022@gmail.com', 973776072, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwFyixQUYNgimBdHs_C8iIRVmamalB34_RXvBwjPafQL4xDhvmdTpGFyIat7IVc2z3mQM&usqp=CAU', 1, N'DR', 1, 2)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (41, N'Phung Thi Bich Thuy', N'123', N'Female', N'thuyphung202@gmail.com', 917749254, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzrBu8RfHTw4CAglJ_Hr6CJ684N9LoUlQ-Wtr1r9L_B8sDdzGG0k3M8_kge3FTdvwNsU&usqp=CAU', 1, N'DR', 2, 4)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (44, N'Hoang Vu Trong Thuy', N'123 ', N'Male', N'thuyhoang2022@gmail.com', 904770053, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-ngf_WZyJDWfGMDrrn37EhrkMl1GIcLiJeXWz01OgyaEAoad8j_a6-0nNbE67GvFlz_I&usqp=CAU', 1, N'DR', 2, 5)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (45, N'Vu Duc Duy', N'123', N'Male ', N'duyvu2022@gmail.com', 974880788, N'''https://nhakhoaanphuoc.vn/wp-content/uploads/2021/08/Nguyen-Hong-Huy-mobile.jpg', 1, N'DR', 2, 6)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (46, N'Nguyen Thi Phuong Trang', N'123', N'Female', N'trangnguyen2022@gmail.com', 983888611, N'https://nhakhoathuyanh.com/wp-content/uploads/2019/07/bs.T.A.png', 1, N'DR', 1, 5)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (47, N'Le Thi Thanh Thuong', N'123', N'Female', N'thuongle2022@gmail.com', 984603663, N'https://nhakhoapeace.com/wp-content/uploads/2017/12/doi-ngu-bac-sy-nha-khoa-gioi-va-tan-tam-tai-peace-dentistry-07.jpg', 1, N'DR', 1, 7)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (48, N'Nguyen Van Hung', N'123', N'Male', N'hungnguyen2022@gmail.com', 986375176, N'http://kiet.viettechcorp.vn/chihieu/upload/bs-cong.jpg', 1, N'DR', 2, 7)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (50, N'Dam Thi Kim Tho', N'123', N'Female', N'thodam2022@gmail.com', 914770545, N'https://nhakhoakim.com/wp-content/uploads/2018/01/BS.-%C4%90%C3%80M-TH%E1%BB%8A-KIM-TH%C6%A0.png', 1, N'DR', 1, 6)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (51, N'Le Nguyen Thanh Tam', N'123', N'Female', N'tamle2022@gmail.com', 986253482, N'https://nhakhoakim.com/wp-content/uploads/2018/02/L%C3%AA-Nguy%E1%BB%85n-Thanh-T%C3%A2m-ADV.png', 1, N'DR', 2, 2)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (52, N'Nguyen Minh Tai', N'123', N'Male', N'tainguyen2022@gmail.com', 944545232, N'https://nhakhoakim.com/wp-content/uploads/2018/02/Tr%C6%B0%C6%A1ng-Nguy%E1%BB%85n-Ph%C6%B0%E1%BB%9Bc-Hi%E1%BB%81n_3T2.png', 1, N'DR', 2, 7)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (54, N'Luong Hai Lam ', N'123', N'Male ', N'lamluong2022@gmail.com', 912644784, N'https://nhakhoakim.com/wp-content/uploads/2018/01/BS.-PH%E1%BA%A0M-XU%C3%82N-GIANG-VI%E1%BB%86T.png', 1, N'DR', 1, 4)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (56, N'Nguyen Ngoc Bich Hoai', N'123', N'Female', N'hoainguyen2022@gmail.com', 1674269375, N'https://nhakhoakim.com/wp-content/uploads/2018/02/Nguy%E1%BB%85n-Th%E1%BB%8B-Minh-H%E1%BA%B1ng_S%C6%B0%C6%A1ng-Nguy%E1%BB%87t-Anh.png', 1, N'DR', 1, 5)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (57, N'Nguyen Thi Minh Tam ', N'123', N'Female', N'tamnguyen2022@gmail.com', 962089926, N'https://nhakhoakim.com/wp-content/uploads/2018/02/nguyenthiminhtam.png', 1, N'DR', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblDoctors] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatientFeedbacks] ON 
GO
INSERT [dbo].[tblPatientFeedbacks] ([serviceFeedBackID], [status], [content], [dateFeedback], [patientID], [serviceID]) VALUES (13, 1, N'Bác sĩ ', CAST(N'2022-06-25' AS Date), 8, 32)
GO
SET IDENTITY_INSERT [dbo].[tblPatientFeedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatients] ON 
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (8, N'Nguyen Phuoc Duy', N'123', N'duynguyen2022@gmail.com', 394167409, N'53/34 đường Lò Lu', N'Male ', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (9, N'Le Van Tien', N'123', N'tienle2022@gmail.com', 362462473, N'35/6 Đặng Văn Bi', N'Male', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (10, N'Le Minh Quan ', N'123', N'quanle2022@gmail.com', 987214082, N'35 lầu 5 Sky Night', N'Male', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (12, N'Nguyen Thi Kim Ngan ', N'123', N'ngannguyen2022@gmail.com', 978366465, N'25 Võ Văn Ngân ', N'Female', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (14, N'Tran Ngoc Hai', N'123', N'haitran2022@gmail.com', 933140284, N'14 Lê Văn Việt', N'Male', 1, N'PA')
GO
SET IDENTITY_INSERT [dbo].[tblPatients] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'ADMIN')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'DR', N'DOCTOR')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'PA', N'PATIENT')
GO
SET IDENTITY_INSERT [dbo].[tblServices] ON 
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (1, N'Cạo vôi & đánh bóng', 150000, N'https://nhakhoaident.com/Images/filebrowser/nieng-rang.jpg', N'Vôi răng là những mảng bám bị vôi hoá trên bề mặt răng và giữa răng với nướu. Vôi răng quá nhiều đe doạ đến sức khoẻ răng miệng do có thể gây viêm nướu. Do đó cần phải đến nha sĩ để lấy vôi răng và đánh bóng răng định kỳ từ 3 – 6 tháng/lần nhằm loại bỏ các mảng bám này.(150.000VND/2 hàm)', 1, 1, 6)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (2, N'Điều trị viêm nha chu', 200000, N'https://www.edendental.vn/images/product/theme-1594891276-dich%20vu%20tram%20rang.jpg', N'Viêm nha chu hay còn gọi là bệnh nha chu là tình trạng các tổ chức xung quanh răng bị viêm. Viêm nha chu được chia thành hai nhóm chính, đó là viêm lợi và viêm nha chu.(100.000VND/2 hàm)', 1, 1, 6)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (3, N'Trám răng sữa', 100000, N'https://nhakhoakim.com/wp-content/uploads/2018/07/tu-van-cach-nho-rang-cho-tre-em-e1530867235379.jpg''', N'Phương pháp trám răng là kỹ thuật nha khoa được áp dụng trong việc điều trị và phòng ngừa bệnh lý răng miệng ở trẻ nhỏ. Kỹ thuật này được thực hiện vô cùng đơn giản và nhẹ nhàng, không gây đau nhức gì cho trẻ.(100.000VND/răng)', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (4, N'Trám răng sâu', 200000, N'https://nhakhoabaoviet.com.vn/Data/Sites/1/media/kien-thuc-nha-khoa/tr%C3%A1m-r%C4%83ng-s%C3%A2u-c%C3%B3-%C4%91au-kh%C3%B4ng/vi-sao-nen-tram-rang-bi-sau.jpg', N'Trám răng sâu thực sự là cấn thiết, khi các mô răng bị hư tốn do vi khuẩn xâm hại dẫn đến sâu răng thì trám răng giúp bảo vệ răng khỏi các tác nhân bên ngoài như nhiệt độ, hóa chất tấn công, vi khuẩn hủy hoại tủy răng', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (5, N'Trám răng thẩm mỹ', 300000, N'https://hoanmydental.vn/templates/hoanmydental.vn/data/img/upload/tramrang/tram-rang-tham-my-4.jpg', N'Trám răng thẩm mỹ là phương án phục hồi răng hư tổn khá phổ biến hiện nay. Với những trường hợp thường gặp như: răng sâu, răng vỡ mẻ, răng thưa ở mức độ nhẹ...(300000/răng)''', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (6, N'Chữa tủy lại', 800000, N'https://nhakhoadongnam.com/wp-content/uploads/2020/01/dich-vu-dieu-tri-tuy-rang.png', N'Điều trị tủy răng (chữa tủy hay còn gọi là điều trị nội nha) là cách thức can thiệp hàng đầu trong các trường hợp bị viêm tủy răng.(800.000/răng)''', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (7, N'Răng sứ Mỹ', 800000, N'https://hoanmydental.vn/templates/hoanmydental.vn/data/img/upload/rangsu/dia-chi-lam-rang-su-my-dep-tai-quan-12-min.jpg', N'Cấu tạo chắc chắn, khả năng chịu lực cao, ăn nhai không lo sợ  bị vỡ. Màu sắc và hình dáng răng tự nhiên.Giá thành tương đối rẻ.Tuổi thọ trung bình từ 5-7 năm. (800.000/răng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (8, N'Răng sứ Titan', 2000000, N'https://cdn.niengrangkhongnhorang.net/wp-content/uploads/2015/06/Rang-su-Titan-co-tot-khong-11.jpg', N'Nhẹ và khó bị oxy hóa trong môi trường miệngRăng chuyển động linh hoạt, dẻo dai như răng thật.Bền chắc ăn nhai tốt.Tuổi thọ trung bình từ 7-10 năm.(2.000.000/răng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (10, N'Răng sứ Ceramco', 1300000, N'https://nhakhoakim.com/wp-content/uploads/2018/08/rang-su-ceramco.jpg', N'Thẩm mỹ đẹp, giống răng thật.Răng bền chắc, ăn nhai tốt.Chất liệu sứ lành tính, an toàn.Chi phí tiết kiệm.(1.300.000/răng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (12, N'Răng sứ Venus', 5500000, N'https://benhvienthammykangnam.vn/wp-content/uploads/2020/01/rang-su-venus.jpg', N'Răng sứ Venus là loại răng toàn sứ có độ bền cao, màu sắc tự nhiên như răng thật, thuộc nhóm răng sứ không kim loại.(5.500.000/răng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (16, N'Nhổ răng sữa', 100000, N'https://nhakhoasaigonbacsilam.com/wp-content/uploads/2015/12/shutterstock_146378675-1000x630.jpg', N'Phương pháp nhổ hiện đại, không gây đau nhức cho trẻ sau khi nhổ(100.000/răng', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (25, N'Nhổ răng 1 chân', 250000, N'https://nhakhoathuyduc.com.vn/wp-content/uploads/2021/12/20200917_rang-khon-02.jpg', N'Các răng có một chân gồm: các răng cửa, răng nanh, răng hàm nhỏ hàm dưới, răng hàm nhỏ thứ hai hàm trên.(250.000/răng)', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (26, N'Nhổ răng 2-3 chân', 500000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd3zJe7bwEUd8qcGNNbLpZcnomCFrVlaiGlQ&usqp=CAU', N'Răng 2 và 3 chân gồm các răng hàm trong cùng(500.000/răng)', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (28, N'Tẩy trắng răng tại nha khoa', 1500000, N'https://icdn.dantri.com.vn/thumb_w/640/2017/tay-trang-rang-1495170545877.jpg', N'Xử lí tại nha khoa.(1.500.000/2 hàm)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (29, N'Tẩy trắng tại nhà ', 900000, N'https://taimuihongsg.com/wp-content/uploads/2013/06/tay-trang-rang_taimuihongsg.jpg', N'Xử lí tại nhà bệnh nhân.(900.000/2 hàm)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (31, N'Đính đá kim cương thẩm mỹ', 700000, N'https://nhakhoafamily.vn/wp-content/uploads/2018/09/rang-dinh-kim-cuong.jpg', N' Đá kim cương được gắn cố định và bền chặt.Chỉ có thể lấy ra khi tới Nha Khoa.Sau khi lấy đá kim cương ra, hoàn toàn không gây mất thẩm mỹ.(700.000/răng)'', 1, 1, 6)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (32, N'Mắc cài kim loại', 30000000, N'https://nhakhoavinhan.com/wp-content/uploads/2021/06/nieng-rang-ho.jpg', N'Chi phí thấp, phù hợp với người kinh phí eo hẹp, hiệu quả mang lại cao.(30.000.000/2 hàm)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (33, N'Mắc cài sứ', 35000000, N'https://vinmec-prod.s3.amazonaws.com/images/20190930_050109_144815_nieng-rang-tham-my.max-1800x1800.png', N'Tính thẩm mỹ cao, khó phát hiện bệnh nhân đeo mắc cài, hiệu cả cao.(35.000.000/2 hàm)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (34, N'Niềng răng trong suốt invisalign', 40000000, N'https://vinmec-prod.s3.amazonaws.com/images/20190930_050625_632773_nieng-rang-trong-su.max-1800x1800.jpg', N'Mang lại hiệu quả cao, tính thẩm mỹ tốt. Khay niềng răng tháo lắp một cách dễ dàng, vô cùng thuận tiện trong việc ăn uống và vệ sinh răng miệng. Chất liệu thân thiện, mỏng, không gây khó chịu. (40.000.000/2 hàm)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (37, N'Đặt chốt cùi giả kim loại ', 400000, N'https://nhakhoatrongrang.com/wp-content/uploads/2021/01/Lam-cui-rang-gia.jpg', N'Chi phí thấp, khả năng chịu lực tốt.(400.000/răng)', 1, 3, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (39, N'Đặt chốt cùi giả sứ ', 1000000, N'https://nhakhoamedika.vn/wp-content/uploads/2018/11/cui-gia-zirconia-nha-khoa-medika-vn.jpg', N'Cấu tạo được làm từ sứ nguyên khối, độ bền và tính thẩm mỹ khá cao.', 1, 3, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (40, N'Răng sứ Zolid', 4000000, N'https://nhakhoakim.com/wp-content/uploads/2018/08/rang-su-cua-duc-4.jpg', N'Bền chắc, chịu lực lớn hơn cả răng thật. Lành tính, không kích ứng răng miệng. (4.000.000/răng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (41, N'Răng sứ Emax', 3200000, N'Nhttps://nhakhoaparis.vn/wp-content/uploads/2020/08/rang-su-emax-press.jpgULL', N'An toàn với cơ thể con người. Tuổi thọ cao.  Khả năng ăn nhai lớn(3.200.000/răng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (42, N'Răng sứ Cercon', 6000000, N'https://cdn.nhakhoadangluu.com.vn/assets/rang-su-cercon-co-may-loai-2.jpg', N'Tính thẩm mỹ nổi bật. Ăn nhai tốt, độ bền, tuổi thọ cao.(6.000.000/răng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (43, N'Răng sứ Chrome Cobalt', 3000000, N'https://nhakhoakim.com/wp-content/uploads/2018/10/rang-su-Chrome-Cobalt-2.jpg', N'An toàn, lành tính, không gây kích ứng răng miệng', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (45, N'Đắp tạo kiểu răng khểnh', 700000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSONlmqTaXcMOv2JSjtb-iCeApsgVKGcWPnsCLOPBrII7azAE4iyqL80nrx6i0rDQ8Vyjk&usqp=CAU', N'Thời gian thực hiện nhanh chóng trong vòng 20 - 30 phút. Tính thẩm mỹ cao, răng có độ trắng sáng giống với răng thật. (700.000/răng)', 1, 1, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (46, N'Hàm trainer trẻ em ', 1500000, N'http://vienniengrang.com/wp-content/uploads/2018/10/ch%E1%BB%89nh-nha-th%C3%A1o-l%E1%BA%AFp-cho-tr%E1%BA%BB-em.jpg', N'Hàm trainer là công cụ chỉnh nha chủ yếu dành cho trẻ em từ 2 đến 15 tuổi. Việc sử dụng các hàm trainer có tác dụng ngăn ngừa tình trạng sai khớp cắn, răng mọc lệch trong giai đoạn phát triển ở trẻ em.(1.500.000/2 hàm)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (47, N'Răng tháo lắp Nhật ', 400000, N'https://drsmile.vn/wp-content/uploads/2018/06/cac-loai-rang-su-tot-nhat.png', N'Dễ dàng tháo lắp và sử dụng', 1, 1, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (48, N'Răng tháo lắp sứ cao cấp ', 600000, N'https://nhakhoaquoctevietsing.com.vn/wp-content/uploads/2019/09/ham-gia-thao-lap-1-e1569835848451.png', N'Cải thiện tình trạng mất răng, tăng sức ăn nhai.

– Giúp ăn ngon miệng hơn.Tránh nếp nhăn quanh miệng, cho nụ cười đẹp, tự tin.(600.000/răng)', 1, 1, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (50, N'Răng tháo lắp Việt Nam', 200000, N'https://nhakhoaident.com/Images/filebrowser/NEW_ham-gia-thao-lap.jpg', N'Giá rẻ, Khá bền, cải thiện khả năng phát âm.(200.000/răng)', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblServices] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServiceTypes] ON 
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (1, N'Phục hình thẩm mỹ ', N'Nha khoa thẩm mỹ là một phương pháp chăm sóc răng miệng chuyên nghiệp tập trung vào việc cải thiện vẻ ngoài của khuôn miệng, hàm răng và nụ cười của bạn. Và mặc dù các quy trình nha khoa thẩm mỹ thường là tự chọn, thay vì thiết yếu, một số trường hợp điều trị cũng mang lại lợi ích phục hồi.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (2, N'Chỉnh nha', N'Chỉnh nha là một nhánh của ngành nha khoa giúp điều chỉnh vị trí của những răng sai lệch về đúng vị trí trên cung hàm, giúp cho hàm răng trắng đều, gương mặt cân đối hơn. Phương pháp chỉnh nha được dùng để điều trị cho những tình trạng răng hô, móm, thưa, lệch lạc... giúp cải thiện tính thẩm mĩ của răng miệng và cả chức năng ăn nhai.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (4, N'Nhổ răng', N'Nhổ răng là thủ thuật lấy bỏ một hoặc nhiều răng, được thực hiện bởi bác sĩ nha khoa,  nhằm loại bỏ những răng đang nhiễm trùng, không còn giá trị sử dụng và có khả năng gây hại cho sức khỏe.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (5, N'Trám răng, chữa tủy', N'Trám răng lấy tủy là phương pháp trám răng phục hình sau khi điều trị tủy răng. Đây là kỹ thuật phức tạp, đòi hỏi về tay nghề, kinh nghiệm và dụng cụ, máy móc để loại bỏ tủy viêm nhiễm ra khỏi răng trước khi tiến hành trám răng phục hồi.', 2)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (6, N'Nha chu', N'Nha chu là tình trạng viêm nhiễm của tổ chức quanh răng, ảnh hưởng đến cấu trúc nâng đỡ răng, khiến răng mất liên kết với tổ chức nâng đỡ này. Bệnh nha chu ban đầu chỉ ảnh hưởng đến phần mô mềm – nướu răng – sau có thể phát triển ảnh hưởng đến cả xương ổ răng có vai trò quan trọng trong việc giữ răng.', 2)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (7, N'Tẩy trắng răng', N'Tẩy trắng răng là một phương pháp sử dụng các chất oxy hóa thường dùng Carbamide Peroxide cho thẩm thấu qua lớp men răng. Nó khi kết hợp với năng lượng ánh sáng sẽ tạo ra phản ứng khiến các chuỗi phân tử màu trong ngà răng bị cắt đứt bởi quá trình oxi hóa.', 2)
GO
SET IDENTITY_INSERT [dbo].[tblServiceTypes] OFF
GO
INSERT [dbo].[tblSlots] ([slotID], [hour]) VALUES (1, N'7h-9h')
GO
INSERT [dbo].[tblSlots] ([slotID], [hour]) VALUES (2, N'9h-11h')
GO
INSERT [dbo].[tblSlots] ([slotID], [hour]) VALUES (3, N'13-15h')
GO
INSERT [dbo].[tblSlots] ([slotID], [hour]) VALUES (4, N'15h-17h')
GO
SET IDENTITY_INSERT [dbo].[tblWorkDays] ON 
GO
INSERT [dbo].[tblWorkDays] ([workDayID], [workDay]) VALUES (1, 2)
GO
INSERT [dbo].[tblWorkDays] ([workDayID], [workDay]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[tblWorkDays] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblAdmin__493D0C0A8449D815]    Script Date: 6/4/2022 2:48:40 AM ******/
ALTER TABLE [dbo].[tblAdministrators] ADD UNIQUE NONCLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tblDisco__D2130A07175AFC1A]    Script Date: 6/4/2022 2:48:40 AM ******/
ALTER TABLE [dbo].[tblDiscounts] ADD  CONSTRAINT [UQ__tblDisco__D2130A07175AFC1A] UNIQUE NONCLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblDocto__493D0C0A8F7B9005]    Script Date: 6/4/2022 2:48:40 AM ******/
ALTER TABLE [dbo].[tblDoctors] ADD UNIQUE NONCLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblPatie__493D0C0A0DE876EC]    Script Date: 6/4/2022 2:48:40 AM ******/
ALTER TABLE [dbo].[tblPatients] ADD UNIQUE NONCLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdministrators]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblBookingDetails]  WITH CHECK ADD FOREIGN KEY([bookingID])
REFERENCES [dbo].[tblBookings] ([bookingID])
GO
ALTER TABLE [dbo].[tblBookingDetails]  WITH CHECK ADD FOREIGN KEY([doctorID])
REFERENCES [dbo].[tblDoctors] ([doctorID])
GO
ALTER TABLE [dbo].[tblBookingDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblBookin__servi__5165187F] FOREIGN KEY([serviceID])
REFERENCES [dbo].[tblServices] ([serviceID])
GO
ALTER TABLE [dbo].[tblBookingDetails] CHECK CONSTRAINT [FK__tblBookin__servi__5165187F]
GO
ALTER TABLE [dbo].[tblBookingDetails]  WITH CHECK ADD FOREIGN KEY([slotID])
REFERENCES [dbo].[tblSlots] ([slotID])
GO
ALTER TABLE [dbo].[tblBookings]  WITH CHECK ADD FOREIGN KEY([patientID])
REFERENCES [dbo].[tblPatients] ([patientID])
GO
ALTER TABLE [dbo].[tblDiscounts]  WITH CHECK ADD  CONSTRAINT [FK__tblDiscou__admin__5441852A] FOREIGN KEY([adminID])
REFERENCES [dbo].[tblAdministrators] ([adminID])
GO
ALTER TABLE [dbo].[tblDiscounts] CHECK CONSTRAINT [FK__tblDiscou__admin__5441852A]
GO
ALTER TABLE [dbo].[tblDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_tblDisCounts_tblServices] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblServices] ([serviceID])
GO
ALTER TABLE [dbo].[tblDiscounts] CHECK CONSTRAINT [FK_tblDisCounts_tblServices]
GO
ALTER TABLE [dbo].[tblDoctors]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblDoctors]  WITH CHECK ADD  CONSTRAINT [FK__tblDoctor__servi__571DF1D5] FOREIGN KEY([serviceTypeID])
REFERENCES [dbo].[tblServiceTypes] ([serviceTypeID])
GO
ALTER TABLE [dbo].[tblDoctors] CHECK CONSTRAINT [FK__tblDoctor__servi__571DF1D5]
GO
ALTER TABLE [dbo].[tblDoctors]  WITH CHECK ADD FOREIGN KEY([workDayID])
REFERENCES [dbo].[tblWorkDays] ([workDayID])
GO
ALTER TABLE [dbo].[tblPatientFeedbacks]  WITH CHECK ADD FOREIGN KEY([patientID])
REFERENCES [dbo].[tblPatients] ([patientID])
GO
ALTER TABLE [dbo].[tblPatientFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK__tblPatien__servi__59FA5E80] FOREIGN KEY([serviceID])
REFERENCES [dbo].[tblServices] ([serviceID])
GO
ALTER TABLE [dbo].[tblPatientFeedbacks] CHECK CONSTRAINT [FK__tblPatien__servi__59FA5E80]
GO
ALTER TABLE [dbo].[tblPatients]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblServices]  WITH CHECK ADD  CONSTRAINT [FK__tblServic__admin__5BE2A6F2] FOREIGN KEY([adminID])
REFERENCES [dbo].[tblAdministrators] ([adminID])
GO
ALTER TABLE [dbo].[tblServices] CHECK CONSTRAINT [FK__tblServic__admin__5BE2A6F2]
GO
ALTER TABLE [dbo].[tblServices]  WITH CHECK ADD  CONSTRAINT [FK__tblServic__servi__5CD6CB2B] FOREIGN KEY([serviceTypeID])
REFERENCES [dbo].[tblServiceTypes] ([serviceTypeID])
GO
ALTER TABLE [dbo].[tblServices] CHECK CONSTRAINT [FK__tblServic__servi__5CD6CB2B]
GO
ALTER TABLE [dbo].[tblServiceTypes]  WITH CHECK ADD  CONSTRAINT [FK__tblServic__admin__5DCAEF64] FOREIGN KEY([adminID])
REFERENCES [dbo].[tblAdministrators] ([adminID])
GO
ALTER TABLE [dbo].[tblServiceTypes] CHECK CONSTRAINT [FK__tblServic__admin__5DCAEF64]
GO
USE [master]
GO
ALTER DATABASE [DentistBookingApp] SET  READ_WRITE 
GO
