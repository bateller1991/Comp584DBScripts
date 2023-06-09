USE [master]
GO
/****** Object:  Database [BackendDB]    Script Date: 5/19/2023 12:51:49 PM ******/
CREATE DATABASE [BackendDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackendDB', FILENAME = N'C:\Users\1\BackendDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BackendDB_log', FILENAME = N'C:\Users\1\BackendDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BackendDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackendDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackendDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BackendDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BackendDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BackendDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BackendDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BackendDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BackendDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BackendDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BackendDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BackendDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BackendDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BackendDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BackendDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BackendDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BackendDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BackendDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BackendDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BackendDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BackendDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BackendDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BackendDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BackendDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BackendDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BackendDB] SET  MULTI_USER 
GO
ALTER DATABASE [BackendDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BackendDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BackendDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BackendDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BackendDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BackendDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BackendDB] SET QUERY_STORE = OFF
GO
USE [BackendDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/19/2023 12:51:49 PM ******/
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
/****** Object:  Table [dbo].[BodyStyles]    Script Date: 5/19/2023 12:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyStyles](
	[BodyStyleID] [int] IDENTITY(1,1) NOT NULL,
	[BodyStyleName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BodyStyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BodyStyleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 5/19/2023 12:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](255) NOT NULL,
	[BodyStyleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/19/2023 12:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('User') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([BodyStyleID])
REFERENCES [dbo].[BodyStyles] ([BodyStyleID])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [BackendDB] SET  READ_WRITE 
GO
