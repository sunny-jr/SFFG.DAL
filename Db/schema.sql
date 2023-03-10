USE [master]
GO
/****** Object:  Database [SFFG_DB]    Script Date: 25/01/2023 10:28:35 pm ******/
CREATE DATABASE [SFFG_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SFFG_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SFFG_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SFFG_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SFFG_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SFFG_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SFFG_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SFFG_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SFFG_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SFFG_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SFFG_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SFFG_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SFFG_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SFFG_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SFFG_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SFFG_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SFFG_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SFFG_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SFFG_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SFFG_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SFFG_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SFFG_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SFFG_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SFFG_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SFFG_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SFFG_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SFFG_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SFFG_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SFFG_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SFFG_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SFFG_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SFFG_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SFFG_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SFFG_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SFFG_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SFFG_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SFFG_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SFFG_DB] SET QUERY_STORE = OFF
GO
USE [SFFG_DB]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 25/01/2023 10:28:35 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](10) NULL,
	[lesson_name] [varchar](30) NOT NULL,
	[lesson_path] [varchar](300) NOT NULL,
	[dateCreated] [datetime2](7) NULL,
	[sectionID] [int] NOT NULL,
 CONSTRAINT [PK__Lessons__3213E83F66F88B8D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MisSection]    Script Date: 25/01/2023 10:28:35 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MisSection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](10) NULL,
	[section_name] [varchar](30) NOT NULL,
	[advisor] [varchar](30) NOT NULL,
	[noOfStudents] [int] NOT NULL,
 CONSTRAINT [PK__MisSecti__3213E83F1889D4C9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 25/01/2023 10:28:35 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](30) NOT NULL,
	[RefToken] [varchar](400) NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/01/2023 10:28:35 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](30) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NOT NULL,
	[email] [varchar](55) NULL,
	[address] [varchar](150) NULL,
	[role] [varchar](1) NOT NULL,
	[sectionID] [int] NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoLessons]    Script Date: 25/01/2023 10:28:35 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoLessons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nchar](10) NULL,
	[video_name] [varchar](30) NOT NULL,
	[video_path] [varchar](300) NOT NULL,
	[dateCreated] [datetime2](7) NULL,
	[sectionID] [int] NOT NULL,
 CONSTRAINT [PK__VideoLes__3213E83FCF9DAE56] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([id], [userID], [lesson_name], [lesson_path], [dateCreated], [sectionID]) VALUES (0, NULL, N'Sample', N'C:\Users\Sunny\OneDrive\Desktop\SFFG_Proj\SFFG.API\SFFG.API\Uploads\Lessons\PngItem_712633_031d.png', NULL, 0)
INSERT [dbo].[Lessons] ([id], [userID], [lesson_name], [lesson_path], [dateCreated], [sectionID]) VALUES (1, NULL, N'Sample', N'C:\Users\Sunny\OneDrive\Desktop\SFFG_Proj\SFFG.API\SFFG.API\Uploads\Lessons\PngItem_712633_cd6c.png', NULL, 0)
INSERT [dbo].[Lessons] ([id], [userID], [lesson_name], [lesson_path], [dateCreated], [sectionID]) VALUES (2, NULL, N'Sample', N'C:\Users\Sunny\OneDrive\Desktop\SFFG_Proj\SFFG.API\SFFG.API\Uploads\Lessons\PngItem_712633_93e1.png', NULL, 0)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[MisSection] ON 

INSERT [dbo].[MisSection] ([id], [userID], [section_name], [advisor], [noOfStudents]) VALUES (0, N'1212      ', N'Kamunggay', N'Kamagong', 0)
SET IDENTITY_INSERT [dbo].[MisSection] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (1, N'121212', N'poMGfVdRc2oXDbL69idRFw0MGZimjNRKfa3B8SHzBjI=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (2, N'121212', N'RG1KNHYaZVP0ynLP7r3Z/ytDQ/dHBdGF7UI0PW5iEs8=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (3, N'121212', N'bnwpAPSkT/jDIjLBavlWB0AI/ytfNaCLveHthmaVZuA=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (4, N'121212', N'YsW6L/jcbCuvgmbTMRzXj1E7/G3gqCmyS5SygpqnuBw=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (5, N'121212', N'yM47ly7LVdsDA6U5l7NGW8nhEAS8JT6tMD4tCwkyS9s=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (6, N'121212', N'd7aSpY5azd2z7df94N64AvPuG1WlBephePZFW6GqWfI=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (7, N'121212', N'c/3IPTNDeP4Hmc+8L30rC7wrD2lzI05KtfeKD/8dZ6E=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (8, N'121212', N'KmeMNJyY39Fcz2MDVCgpgiF4SAhi9iwjljSoqSu12rY=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (9, N'121212', N'2VShlHeFHZ+WSxO+SHIadIuoOQGxQVa2IHPSvHF8IT0=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (10, N'121212', N'mwYhsbjwOj3z0K4GSh/r/ESR9ZBHfuBYyRCPdcNYZYU=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (11, N'121212', N'mJfszUOCBcBl+C7bbEa3duilNoJfbtiWWPEsiAbc2Nk=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (12, N'121212', N'9qZTLB5VWvk9utYOyBFGY3ka+h/4/toxWC93tihQsqQ=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (13, N'121212', N'HTv4JHHh5fOfBi+qHKlJROAs5HZ9TYzz8l8oXvNIZYs=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (14, N'121212', N'qxJtvpsBisyGuH344HzISx4GMwOcYfWvbYOUpyswS38=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (15, N'121212', N'ts23GpCdS/V0RHT0y/9FkU+/SN+ZGquRyBMT+s1uyqU=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (16, N'121212', N'PvdT+6VJ1b5W9JWYKaki1nJSTDndiQ/UIrU7ly4YiDU=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (17, N'123123', N'Y1P6gL08LRIRooadMQbWK14bPVBldgs4bRT7t9ljW4w=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (18, N'121212', N'EKWZZQWOAFyCkhe4/GyFGEbrjo55ZNniCIvPhJGOX7k=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (19, N'123123', N'rjh5Xa7okfnpH5KavAsIJqNF2tg/AXtsU6Ey697e05E=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (20, N'121212', N'Nh8vOe0prBg+9uwFuABSxNQU1jqfSUOGabkL+3Y4+ac=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (21, N'121212', N'ebIwees2AVCaxtRWD/Yb1sPtwneMJU1H9AfbneX3v9Q=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (22, N'121212', N'aajLyIxo4g4Jx3xWXAKQ+3Qj13VbSrCSNUB7zAhA6gc=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (23, N'121212', N'h9lTPxB68R+EkunSQujLFosbnVzqgJTrbYyhcgTk2P8=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (24, N'121212', N'52xHmIVeqXNpbDQ6i8ZqyCguhryUEFH2hTAulf6DuFM=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (25, N'121212', N'Uhbgw8B39ncmmTGxoG3rriZXprcBe5ojoQ/DMAISMkI=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (26, N'121212', N'zdnWnF0egWS4BIq+jkzXyz8/ebSjaQ/y+Xl8T7XePiM=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (27, N'121212', N'kbZ908I7M2rruVoDLSIwWCTJTG1Jm3JeM0SkG7zzVlc=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (28, N'121212', N'nAem0WJVAbAMBJK5Kd6EYII4C8LLE4HG68YM/ocijqk=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (29, N'121212', N'99OgijN5Do/ATUDvqQ7dMw7ubNedKkfVgi45XqA5leQ=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (30, N'121212', N'VTesjzUKV/wCWHzlvQEbh6NxGN65Bko2cXL8pxkFO88=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (31, N'121212', N'zH9sbM71ZMPjSNYL1nl8x0Ahnscb2o8f+sk7MwjmAIU=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (32, N'121212', N'iNoPnE3cBoJAzsDE1YSll/7zz/SVDZ3mfDmIUdjmwwI=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (33, N'121212', N'OuyFeN6hLunmbKmBL2l99XMC6qKTawAeZ0oaGAZBg80=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (34, N'121212', N'wLaTgZMaAcgAH1ja8xyioOQufY6NfvJuW/dfYopW4u0=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (35, N'121212', N'wwgphFNV3zi36SnyvLdkUIf8nlVJZRR3wj7zbsrS1EQ=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (36, N'121212', N'Ggq4Q9qhfdChPwV015t4unBVpH+GN2WFXCqth8dNyg8=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (37, N'121212', N'O4NIhACRZyRroV+F766YmDxfJFv2d+WqJBMINtM8gXM=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (38, N'121212', N'dhboHm3SFKvcgpTpTIUj+qvWuw9jYYGE/PuqJmKy2Dc=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (39, N'121212', N'EpnBgPzCBu/F4FNZTcW0s+zA9lKHLzLGrQz/SBHBqu8=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (40, N'121212', N'2E+9N8762/hl0YO9Pf695hZSiTdkktiKaOJcZs32v00=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (41, N'121212', N'JK61ZwUjMyC7Ci4JVUYDADW3j6Dj7U9s2k7wxbFg5UY=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (42, N'121212', N'mKT376QYgWb3v+yOBi9lq++/VNyghdsw9DTFEr2peOY=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (43, N'121212', N'WGZRSUiPRfPxPClbJhevIhTqOlXD8TtKr6EExYiYTH4=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (44, N'121212', N'adow3ZpyZu56Rt/fY7OmCPokZw5aQqXXHSrh/RjfKCE=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (45, N'121212', N'lBFFTTKst1TVoUdRwHs8y33iQT3422t7r1Bn68H2BGc=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (46, N'121212', N'qa5fDjCGPL1zTDAnItRTbefKZ/AP1bQhrDjSghlLOh0=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (47, N'121212', N'MG2Tz41xjw7fcJavoeQPQTm67lyw2B2aOLAweE+GDUg=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (48, N'121212', N'zTClDqOpy8SFIdjC5vj8byy9A//eqOY0jYpbVbsHDb8=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (49, N'121212', N'rTcmZv4Z8zRbCefk1QtAnQdPWinjCy/fKW+wpbd6qyI=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (50, N'121212', N'9zIXjO6cRdgbZXbUAD2wdi+v169frMgIcjZBYjWiTU4=', 1)
INSERT [dbo].[RefreshToken] ([Id], [userID], [RefToken], [IsActive]) VALUES (51, N'121212', N'YoPijFjjBfBONDHyEvY0f8SofHif/YFlBm4R7zz/wUM=', 1)
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [userID], [first_name], [last_name], [email], [address], [role], [sectionID], [password]) VALUES (1, N'121212', N'Sample', N'Admin Lang', NULL, N'Tambisan St', N'T', NULL, N'123456')
INSERT [dbo].[Users] ([id], [userID], [first_name], [last_name], [email], [address], [role], [sectionID], [password]) VALUES (2, N'123123', N'Kyla', N'Leyson', NULL, N'Same ra mi ug address', N'S', NULL, N'123456')
INSERT [dbo].[Users] ([id], [userID], [first_name], [last_name], [email], [address], [role], [sectionID], [password]) VALUES (3, N'4324', N'Admin', N'Admin', N'dasda@gmail.com', N'Same ra mi ug address', N'A', NULL, N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_MisSection] FOREIGN KEY([sectionID])
REFERENCES [dbo].[MisSection] ([id])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_MisSection]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_MisSection] FOREIGN KEY([sectionID])
REFERENCES [dbo].[MisSection] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_MisSection]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_RefreshToken] FOREIGN KEY([id])
REFERENCES [dbo].[RefreshToken] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_RefreshToken]
GO
ALTER TABLE [dbo].[VideoLessons]  WITH CHECK ADD  CONSTRAINT [FK_VideoLessons_MisSection] FOREIGN KEY([sectionID])
REFERENCES [dbo].[MisSection] ([id])
GO
ALTER TABLE [dbo].[VideoLessons] CHECK CONSTRAINT [FK_VideoLessons_MisSection]
GO
USE [master]
GO
ALTER DATABASE [SFFG_DB] SET  READ_WRITE 
GO
