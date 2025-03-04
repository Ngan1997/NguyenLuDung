USE [master]
GO
/****** Object:  Database [QLNS]    Script Date: 02-05-2018 10:15:30 PM ******/
CREATE DATABASE [QLNS] ON  PRIMARY 
( NAME = N'QLNS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVER0\MSSQL\DATA\QLNS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVER0\MSSQL\DATA\QLNS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLNS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNS] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNS] SET  MULTI_USER 
GO
ALTER DATABASE [QLNS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNS] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNS', N'ON'
GO
USE [QLNS]
GO
/****** Object:  StoredProcedure [dbo].[txsTaikhoan]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROC [dbo].[txsTaikhoan] 
	@kieu char(1),
	@tendangnhap nvarchar(50),
	@matkhau nvarchar(50),
	@tenhienthi nvarchar(50),
	@maloai nchar(50)
AS
BEGIN
	if @kieu='x'
		if exists (select Tendangnhap from tblTaikhoan where Tendangnhap=@tendangnhap)
			begin
				delete from tblTaikhoan where Tendangnhap=@tendangnhap
				return 1
			end
	if @kieu='t'
		if not exists (select Tendangnhap from tblTaikhoan where Tendangnhap=@tendangnhap)
			begin
				insert into tblTaikhoan(Tendangnhap,Matkhau,Tenhienthi,Maloai) values (@tendangnhap,@matkhau,@tenhienthi,@maloai)
				return 1 
			end
		else 
			begin
				update tblTaikhoan set Matkhau=@matkhau where Tendangnhap=@tendangnhap 
				return 1
			end
END

GO
/****** Object:  Table [dbo].[tblChucvu]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChucvu](
	[Macv] [nvarchar](50) NOT NULL,
	[Tencv] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblChucvu] PRIMARY KEY CLUSTERED 
(
	[Macv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHopdong]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHopdong](
	[Mahd] [nvarchar](50) NOT NULL,
	[Tenhd] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblHopdong] PRIMARY KEY CLUSTERED 
(
	[Mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoso]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoso](
	[Manv] [nvarchar](50) NOT NULL,
	[Hodem] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Gioitinh] [nvarchar](50) NULL,
	[Ngaysinh] [date] NULL,
	[Noisinh] [nvarchar](50) NULL,
	[SoCMND] [nvarchar](50) NULL,
	[Sodt] [nvarchar](50) NULL,
	[NgayvaoCT] [date] NULL,
	[Dantoc] [nvarchar](50) NULL,
	[BHXH] [nvarchar](50) NULL,
	[Mahd] [nvarchar](50) NOT NULL,
	[Macv] [nvarchar](50) NOT NULL,
	[Matd] [nvarchar](50) NOT NULL,
	[Maphong] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblHoso] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoaitaikhoan]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoaitaikhoan](
	[Maloai] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLoaitaikhoan] PRIMARY KEY CLUSTERED 
(
	[Maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLuong]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLuong](
	[Ngay] [date] NOT NULL,
	[Manv] [nvarchar](50) NOT NULL,
	[Songaylv] [nvarchar](50) NULL,
	[Tiencong1ngay] [nvarchar](50) NULL,
	[Sogiotangca] [nvarchar](50) NULL,
	[Luong1giotangca] [nvarchar](50) NULL,
	[BHXH] [nvarchar](50) NULL,
	[Thuong] [nvarchar](50) NULL,
	[Tongluong] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblLuong_1] PRIMARY KEY CLUSTERED 
(
	[Ngay] ASC,
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPhong]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhong](
	[Maphong] [nvarchar](50) NOT NULL,
	[Tenphong] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPhong] PRIMARY KEY CLUSTERED 
(
	[Maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaikhoan]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaikhoan](
	[Tendangnhap] [nvarchar](50) NOT NULL,
	[Matkhau] [nvarchar](50) NULL,
	[Tenhienthi] [nvarchar](50) NULL,
	[Maloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Taikhoan] PRIMARY KEY CLUSTERED 
(
	[Tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTrinhdo]    Script Date: 02-05-2018 10:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrinhdo](
	[Matd] [nvarchar](50) NOT NULL,
	[Tentd] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTrinhdo] PRIMARY KEY CLUSTERED 
(
	[Matd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblChucvu] ([Macv], [Tencv]) VALUES (N'CV01', N'Giám đốc')
INSERT [dbo].[tblChucvu] ([Macv], [Tencv]) VALUES (N'CV02', N'Phó giám đốc')
INSERT [dbo].[tblChucvu] ([Macv], [Tencv]) VALUES (N'CV03', N'Trưởng phòng')
INSERT [dbo].[tblChucvu] ([Macv], [Tencv]) VALUES (N'CV04', N'Nhân viên')
INSERT [dbo].[tblHopdong] ([Mahd], [Tenhd], [Ghichu]) VALUES (N'HD01', N'Hợp đồng thử việc', N'Thử việc')
INSERT [dbo].[tblHopdong] ([Mahd], [Tenhd], [Ghichu]) VALUES (N'HD02', N'Hợp đồng 1 năm', N'1 năm')
INSERT [dbo].[tblHopdong] ([Mahd], [Tenhd], [Ghichu]) VALUES (N'HD03', N'Hợp đồng 3 năm', N'3 năm')
INSERT [dbo].[tblHopdong] ([Mahd], [Tenhd], [Ghichu]) VALUES (N'HD04', N'Hợp đồng dài hạn', N'Dài hạn')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV01', N'Nguyễn Văn', N'A', N'Nam', CAST(0xF9160B00 AS Date), N'Đà Nẵng', N'0129310231', N'123091231231', CAST(0x4B360B00 AS Date), N'Tày', N'102938123123', N'HD01', N'CV04', N'TD03', N'P04')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV02', N'Nguyễn Thị', N'B', N'Nữ', CAST(0x301E0B00 AS Date), N'Đà Nẵng', N'0129310231', N'123091231231', CAST(0x08360B00 AS Date), N'Kinh', N'102938123123', N'HD01', N'CV04', N'TD03', N'P04')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV03', N'Nguyễn Lư', N'Dung', N'Nam', CAST(0xF6200B00 AS Date), N'Tp.HCM', N'518989189', N'891981981', CAST(0x93390B00 AS Date), N'Kinh', N'819819189', N'HD04', N'CV01', N'TD01', N'P01')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV04', N'Nguyễn Thị', N'D', N'Nam', CAST(0xF9160B00 AS Date), N'Tp.HCM', N'518989189', N'891981981', CAST(0x93390B00 AS Date), N'Kinh', N'819819189', N'HD04', N'CV02', N'TD01', N'P02')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV05', N'Nguyễn Văn', N'E', N'Nam', CAST(0xB5080B00 AS Date), N'Tp.HCM', N'518989189', N'891981981', CAST(0x93390B00 AS Date), N'Kinh', N'819819189', N'HD04', N'CV03', N'TD01', N'P03')
INSERT [dbo].[tblHoso] ([Manv], [Hodem], [Ten], [Gioitinh], [Ngaysinh], [Noisinh], [SoCMND], [Sodt], [NgayvaoCT], [Dantoc], [BHXH], [Mahd], [Macv], [Matd], [Maphong]) VALUES (N'NV06', N'Nguyễn Khoa', N'Tuyên', N'Nam', CAST(0xFE200B00 AS Date), N'Dak Lak', N'0129310231', N'123091231231', CAST(0x4B360B00 AS Date), N'Thái', N'102938123123', N'HD04', N'CV04', N'TD03', N'P03')
INSERT [dbo].[tblLoaitaikhoan] ([Maloai], [TenLoai]) VALUES (N'1', N'ADMIN')
INSERT [dbo].[tblLoaitaikhoan] ([Maloai], [TenLoai]) VALUES (N'2', N'Nhân viên')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x523C0B00 AS Date), N'NV01', N'25', N'100000', N'0', N'20000', N'300000', N'50000', N'2250000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x523C0B00 AS Date), N'NV02', N'22', N'100000', N'10', N'20000', N'300000', N'500000', N'2600000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x523C0B00 AS Date), N'NV03', N'30', N'1500000', N'15', N'500000', N'300000', N'0', N'52200000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x523C0B00 AS Date), N'NV04', N'22', N'500000', N'12', N'30000', N'0', N'0', N'11360000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x523C0B00 AS Date), N'NV05', N'28', N'1000000', N'10', N'50000', N'300000', N'0', N'28200000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x713C0B00 AS Date), N'NV01', N'25', N'100000', N'0', N'20000', N'0', N'50000', N'2550000')
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x2F3E0B00 AS Date), N'NV01', N'20', N'120000', N'10', N'100000', N'0', N'0', NULL)
INSERT [dbo].[tblLuong] ([Ngay], [Manv], [Songaylv], [Tiencong1ngay], [Sogiotangca], [Luong1giotangca], [BHXH], [Thuong], [Tongluong]) VALUES (CAST(0x2F3E0B00 AS Date), N'NV03', N'26', N'1500000', N'20', N'500000', N'0', N'2000000', N'51000000')
INSERT [dbo].[tblPhong] ([Maphong], [Tenphong]) VALUES (N'P01', N'Lãnh đạo')
INSERT [dbo].[tblPhong] ([Maphong], [Tenphong]) VALUES (N'P02', N'Kế toán')
INSERT [dbo].[tblPhong] ([Maphong], [Tenphong]) VALUES (N'P03', N'Nhân sự')
INSERT [dbo].[tblPhong] ([Maphong], [Tenphong]) VALUES (N'P04', N'Vận tải')
INSERT [dbo].[tblTaikhoan] ([Tendangnhap], [Matkhau], [Tenhienthi], [Maloai]) VALUES (N'admin', N'123', N'AdminTest', N'1')
INSERT [dbo].[tblTaikhoan] ([Tendangnhap], [Matkhau], [Tenhienthi], [Maloai]) VALUES (N'aiaixinhdep', N'123', N'AIAI', N'2')
INSERT [dbo].[tblTaikhoan] ([Tendangnhap], [Matkhau], [Tenhienthi], [Maloai]) VALUES (N'dungng', N'123', N'DungNg', N'1')
INSERT [dbo].[tblTaikhoan] ([Tendangnhap], [Matkhau], [Tenhienthi], [Maloai]) VALUES (N'user', N'123', N'UserTest', N'2')
INSERT [dbo].[tblTrinhdo] ([Matd], [Tentd]) VALUES (N'TD01', N'Tiến sĩ')
INSERT [dbo].[tblTrinhdo] ([Matd], [Tentd]) VALUES (N'TD02                                              ', N'Thạc sĩ')
INSERT [dbo].[tblTrinhdo] ([Matd], [Tentd]) VALUES (N'TD03                                              ', N'Đại học')
INSERT [dbo].[tblTrinhdo] ([Matd], [Tentd]) VALUES (N'TD04', N'Cao đẳng')
INSERT [dbo].[tblTrinhdo] ([Matd], [Tentd]) VALUES (N'TD05                                              ', N'THPT')
ALTER TABLE [dbo].[tblHoso]  WITH CHECK ADD  CONSTRAINT [FK_tblHoso_tblChucvu] FOREIGN KEY([Macv])
REFERENCES [dbo].[tblChucvu] ([Macv])
GO
ALTER TABLE [dbo].[tblHoso] CHECK CONSTRAINT [FK_tblHoso_tblChucvu]
GO
ALTER TABLE [dbo].[tblHoso]  WITH CHECK ADD  CONSTRAINT [FK_tblHoso_tblHopdong] FOREIGN KEY([Mahd])
REFERENCES [dbo].[tblHopdong] ([Mahd])
GO
ALTER TABLE [dbo].[tblHoso] CHECK CONSTRAINT [FK_tblHoso_tblHopdong]
GO
ALTER TABLE [dbo].[tblHoso]  WITH CHECK ADD  CONSTRAINT [FK_tblHoso_tblPhong] FOREIGN KEY([Maphong])
REFERENCES [dbo].[tblPhong] ([Maphong])
GO
ALTER TABLE [dbo].[tblHoso] CHECK CONSTRAINT [FK_tblHoso_tblPhong]
GO
ALTER TABLE [dbo].[tblHoso]  WITH CHECK ADD  CONSTRAINT [FK_tblHoso_tblTrinhdo] FOREIGN KEY([Matd])
REFERENCES [dbo].[tblTrinhdo] ([Matd])
GO
ALTER TABLE [dbo].[tblHoso] CHECK CONSTRAINT [FK_tblHoso_tblTrinhdo]
GO
ALTER TABLE [dbo].[tblLuong]  WITH CHECK ADD  CONSTRAINT [FK_tblLuong_tblHoso] FOREIGN KEY([Manv])
REFERENCES [dbo].[tblHoso] ([Manv])
GO
ALTER TABLE [dbo].[tblLuong] CHECK CONSTRAINT [FK_tblLuong_tblHoso]
GO
ALTER TABLE [dbo].[tblTaikhoan]  WITH CHECK ADD  CONSTRAINT [FK_tblTaikhoan_tblLoaitaikhoan] FOREIGN KEY([Maloai])
REFERENCES [dbo].[tblLoaitaikhoan] ([Maloai])
GO
ALTER TABLE [dbo].[tblTaikhoan] CHECK CONSTRAINT [FK_tblTaikhoan_tblLoaitaikhoan]
GO
USE [master]
GO
ALTER DATABASE [QLNS] SET  READ_WRITE 
GO
