USE [QLyNhanSu]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[MaNV] [nchar](10) NOT NULL,
	[HeSBL] [float] NULL,
	[Ngay] [date] NULL,
	[GioVao] [time](7) NULL,
	[GioRa] [time](7) NULL,
	[ThoiGian] [time](7) NULL,
	[Phep] [int] NULL,
	[KhongPhep] [int] NULL,
	[SoNgay] [int] NULL,
	[TangCa] [time](7) NULL,
 CONSTRAINT [PK_ChamCong] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVuNV] [nchar](10) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVuNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanToc]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanToc](
	[MaDanToc] [nchar](10) NOT NULL,
	[TenDanToc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanToc] PRIMARY KEY CLUSTERED 
(
	[MaDanToc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHopDong] [nchar](10) NOT NULL,
	[LoaiHopDong] [nchar](10) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[GhiChu] [nchar](10) NULL,
 CONSTRAINT [PK_HopDong] PRIMARY KEY CLUSTERED 
(
	[MaHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhenThuong]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuong](
	[MaNV] [nchar](10) NOT NULL,
	[LyDo] [nchar](10) NULL,
	[ThangThuong] [nchar](10) NULL,
	[TienThuong] [nchar](10) NULL,
 CONSTRAINT [PK_KhenThuong] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyLuat]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyLuat](
	[MaNV] [nchar](10) NOT NULL,
	[LyDo] [nchar](10) NULL,
	[ThangKyLuat] [nchar](10) NULL,
	[TienKyLuat] [nchar](10) NULL,
 CONSTRAINT [PK_KyLuat] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Luong]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luong](
	[MaLuong] [nchar](10) NOT NULL,
	[MaNV] [nchar](10) NULL,
	[TienThuong] [float] NULL,
	[TienPhat] [float] NULL,
	[NgayNhanLuong] [date] NULL,
	[TongTienLuong] [float] NULL,
 CONSTRAINT [PK_Luong] PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](50) NOT NULL,
	[CMND] [int] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[QueQuan] [nvarchar](50) NOT NULL,
	[SDT] [int] NOT NULL,
	[MaPhongBan] [nchar](10) NULL,
	[MaTonGiao] [nchar](10) NULL,
	[MaDanToc] [nchar](10) NULL,
	[TrinhDo] [int] NOT NULL,
	[MaBacLuong] [nchar](10) NULL,
	[MaChucVuNV] [nchar](10) NULL,
	[MaHopDong] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPhongBan] [nchar](10) NOT NULL,
	[TenPhongBan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThoiViec]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiViec](
	[MaNV] [nchar](10) NOT NULL,
	[NgayThoiViec] [date] NULL,
	[LyDo] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThoiViec] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TonGiao]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonGiao](
	[MaTonGiao] [nchar](10) NOT NULL,
	[TenTonGiao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TonGiao] PRIMARY KEY CLUSTERED 
(
	[MaTonGiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/10/2021 8:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NOT NULL,
	[PassWord] [nchar](50) NOT NULL,
	[Role] [nchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChucVu] ([MaChucVuNV], [TenChucVu]) VALUES (N'MCV001    ', N'Trưởng Phòng')
INSERT [dbo].[DanToc] ([MaDanToc], [TenDanToc]) VALUES (N'MDT01     ', N'Kinh')
INSERT [dbo].[DanToc] ([MaDanToc], [TenDanToc]) VALUES (N'MDT02     ', N'Hoa')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD01     ', N'Dài Hạn   ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-09' AS Date), N'1         ')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD02     ', N'Dài Hạn   ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-09' AS Date), N'123       ')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD03     ', N'Dài Hạn   ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-09' AS Date), N'1         ')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD04     ', N'Dài Hạn   ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-09' AS Date), N'1         ')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD06     ', N'1         ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-11' AS Date), N'1         ')
INSERT [dbo].[HopDong] ([MaHopDong], [LoaiHopDong], [NgayBatDau], [NgayKetThuc], [GhiChu]) VALUES (N'MHD07     ', N'1         ', CAST(N'2021-05-13' AS Date), CAST(N'2021-05-13' AS Date), N'1         ')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan]) VALUES (N'PB01      ', N'Nhân Phòng')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan]) VALUES (N'PB02      ', N'Hợp Đồng')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan]) VALUES (N'PB03      ', N'Nhân sự')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [PassWord], [Role]) VALUES (12, N'admin                                             ', N'123                                               ', N'nhân viên ')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_NhanVien]
GO
ALTER TABLE [dbo].[KhenThuong]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhenThuong] CHECK CONSTRAINT [FK_KhenThuong_NhanVien]
GO
ALTER TABLE [dbo].[KyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KyLuat_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KyLuat] CHECK CONSTRAINT [FK_KyLuat_NhanVien]
GO
ALTER TABLE [dbo].[Luong]  WITH CHECK ADD  CONSTRAINT [FK_Luong_ChamCong] FOREIGN KEY([MaNV])
REFERENCES [dbo].[ChamCong] ([MaNV])
GO
ALTER TABLE [dbo].[Luong] CHECK CONSTRAINT [FK_Luong_ChamCong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVuNV])
REFERENCES [dbo].[ChucVu] ([MaChucVuNV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_DanToc] FOREIGN KEY([MaDanToc])
REFERENCES [dbo].[DanToc] ([MaDanToc])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_DanToc]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_HopDong] FOREIGN KEY([MaHopDong])
REFERENCES [dbo].[HopDong] ([MaHopDong])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_HopDong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[PhongBan] ([MaPhongBan])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TonGiao] FOREIGN KEY([MaTonGiao])
REFERENCES [dbo].[TonGiao] ([MaTonGiao])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TonGiao]
GO
ALTER TABLE [dbo].[ThoiViec]  WITH CHECK ADD  CONSTRAINT [FK_ThoiViec_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ThoiViec] CHECK CONSTRAINT [FK_ThoiViec_NhanVien]
GO
