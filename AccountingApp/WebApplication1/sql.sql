USE [master]
GO
/****** Object:  Database [Accounting]    Script Date: 07/31/2014 17:16:15 ******/
CREATE DATABASE [Accounting] ON  PRIMARY 
( NAME = N'Accounting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Accounting.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Accounting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Accounting_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Accounting] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accounting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accounting] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Accounting] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Accounting] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Accounting] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Accounting] SET ARITHABORT OFF
GO
ALTER DATABASE [Accounting] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Accounting] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Accounting] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Accounting] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Accounting] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Accounting] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Accounting] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Accounting] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Accounting] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Accounting] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Accounting] SET  DISABLE_BROKER
GO
ALTER DATABASE [Accounting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Accounting] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Accounting] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Accounting] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Accounting] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Accounting] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Accounting] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Accounting] SET  READ_WRITE
GO
ALTER DATABASE [Accounting] SET RECOVERY FULL
GO
ALTER DATABASE [Accounting] SET  MULTI_USER
GO
ALTER DATABASE [Accounting] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Accounting] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Accounting', N'ON'
GO
USE [Accounting]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CategoryDescription] [varbinary](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[HireDate] [date] NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[StateID] [int] NULL,
	[Phone] [numeric](18, 0) NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[StateID] [int] NULL,
	[City] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[CateoryID] [int] NULL,
	[SupplierID] [int] NULL,
	[QuantityPerUnit] [nvarchar](50) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsInOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[ProductDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [date] NULL,
	[RequiredDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
	[Discount] [int] NULL,
	[Remarks] [varchar](max) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[DateCreated] [datetime] NULL,
	[CheckedOut] [smallint] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 07/31/2014 17:16:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemsID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [smallint] NULL,
	[UnitPrice] [money] NULL,
	[Discount] [real] NULL,
	[Total] [real] NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Employee_State]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_State]
GO
/****** Object:  ForeignKey [FK_Customer_Customer]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
/****** Object:  ForeignKey [FK_Product_Category]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  ForeignKey [FK_Product_Supplier]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
/****** Object:  ForeignKey [FK_Order_Customer]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Order]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
/****** Object:  ForeignKey [FK_Product_OrderDetails]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Product_OrderDetails] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Product_OrderDetails]
GO
/****** Object:  ForeignKey [FK_Cart_Customer]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
/****** Object:  ForeignKey [FK_Cart_Order]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Order]
GO
/****** Object:  ForeignKey [FK_CartItems_Cart]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Cart]
GO
/****** Object:  ForeignKey [FK_CartItems_Product]    Script Date: 07/31/2014 17:16:16 ******/
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Product]
GO
