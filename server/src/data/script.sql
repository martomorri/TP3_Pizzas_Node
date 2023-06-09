USE [master]
GO
/****** Object:  Database [Pizzas]    Script Date: 4/5/2023 18:59:48 ******/
CREATE DATABASE [Pizzas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pizzas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pizzas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pizzas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pizzas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pizzas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pizzas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pizzas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pizzas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pizzas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pizzas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pizzas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pizzas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pizzas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pizzas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pizzas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pizzas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pizzas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pizzas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pizzas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pizzas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pizzas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pizzas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pizzas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pizzas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pizzas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pizzas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pizzas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pizzas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pizzas] SET RECOVERY FULL 
GO
ALTER DATABASE [Pizzas] SET  MULTI_USER 
GO
ALTER DATABASE [Pizzas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pizzas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pizzas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pizzas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pizzas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pizzas] SET QUERY_STORE = OFF
GO
USE [Pizzas]
GO
/****** Object:  User [Pizzas]    Script Date: 4/5/2023 18:59:48 ******/
CREATE USER [Pizzas] FOR LOGIN [Pizzas] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Pizzas]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 4/5/2023 18:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NULL,
	[LibreGluten] [bit] NULL,
	[Importe] [float] NULL,
	[Descripcion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pizza] ON 

INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (1, N'Muzzarella', 0, 4500, N'Es la mas simple pero la mas bonita')
INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (2, N'Fugazzetta', 0, 8500, N'Ni hablar de esta. MMMM')
INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (3, N'Napolitana', 0, 1000, N'Sobrevaloradisima')
INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (4, N'4 Quesos', 1, 10000, N'Sin comentarios')
INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (5, N'Tkl', 0, 2000, N'Farmacias TKL')
INSERT [dbo].[Pizza] ([Id], [Nombre], [LibreGluten], [Importe], [Descripcion]) VALUES (6, N'Hawaiana', 0, 10, N'Comprala si queres un ataque al corazon')
SET IDENTITY_INSERT [dbo].[Pizza] OFF
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPizza]    Script Date: 4/5/2023 18:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPizza]
	@id int,
	@nombre varchar(150),
	@libreGluten bit,
	@importe float,
	@descripcion varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Pizza SET Nombre = @nombre, LibreGluten = @libreGluten, Importe = @importe, Descripcion = @descripcion
	WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[CrearPizza]    Script Date: 4/5/2023 18:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearPizza]
	@nombre varchar(150),
	@libreGluten bit,
	@importe float,
	@descripcion varchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Pizza VALUES (@nombre, @libreGluten, @importe, @descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarPizza]    Script Date: 4/5/2023 18:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPizza]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	DELETE Pizza FROM Pizza WHERE Id = @id
	SELECT 'Rows Affected' = @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPizzas]    Script Date: 4/5/2023 18:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarPizzas]

AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Pizza
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPizzaXID]    Script Date: 4/5/2023 18:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarPizzaXID]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Pizza WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [Pizzas] SET  READ_WRITE 
GO
