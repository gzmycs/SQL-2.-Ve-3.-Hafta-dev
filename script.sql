USE [master]
GO
/****** Object:  Database [VeriT]    Script Date: 16.03.2025 14:58:48 ******/
CREATE DATABASE [VeriT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VeriT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VeriT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VeriT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VeriT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VeriT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VeriT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VeriT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VeriT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VeriT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VeriT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VeriT] SET ARITHABORT OFF 
GO
ALTER DATABASE [VeriT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VeriT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VeriT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VeriT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VeriT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VeriT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VeriT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VeriT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VeriT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VeriT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VeriT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VeriT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VeriT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VeriT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VeriT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VeriT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VeriT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VeriT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VeriT] SET  MULTI_USER 
GO
ALTER DATABASE [VeriT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VeriT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VeriT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VeriT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VeriT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VeriT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VeriT] SET QUERY_STORE = ON
GO
ALTER DATABASE [VeriT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VeriT]
GO
/****** Object:  Table [dbo].[Adresler]    Script Date: 16.03.2025 14:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresler](
	[adres_id] [int] NULL,
	[kullanici_id] [int] NULL,
	[sokak] [nvarchar](255) NULL,
	[sehir] [nvarchar](100) NULL,
	[posta_kodu] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoriler]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoriler](
	[urun_id] [int] NULL,
	[kullanici_id] [int] NULL,
	[eklenme_tarihi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[kategori_id] [int] NOT NULL,
	[ad] [nvarchar](100) NULL,
	[aciklama] [nvarchar](255) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[kategori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[kullanici_id] [int] NOT NULL,
	[ad_soyad] [nvarchar](100) NULL,
	[e_posta] [nvarchar](255) NULL,
	[telefon] [nvarchar](15) NULL,
	[kayit_tarihi] [datetime] NULL,
	[sifre_hash] [nvarchar](255) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[kullanici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odemeler](
	[odeme_id] [int] NULL,
	[siparis_id] [int] NULL,
	[tutar] [decimal](10, 2) NULL,
	[odeme_tarihi] [datetime] NULL,
	[odeme_yontemi] [nvarchar](50) NULL,
	[durum] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[sepet_id] [int] NULL,
	[urun_id] [int] NULL,
	[kullanici_id] [int] NULL,
	[eklenme_tarihi] [datetime] NULL,
	[adet] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[siparis_id] [int] NULL,
	[kullanici_id] [int] NULL,
	[siparis_tarihi] [datetime] NULL,
	[toplam_tutar] [decimal](10, 2) NULL,
	[adres_id] [int] NULL,
	[durum] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[urun_id] [int] NULL,
	[ad] [nvarchar](255) NULL,
	[aciklama] [nvarchar](500) NULL,
	[stok] [int] NULL,
	[fiyat] [decimal](10, 2) NULL,
	[kategori_id] [int] NULL,
	[eklenme_tarihi] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[yorum_id] [int] NULL,
	[urun_id] [int] NULL,
	[puan] [int] NULL,
	[yorum_metni] [nvarchar](1000) NULL,
	[yorum_tarihi] [datetime] NULL,
	[kullanici_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProcessOrder]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored Procedure: Sipariş İşleme
CREATE PROCEDURE [dbo].[sp_ProcessOrder] 
    @UserID INT, 
    @AddressID INT, 
    @PaymentMethod VARCHAR(50)
AS
BEGIN
    -- Add your procedure's logic here, for example:
    -- INSERT INTO Orders(UserID, AddressID, PaymentMethod, OrderDate)
    -- VALUES (@UserID, @AddressID, @PaymentMethod, GETDATE());

    PRINT 'Order processed successfully!';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SalesReport]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Satış Raporu Stored Procedure'ü
CREATE PROCEDURE [dbo].[sp_SalesReport] @StartDate DATE, @EndDate DATE
AS BEGIN
    SELECT COUNT(*) AS satis_sayisi, SUM(toplam_tutar) AS toplam_gelir FROM Siparisler WHERE siparis_tarihi BETWEEN @StartDate AND @EndDate;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_StockReport]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stok Raporu Stored Procedure'ü
CREATE PROCEDURE [dbo].[sp_StockReport]
AS BEGIN
    SELECT * FROM Urunler WHERE stok < 10;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrderStatus]    Script Date: 16.03.2025 14:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sipariş Durumu Güncelleme Procedure'ü
CREATE PROCEDURE [dbo].[sp_UpdateOrderStatus] @OrderID INT, @NewStatus VARCHAR(50)
AS BEGIN
    UPDATE Siparisler SET siparis_tarihi = GETDATE() WHERE siparis_id = @OrderID;
END;

GO
USE [master]
GO
ALTER DATABASE [VeriT] SET  READ_WRITE 
GO
