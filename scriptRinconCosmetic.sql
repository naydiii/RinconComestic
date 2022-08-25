USE [master]
GO
/****** Object:  Database [RinconCosmetic]    Script Date: 24/08/2022 7:39:44 PM ******/
CREATE DATABASE [RinconCosmetic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RinconCosmetic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RinconCosmetic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RinconCosmetic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RinconCosmetic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RinconCosmetic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RinconCosmetic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RinconCosmetic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RinconCosmetic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RinconCosmetic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RinconCosmetic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RinconCosmetic] SET ARITHABORT OFF 
GO
ALTER DATABASE [RinconCosmetic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RinconCosmetic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RinconCosmetic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RinconCosmetic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RinconCosmetic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RinconCosmetic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RinconCosmetic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RinconCosmetic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RinconCosmetic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RinconCosmetic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RinconCosmetic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RinconCosmetic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RinconCosmetic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RinconCosmetic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RinconCosmetic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RinconCosmetic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RinconCosmetic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RinconCosmetic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RinconCosmetic] SET  MULTI_USER 
GO
ALTER DATABASE [RinconCosmetic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RinconCosmetic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RinconCosmetic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RinconCosmetic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RinconCosmetic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RinconCosmetic] SET QUERY_STORE = OFF
GO
USE [RinconCosmetic]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](70) NOT NULL,
	[NumeroDocumento] [nvarchar](20) NULL,
	[Direccion] [nvarchar](80) NULL,
	[Telefono] [nvarchar](15) NULL,
	[Email] [nvarchar](40) NULL,
	[IdSucursal] [bigint] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](60) NOT NULL,
	[NumeroDocumento] [nvarchar](20) NULL,
	[FechaNacimiento] [date] NULL,
	[Edad] [int] NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](15) NULL,
	[Celular] [nvarchar](15) NULL,
	[IdSucursal] [bigint] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrden] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Estatus] [varchar](15) NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[IdOrderDetail] [bigint] IDENTITY(1,1) NOT NULL,
	[IdOrder] [bigint] NOT NULL,
	[IdProducto] [bigint] NULL,
	[Cantidad] [int] NULL,
	[PrecioTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[IdOrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[Marca] [nvarchar](30) NULL,
	[Descripcion] [nvarchar](40) NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 24/08/2022 7:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[Direccion] [nvarchar](120) NULL,
	[Telefono] [nvarchar](15) NULL,
	[Telefono2] [nvarchar](15) NULL,
	[Email] [nvarchar](40) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Marca], [Descripcion], [Precio]) VALUES (1, N'Base H&M', N'H&M', N'Base de color crema', CAST(725 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (1, N'El Rincon de los Cosmeticos - San Cristobal', N'Calle San Juan #22', N'8091237654', NULL, N'rinconcosmetic_sc@outlook.com')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (2, N'El Rincon de los Cosmeticos - Bani', N'Calle Padre Billini #42', N'8091237555', NULL, N'rinconcosmetic_bn@outlook.com')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (3, N'El Rincon de los Cosmeticos - Barahona', N'Calle 30 de Mayo #05', N'8091237756', NULL, N'rinconcosmetic_br@outlook.com')
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
USE [master]
GO
ALTER DATABASE [RinconCosmetic] SET  READ_WRITE 
GO
