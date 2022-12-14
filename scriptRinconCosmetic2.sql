USE [master]
GO
/****** Object:  Database [RinconCosmetic]    Script Date: 24/08/2022 8:48:51 PM ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/08/2022 8:48:52 PM ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 24/08/2022 8:48:52 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 24/08/2022 8:48:52 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 24/08/2022 8:48:52 PM ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 24/08/2022 8:48:52 PM ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 24/08/2022 8:48:52 PM ******/
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
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (1, N'Samuel Martinez', N'002-8541236-5', N'Calle Las carreras #125 Honduras del Norte, Santo Domingo', N'809-530-7874', N'smartinez@gmail.do', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (2, N'Manuel Martinez', N'001-6521431-3', N'Calle las minas #12 El Invi, Santo Domingo', N'809-323-0101', N'Manuel-Martinez@gmail.do', 1)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (3, N'Carlos Contreras', N'005-652712-2', N'Calle Las Marias #55, Bani', N'849-601-8400', N'Carlos.C005@gmail.do', 2)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (4, N'Julio Lugo', N'004-541207-1', N'Residencial el Pedregal #02, Bani', N'849-624-3478', N'JLugo@gmail.do', 2)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (5, N'Jimmy Paredes', N'003-741238-1', N'Residencial Villa Reyna #44, Barahona', N'809-626-0133', N'JimmyParedes01@gmail.do', 3)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (6, N'Luis Castillo', N'001-3205417-1', N'Calle Segunda  #30 El Palmar de Herrera, Barahona', N'849-365-2010', N'smartinez@gmail.do', 3)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (7, N'Jose Gomez', N'001-9874125-1', N'Calle #11 avenida españa, Elias Pina', N'809-741-7456', N'j-Gomez14@gmail.do', 4)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (8, N'Franmil Reyes', N'002-452102-3', N'Calle #20 Resisdencial jose contreras, Elias Pina', N'809-555-0001', N'Franmil14Reyes@gmail.do', 4)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (9, N'Brayce Harpers', N'001-3338574-1', N'Calle #02 El Palmar de Herrera, Azua', N'809-742-3548', N'BrayceHarpers10@gmail.do', 5)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [NumeroDocumento], [Direccion], [Telefono], [Email], [IdSucursal]) VALUES (10, N'Nolan Arenado', N'001-88874125-1', N'Calle  #12 avenida independencia, Azua', N'829-321-9547', N'NolanArenado@gmail.do', 5)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (2, N'Naydelin', N'Dipre', N'002-20369852-1', CAST(N'2004-03-17' AS Date), 18, N'Calle Segunda  #30 El Palmar de Herrera, Santo Domingo Oeste', N'829-528-3040', N'849-638-7412', 1)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (3, N'roberto', N'perez', N'003-20361852-2', CAST(N'2002-03-14' AS Date), 20, N'Calle  #12 avenida independencia, Santo Domingo DN', N'829-530-0540', N'849-638-8412', 2)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (4, N'ramon', N'ogando', N'005-20369452-1', CAST(N'2000-03-13' AS Date), 22, N'Calle #11 avenida españa, Santo Domingo este', N'829-548-3040', N'849-638-7812', 3)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (5, N'junior', N'contreras', N'003-20367852-1', CAST(N'1992-11-03' AS Date), 30, N'Calle  #10 alma rosa, Santo Domingo este', N'829-518-3040', N'849-638-7812', 4)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (6, N'adolfo', N'perez', N'001-20368852-1', CAST(N'1991-03-10' AS Date), 31, N'Calle #20 Resisdencial jose contreras, Santo Domingo Distrito Nacional', N'829-518-3040', N'849-638-7312', 5)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (8, N'Cesar', N'ramirez', N'002-20369852-1', CAST(N'1993-03-18' AS Date), 29, N'Calle #40 El Palmar de Herrera, Santo Domingo Oeste', N'829-528-3040', N'849-638-7412', 6)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (9, N'Jean Carlos', N'Canela', N'001-1919740-1', CAST(N'1993-03-01' AS Date), 28, N'Calle #18 Residencial Maria Auxiliador, Distrito Nacional', N'829-502-2020', N'809-743-2121', 8)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (10, N'Jesica', N'Infante', N'002-8574631-5', CAST(N'1997-01-20' AS Date), 25, N'Calle #02 Residencial Las Marinas, San Cristobal', N'849-632-9630', N'849-225-7960', 8)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (11, N'maria', N'cabrera', N'002-20769852-1', CAST(N'1995-03-15' AS Date), 27, N'Calle #30 El Palmar de Herrera, Santo Domingo Oeste', N'829-518-3040', N'849-638-7312', 7)
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [NumeroDocumento], [FechaNacimiento], [Edad], [Direccion], [Telefono], [Celular], [IdSucursal]) VALUES (12, N'marina', N'gomez', N'001-20369852-1', CAST(N'2000-03-13' AS Date), 22, N'Calle #02 El Palmar de Herrera, Santo Domingo Oeste', N'829-578-3010', N'809-638-7412', 8)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Marca], [Descripcion], [Precio]) VALUES (1, N'Base H&M', N'H&M', N'Base de color crema', CAST(725 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (1, N'El Rincon de los Cosmeticos - San Cristobal', N'Calle San Juan #22', N'8091237654', NULL, N'rinconcosmetic_sc@outlook.com')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (2, N'El Rincon de los Cosmeticos - Bani', N'Calle Padre Billini #42', N'8091237555', NULL, N'rinconcosmetic_bn@outlook.com')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [Direccion], [Telefono], [Telefono2], [Email]) VALUES (3, N'El Rincon de los Cosmeticos - Barahona', N'Calle 30 de Mayo #05', N'8091237756', NULL, N'rinconcosmetic_br@outlook.com')
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderDetails] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrden])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Order_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Producto]
GO
USE [master]
GO
ALTER DATABASE [RinconCosmetic] SET  READ_WRITE 
GO
