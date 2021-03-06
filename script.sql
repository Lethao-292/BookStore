USE [master]
GO
/****** Object:  Database [MyBookStore]    Script Date: 11/13/2020 6:01:31 AM ******/
CREATE DATABASE [MyBookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyBookStore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyBookStore.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyBookStore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MyBookStore_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyBookStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyBookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyBookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyBookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyBookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyBookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyBookStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyBookStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MyBookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyBookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyBookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyBookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyBookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyBookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyBookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyBookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyBookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyBookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyBookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyBookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyBookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyBookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyBookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyBookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyBookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyBookStore] SET  MULTI_USER 
GO
ALTER DATABASE [MyBookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyBookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyBookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyBookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MyBookStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/13/2020 6:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](100) NOT NULL,
	[Fullname] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](1000) NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/13/2020 6:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Author] [nvarchar](100) NULL,
	[Publisher] [nvarchar](100) NULL,
	[CategoryID] [int] NOT NULL,
	[IsLocal] [bit] NULL,
	[Image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/13/2020 6:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[DateReceive] [date] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/13/2020 6:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/13/2020 6:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'baohq', N'Hoàng Quốc Bảo', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'baontt', N'Nguyễn Thành Thiên Bảo', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'conglkt', N'Lâm Kha Thành Công', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'ducnm', N'Nguyễn Minh Đức', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'dunglq', N'Lê Quốc Dũng', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'duytl', N'Trần Lê Duy', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'haonn', N'Nguyễn Nhật Hào', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'hapk', N'Phùng Khắc Hà', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'hieunm', N'Nguyễn Mậu Hiếu', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'hoadd', N'Đỗ Đức Hòa', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'hoald', N'Lưu Diệu Hoa', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'huypc', N'Phùng Chí Huy', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'kimtt', N'Trần Thanh Kim', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'namnhp', N'Nguyễn Hữu Phương Nam', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'namnk', N'Nguyễn Kế Nam', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'ngocnth', N'Nguyễn Thị Hồng Ngọc', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'nhannt', N'Nguyễn Thế Nhân', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'phattv', N'Trần Vĩnh Phát', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'thaonlp', N'Nguyễn Lê Phương Thảo', N'123456', N'Admin', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'tienlt', N'Lưu Thùy Tiên', N'123456', N'Admin', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'trinh', N'Nguyễn Hữu Trí', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'trint', N'Ngô Thành Trí', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
INSERT [dbo].[Account] ([Username], [Fullname], [Password], [Role], [Address], [Phone]) VALUES (N'vyntt', N'Nguyễn Thị Tường Vy', N'123456', N'User', N'Hồ Chí Minh', N'0123456789')
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (1, N'Rich Dad''s Who Took My Money?
', 266000, 152, N'Robert T. Kiyosaki', N'Plata Publishing', 4, 0, N'1.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (2, N'Trump - Đừng Bao Giờ Bỏ Cuộc
', 58000, 215, N'Donald J.Trump & Meredith Mclver', N'NXB Trẻ', 4, 1, N'2.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (3, N'Nhật Ký Đặng Thùy Trâm', 60000, 412, N'Đặng Thùy Trâm', N'NXB Hội Nhà Văn', 4, 1, N'3.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (4, N'Nhà Ngoại Giao Kể Chuyện
', 90000, 123, N'Võ Anh Tuấn', N'NXB Chính Trị Quốc Gia Sự Thật', 4, 1, N'4.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (5, N'Second Chance : For Your Money, Your Life and Our World
', 280000, 154, N'Robert T Kiyosaki', N'Plata Publishing', 9, 0, N'5.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (6, N'The Laundromat
', 223000, 54, N'Jake Bernstein', N'Picador Paper', 4, 0, N'6.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (8, N'Bùi Kiến Thành - Người Mở Khóa Lãng Du
', 90000, 210, N'Lê Xuân Khoa, Xuân Chi, Thanh Huyền', N'NXB Thế Giới', 5, 1, N'8.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (9, N'Hỏi Chuyện Đời Bà "Thứ Phi" Mộng Điệp Và Cựu Hoàng Đế Bảo Đại
', 72000, 215, N'Nguyễn Đắc Xuân', N'NXB Thuận Hóa', 5, 1, N'9.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (13, N'Code Dạo Kí Sự - Lập Trình Viên Đâu Phải Chỉ Biết Code
', 127000, 173, N'Phạm Huy Hoàng', N'NXB Dân Trí', 8, 1, N'13.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (14, N'Kỹ Thuật Sửa Chữa Xe Máy Cơ Bản', 78000, 216, N'Trí Cường', N'NXB Bách Khoa Hà Nội', 8, 1, N'14.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (15, N'Tủ Sách Nhất Nghệ Tinh - Chuyên Ngành Cơ Khí', 756000, 145, N'Nhiều Tác Giả', N'NXB Trẻ', 8, 1, N'15.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (16, N'IC3 - Máy Tính Căn Bản', 52000, 123, N'Không rõ', N'IIG Việt Nam', 6, 1, N'16.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (17, N'Computer Coding with JavaScript Made Easy
', 79000, 221, N'Carol Vorderman', N'Dorling Kindersley Ltd', 8, 0, N'17.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (18, N'Code: STEM: Robots
', 258000, 87, N'Max Wainewright, John Haslam', N'Wayland', 8, 0, N'18.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (19, N'Tài Chính Cá Nhân Dành Cho Người Việt Nam', 200000, 222, N'Lâm Minh Chánh', N'NXB Văn hóa Văn nghệ', 9, 1, N'19.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (20, N'Tiền Đấu Với Vàng
', 116000, 32, N'James Rickards', N'NXB Tài Chính', 9, 1, N'20.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (21, N'Currency Wars: The Making of the Next Global Crisis
', 231000, 45, N'James Rickards', N'PORTFOLIO', 9, 0, N'21.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (23, N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 64000, 154, N'Nguyễn Nhật Ánh', N'NXB Trẻ', 1, 1, N'23.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (24, N'Thanh Xuân Ấy Mình Đã Từng Thương
', 67000, 84, N'Lâm Lâm', N'NXB Dân Trí', 1, 1, N'24.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (25, N'Con Chim Xanh Biếc Bay Về', 112000, 456, N'Nguyễn Nhật Ánh', N'NXB Trẻ', 1, 1, N'25.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (26, N'Chiến Binh Cầu Vồng', 90000, 845, N'Andrea Hirata', N'NXB Hội Nhà Văn', 1, 1, N'26.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (27, N'Chuyện Con Ốc Sên Muốn Biết Tại Sao Nó Chậm Chạp', 33000, 148, N'Luis Sepúlveda', N'NXB Hội Nhà Văn', 1, 1, N'27.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (28, N'Perfume: The Story of a Murderer
', 195000, 238, N'Patrick Süskind', N'Penguin Books LtdHì', 1, 0, N'28.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (29, N'My Name Is Lucy Barton
', 171000, 86, N'Elizabeth Strout', N'Penguin Random House', 1, 0, N'29.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (30, N'Mrs. Fletcher
', 239000, 32, N'Tom Perrotta', N'Simon & Schuster', 1, 0, N'30.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (31, N'Ranma 1/2 - Tập 3', 66000, 48, N'Rumiko Takahashi', N'NXB Trẻ', 2, 1, N'31.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (33, N'Gintama - Tập 61', 16000, 163, N'Hideaki Sorachi', N'NXB Kim Đồng', 2, 1, N'33.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (35, N'Spy X Family Tập 1', 23000, 785, N'Tatsuya Endo', N'NXB Kim Đồng', 2, 1, N'35.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (36, N'ASSASSINATION CLASSROOM 16 - Thời Gian Lội Dòng Quá Khứ', 20000, 485, N'Yusei Matsui', N'NXB Trẻ', 2, 1, N'36.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (37, N'Thuật Đọc Tâm
', 159000, 154, N'Don Richard Riso, Russ Hudson', N'NXB Thanh Niên', 3, 1, N'37.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (38, N'Tâm Lý Học Tích Cực
', 103000, 98, N'Edward Hoffman, William C Compton', N'NXB Lao Động', 3, 1, N'38.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (39, N'Sổ Tay Nhà Thôi Miên
', 116000, 269, N'Cao Minh', N'NXB Thế Giới', 3, 1, N'39.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (40, N'Mẹ Ơi, Con Muốn Làm Con Gái
', 47000, 456, N'Alex Gino', N'NXB Văn Học', 3, 1, N'40.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (41, N'Children’s Mental Health And Emotional Well-being In Primary Schools', 434000, 462, N'Colin Howard, Maddie Burton, Denisse Levermore', N'Learning Matters', 3, 0, N'41.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (42, N'Self-Acceptance
', 405000, 842, N'Dr Harry Barry', N'Orion Spring', 3, 0, N'42.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (44, N'100 Women Who Made History: Remarkable women who shaped our world', 232000, 235, N'DK', N'Sunrise Publishers', 5, 0, N'44.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (45, N'Women Who Rocked Space
', 38000, 179, N'Parragon Books Ltd', N'Lake Press', 5, 0, N'45.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (46, N'What Is NASA?
', 85000, 62, N'Sarah Fabiny', N'Penguin', 5, 0, N'46.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (47, N'Lịch Sử Kháng Chiến Chống Mỹ, Cứu Nước 1954-1975 - Tập 7: Thắng Lợi Quyết Định Năm 1972', 140000, 48, N'Viện Lịch Sử Quân Sự Việt Nam', N'NXB Chính Trị Quốc Gia', 5, 1, N'47.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (48, N'Lịch Sử Chiến Tranh
', 167000, 24, N'John Keegan', N'NXB Lao động', 5, 1, N'48.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (49, N'Cuộc Kháng Chiến Chống Xâm Lược Nguyên Mông
', 135000, 843, N'Hà Văn Tấn, Phạm Thị Tâm', N'NXB Hồng Đức', 5, 1, N'49.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (50, N'Lịch Sử Việt Nam Từ Nguồn Gốc Đến Giữa Thế Kỷ XX', 160000, 512, N'Lê Thành Khôi', N'NXB Thế Giới', 5, 1, N'50.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (51, N'Sách Giáo Khoa Bộ Lớp 9 - Sách Bài Học Phía Bắc', 120000, 4120, N'Bộ Giáo Dục Và Đào Tạo', N'Nhà xuất bản Giáo Dục', 6, 1, N'51.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (53, N'Sách Giáo Khoa Bộ Lớp 2 (Bộ 13 Cuốn)', 95000, 1566, N'Bộ Giáo Dục Và Đào Tạo', N'NXB Giáo Dục Việt Nam', 6, 1, N'53.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (54, N'Những Truyện Hay Viết Cho Thiếu Nhi', 53000, 496, N'Phạm Hổ', N'NXB Kim Đồng', 7, 1, N'54.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (55, N'Combo Ở Nơi Yên Ấm - 4 Cuốn
', 164000, 52, N'Phan Thị Hồ Điệp', N'NXB Lao Động', 7, 1, N'55.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (56, N'Chuyện Của Anh Em Nhà Mem & Kya
', 72000, 56, N'Nguyễn Quang Thiều', N'NXB Trẻ', 7, 1, N'56.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (57, N'Shin - Cậu Bé Bút Chì Tập 25', 17000, 51, N'Yoshito Usui', N'NXB Kim Đồng', 7, 1, N'57.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (58, N'Mẹ Không Được Ốm Đâu - Con Có Cách Rồi', 25000, 54, N'Mint, Tâm Trần', N'NXB Văn Học', 7, 1, N'58.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (59, N'Disney Pinocchio: Animated Classics
', 62000, 73, N'Igloo Books', N'Igloo Books', 7, 0, N'59.jpg')
INSERT [dbo].[Book] ([BookID], [Title], [Price], [Quantity], [Author], [Publisher], [CategoryID], [IsLocal], [Image]) VALUES (60, N'You''re Called What?
', 121000, 96, N'Kes Gray,Nikki Dyson', N'Pan MacMillan', 7, 0, N'60.jpg')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (2, CAST(0x72410B00 AS Date), CAST(0x74410B00 AS Date), N'trint', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (3, CAST(0x76410B00 AS Date), CAST(0x78410B00 AS Date), N'trint', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (5, CAST(0x76410B00 AS Date), CAST(0x77410B00 AS Date), N'vyntt', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (6, CAST(0x78410B00 AS Date), CAST(0x84410B00 AS Date), N'vyntt', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (7, CAST(0xE63F0B00 AS Date), CAST(0xE83F0B00 AS Date), N'vyntt', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (8, CAST(0x0A400B00 AS Date), CAST(0x0E400B00 AS Date), N'vyntt', N'done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (9, NULL, NULL, N'trint', N'Not done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (10, NULL, NULL, N'vyntt', N'Not done')
INSERT [dbo].[Cart] ([CartID], [DateOrder], [DateReceive], [Username], [Status]) VALUES (11, NULL, NULL, N'hoald', N'Not done')
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (2, 2, 15, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (3, 2, 1, 3)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (4, 2, 40, 1)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (5, 3, 26, 10)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (6, 3, 16, 9)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (12, 5, 26, 8)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (13, 6, 2, 7)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (14, 6, 20, 19)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (15, 6, 37, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (16, 6, 29, 1)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (17, 7, 19, 3)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (18, 7, 45, 6)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (19, 8, 17, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [CartID], [BookID], [Quantity]) VALUES (21, 8, 23, 1)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Chính Trị - Pháp Luật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Công Nghệ - Kỹ  Thuật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Giáo Trình')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Kinh Tế - Tài Chính')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Tâm Lý')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Thiếu Nhi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Truyện Tranh')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Văn Học - Tiểu Thuyết')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Xã Hội - Lịch Sử')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Category__8517B2E043ECC5C9]    Script Date: 11/13/2020 6:01:31 AM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Anonymous') FOR [Fullname]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'123456') FOR [Password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'User') FOR [Role]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Hồ Chí Minh') FOR [Address]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'0123456789') FOR [Phone]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ('2020-1-1') FOR [DateOrder]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (N'Not done') FOR [Status]
GO
ALTER TABLE [dbo].[CartDetail] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
USE [master]
GO
ALTER DATABASE [MyBookStore] SET  READ_WRITE 
GO
