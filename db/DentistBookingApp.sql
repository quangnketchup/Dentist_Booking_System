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
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (7, N'Ni???ng r??ng trong su???t', N'??u ????i c???c th???p - ch??? trong 2 th??ng', 30, 1, N'https://thammyhanquoc.vn/wp-content/uploads/2019/12/nieng-rang-invisalign-1.jpg', CAST(N'2022-05-01' AS Date), CAST(N'2022-07-01' AS Date), 1)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (10, N'R??ng s??? Titan', N'Ph???c h???i r??ng gi?? ??u ????i , 50% chi ph?? ', 50, 1, N'https://suckhoe123.vn/uploads/blog/2021_04/giam-gia-len-den-2025cho-tat-ca-cac-dich-vu-trong-rang-su.png', CAST(N'2022-06-04' AS Date), CAST(N'2022-08-01' AS Date), 1)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (12, N'Tr??m r??ng ', N'Gi???m gi?? l??n ?????n 25% cho t???t c??? d???ch v??? tr??m r??ng', 25, 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR59iTz8v5Bq_6SwLiOXkNnAZjsSalIgNvINBwIXPYnh708Z6r0UzfIDtXUQJR8olBFFdQ&usqp=CAU', CAST(N'2022-06-04' AS Date), CAST(N'2022-07-01' AS Date), 2)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (25, N'B???c r??ng s??? th???m m???', N'??u ????i 20% cho 30 kh??ch h??ng ????ng k?? ng??y h??m nay', 30, 1, N'https://nhakhoadongnam.com/wp-content/uploads/2020/11/boc-rang-su.webp', CAST(N'2022-06-03' AS Date), CAST(N'2022-07-01' AS Date), 2)
GO
INSERT [dbo].[tblDiscounts] ([discountID], [tittle], [description], [percentDiscount], [status], [image], [createDate], [expiredDate], [adminID]) VALUES (16, N'T???y tr???ng r??ng', N'Gi???m gi?? 15% d???ch v??? t???y tr???ng r??ng', 15, 1, N'https://benhvienranghammatsg.vn/wp-content/uploads/2020/07/z1963018146106_85de26d1aa8448cf73a8b7a7208d01a5.jpg', CAST(N'2022-06-04' AS Date), CAST(N'2022-07-15' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[tblDiscounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDoctors] ON 
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (36, N'Nguyen Huu Doan', N'123', N'Male', N'doannguyen2022@gmail.com', 95445663, N'https://tnaclinic.com/wp-content/uploads/2016/05/Untitled-3.png', 1, N'DR', 2, 1)
GO
INSERT [dbo].[tblDoctors] ([doctorID], [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [workDayID], [serviceTypeID]) VALUES (38, N'Do??n Thanh Tung', N'123', N'Male', N'trungdoan2022@gmail.com', 372248438, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWLmiSXdvagaI8T_l84KRGUzr-gPUC2uRkEeHUUQbVRri-QhGzy6Xz6oL6x9mnWlpIZPw&usqp=CAU', 1, N'DR', 1, 1)
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
INSERT [dbo].[tblPatientFeedbacks] ([serviceFeedBackID], [status], [content], [dateFeedback], [patientID], [serviceID]) VALUES (13, 1, N'B??c s?? ', CAST(N'2022-06-25' AS Date), 8, 32)
GO
SET IDENTITY_INSERT [dbo].[tblPatientFeedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatients] ON 
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (8, N'Nguyen Phuoc Duy', N'123', N'duynguyen2022@gmail.com', 394167409, N'53/34 ???????ng L?? Lu', N'Male ', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (9, N'Le Van Tien', N'123', N'tienle2022@gmail.com', 362462473, N'35/6 ?????ng V??n Bi', N'Male', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (10, N'Le Minh Quan ', N'123', N'quanle2022@gmail.com', 987214082, N'35 l???u 5 Sky Night', N'Male', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (12, N'Nguyen Thi Kim Ngan ', N'123', N'ngannguyen2022@gmail.com', 978366465, N'25 V?? V??n Ng??n ', N'Female', 1, N'PA')
GO
INSERT [dbo].[tblPatients] ([patientID], [fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (14, N'Tran Ngoc Hai', N'123', N'haitran2022@gmail.com', 933140284, N'14 L?? V??n Vi???t', N'Male', 1, N'PA')
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
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (1, N'C???o v??i & ????nh b??ng', 150000, N'https://nhakhoaident.com/Images/filebrowser/nieng-rang.jpg', N'V??i r??ng l?? nh???ng m???ng b??m b??? v??i ho?? tr??n b??? m???t r??ng v?? gi???a r??ng v???i n?????u. V??i r??ng qu?? nhi???u ??e do??? ?????n s???c kho??? r??ng mi???ng do c?? th??? g??y vi??m n?????u. Do ???? c???n ph???i ?????n nha s?? ????? l???y v??i r??ng v?? ????nh b??ng r??ng ?????nh k??? t??? 3 ??? 6 th??ng/l???n nh???m lo???i b??? c??c m???ng b??m n??y.(150.000VND/2 h??m)', 1, 1, 6)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (2, N'??i???u tr??? vi??m nha chu', 200000, N'https://www.edendental.vn/images/product/theme-1594891276-dich%20vu%20tram%20rang.jpg', N'Vi??m nha chu hay c??n g???i l?? b???nh nha chu l?? t??nh tr???ng c??c t??? ch???c xung quanh r??ng b??? vi??m. Vi??m nha chu ???????c chia th??nh hai nh??m ch??nh, ???? l?? vi??m l???i v?? vi??m nha chu.(100.000VND/2 h??m)', 1, 1, 6)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (3, N'Tr??m r??ng s???a', 100000, N'https://nhakhoakim.com/wp-content/uploads/2018/07/tu-van-cach-nho-rang-cho-tre-em-e1530867235379.jpg''', N'Ph????ng ph??p tra??m r??ng la?? k??? thu???t nha khoa ????????c a??p du??ng trong vi???c ??i???u tr??? v?? ph??ng ng???a b???nh l?? r??ng mi???ng ???? tr??? nh???. K??? thu???t n??y ???????c th???c hi???n v?? c??ng ????n gi???n v?? nh??? nh??ng, kh??ng g??y ??au nh???c g?? cho tr???.(100.000VND/r??ng)', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (4, N'Tr??m r??ng s??u', 200000, N'https://nhakhoabaoviet.com.vn/Data/Sites/1/media/kien-thuc-nha-khoa/tr%C3%A1m-r%C4%83ng-s%C3%A2u-c%C3%B3-%C4%91au-kh%C3%B4ng/vi-sao-nen-tram-rang-bi-sau.jpg', N'Tr??m r??ng s??u th???c s??? l?? c???n thi???t, khi c??c m?? r??ng b??? h?? t???n do vi khu???n x??m h???i d???n ?????n s??u r??ng th?? tr??m r??ng gi??p b???o v??? r??ng kh???i c??c t??c nh??n b??n ngo??i nh?? nhi???t ?????, h??a ch???t t???n c??ng, vi khu???n h???y ho???i t???y r??ng', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (5, N'Tr??m r??ng th???m m???', 300000, N'https://hoanmydental.vn/templates/hoanmydental.vn/data/img/upload/tramrang/tram-rang-tham-my-4.jpg', N'Tr??m r??ng th???m m??? l?? ph????ng ??n ph???c h???i r??ng h?? t???n kh?? ph??? bi???n hi???n nay. V???i nh???ng tr?????ng h???p th?????ng g???p nh??: r??ng s??u, r??ng v??? m???, r??ng th??a ??? m???c ????? nh???...(300000/r??ng)''', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (6, N'Ch???a t???y l???i', 800000, N'https://nhakhoadongnam.com/wp-content/uploads/2020/01/dich-vu-dieu-tri-tuy-rang.png', N'??i???u tr??? t???y r??ng (ch???a t???y hay c??n g???i l?? ??i???u tr??? n???i nha) l?? c??ch th???c can thi???p h??ng ?????u trong c??c tr?????ng h???p b??? vi??m t???y r??ng.(800.000/r??ng)''', 1, 1, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (7, N'R??ng s??? M???', 800000, N'https://hoanmydental.vn/templates/hoanmydental.vn/data/img/upload/rangsu/dia-chi-lam-rang-su-my-dep-tai-quan-12-min.jpg', N'C???u t???o ch???c ch???n, kh??? n??ng ch???u l???c cao, ??n nhai kh??ng lo s???  b??? v???. M??u s???c v?? h??nh d??ng r??ng t??? nhi??n.Gi?? th??nh t????ng ?????i r???.Tu???i th??? trung b??nh t??? 5-7 n??m. (800.000/r??ng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (8, N'R??ng s??? Titan', 2000000, N'https://cdn.niengrangkhongnhorang.net/wp-content/uploads/2015/06/Rang-su-Titan-co-tot-khong-11.jpg', N'Nhe?? va?? kho?? bi?? oxy ho??a trong m??i tr??????ng mi????ngR??ng chuy???n ?????ng linh ho???t, d???o dai nh?? r??ng th???t.B???n ch???c ??n nhai t???t.Tu???i th??? trung b??nh t??? 7-10 n??m.(2.000.000/r??ng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (10, N'R??ng s??? Ceramco', 1300000, N'https://nhakhoakim.com/wp-content/uploads/2018/08/rang-su-ceramco.jpg', N'Th???m m??? ?????p, gi???ng r??ng th???t.R??ng b???n ch???c, ??n nhai t???t.Ch???t li???u s??? l??nh t??nh, an to??n.Chi ph?? ti???t ki???m.(1.300.000/r??ng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (12, N'R??ng s??? Venus', 5500000, N'https://benhvienthammykangnam.vn/wp-content/uploads/2020/01/rang-su-venus.jpg', N'R??ng s??? Venus l?? lo???i r??ng to??n s??? c?? ????? b???n cao, m??u s???c t??? nhi??n nh?? r??ng th???t, thu???c nh??m r??ng s??? kh??ng kim lo???i.(5.500.000/r??ng)', 1, 2, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (16, N'Nh??? r??ng s???a', 100000, N'https://nhakhoasaigonbacsilam.com/wp-content/uploads/2015/12/shutterstock_146378675-1000x630.jpg', N'Ph????ng ph??p nh??? hi???n ?????i, kh??ng g??y ??au nh???c cho tr??? sau khi nh???(100.000/r??ng', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (25, N'Nh??? r??ng 1 ch??n', 250000, N'https://nhakhoathuyduc.com.vn/wp-content/uploads/2021/12/20200917_rang-khon-02.jpg', N'C??c r??ng c?? m???t ch??n g???m: c??c r??ng c???a, r??ng nanh, r??ng h??m nh??? h??m d?????i, r??ng h??m nh??? th??? hai h??m tr??n.(250.000/r??ng)', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (26, N'Nh??? r??ng 2-3 ch??n', 500000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd3zJe7bwEUd8qcGNNbLpZcnomCFrVlaiGlQ&usqp=CAU', N'R??ng 2 v?? 3 ch??n g???m c??c r??ng h??m trong c??ng(500.000/r??ng)', 1, 1, 4)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (28, N'T???y tr???ng r??ng t???i nha khoa', 1500000, N'https://icdn.dantri.com.vn/thumb_w/640/2017/tay-trang-rang-1495170545877.jpg', N'X??? l?? t???i nha khoa.(1.500.000/2 h??m)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (29, N'T???y tr???ng t???i nh?? ', 900000, N'https://taimuihongsg.com/wp-content/uploads/2013/06/tay-trang-rang_taimuihongsg.jpg', N'X??? l?? t???i nh?? b???nh nh??n.(900.000/2 h??m)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (31, N'????nh ???? kim c????ng th???m m???', 700000, N'https://nhakhoafamily.vn/wp-content/uploads/2018/09/rang-dinh-kim-cuong.jpg', N' ???? kim c????ng ???????c g???n c??? ?????nh v?? b???n ch???t.Ch??? c?? th??? l???y ra khi t???i Nha Khoa.Sau khi l???y ???? kim c????ng ra, ho??n to??n kh??ng g??y m???t th???m m???.(700.000/r??ng)'', 1, 1, 6)', 1, 2, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (32, N'M???c c??i kim lo???i', 30000000, N'https://nhakhoavinhan.com/wp-content/uploads/2021/06/nieng-rang-ho.jpg', N'Chi ph?? th???p, ph?? h???p v???i ng?????i kinh ph?? eo h???p, hi???u qu??? mang l???i cao.(30.000.000/2 h??m)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (33, N'M???c c??i s???', 35000000, N'https://vinmec-prod.s3.amazonaws.com/images/20190930_050109_144815_nieng-rang-tham-my.max-1800x1800.png', N'T??nh th???m m??? cao, kh?? ph??t hi???n b???nh nh??n ??eo m???c c??i, hi???u c??? cao.(35.000.000/2 h??m)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (34, N'Ni???ng r??ng trong su???t invisalign', 40000000, N'https://vinmec-prod.s3.amazonaws.com/images/20190930_050625_632773_nieng-rang-trong-su.max-1800x1800.jpg', N'Mang l???i hi???u qu??? cao, t??nh th???m m??? t???t. Khay ni???ng r??ng th??o l???p m???t c??ch d??? d??ng, v?? c??ng thu???n ti???n trong vi???c ??n u???ng v?? v??? sinh r??ng mi???ng. Ch???t li???u th??n thi???n, m???ng, kh??ng g??y kh?? ch???u. (40.000.000/2 h??m)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (37, N'?????t ch???t c??i gi??? kim lo???i ', 400000, N'https://nhakhoatrongrang.com/wp-content/uploads/2021/01/Lam-cui-rang-gia.jpg', N'Chi ph?? th???p, kh??? n??ng ch???u l???c t???t.(400.000/r??ng)', 1, 3, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (39, N'?????t ch???t c??i gi??? s??? ', 1000000, N'https://nhakhoamedika.vn/wp-content/uploads/2018/11/cui-gia-zirconia-nha-khoa-medika-vn.jpg', N'C???u t???o ???????c l??m t??? s??? nguy??n kh???i, ????? b???n v?? t??nh th???m m??? kh?? cao.', 1, 3, 5)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (40, N'R??ng s??? Zolid', 4000000, N'https://nhakhoakim.com/wp-content/uploads/2018/08/rang-su-cua-duc-4.jpg', N'B???n ch???c, ch???u l???c l???n h??n c??? r??ng th???t. L??nh t??nh, kh??ng k??ch ???ng r??ng mi???ng. (4.000.000/r??ng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (41, N'R??ng s??? Emax', 3200000, N'Nhttps://nhakhoaparis.vn/wp-content/uploads/2020/08/rang-su-emax-press.jpgULL', N'An to??n v???i c?? th??? con ng?????i. Tu???i th??? cao.  Kh??? n??ng ??n nhai l???n(3.200.000/r??ng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (42, N'R??ng s??? Cercon', 6000000, N'https://cdn.nhakhoadangluu.com.vn/assets/rang-su-cercon-co-may-loai-2.jpg', N'T??nh th???m m??? n???i b???t. ??n nhai t???t, ????? b???n, tu???i th??? cao.(6.000.000/r??ng)', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (43, N'R??ng s??? Chrome Cobalt', 3000000, N'https://nhakhoakim.com/wp-content/uploads/2018/10/rang-su-Chrome-Cobalt-2.jpg', N'An to??n, l??nh t??nh, kh??ng g??y k??ch ???ng r??ng mi???ng', 1, 3, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (45, N'?????p t???o ki???u r??ng kh???nh', 700000, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSONlmqTaXcMOv2JSjtb-iCeApsgVKGcWPnsCLOPBrII7azAE4iyqL80nrx6i0rDQ8Vyjk&usqp=CAU', N'Th???i gian th???c hi???n nhanh ch??ng trong v??ng 20 - 30 ph??t. T??nh th???m m??? cao, r??ng c?? ????? tr???ng s??ng gi???ng v???i r??ng th???t. (700.000/r??ng)', 1, 1, 7)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (46, N'H??m trainer tr??? em ', 1500000, N'http://vienniengrang.com/wp-content/uploads/2018/10/ch%E1%BB%89nh-nha-th%C3%A1o-l%E1%BA%AFp-cho-tr%E1%BA%BB-em.jpg', N'H??m trainer l?? c??ng c??? ch???nh nha ch??? y???u d??nh cho tr??? em t??? 2 ?????n 15 tu???i. Vi???c s??? d???ng c??c h??m trainer c?? t??c d???ng ng??n ng???a t??nh tr???ng sai kh???p c???n, r??ng m???c l???ch trong giai ??o???n ph??t tri???n ??? tr??? em.(1.500.000/2 h??m)', 1, 1, 2)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (47, N'R??ng th??o l???p Nh???t ', 400000, N'https://drsmile.vn/wp-content/uploads/2018/06/cac-loai-rang-su-tot-nhat.png', N'D??? d??ng th??o l???p v?? s??? d???ng', 1, 1, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (48, N'R??ng th??o l???p s??? cao c???p ', 600000, N'https://nhakhoaquoctevietsing.com.vn/wp-content/uploads/2019/09/ham-gia-thao-lap-1-e1569835848451.png', N'C???i thi???n t??nh tr???ng m???t r??ng, t??ng s???c ??n nhai.

??? Gi??p ??n ngon mi???ng h??n.Tr??nh n???p nh??n quanh mi???ng, cho n??? c?????i ?????p, t??? tin.(600.000/r??ng)', 1, 1, 1)
GO
INSERT [dbo].[tblServices] ([serviceID], [serviceName], [servicePrice], [image], [description], [status], [adminID], [serviceTypeID]) VALUES (50, N'R??ng th??o l???p Vi???t Nam', 200000, N'https://nhakhoaident.com/Images/filebrowser/NEW_ham-gia-thao-lap.jpg', N'Gi?? r???, Kh?? b???n, c???i thi???n kh??? n??ng ph??t ??m.(200.000/r??ng)', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblServices] OFF
GO
SET IDENTITY_INSERT [dbo].[tblServiceTypes] ON 
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (1, N'Ph???c h??nh th???m m??? ', N'Nha khoa th???m m??? l?? m???t ph????ng ph??p ch??m s??c r??ng mi???ng chuy??n nghi???p t???p trung v??o vi???c c???i thi???n v??? ngo??i c???a khu??n mi???ng, h??m r??ng v?? n??? c?????i c???a b???n. V?? m???c d?? c??c quy tr??nh nha khoa th???m m??? th?????ng l?? t??? ch???n, thay v?? thi???t y???u, m???t s??? tr?????ng h???p ??i???u tr??? c??ng mang l???i l???i ??ch ph???c h???i.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (2, N'Ch???nh nha', N'Ch???nh nha l?? m???t nh??nh c???a ng??nh nha khoa gi??p ??i???u ch???nh v??? tr?? c???a nh???ng r??ng sai l???ch v??? ????ng v??? tr?? tr??n cung h??m, gi??p cho h??m r??ng tr???ng ?????u, g????ng m???t c??n ?????i h??n. Ph????ng ph??p ch???nh nha ???????c d??ng ????? ??i???u tr??? cho nh???ng t??nh tr???ng r??ng h??, m??m, th??a, l???ch l???c... gi??p c???i thi???n t??nh th???m m?? c???a r??ng mi???ng v?? c??? ch???c n??ng ??n nhai.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (4, N'Nh??? r??ng', N'Nh??? r??ng l?? th??? thu???t l???y b??? m???t ho???c nhi???u r??ng, ???????c th???c hi???n b???i b??c s?? nha khoa,  nh???m lo???i b??? nh???ng r??ng ??ang nhi???m tr??ng, kh??ng c??n gi?? tr??? s??? d???ng v?? c?? kh??? n??ng g??y h???i cho s???c kh???e.', 1)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (5, N'Tr??m r??ng, ch???a t???y', N'Tr??m r??ng l???y t???y l?? ph????ng ph??p tr??m r??ng ph???c h??nh sau khi ??i???u tr??? t???y r??ng. ????y l?? k??? thu???t ph???c t???p, ????i h???i v??? tay ngh???, kinh nghi???m v?? d???ng c???, m??y m??c ????? lo???i b??? t???y vi??m nhi???m ra kh???i r??ng tr?????c khi ti???n h??nh tr??m r??ng ph???c h???i.', 2)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (6, N'Nha chu', N'Nha chu l?? t??nh tr???ng vi??m nhi???m c???a t??? ch???c quanh r??ng, ???nh h?????ng ?????n c???u tr??c n??ng ????? r??ng, khi???n r??ng m???t li??n k???t v???i t??? ch???c n??ng ????? n??y. B???nh nha chu ban ?????u ch??? ???nh h?????ng ?????n ph???n m?? m???m ??? n?????u r??ng ??? sau c?? th??? ph??t tri???n ???nh h?????ng ?????n c??? x????ng ??? r??ng c?? vai tr?? quan tr???ng trong vi???c gi??? r??ng.', 2)
GO
INSERT [dbo].[tblServiceTypes] ([serviceTypeID], [serviceTypeName], [description], [adminID]) VALUES (7, N'T???y tr???ng r??ng', N'T???y tr???ng r??ng l?? m???t ph????ng ph??p s??? d???ng c??c ch???t oxy h??a th?????ng d??ng Carbamide Peroxide cho th???m th???u qua l???p men r??ng. N?? khi k???t h???p v???i n??ng l?????ng ??nh s??ng s??? t???o ra ph???n ???ng khi???n c??c chu???i ph??n t??? m??u trong ng?? r??ng b??? c???t ?????t b???i qu?? tr??nh oxi h??a.', 2)
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
