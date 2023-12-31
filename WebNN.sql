USE [master]
GO
/****** Object:  Database [WebNN]    Script Date: 11/05/2023 5:10:21 PM ******/
CREATE DATABASE [WebNN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebNgheNhac_DB', FILENAME = N'E:\THIETKEWEB\WebNgheNhac_DB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebNgheNhac_DB_log', FILENAME = N'E:\THIETKEWEB\WebNgheNhac_DB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebNN] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebNN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebNN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebNN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebNN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebNN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebNN] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebNN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebNN] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [WebNN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebNN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebNN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebNN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebNN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebNN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebNN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebNN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebNN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebNN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebNN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebNN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebNN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebNN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebNN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebNN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebNN] SET  MULTI_USER 
GO
ALTER DATABASE [WebNN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebNN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebNN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebNN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebNN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebNN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebNN] SET QUERY_STORE = OFF
GO
USE [WebNN]
GO
/****** Object:  Table [dbo].[ALBUM]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALBUM](
	[MA_AB] [int] NOT NULL,
	[TEN_AB] [nvarchar](255) NULL,
	[ANH_AB] [text] NULL,
	[NGAYPHATHANH] [date] NULL,
	[LUOTNGHE] [int] NULL,
	[THONGTIN] [nvarchar](max) NULL,
	[MA_TL] [int] NULL,
	[MA_CS] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_AB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAIHAT]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAIHAT](
	[MA_BH] [int] NOT NULL,
	[TEN_BH] [nvarchar](255) NULL,
	[LINK] [nvarchar](500) NULL,
	[LYRIC] [nvarchar](max) NULL,
	[LUOTNGHE] [int] NULL,
	[LUOTLIKE] [int] NULL,
	[MA_CS] [int] NULL,
	[ID] [int] NULL,
	[MA_TL] [int] NULL,
	[MA_AB] [int] NULL,
	[AnhBaiHat] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_BH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASI]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASI](
	[MA_CS] [int] NOT NULL,
	[TEN_CS] [nvarchar](255) NULL,
	[ANH_CS] [nvarchar](255) NULL,
	[THONGTIN_CS] [nvarchar](max) NULL,
	[QUOCGIA] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_CS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUOCGIA]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUOCGIA](
	[MA_QG] [int] NOT NULL,
	[TEN_QG] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_QG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[ID_LV] [int] NOT NULL,
	[LEVEL] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MA_TL] [int] NOT NULL,
	[TEN_TL] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_TL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 11/05/2023 5:10:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [int] NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[PASS] [varchar](50) NULL,
	[HOTEN] [nvarchar](255) NULL,
	[NGAYSINH] [date] NULL,
	[QUYEN] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (1, N'Vì Tôi Còn Sống (3rd Single)', N'/Uploads/poster/anhbia4.jpg', CAST(N'2015-11-01' AS Date), 2335769, N'Single Vì tôi còn sống của Tiên Tiên phát hành ngày 24 tháng 10, đây là Single thứ ba của Tiên Tiên sau hai bản hit đình đám "Say you do" và "My Everything".
Vì tôi còn sống là ca khúc mang đậm phong cách sở trường của Tiên Tiên với giai điệu vui tươi, rộn ràng, ca từ dễ nhớ và rất gần gũi. Bên cạnh đó, ca khúc còn như "thay lời muốn nói" của rất nhiều bạn trẻ "Cứ sai đi vì cuộc đời cho phép", "Cứ yêu đi dù rằng mình ngu si", "Cứ đam mê dù nhiều người cười chê".
Hãy thưởng thức Vì tôi còn sống và thấu hiểu ca khúc mà Tiên Tiên tâm huyết sáng tác nhé!', 1, 1)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (2, N'Vợ Người Ta (Single)', N'/Uploads/poster/anhbia6.jpg', CAST(N'2015-09-28' AS Date), 1000002, N'', 1, 2)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (3, N'Một Chặng Đường (Vol 1)', N'/Uploads/poster/buongdoitaynhaura.jpg', CAST(N'2015-11-28' AS Date), 250006, N'', 1, 3)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (4, N'Chưa Bao Giờ (Single)', N'/Uploads/poster/chuabaogio.jpg', CAST(N'2015-07-12' AS Date), 4040602, N'', 1, 4)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (5, N'Dưới Những Cơn Mưa (Single)', N'/Uploads/poster/duoinhungconmua.jpg', CAST(N'2015-11-10' AS Date), 1346270, N'', 1, 5)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (6, N'Một Nhà (2nd Single)', N'/Uploads/poster/motnha.jpg', CAST(N'2015-04-03' AS Date), 1294139, N'', 1, 6)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (7, N'Không Yêu Cũng Đừng Làm Bạn (1st Album)', N'/Uploads/poster/nguoikhongdang.jpg', CAST(N'2015-09-05' AS Date), 2790244, N'', 1, 7)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (9, N'Kungfu Phở (OST)', N'/Uploads/poster/pho.jpg', CAST(N'2015-08-07' AS Date), 1040593, N'', 1, 8)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (10, N'Thế Giới Ảo Tình Yêu Thật (Single)', N'/Uploads/poster/tgaotythat.jpg', CAST(N'2015-02-01' AS Date), 3678927, N'', 1, 10)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (11, N'Purpose (Deluxe)', N'/Uploads/poster/anhbia1.jpg', CAST(N'2015-11-19' AS Date), 7200441, N'"Purpose" là tựa đề album phòng thu thứ 4 của nam ca sĩ Justin Bieber phát hành ngày 13/11/2015 bởi hãng Dej Jam Records. Album được Justin hợp tác với hàng loạt các nghệ sĩ, ca sĩ, DJ, nhà sản xuất âm nhạc nổi tiếng như: Diplo, Skrillex, T.I., T-Pain, Diddy, Rick Ross, Wale, Jermaine Dupri, Kanye West và producer huyền thoại đồng thời là người sáng lập của Dej Jam Records - Rick Rubin. Đĩa đơn đầu tiên trích từ album mang tên "What Do You Mean?" phát hành vào tháng 8 vừa qua đã đạt No.1 trên Hot 100 Billboard ngay tuần đầu tiên phát hành. Với mức đầu tư khủng cùng hàng loạt những tên tuổi nổi tiếng góp mặt trong "Purpose" thì sản phẩm âm nhạc lần này thật sự là một quả bom tấn của Justin Bieber. Cùng thưởng thức nào!!!', 2, 11)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (12, N'Hello B*Tches (Single)', N'/Uploads/poster/hellobitches.jpg', CAST(N'2015-11-25' AS Date), 1078033, N'Đây là single mới nhất của trường nhóm tài năng CL thuộc nhóm 2NE1, cùng thưởng thức nào !', 3, 12)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (13, N'Thiên Thần Tội Lỗi (Single)', N'/Uploads/poster/posterdefault.jpg', CAST(N'2015-12-08' AS Date), 4, N'Chưa có thông tin', 1, 1)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (14, N'I Belong To You Bae (Single)', N'/Uploads/poster/posterdefault.jpg', CAST(N'2015-08-02' AS Date), 2, N'Chưa có thông tin', 1, 20)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (15, N'Stow The Show (2nd)', N'/Uploads/poster/albumkygo.jpg', CAST(N'2015-01-01' AS Date), 3, N'Hãng phát hành: Sony Music Entertainment International Ltd / Ultra Records, LLC', 2, 25)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (16, N'True Colors', N'/Uploads/poster/beautifulnow.jpeg', CAST(N'2015-05-05' AS Date), 1, N'"True Colors" là tựa đề album phòng thu thứ 2 của DJ/Nhà sản xuất âm nhạc Zedd (tên thật là Anton Zaslavski), phát hành bởi hãng Interscope Records. Đĩa đơn đầu tiên trích từ album mang tên "I Want You To Know" với sự góp mặt của giọng ca Selena Gomez đã được ra mắt vào tháng 2 vừa qua và đạt vị trí #17 trên bảng xếp hạng Hot 100 của Billboard.', 2, 30)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (17, N'Just Right (3rd Mini Album)', N'/Uploads/poster/justright.jpg', CAST(N'2015-01-02' AS Date), 1, N'Chưa có thông tin', 3, 19)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (18, N'M.A.D.E (Series)', N'/Uploads/poster/made.jpg', CAST(N'2015-06-01' AS Date), 3, N'Chưa có thông tin', 3, 16)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (19, N'Made In The A.M (Deluxe Edition)', N'/Uploads/poster/madeintheam.jpg', CAST(N'2015-07-03' AS Date), 1, N'"Made In the A.M." là tựa đề album phòng thu thứ 5 của nhóm nhạc nam đến từ Anh Quốc - One Direction, phát hành bởi hãng Syco và Columbia. Album được thực hiện chỉ với 4 thành viên - Niall, Liam, Harry, Louis sau sự ra đi của Zayn Malik. "Made In the A.M." là album cuối trong giai đoạn 2015 - 2016 của One Direction, nhóm tạm thời tan rã trong năm 2016 để mỗi cá nhân theo đuổi sự nghiệp solo của mình.', 2, 14)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (20, N'Oh My Venus (OST)', N'/Uploads/poster/ohmyvenusost.jpg', CAST(N'2015-11-11' AS Date), 1, N'Album mang tựa đề cùng tên với bộ phim truyền hình ăn khách tại Hàn Quốc Oh My Venus.', 3, 24)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (21, N'The Most Beautiful Moment In Life Pt. 2 (EP)', N'/Uploads/poster/themostbeautiful.jpg', CAST(N'2015-12-02' AS Date), 3, N'The Most Beautiful Moment in Life Pt. 2 chính là phần hai nối tiếp thành công mini album In The Mood For Love Part.1 với hai ca khúc chủ đề I Need You và Dope. Với lần trở lại này, BTS vẫn phát huy thế mạnh hiphop/rap, dance của nhóm được thể hiện rõ nét qua ca khúc Run.', 3, 17)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (22, N'Welcome Back (1st Album)', N'/Uploads/poster/welcomeback.jpg', CAST(N'2015-10-12' AS Date), 2, N'Chưa có thông tin', 3, 21)
INSERT [dbo].[ALBUM] ([MA_AB], [TEN_AB], [ANH_AB], [NGAYPHATHANH], [LUOTNGHE], [THONGTIN], [MA_TL], [MA_CS]) VALUES (23, N'Fybeats.somee.com', N'/Uploads/poster/posterdefault.jpg', CAST(N'2015-12-09' AS Date), 2, N'Đây là album mặc định của website.', 4, 1)
GO
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (1, N'Vì Tôi Còn Sống', N'/Uploads/music/ViToiConSong-TienTien.mp3', N'Vì tôi còn sóng.....', 3230503, 4040152, 1, 1, 1, 1, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (2, N'Vợ Người Ta', N'/Uploads/music/VoNguoiTa-PhanManhQuynh.mp3', N'Tấm thiệp mời trên bàn.....', 6002305, 1500390, 2, 1, 1, 2, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (3, N'Buông Đôi Tay Nhau Ra', N'/Uploads/music/BuongDoiTayNhauRa-SonTungM-TP.mp3', N'Cứ quên anh vậy đi.....', 1002306, 900391, 3, 1, 1, 3, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (4, N'Chưa Bao Giờ', N'/Uploads/music/ChuaBaoGio-TrungQuanIdol.mp3', N'Chưa bao giờ.....', 3102304, 2900210, 4, 1, 1, 4, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (5, N'Dưới Những Cơn Mưa', N'/Uploads/music/DuoiNhungConMua-MrSiro.mp3', N'Trời trắng xóa màu mưa...Mọi thứ đang lu mờ quá nhanh...', 4252104, 2630171, 5, 1, 1, 5, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (6, N'Thiên Thần Tội Lỗi', N'/Uploads/music/ThienThanToiLoi-ChiDan.mp3', N'', 2530525, 1400150, 13, 1, 1, 13, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (7, N'Một Nhà', N'/Uploads/music/MotNha-DaLAB.mp3', N'Khi hai ta chung một nhà.....', 4999139, 3500391, 6, 1, 1, 6, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (8, N'Người Không Đáng', N'/Uploads/music/NguoiKhongDang-KhacViet.mp3', N'Có phải em đã đổi thay chỉ vì anh.....', 1200323, 723510, 7, 1, 1, 7, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (9, N'Phở', N'/Uploads/music/Pho-OnlyCfeatLouHoang.mp3', N'Van danh đi khắp muôn nơi và tung bay khắp bốn phương.....', 3102301, 2900210, 8, 1, 1, 9, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (10, N'Thế Giới Ảo Tình Yêu Thật', N'/Uploads/music/TheGioiAoTinhYeuThat.mp3', N'Có bao yêu thương anh này cũng trao cho em rồi.....', 4252101, 2630170, 10, 1, 1, 10, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (11, N'What Do You Mean ?', N'/Uploads/music/WhatDoYouMean-JustinBieber.mp3', N'What do you mean oh  oh when you nod your head yes..But you wanna say no...What do you mean ?...When you don''t want me to move...But you tell me to go...What do you mean ?...Oh,What do you mean?...Said we''re running out of time...What do you mean?...Oh, oh, oh, what do you mean?...Better make up your mind...What do you mean?', 9003530, 5000325, 11, 1, 2, 11, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (12, N'Hello Bitches', N'/Uploads/music/HelloBitches-CL.mp3', N'Hello bitches...', 3890023, 2100324, 12, 1, 3, 12, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (13, N'Sorry', N'/Uploads/music/Sorry-JustinBieber.mp3', N'You gotta go and get angry at all of my honesty...You know I try but I don''t do too well with apologies...I hope I don''t run out of time, could someone call a referee?...Cause I just need one more shot at forgiveness...I know you know that I made those mistakes maybe once or twice...By once or twice I mean maybe a couple a hundred times...So let me, oh let me redeem, oh redeem, oh myself tonight...Cause I just need one more shot at second chances...Yeah, is it too late now to say sorry?...Cause I''m missing more than just your body...Is it too late now to say sorry?...Yeah I know that I let you down...Is it too late to say I''m sorry now?', 6490264, 4295029, 11, 1, 2, 11, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (15, N'Purpose', N'/Uploads/music/Purpose-JustinBieber.mp3', N'Feeling like I''m breathing my last breath...Feeling like I''m walking my last steps...Look at all of these tears I''ve wept...Look at all the promises that I''ve kept...I put my heart into your hands...Here''s my soul to keep...I let you in with all that I can...You''re not hard to reach...And you bless me with the best gift...That I''ve ever known...You give me purpose...Yeah, you''ve given me purpose...', 1239002, 600349, 11, 1, 2, 11, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (16, N'Beautiful Lady', N'/Uploads/music/BeautifulLady-JongHyun.mp3', N'You my beautiful lady...yeah', 5, 1, 23, 1, 3, 20, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (17, N'Darling U', N'/Uploads/music/DarlingU-KimTaeWoo.mp3', N'Chưa có lời bài hát.', 1, 1, 24, 2, 3, 20, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (18, N'Dope', N'/Uploads/music/Dope-BTS.mp3', N'Chưa có lời.', 2, 1, 17, 2, 3, 21, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (19, N'Drag Me Down', N'/Uploads/music/DragMeDown-OneDirection.mp3', N'Drag me down...', 1, 1, 14, 2, 2, 19, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (20, N'Firestone', N'/Uploads/music/Firestone-Kygo.mp3', N'Chưa có lời', 1, 1, 25, 2, 2, 15, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (21, N'Golden', N'/Uploads/music/Golden-Sia.mp3', N'Golden', 1, 1, 28, 2, 2, 23, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (22, N'Hero', N'/Uploads/music/Hero-MonstaX.mp3', N'Chưa có lời', 2, 1, 27, 2, 3, 23, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (23, N'Hold My Hand', N'/Uploads/music/HoldMyHand-JessGlynne.mp3', N'Chưa có', 1, 1, 22, 2, 2, 23, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (24, N'I Belong To You Bae', N'/Uploads/music/IBelongToYouBae-HUI.mp3', N'I be long to you bae..bae...bae', 1, 1, 20, 2, 1, 14, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (25, N'Just Right', N'/Uploads/music/JustRight-GOT7.mp3', N'Chưa cập nhật', 1, 1, 19, 2, 3, 17, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (26, N'Let''s Not Fall In Love', N'/Uploads/music/LetsNotFallInLove-BIG BANG.mp3', N'Chưa có', 1, 1, 16, 2, 3, 18, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (27, N'My Type', N'/Uploads/music/MyType-iKon.mp3', N'chưa có', 1, 1, 21, 2, 3, 22, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (28, N'Perfect', N'/Uploads/music/Perfect-OneDirection.mp3', N'chưa có', 1, 1, 14, 2, 2, 19, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (29, N'RhythmTa', N'/Uploads/music/RhythmTa-iKon.mp3', N'chưa có', 5, 4, 21, 2, 3, 22, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (30, N'Run', N'/Uploads/music/Run-BTS.mp3', N'chưa có', 3, 2, 17, 2, 3, 21, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (31, N'Stole The Show', N'/Uploads/music/StoleTheShow-Kygo.mp3', N'chưa có', 1, 1, 25, 2, 2, 15, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (32, N'Waiting For Love', N'/Uploads/music/WaitingForLove-Avicii.mp3', N'chưa có', 3, 2, 15, 2, 2, 23, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (33, N'Wildest Dream', N'/Uploads/music/WildestDreams-TaylorSwift.mp3', N'chưa có', 1, 1, 29, 2, 2, 23, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (34, N'Zutter', N'/Uploads/music/Zutter-GD&TOP.mp3', N'chưa có', 2, 1, 16, 2, 3, 18, NULL)
INSERT [dbo].[BAIHAT] ([MA_BH], [TEN_BH], [LINK], [LYRIC], [LUOTNGHE], [LUOTLIKE], [MA_CS], [ID], [MA_TL], [MA_AB], [AnhBaiHat]) VALUES (35, N'Em sẽ là cô dâu đẹp nhất', N'/Uploads/music/emselacodaudepnhat.mp3', N'aaaa', 3, 1, 2, 1, 1, 1, N'/Uploads/baihat/maxresdefault.jpg')
GO
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (1, N'Tiên Tiên', N'/Uploads/avatar/tiêntien.jpg', N'Tiên Tiên tên thật là Huỳnh Nữ Thủy Tiên, cô là ca sĩ, nhạc sĩ trẻ Việt Nam nổi tiếng với những bản hit dành cho tuổi teen như So You Do, My Everything, Gọi mưa, Giữ em đi... Tiên Tiên sinh ra và lớn lên ở Bảo Lộc. Sau này, Tiên Tiên chuyển vào sinh sống ở Tp.Hồ Chí Minh để theo đuổi con đường âm nhạc chuyên nghiệp. Tiên Tiên tham gia học tại Soul Music Academy do Thanh Bùi làm hiệu trưởng và trở thành một trong những sinh viên ưu tú nhất của trường. ', 2)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (2, N'Phan Mạnh Quỳnh', N'/Uploads/avatar/phan_manh_quynh.jpg', N'Là một ca sĩ/nhạc sĩ người Việt Nam.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (3, N'Sơn Tùng M-TP', N'/Uploads/avatar/sontung.jpg', N'Chưa có thông tin', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (4, N'Trung Quân', N'/Uploads/avatar/trungquan.jpg', N'Là một ca sĩ/nhạc sĩ, được biết đến thông qua chương trình Việt Nam Idol 2013', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (5, N'Mr Siro', N'/Uploads/avatar/mrsiro.jpg', N'Là ca sĩ/nhạc sĩ nổi tiếng với những bản hit đình đám, anh còn được gọi là hit-maker trong giới V-Biz.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (6, N'DaLAB', N'/Uploads/avatar/dalab.jpg', N'Chưa có thông tin', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (7, N'Khắc Việt', N'/Uploads/avatar/khacviet.jpg', N'Khắc Việt tên thật là Nguyễn Khắc Việt (sinh ngày 30 tháng 8 năm 1987) là một nhạc sĩ, ca sĩ trẻ dòng pop-ballad.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (8, N'Only C', N'/Uploads/avatar/onlyc.jpg', N'Tên thật: Nguyễn Phúc Thạch, ngày sinh: 20/02, thể loại: Việt Nam, nhạc trẻ. Vốn có năng khiếu âm nhạc...được bố cho tiếp xúc với âm nhạc và truyền đạt hiểu biết kiến thức âm nhạc từ lúc bé. Biết chơi Guitar, piano và trống năm 16 tuổi và được sở hữu dàn nhạc riêng ở nhà nên tự tập và tự biết chơi các nhạc cụ không qua trường lớp đào tạo.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (10, N'Trịnh Đình Quang', N'/Uploads/avatar/trinhdinhquang.jpg', N'Sinh ra ở mảnh đất xứ Thanh, trong một gia đình không có ai theo hoạt động nghệ thuật. Bố mẹ làm nông. Sau khi tốt nghiệp phổ thông, Trịnh Đình Quang đã quyết định Nam tiến để theo đuổi đam mê nghệ thuật của mình. Tốt nghiệp trường Đại học văn hóa nghệ thuật khoa Piano năm 2012.
', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (11, N'Justin Bieber', N'/Uploads/avatar/justinbb.jpg', N'Justin Drew Bieber (sinh ngày 1 tháng 3 năm 1994), là một ca sĩ nhạc Pop/R&B người Canada. Đĩa đơn đầu tiên của cậu là One Time đã phát hành vào hè năm 2009, được lọt vào bảng xếp hạng 30 trong 10 quốc gia và nằm trong album đầu tiên My World ra mắt công chúng vào ngày 17-11-2009, nhận được nhiều lời khen từ RIAA, nơi đã đưa Justin lên đỉnh cao nhất của các nghệ sĩ mới trong năm. "Baby", single đầu tiên trích từ album My World 2.0 của anh, đã ra mắt vào tháng 1, năm 2010 và trở thành hit lớn nhất của Bieber khi nó đã leo lên vị trí thứ 5 của Billboard và lọt vào top 10 của các bảng xếp hạng âm nhạc ở những quốc gia khác.', 5)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (12, N'CL (2NE1)', N'/Uploads/avatar/CL.jpg', N'CL (Tên khai sinh: Lee Chae Lyn), sinh ngày 26 tháng 2 năm 1991) là một nữ ca sĩ kiêm rapper nổi tiếng người Hàn Quốc. Cô được biết đến với nghệ danh CL sau khi gia nhập YG Entertainment và trở thành nhóm trưởng của nhóm nhạc nữ 2NE1 từ năm 2009 đến nay (cùng với Dara, Bom và Minzy).', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (13, N'Chi Dân', N'/Uploads/avatar/chidan.jpg', N'Chi Dân sinh năm 1989 và đã có thời gian sinh hoạt ca hát trong nhóm Hero trước đây. Sau một thời gian hoạt động trong nhóm thu được một số kinh nghiệm, Chi Dân quyết định rời nhóm khi hết hợp đồng và theo đuổi con đường ca hát solo. Chi Dân may mắn gặp gỡ anh Việt Anh - giám đốc Avatar Entertainment - cũng là công ty cũ của Angela Phương Trinh. Hai anh em nói chuyện rất hợp và định hướng cũng đồng nhất nên quyết định hợp tác. ', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (14, N'One Direction', N'/Uploads/avatar/oneD.jpeg', N'One Direction (hay 1-D) là một nhóm nhạc nam người Anh-Ireland gồm các thành viên: Niall Horan, Liam Payne, Harry Styles và Louis Tomlinson. Họ kí hợp đồng với Simon Cowell của hãng thu âm Syco Records sau khi được hình thành và giành hạng ba trong cuộc thi The X Factor của Anh Quốc mùa giải thứ 7 (năm 2010).', 4)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (15, N'Avicii', N'/Uploads/avatar/avicii.jpg', N'Tim Bergling (sinh ngày 8 tháng 9 năm 1989), được biết đến với nghệ danh Avicii, là một DJ, nhà sản xuất âm nhạc người Thụỵ Điển. Avicii là một DJ nhạc dance xếp thứ 6 trên bảng xếp hạng 100 DJs bình chọn bởi tạp chí DJ Magazine vào năm 2011, xếp thứ 3 trong 2 năm liên tiếp 2012 và 2013. Anh được đề cử giải Grammy 2 lần cho ca khúc "Sunshine" với David Guetta năm 2012, và đĩa đơn "Levels" năm 2013.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (16, N'Big Bang', N'/Uploads/avatar/bigbang.jpg', N'BIGBANG là một nhóm nhạc nam của Hàn Quốc với 5 thành viên thuộc YG Entertainment. Vào tháng tư năm 2015 YG Entertainment ra thông báo về sự trở lại của Big Bang với album tiếp theo mang tên MADE dự kiến phát hành vào ngày 1 tháng 9 năm 2015. Trước đó, các "đĩa đơn dự án" trong album sẽ được phát hành vào ngày đầu tiên của mỗi tháng bắt đầu từ 1 tháng 5 với "M" và sau đó là "A", "D" và "E".', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (17, N'Bangtan Boys', N'/Uploads/avatar/bts.jpg', N'Bangtan Boys còn được gọi là BTS (viết tắt của Bangtan Sonyeondan). Tên tiếng Anh là Bulletproof Boy Scouts. Là một nhóm nhạc hip-hop của Hàn Quốc gồm 7 thành viên chính thức ra mắt vào 13 - 06 - 2013 do chủ tịch của Big Hit Entertainment là Bang Sihyuk thành lập nên.', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (18, N'f(x)', N'/Uploads/avatar/f(x).jpg', N'f(x) là một nhóm nhạc nữ Hàn Quốc, được thành lập bởi SM Entertainment năm 2009. Là một nhóm nhạc nữ gồm 4 thành viên đa quốc tịch, trong đó thành viên người Hàn Quốc: Luna, Amber: thành viên người Mỹ gốc Đài Loan, Krystal: thành viên người Mỹ gốc Hàn Quốc và trưởng nhóm Victoria người Trung Quốc.', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (19, N'GOT7', N'/Uploads/avatar/got7.jpg', N'GOT7 là một nhóm nhạc nam của Hàn Quốc. Được thành lập bởi tập đoàn công ty giải trí JYP Entertaiment vào năm 2014. GOT7 gồm 7 thành viên JB (Trưởng nhóm), Mark, Junior, Jackson, Young Jae, BamBam và Yugyeom. Nhóm có các thành viên đến từ Hàn Quốc, HongKong, Thái Lan và Mỹ.', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (20, N'HUI', N'/Uploads/avatar/hui.jpg', N'HUI là một ca sĩ solo người Việt Nam, được đào tạo bởi ca sĩ/nhạc sĩ Mr Siro. Ra mắt vào tháng 10 năm 2015.', 1)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (21, N'iKON', N'/Uploads/avatar/ikon.jpg', N'iKON là nhóm nhạc Hàn Quốc được thành lập bởi YG Entertainment. Nhóm nhạc này có bảy thành viên gồm B.I, Bobby, Kim Jinhwan, Koo Junhoe, Song Yunhyeong, Kim Donghyuk, Jung Chanwoo. Nhóm được chọn ra từ 9 thành viên ban đầu thông qua chương trình truyền hình thực tế Mix and Match (2014). Ngoài Chanwoo, 6 thành viên còn lại đều thuộc Team B (B.I làm nhóm trưởng) trong chương trình truyền hình thực tế Who Is Next - WIN (2013).', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (22, N'Jess Glynne', N'/Uploads/avatar/jessglynn.png', N'Sinh: 20 tháng 10, 1989 (tuổi 26), Hampstead, Vương quốc Liên hiệp Anh và Bắc Ireland
Các album: I Cry When I Laugh
Giải thưởng: Giải Grammy cho Thu âm nhạc Dance xuất sắc nhất', 4)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (23, N'Kim Jong-hyun', N'/Uploads/avatar/jonghyun.jpg', N'Kim Jong-hyun sinh ngày 8 tháng 4 năm 1990 tại Seoul, Hàn Quốc. Anh là thành viên nhóm nhạc hiện đại nổi tiếng SHINee. Trong nhóm, Jonghyun đảm nhận vai trò hát chính, nhảy chính và là người sáng tác.', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (24, N'Kim Tae Woo', N'/Uploads/avatar/kimtaewoo.jpg', N'Sinh: 12 tháng 5, 1981 (tuổi 34), Gumi, Hàn Quốc
Vợ: Kim Aeri (kết hôn 2011)
Chương trình truyền hình: Invincible Youth
Nhóm nhạc: g.o.d (từ 1998)', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (25, N'Kygo', N'/Uploads/avatar/kygo.jpg', N'Là một DJ sản xuất nhạc nổi tiếng người Na Uy. Sinh ngày 11 tháng 9, 1991 (tuổi 24) tại Bergen.', 2)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (26, N'Martin Garrix', N'/Uploads/avatar/martingarrix.jpg', N'Tên thật là Martijn Garritsen (sinh 14 tháng 5 năm 1996), thường được biết đến với nghệ danh là Martin Garrix, là một DJ, nhà soạn nhạc, nhạc sĩ và nhà sản xuất người Hà Lan. Anh được biết đến với các ca khúc "Animals", mà đã là một Top 10 hit tại hơn 10 quốc gia; bài hát cũng đã đạt vị trí số 1 tại Bỉ và Vương quốc Anh, và số 3 ở Ireland.', 4)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (27, N'Monsta X', N'/Uploads/avatar/monstax.jpg', N'Là một nhóm nhạc Hàn Quốc, thuộc công ty Star Ship Entertainment. Các thành viên: Hyungwon, Kihyun, Wonho, I.M, Minhyuk.', 3)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (28, N'Sia', N'/Uploads/avatar/sia.jpg', N'Tên thật là Sia Kate Isobelle Furler, cô là một ca sĩ, nhạc sĩ nhạc pop và jazz người Úc. Cô từng hợp tác với Christina Aguilera trong album Bionic, Burlesque, và làm cố vấn cho Aguilera trong chương trình The Voice.', 2)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (29, N'Taylor Swift', N'/Uploads/avatar/taylorswift.png', N'Taylor Swift, tên đầy đủ là Taylor Alison Swift là một ca sĩ, nhạc sĩ, diễn viên âm nhạc người Mỹ nổi tiếng thế giới. Từ khi bắt đầu sự nghiệp cho đến nay, Taylor Swift dành được tổng cộng 230 giải thưởng, trong đó có 7 giải Grammy, 1 giải Emmy. Chỉ tính đến năm 2011, những album ra mắt trước đó của cô đã bán được tổng cộng hơn 20 triệu bản riêng tại Mỹ (theo Billboard) và hơn 5 triệu bản trên toàn thế giới.', 2)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (30, N'Zedd', N'/Uploads/avatar/zedd.jpg', N'Tên thật là Anton Zaslavski, sinh ngày 02 tháng 9 năm 1989) được biết đến chủ yếu bởi nghệ danh Zedd, là một nhà sản xuất nhạc điện tử, DJ và nhạc sĩ người Nga - Đức. Anh chủ yếu sản xuất nhạc electro house, nhưng sau này anh đã thử nghiệm các thể loại âm nhạc mới, với các ảnh hưởng từ progressive house, dubstep, và nhạc cổ điển.', 2)
INSERT [dbo].[CASI] ([MA_CS], [TEN_CS], [ANH_CS], [THONGTIN_CS], [QUOCGIA]) VALUES (31, N'Nhiều ca sĩ', N'/Uploads/avatar/posterdefault.jpg', N'Quá nhiều', 1)
GO
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (1, N'Việt Nam')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (2, N'Mỹ')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (3, N'Hàn Quốc')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (4, N'Anh')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (5, N'Canada')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (6, N'Na Uy')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (8, N'Thụy Điển')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (9, N'Úc')
INSERT [dbo].[QUOCGIA] ([MA_QG], [TEN_QG]) VALUES (10, N'Nga')
GO
INSERT [dbo].[QUYEN] ([ID_LV], [LEVEL]) VALUES (1, N'Admin     ')
INSERT [dbo].[QUYEN] ([ID_LV], [LEVEL]) VALUES (2, N'Manager   ')
INSERT [dbo].[QUYEN] ([ID_LV], [LEVEL]) VALUES (3, N'User      ')
GO
INSERT [dbo].[THELOAI] ([MA_TL], [TEN_TL]) VALUES (1, N'Vpop')
INSERT [dbo].[THELOAI] ([MA_TL], [TEN_TL]) VALUES (2, N'Âu - Mỹ')
INSERT [dbo].[THELOAI] ([MA_TL], [TEN_TL]) VALUES (3, N'Kpop')
INSERT [dbo].[THELOAI] ([MA_TL], [TEN_TL]) VALUES (4, N'Khác')
GO
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASS], [HOTEN], [NGAYSINH], [QUYEN]) VALUES (1, N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'Thanhpv', CAST(N'1996-05-13' AS Date), 1)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASS], [HOTEN], [NGAYSINH], [QUYEN]) VALUES (2, N'manager', N'manager', N'thanhpv_1', NULL, 1)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASS], [HOTEN], [NGAYSINH], [QUYEN]) VALUES (4, N'manager2', N'manager', N'Linh Trang', NULL, 3)
INSERT [dbo].[USERS] ([ID], [USERNAME], [PASS], [HOTEN], [NGAYSINH], [QUYEN]) VALUES (8, N'thanhpham', N'E10ADC3949BA59ABBE56E057F20F883E', N'thanhpv', NULL, 3)
GO
ALTER TABLE [dbo].[ALBUM]  WITH CHECK ADD FOREIGN KEY([MA_CS])
REFERENCES [dbo].[CASI] ([MA_CS])
GO
ALTER TABLE [dbo].[ALBUM]  WITH CHECK ADD FOREIGN KEY([MA_TL])
REFERENCES [dbo].[THELOAI] ([MA_TL])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH CHECK ADD FOREIGN KEY([MA_CS])
REFERENCES [dbo].[CASI] ([MA_CS])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH CHECK ADD FOREIGN KEY([MA_TL])
REFERENCES [dbo].[THELOAI] ([MA_TL])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[USERS] ([ID])
GO
ALTER TABLE [dbo].[CASI]  WITH CHECK ADD FOREIGN KEY([QUOCGIA])
REFERENCES [dbo].[QUOCGIA] ([MA_QG])
GO
ALTER TABLE [dbo].[USERS]  WITH NOCHECK ADD FOREIGN KEY([QUYEN])
REFERENCES [dbo].[QUYEN] ([ID_LV])
GO
USE [master]
GO
ALTER DATABASE [WebNN] SET  READ_WRITE 
GO
