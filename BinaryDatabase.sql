USE [master]
GO
/****** Object:  Database [BinaryTextAdventure]    Script Date: 11/1/2018 3:17:21 PM ******/
CREATE DATABASE [BinaryTextAdventure]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BinaryTextAdventure', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BinaryTextAdventure.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BinaryTextAdventure_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BinaryTextAdventure_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BinaryTextAdventure] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BinaryTextAdventure].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BinaryTextAdventure] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET ARITHABORT OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BinaryTextAdventure] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BinaryTextAdventure] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BinaryTextAdventure] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BinaryTextAdventure] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET RECOVERY FULL 
GO
ALTER DATABASE [BinaryTextAdventure] SET  MULTI_USER 
GO
ALTER DATABASE [BinaryTextAdventure] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BinaryTextAdventure] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BinaryTextAdventure] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BinaryTextAdventure] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BinaryTextAdventure] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BinaryTextAdventure', N'ON'
GO
ALTER DATABASE [BinaryTextAdventure] SET QUERY_STORE = OFF
GO
USE [BinaryTextAdventure]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [nvarchar](40) NULL,
	[LastName] [nvarchar](40) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ending]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ending](
	[EndingId] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[EndingName] [nvarchar](128) NOT NULL,
	[EndingText] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EndingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventChoice]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventChoice](
	[EventChoiceId] [int] IDENTITY(1,1) NOT NULL,
	[SceneId] [int] NOT NULL,
	[GenerationNumber] [int] NULL,
	[ImgUrl] [nvarchar](1000) NULL,
	[EventName] [nvarchar](50) NOT NULL,
	[StartText] [nvarchar](max) NOT NULL,
	[PositiveText] [nvarchar](max) NOT NULL,
	[NegativeText] [nvarchar](max) NOT NULL,
	[PositiveRoute] [int] NULL,
	[NegativeRoute] [int] NULL,
	[PositiveButton] [nvarchar](128) NOT NULL,
	[NegativeButton] [nvarchar](128) NOT NULL,
	[PositiveSceneRoute] [int] NULL,
	[NegativeSceneRoute] [int] NULL,
	[PositiveEndingId] [int] NULL,
	[NegativeEndingId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 11/1/2018 3:17:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[GameTitle] [nvarchar](75) NOT NULL,
	[IntroText] [nvarchar](max) NOT NULL,
	[Health] [int] NOT NULL,
	[Gold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outcome]    Script Date: 11/1/2018 3:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outcome](
	[OutcomeId] [int] IDENTITY(1,1) NOT NULL,
	[EventChoiceId] [int] NOT NULL,
	[Positive] [bit] NOT NULL,
	[Health] [int] NOT NULL,
	[Gold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OutcomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCharacter]    Script Date: 11/1/2018 3:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCharacter](
	[CharacterId] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [nvarchar](128) NOT NULL,
	[SceneId] [int] NOT NULL,
	[EventChoiceId] [int] NOT NULL,
	[CharacterName] [nvarchar](30) NOT NULL,
	[HealthPoints] [int] NOT NULL,
	[Gold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scene]    Script Date: 11/1/2018 3:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scene](
	[SceneId] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[IsStart] [bit] NOT NULL,
	[SceneName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SceneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201810222204576_init', N'BTAdventure.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2D3B61323E30BA6ED45DE066C89DD1646A2B412E5B511EC97E5219F945F4851A22EBCE9D22D77B717030C5A64F154B158248BC5A2FFF79FFF4E7F7A0903EB1927A91F9133FB6872685B98B891E793D5999DD1E50F9FEC9F7EFCE31FA6975EF862FD5CD29D303A6849D233FB89D2F8D47152F70987289D84BE9B4469B4A413370A1DE445CEF1E1E1DF9CA3230703840D589635FD9A11EA8738FF80CF59445C1CD30C0537918783949743CD3C47B56E5188D318B9F8CCFEFC70EE3D6342B3044F1EAF274503DB3A0F7C04C2CC71B0B42D4448441105514F1F533CA7494456F3180A50F0F01A63A05BA220C5BC0BA73579DFDE1C1EB3DE3875C312CACD521A8503018F4EB87A1CB9F95A4AB62BF581022F41D1F495F53A57E2997DEDE1BCE86B1480026486A7B32061C467F64DC5E23C8D6F319D940D2705E4550270BF46C9F74913F1C0EADDEEA032A7E3C921FB7760CDB2808DEB19C1194D507060DD678BC077FF895F1FA2EF989C9D1C2D96279F3E7C44DEC9C7BFE2930FCD9E425F814E2880A2FB248A7102B2E165D57FDB72C4768EDCB06AD6685368056C0966866DDDA0972F98ACE813CC99E34FB675E5BF60AF2CE1C6F5487C9848D08826197CDE6641801601AEEA9D569EECFF16AEC71F3E8EC2F5163DFBAB7CE825FE30711298575F7190D7A64F7E5C4C2F61BCBF71B2AB240AD9B7685F45EDB77994252EEB4C64247940C90A5351BAA9531B6F2F936650E39B7589BAFFA6CD2455CD5B4BCA3AB4CE4C28596C7B3694F2BE2DDFDE16771EC73078B969318DB4199C76BF9A4800079648561BD0515F0322D0B1DFF37A7819223F186141ECC105DC91A59F84B8EAE5E708CC0F91C132DFA33485F5C0FB074A9F5A44879F23883EC76E968099CE290AE337E776FF14117C9B850B66FDDBE335DAD03CFC1A5D219746C92561AD36C6FB12B9DFA38C5E12EF0251FC48DD12907D3EF8617F8051C439775D9CA65760CCD89B45E06D9780D7849E1C0F86636BD4AE1D925980FC50EF9148ABE9B792B4F64AF4148A676220D379276DA27E89563EE9276A496A16B5A0E81495930D159581F59394539A05CD093AE52CA846F3F7F2111ADFE1CB61F7DFE3DB6CF336AD050D35CE6185C47FC70427B08C79F788529C907A04FAAC1BBB7016F2E1634CDF7C6FCA39FD8C826C6C566BCD867C11187F36E4B0FB3F1B7231A1F8D9F79857D2E3185412037C2F7AFD09AB7BCE49926D7B3A08DDDC36F3EDAC01A6E9729EA691EBE7B3401300E3E10B517EF0E1ACEE5846D11B391E021D0343F7D9960725D0375B36AA3B7281034CB175EE1601C2194A5DE4A96A840E7903042B77548D60755C4414EE2F0A4FB0749CB046881D825298A93EA1EAB4F089EBC728E8D492D4B2E716C6FA5EF1906B2E708C0963D8A9893ECCF561102640C5471A942E0D4D9D86C5B51BA2C16B358D79970B5B8FBB129DD88A4D76F8CE06BBE4FEDB9B1866BBC6B6609CED2AE9238031A4B70B03E56795BE06201F5CF6CD40A51393C140B94BB515031535B603031555F2EE0CB438A2F61D7FE9BCBA6FE6291E94B7BFADB7AA6B07B629E863CF4CB3F03DA10D85163851CDF362C12AF10BD51CCE404E7E3E4BB9AB2B9B08039F632A866C6A7F57EB873AED20B211B501D686D601CA2F03152065420D10AE8CE5B54AC7BD8801B065DCAD1596AFFD126CC30654ECE6A56883D07C752A1B67AFD347D5B3CA1A1423EF755868E0680C425EBCC48EF7508A292EAB2AA68F2F3CC41B6E748C0F468B823A3C578392CACE8CAEA5D234BBB5A473C886B8641B6949729F0C5A2A3B33BA96B88D762B49E3140C700B365291B8858F34D9CA4847B5DB547553A74897E20553C7905735BD4171EC935523CF8A9758F322C96AF6C37C78EA515860386EAAC940AAA4AD38D128412B2CD5026B90F4CA4F527A81285A2016E79979A142A6DD5B0DCB7FC9B2B97DAA8358EE032535FB5DB4D05FE10BDBADEA8F70982BE864C89C9A3C92AE31017D738BA5BEA100259AE0FD2C0AB290987D2C73EBE20AAFD9BE285111A68E24BFE243290A533C5D51FBBDC6469D17E38D53E5C5AC3F56660893C64B1FB4A973935F6A4629C3544D1453E86A6763677267868E97EC2C0E1FAE4E84B7995D3C43A509C08B066234921C14B0465D7F54310FA58929D6F44794924D9A9052D500299B29258290CD8AB5F00C1AD553F4E7A0269134D1D5DAFEC89A749226B4A67A0D6C8DCC725D7F544DC649135853DD1FBB4E3F91D7D13DDEBF8C47984D36B0E2A0BBD90E66C0789B45719C0DB0719FDF046A140FC4E237F60A182FDF4B83329EF63631A822C4B199411930CCEB8F70192E2E3FAD37F8664CE1865B58E2DB6EF8CD78C3CCF64D8D4339EFC92415F7EADC279DEFA6FCACD5FDB846397C1524B655AA11B6F7D794E270C20826F35F8259E063B69897043788F84B9CD222ABC33E3E3C3A961EE7ECCF4319274DBD40735635BD9611C76C0B095AE41925EE134AD474890D1E93D4A04A24FA9A78F8E5CCFE77DEEA340F6AB05F79F181759D3E12FF970C2A1E920C5BBFA9E99FE324D7F778CE5109FADBBB7827D15FE5D7FFFA56343DB0EE12984EA7D6A1A4E875865F7C3D31489AA2E906D2ACFDA6E2FDCE36E1A98216559A2DEBBF4C58F874945709A5947F0AD1CB9F878AA67D79B011A2E675C15878A3A8D0F47A601D2CE3CB010F3E69FE72605867F52F09D611CDF88AC027C3C1E43704FD97A1B2E50EF721CD99691B4B52AEE7CE1CEC8D123277BD3729A9DA1B4D74351D7B00DCA829D79BB928EF2C9579B4AD5393A93C1AF62EEDFECDD393F72523B976DA779B88BCCDDCE3969BA5DF55CAF11E24C969927E769F58BC6D5B330581F73C3B7358FAF09E191BDFE6779F24BC6D63330588F7DCD806A502EF99ADED6AFFDCB1A5F5DE42779ED8ABE628192E737451E4AEC4DD22E40EC7FF450446507894C57B4B7DA69889596D2C4686358999A939454D66AC4C1C85AF42D1CE76585FF986DFDA594ED3CED690D8D9C69BAFFFADBC394D3B6F43BAE42E528EB5098BBA34F08E75AC2D8FEA3DA5180B3DE9C868EFF2595B6FE6DF5346F1284A11668FE176F9FD24108FA29231A7CE808461F5A218F6CEC6DF6A84FD3BF5573504FBCB8D04BBC2AE59D15C9365546EDE9244258914A1B9C11479B0A59E27D45F229742350B40E70FC6F3A01EBB065960EF9ADC6534CE287419878B4008783127A08D7F9E152DCA3CBD8BD9573A4617404C9F05EEEFC8E7CC0FBC4AEE2B4D4CC800C1BC0B1EEE65634959D877F55A21DD46A42710575FE5143DE0300E002CBD2373F48CD7910DCCEF0B5E21F7B58E009A40BA074254FBF4C247AB048529C7A8DBC327D8B017BEFCF87FC29A5B39B2540000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201810231825055_firstlast', N'BTAdventure.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC2DB24ED206CD0DEB64D1B7052DD18EB012A54A549AA0E897F5A19FD45F28295117DE24CA566CA72850C4E4F0CC7038430E47C3FDF7EF7FC63F3D8581F50893D48FD0C43E18EDDB16446EE4F96839B133BCF8FE9DFDD3FBAFBF1A9F79E193F5A9A43BA27464244A27F603C6F1B1E3A4EE030C413A0A7D3789D26881476E143AC08B9CC3FDFD1F9D83030712089B6059D6F86386B01FC2FC07F9398D900B639C81E02AF26090B276D233CB51AD6B10C234062E9CD81FEE4EBC47887096C0D1FDC5A818605B27810F883033182C6C0B2014618089A8C7F7299CE12442CB594C1A4070F71C4342B700410AD9148E6B72D3D9EC1FD2D938F5C012CACD521C853D010F8E987A1C71F84A4AB62BF511059E1145E3673AEB5C8913FBC28379D3C728200A10191E4F8384124FECAB8AC5491A5F433C2A078E0AC8F384C0FD11255F464DC43DCB78DC5E654E87A37DFADF9E35CD02BAAE1304339C8060CFBACDE681EFFE0A9FEFA22F104D8E0EE68BA3776FDE02EFE8ED0FF0E84D73A664AE848E6B204DB74914C384C80617D5FC6DCBE1C739E2C06A58634CA115624BC4336CEB0A3C5D42B4C40FC4670EDFD9D6B9FF04BDB28519D73DF28923914138C9C8CFEB2C08C03C8055BFD3CA93FEBF85EBE19BB78370BD068FFE325F7A813F719C84F8D54718E4BDE9831F17EEC5ADF76746769E4421FDCDDB57D1FB791665894B27136949EE40B28498976EECD4C66B64D2146A78B32E5177DFB4A9A4B2792B49E98456F18492C5A6BDA194F765F91A5BDC491C93C5CB4D8B6AA4CDE094E7D54800D8B378B2DA800E4C0D089189FD9FF7C3733F4971C7A6F8C3BE11E776469760337CCE42E00703ECF0065C487CB5F0931056CBF62122FE0450EF45B805694A3638EF17903EB4884EFE1C40F41974B384F8DD0C83307E716EB70F1182D75938A7EEBC395E832DCDDD1FD1397071949C213A6A6DBCCBC8FD1265F80C79A700C37BEC9680F4E79D1F9A030C22CE89EBC2343D27C60CBD6944AE0F25E005C24787BDE1E8A6BBED086B1A003F548758C2F1F0B924ADC32C3585146A69C854E1569BA897D1D24766A296A47A510B8A4E5119595F51299899A48C522F684ED02967413558009BAFD0F0116C0EBBFB21EC7AD1886E2F68A871467648F833443021DB98770B308609AA57C064DFD846F4932F1F65FAE26753CEE91308B2A159ADE40DF92630BC37E4B0BBEF0DB998A4F9D1F768546270AF2B8909BC11BDFACAD8ED7382649B76076E9A9B66BE993D40E72E27691AB97EEE058A8C1ECBC7F0F29318CEEA4ECE14B311133C6462C4D07D7AE4911632375B34AA1B740A0388A175E21619CF29485DE0C96A2413F27A08569EA80AC1EA440F2FDC77124F62E930A18300BD04A5C4537D8465B7F091EBC720E8D49230D2F008A373AF78883DA730868832ECD4840973755E870A50F11116A54B4363A76171ED86A8895A756BDE15C2D6EB2EA55B3662931DB1B3C62E59FCF62286D9AEB10D1867BB4A4C04D0E628B761A0ECAE626A00E2C565D70C54B831690C9485541B31505E635B30505E25AFCE408B2BAAE9FA0BF7D55D334FFEA2BCF963BD555D5BB04D4E1F3B669A45EC49C660320226B2799ECE69277CC28ACB199193DDCF5216EA8A2642C16710F3299B3ADE55C6A14E3B8868446D80B5A17580B2AF9B1290E4503D842B7379ADD2B128A2076C99776B85657BBF00DBB00119BBF995B741A8FF162C1AA7D1EDA39A59650D92911B5D161A380A8310372F7EE2064AD1E56565C598C4C27DA2E1C6C4D862B428A82372D528A99CCCE05A2A4DB35B4BAA80AC4F48B6969684F049A3A57232836B89D968B7921441418FB0602D15F147F840CE56663AAAD3A6EA1B3B45FD176B183B9A42B1F11588631F2D1B8563ACC59A155563D3EF67FD6BA9C202C37153454955256DC50947095842A197B02692E61FAF4F01067340F33C532F94C89467AB66FB2F59368F4F7911CB73A0A4A67F1723D43509DC712BC7230CE69C4C32A4414D9E495798807AB8456BF940001245F27E1A055988F431967E74F109AF39BE689111C68E20BF1443490A93225D5EFB466B23FBC570EB544531ABAF951E42A7F132066DEA5C1797EA51CA3455134597BADADADAE9C299BEEB25068BFD97AB13E165BCAB5172D30469349B63D555354DA8BAD51C89D5CD346158534F8C46E98504D6E83347E5AB639A987C8F39A25002D38414BA7A48D92C74E1846C76AC84A7D1A89AC29C835CDAD244977B7B58A55CE4C299A7DCBD02B64266B1CF1C555107D30456749B63D74531E2EEBEC3A7AAF662B5CEB15A5CBFD73B5735182FB3550F732C37AA0C9A408DE69E58AC8E400263ED3B6950DA3BE83A0655245ED633280D867EFFE13ED1F3DB4F6B5D811E93FBEECE6DF16D75077ABC7E66FBA2C621DD4245928A7B751B156E9D637603EC7EC3245D090B12DB2AD5488EF7E714C370440946B3DF8369E043BA9997045700F90B98E2A2D6C43EDC3F3814DE40EDCE7B24274DBD407183D63D4AE2D76C036563E81124EE0348E4228E35DEECD4A0527EFC0279F06962FF998F3ACE532DF4AFBC79CFBA48EF91FF7B463AEE920C5A7FC945A9C3BC613078355309FAD7AB788E62AEF28BDF3E1743F7AC9B84B8D3B1B52F287A95E5E71FA9F492A618BA86342B3F5D79BDDE26BD085122D3B71A35F02A0F400682E5DE7B283105E75EFD79C7DCC7833CED28A5FC26044FDFF6154DF97C632D44C5138DA1F00651A1EE09C62A58DAE7171EF989F3E7173DAD5AF91C6315D1B44F317CD41F4C7C8861BE6B9623B7786C2AAE789BD841733D7716B2AF55D5BAEDA354AA775FCBD1E59AF61E7083D6ADAF1751BDB27AF0C14E7A45B9F760D8DBB4FB17AFF1DE95B2EEFA8EB1DD6AEE4D1670B77C9EFB5FD56DEF40A5A1A2726AFBD5D99BB6355DCE7AC74B5CFBD560EF98B1B1637EFB95D69B36365D3E7BC78DAD573DF58ED9DAB6CECF2D5B9AF111BAF5EA68B9D04BF3ED4995F4EEAA7E2EBE1090EBFF3C2246504494C5A35575B99D8E596D2C5A8635899EA9BECE4F642C398EC457A26867DB6FAEECC06F9D2CA36967ABA98E6DE3CDF6FF56DE8CA69DB7A6E6741B75DBCAAA4F552D7DC73ED6568CF69AEAB4B999743C0BE88A595B0B095E5359F6204AE1BC47F331FCF554610FA292215DA747D5B5FC5D9B9C9D8D7FC1939CDFA9BFAC21E8BFE789A0CB9D9A15CD055A44E5E12D48549208199A2B8881478ED49304FB0BE062D24D13D0F9ABFB3CA9473F83CCA177816E321C67984C1986F3804B78D120A08D7F5E5ACECB3CBE89E9AF74882910317D9AB8BF411F323FF02AB9CF1539210D048D2E58BA97AE25A669DFE57385741D214320A6BE2A28BA83611C10B0F406CDC0235C4536627E977009DCE73A03A803E95E085EEDE3531F2C1310A60CA31E4F7E121BF6C2A7F7FF01E16D2E60C8560000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Creator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a60f9be0-baff-48c7-beb6-049114db1a2d', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1cb4258e-b0ca-4fae-b746-e831f0cab106', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a60f9be0-baff-48c7-beb6-049114db1a2d', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1cb4258e-b0ca-4fae-b746-e831f0cab106', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'484946c7-b906-4a39-8b15-58e5629ac87e', N'3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'00000000-0000-0000-0000-000000000000', NULL, 1, NULL, NULL, NULL, 1, 1, NULL, 1, 1, N'Alvin', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'10000000-0000-0000-0000-000000000000', NULL, 1, NULL, NULL, NULL, 1, 1, NULL, 1, 1, N'Simon', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'1cb4258e-b0ca-4fae-b746-e831f0cab106', N'creator@creator.com', 0, N'ANVmyOY5sJgmHtjlIzq0NuZ9MKlXP2GzBrdTN3oWBA+YJLzi2R5DH/hp6V9y6RORFw==', N'6465c93e-597c-444d-b1f6-9450064c2735', NULL, 0, 0, NULL, 1, 0, N'creator@creator.com', N'creator', N'creator')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'20000000-0000-0000-0000-000000000000', NULL, 1, NULL, NULL, NULL, 1, 1, NULL, 1, 1, N'Piotr', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'484946c7-b906-4a39-8b15-58e5629ac87e', N'user@user.com', 0, N'ADaS3zo0G3ILfELYHAJF8j3ngjmXJNqr04vxVwKfdkjbDtkkA5ks41BElXP49UybqQ==', N'2937b5c7-b664-48da-a706-8e2f85821299', NULL, 0, 0, NULL, 1, 0, N'user@user.com', N'user', N'user')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName]) VALUES (N'a60f9be0-baff-48c7-beb6-049114db1a2d', N'admin@admin.com', 0, N'AF3Hwrh0a/lEb9IdlaGukHdXenGAR/XMV3v0bWs65PeLy7/sdOgeMcgnmbTNDOXu7g==', N'0eb698b8-db7a-49ee-9489-ad0b1e923bf6', NULL, 0, 0, NULL, 1, 0, N'admin@admin.com', N'test', N'test')
SET IDENTITY_INSERT [dbo].[Ending] ON 

INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (1, 3, N'The End', N'The end is at hand.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (2, 1, N'Bad End', N'Bad Ending here. Hi.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (3, 1, N'Yo!', N'Yo. I''m the good ending.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (4, 2, N'Sup.', N'Just end number 4 here. Sup.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (5, 2, N'Fin', N'It''s over. You can leave now.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (6, 1, N'Yawn', N'You have bored me. Leave now.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (7, 3, N'Behold The Might Of Space', N'Space retaliates. You have "dead" now.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (8, 4, N'You Died', N'The princess ended your life. It''s her own sense of responsibility towards her people. Curing the sickness by removing those who have it. Her chilling smile is the last thing you see.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (9, 4, N'Bar Death', N'‘A single word started the brawl, one that took your life.’')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (10, 4, N'You ate until you became full.', N'All in all, an average day.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (11, 5, N'Didn''t Join', N'You missed an incredible opportunity. Fortnite seemed more important. ')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (12, 5, N'Everyone Bids You Farewell', N'The struggles were too much to bare this time around. But everyone knows you had your own circumstances.')
INSERT [dbo].[Ending] ([EndingId], [GameId], [EndingName], [EndingText]) VALUES (13, 5, N'You Passed!', N'It may have been difficult, but it was rewarding in equal measure. 
To Be Continued... (job search)')
SET IDENTITY_INSERT [dbo].[Ending] OFF
SET IDENTITY_INSERT [dbo].[EventChoice] ON 

INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (1, 1, 0, N'https://static1.squarespace.com/static/5a023d01ace864fd7fef3370/5a025338a6525a7eeaae3341/5a02532ea6525a7eeaae30fe/1513028424278/Grand+Stir+Hall%2C+Black+and+White+Marble+Foyer%2C', N'Greeting Event', N'You are greeted in the foyer.', N'You are gracious to your host', N'You punch numerous holes in the foyer walls. A magical portal opens from one hole and you are teleported somewhere.', 2, NULL, N'Be gracious.', N'Punch holes in walls.', NULL, 7, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (2, 1, 1, N'https://images2.roomstogo.com/is/image/roomstogo/dr_rm_hillcreek_black_6_chrs_~Hill-Creek-Black-5-Pc-Rectangle-Dining-Room.jpeg?$pdp_gallery_945$', N'Post-Greeting Event', N'You travel from the foyer to the dining room.', N'You enjoy a hearty meal', N'You have a heart attack.', NULL, NULL, N'Enjoy.', N'Don''t enjoy', NULL, NULL, 3, 2)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (3, 7, 0, N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Alcazar_de_Segovia.JPG/1200px-Alcazar_de_Segovia.JPG', N'Fantasy Castle Event', N'You open your eyes to see an immense castle.', N'You bask in the glory of the castle', N'You are struck by a falling cherub and die.', NULL, NULL, N'Good Choice.', N'Bad Choice', NULL, NULL, 3, 6)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (4, 2, 0, N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Andrew_Classroom_De_La_Salle_University.jpeg/1200px-Andrew_Classroom_De_La_Salle_University.jpeg', N'Classroom Greeting Event', N'You are greeted in the classroom.', N'You are gracious to your teacher.', N'You are ungracious to your teacher.', NULL, NULL, N'Be gracious.', N'Be ungracious.', NULL, NULL, 5, 4)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (5, 3, 0, N'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/International_Space_Station_after_undocking_of_STS-132.jpg/1200px-International_Space_Station_after_undocking_of_STS-132.jpg', N'Space Greeting Event', N'You are greeted in space.', N'You are gracious to space.', N'You snidely scoff at space.', NULL, NULL, N'Be gracious.', N'Scoff', NULL, NULL, 1, 7)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (6, 8, 0, N'https://i.pinimg.com/originals/ab/3b/c8/ab3bc8150858f1edace89f082bdface0.jpg', N'Huddle Event', N'The brisk morning air greets you as you awaken from coughing. You turn to see a fellow beggar’s cold and lifeless eyes. Another victim of the plague.', N'A warmth comes over you, as if your rags were fine linen. It’s as if God himself replied.', N'You hate to do it, but this is the reality of the times: anything to survive.', NULL, NULL, N'Say a Prayer', N'Take His Belongings', 9, 9, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (8, 9, 0, N'http://www.pngmart.com/files/4/Armored-Knight-PNG-File.png', N'Streets Event', N'You choose a spot at the end of the market. Hands held outward; pleading for charity. A knight approaches. He drops several coins, they clink loudly as they hit the ground. The crowd seems to admire this act of kindness; only you and the knight know it as mockery.', N'You grab the coins, slightly wedged in the mud.', N'The knight becomes furious, kicks you over then leaves.', 9, 9, N'Gratefully Accept', N'Leave them alone', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (9, 9, 1, N'https://lifetakeslemons.files.wordpress.com/2012/02/alexander-roslin-portrait-of-grand-duchess-maria-fiodorovna-at-the-age-of-18-1777-oil-on-canvas-265-c397-178-cm-hermitage-museum-st-petersburg.jpg?w=604', N'The Princess', N'Suddenly a woman in fine linen approaches you. She asks if you are hurt.', N'The woman reveals her identity as the eldest princess. She insists on tending to your wounds at the castle.', N'The woman is appalled, she walks away.
You head towards the tavern, hopefully to find a meal.', NULL, NULL, N'You express pain, without hatred', N'You curse about the knight', 10, 11, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (10, 10, 0, N'https://i.dailymail.co.uk/i/pix/2016/04/14/12/332A52BB00000578-3539618-The_historical_reconstruction_makes_it_look_as_if_the_impressive-m-60_1460631847155.jpg', N'Castle Event', N'The castle walls begin to engulf the horizon on your approach. The sun is eventually blocked by the massive structure. Several guards snicker as you pass. The princess gives them a sharp stare before they straighten up, resuming their post.
 …
You find your way to the infirmary, sullen behind the princess. As you are seated you see her reach for a tray of sharp tools.
', N'She hurries over to give you some medicine, as she gives it to you, you notice a sharp pain in your spine. A knife wound.', N'You run away remember the guards who snickered. Something isn''t right here.', NULL, NULL, N'Cough', N'Run', NULL, 11, 8, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (11, 11, 0, N'https://orig00.deviantart.net/e698/f/2011/048/7/d/7d432764399c8d1359ee5326fdac1537-d39rayp.jpg', N'Bar Event', N'The barkeep yells as you enter. “Their’s no warmth for free, I’m afraid.” The roar of the the other guests slows at this remark. You pour your purse, humble as it is, into your left hand. He gestures towards the counter permissively, and the crowd resumes it’s banter. One man doesn’t appear pleased. As you are about to be seated this man pushes you backwards. “You’re sick aren’t you? It’s you people who fester in the streets that spread the disease.”
', N'You explain the horrors you''ve seen. That you only want to use the small change you have to eat.

The man calms down. ''Do it fast then'', he says returning to his group.', N'You push the man backwards. His friends become enraged. Grabbing their ale cups, they bash you over the head.', NULL, NULL, N'Explain yourself.', N'Pick a fight.', NULL, NULL, 10, 9)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (13, 12, 0, N'https://vignette.wikia.nocookie.net/karnione1/images/3/31/Fantasy_Mountain_Art_Hd_Background_9_HD_Wallpapers.jpg/revision/latest?cb=20140914025710', N'Join The Guild', N'A call was sent across the lands: "Great fortune and opportunity awaits those who traverse the great mountain steps."', N'14000, A hefty price to pay. The first half now. But it''s outcome should far exceed the cost. You ready yourself, and meet your companions.', N'The thought of the perils weighed too heavy on your mind.', 14, NULL, N'Join the Guild', N'Do Nothing', NULL, NULL, NULL, 11)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (14, 12, 1, N'https://i.redd.it/9hbdrijg7l1y.png', N'Battleship', N'You and your companions first stepped into a forested peak. It was easy-going on the first 3rd-moon of your travel. But to your surprise a large shipping vessel was wedged on this peak.', N'You knew nothing of the vessel''s layout. At time''s you figuratively banged your head against the wall, and literally face-palmed.. ', N'You missed an important learning opportunity. For "Success is a poor teacher." -Corbin March', 15, 15, N'Board the ship', N'Play Fortnite', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (15, 12, 2, N'https://media1.tenor.com/images/9f1fc475633662e60d832478eff0b17f/tenor.gif?itemid=4882104', N'Wounded', N'You find yourself falling behind the other adventurers. Earlier you had fallen and injured yourself.', N'You forget any pride, and ask a companion for help. He/She smiled, stating: "I have no idea what I''m doing either."', N'You bear your injuries. Deep down-- you know that it will only fester and worsen. ', 16, 16, N'Ask for Help', N'Do Nothing', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (16, 12, 3, N'https://cdn-images-1.medium.com/max/1200/1*ljWWR8lL0PeLzQzs6qI6nQ.png', N'Unit Testing', N'The leader says to prepare for an upcoming battle. "Test your gear", he said.', N'Your gear shimmers--glistens even. You feel prepared against any foe.', N'A sea of red letters; you barely make it through.', 17, 17, N'Sharpen your... code.', N'Curse', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (17, 12, 4, N'http://www.aadhu.com/wp-content/uploads/2017/05/lara-croft-cosplayer-poses-with-actual-giant-bear.jpg', N'First Capstone', N'After many arduous struggles, the foe named "Flooring Mastery" fell. Many companions cheered, while others perished.', N'You embrace the struggles you''ve been through.  Another 7000 gold required.', N'You decide to part ways with your companions. Possibly to enroll on the next expedition.', 18, NULL, N'Stay Enrolled, embracing future trials.', N'Quit', NULL, NULL, NULL, 12)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (18, 12, 5, N'https://www.creativeuncut.com/gallery-25/art/ss-magic-spell.jpg', N'Web Services', N'You always used the magical force known as ''ether''net, and the dark rituals of ''wi-fi'' but had no understanding of how it worked. 

You and your companions learned how to create a service that magically changed without reloading.', N'You loved learning magic. It feels incredibly powerful.', N'You''re having trouble understanding the concepts, but do not seek help.', 21, 21, N'Wow, This is Cool!', N'Wow, This is Hard!', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (21, 12, 6, N'https://ih1.redbubble.net/image.416986968.6661/flat,550x550,075,f.u7.jpg', N'Pre-work Event', N'You''ve gotten this far. It''s time to test your what you''ve prepared for before the venture. 
', N'You learned a new skill. Amazing; this will help down the path.
', N'Yes, there was pre-work.
', 22, 22, N'J-query is easier than JS', N'Sh*t, there was pre-work?', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (22, 12, 7, N'https://www.stevenaitchison.co.uk/wp-content/uploads/energetically_drained.jpg', N'Trials Event', N'Trial after trial began to wane your spirit. But the goal was within sight, atop the peak to the east.', N'You continue to learn more and more through each hardship.', N'I get it man / Feels bad man.', 23, 23, N'You Persevere', N'You Yield', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (23, 12, 8, N'https://cdn.tinybuddha.com/wp-content/uploads/2016/04/Stressed-man.png', N'Trials 2', N'Trials continue to wane your spirit. But the goal was even closer, atop the peak to the east.
', N'You continue to learn more and more through each hardship.', N'I get it. Feels bad man.', 24, 24, N'You Persevere!', N'You Complain', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (24, 12, 9, N'https://www.quirkybyte.com/wp-content/uploads/2017/10/5-8.jpg', N'Trials 3', N'Your spirit is near empty, but finally, the end engulfs the horizon.
', N'Nearly done. OMG', N'Can I go Home Yet?', 25, 25, N'You fight the Dementor / Persevere!!!', N'Complain', NULL, NULL, NULL, NULL)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (25, 12, 10, N'https://heavyeditorial.files.wordpress.com/2018/03/monster-hunter-world-deviljho.jpg?quality=65&strip=all', N'Capstone Week', N'You were paired in groups, 2-4 at a time for safety. There were just two beasts guarding the finish line. One that could be fought alone, but one so great it needed the group.

', N'It seems that you learned so much more during the week-long projects. AMAZING.', N'Struggle-fest. ', NULL, NULL, N'Let''s Do This!', N'Almost done...', NULL, NULL, 13, 13)
INSERT [dbo].[EventChoice] ([EventChoiceId], [SceneId], [GenerationNumber], [ImgUrl], [EventName], [StartText], [PositiveText], [NegativeText], [PositiveRoute], [NegativeRoute], [PositiveButton], [NegativeButton], [PositiveSceneRoute], [NegativeSceneRoute], [PositiveEndingId], [NegativeEndingId]) VALUES (26, 13, 0, NULL, N'Default Name', N'Default Start Text', N'Default Result Text', N'Default Result Text', NULL, NULL, N'Default Button Text', N'Default Button Text', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EventChoice] OFF
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (1, N'Fantasy Game', N'Hey there, this is a fantasy game.', 3, 2)
INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (2, N'Bullied Student Sim', N'Hey there, this is a school sim game where you get bullied.', 5, 1)
INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (3, N'Space Adventure Pt 13: The Arctonian Terradrax', N'Hey there, this is a space game where space stuff happens in space.', 2, 5)
INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (4, N'Streets of Old', N'Experience the riveting tale where you are a 17th century beggar. ', 3, 0)
INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (5, N'The G(u)ilded Adventures', N'Experience the struggles of 41 travelers, fighting to survive.', 41, 14000)
INSERT [dbo].[Game] ([GameId], [GameTitle], [IntroText], [Health], [Gold]) VALUES (6, N'Streets of Old', N'jklkjlk', 1, 0)
SET IDENTITY_INSERT [dbo].[Game] OFF
SET IDENTITY_INSERT [dbo].[Outcome] ON 

INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (1, 1, 1, 0, 10)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (2, 1, 0, -1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (3, 2, 1, 1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (4, 2, 0, 0, -10)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (5, 3, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (6, 3, 0, 1, 5)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (7, 4, 1, -1, 1)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (8, 4, 0, 2, 4)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (11, 6, 1, 3, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (12, 6, 0, 0, 3)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (13, 8, 1, 1, 6)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (14, 8, 0, -1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (15, 9, 1, 1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (16, 9, 0, -1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (17, 10, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (18, 10, 0, -1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (19, 11, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (20, 11, 0, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (23, 13, 1, -1, -7000)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (24, 13, 0, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (25, 14, 1, -5, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (26, 14, 0, -1, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (27, 15, 1, -2, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (28, 15, 0, -2, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (29, 16, 1, -3, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (30, 16, 0, -3, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (31, 17, 1, -4, -7000)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (32, 17, 0, -4, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (33, 18, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (34, 18, 0, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (35, 21, 1, -3, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (36, 21, 0, -3, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (37, 22, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (38, 22, 0, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (39, 23, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (40, 23, 0, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (41, 24, 1, -2, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (42, 24, 0, -2, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (43, 25, 1, 0, 0)
INSERT [dbo].[Outcome] ([OutcomeId], [EventChoiceId], [Positive], [Health], [Gold]) VALUES (44, 25, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Outcome] OFF
SET IDENTITY_INSERT [dbo].[PlayerCharacter] ON 

INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (1, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 1, 1, N'Player''s Character', 5, 12)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (2, N'484946c7-b906-4a39-8b15-58e5629ac87e', 2, 4, N'Lady Character', 3, 4)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (3, N'1cb4258e-b0ca-4fae-b746-e831f0cab106', 3, 5, N'Guy Character', 1, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (4, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'Albert', 4, 9)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (5, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'Albert', 7, 6)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (6, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'redrum4 a reredruming', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (7, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'REDRUM 3', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (8, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'redrum2', 7, 6)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (9, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'redrum2', 6, 6)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (10, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'redrum4 a reredruming', 3, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (11, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 8, N'redrum4 a reredruming', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (12, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 8, N'redrum4 a reredruming', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (13, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'redrum4 a reredruming', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (14, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'redrum4 a reredruming', 3, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (15, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'redrum4 a reredruming', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (16, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'redrum4 a reredruming', 3, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (17, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'redrum4 a reredruming', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (18, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'Martin', 2, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (19, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'Martin', 2, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (20, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 8, N'Martin', 3, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (21, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'Martin', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (22, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'Martin', 1, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (23, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'Martin', 2, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (24, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 8, N'Martin', 9, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (25, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'Martin', 1, 3)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (26, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'Martin', 8, 6)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (28, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'Martin', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (29, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 11, 11, N'Martin', 5, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (30, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 9, N'Martin', 7, 6)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (31, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'Martin', 3, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (32, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 8, 6, N'Martin', 3, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (33, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'Martin', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (34, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 9, 8, N'Martin', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (35, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'Martin', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (36, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 1, 1, N'Martin', 3, 2)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (37, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 10, 10, N'Martin', 6, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (38, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 14, N'Martin', 2, 7000)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (39, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 15, N'Martin', 7, 7000)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (40, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 13, N'Martin', 41, 14000)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (41, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 17, N'Martin', 34, 7000)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (42, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 25, N'Martin', 21, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (43, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 25, N'Martin', 25, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (44, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 13, N'Martin', 41, 14000)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (45, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 25, N'Martin', 25, 0)
INSERT [dbo].[PlayerCharacter] ([CharacterId], [PlayerId], [SceneId], [EventChoiceId], [CharacterName], [HealthPoints], [Gold]) VALUES (1043, N'a60f9be0-baff-48c7-beb6-049114db1a2d', 12, 25, N'Martin', 25, 0)
SET IDENTITY_INSERT [dbo].[PlayerCharacter] OFF
SET IDENTITY_INSERT [dbo].[Scene] ON 

INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (1, 1, 1, N'The Foyer')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (2, 2, 1, N'The Classroom')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (3, 3, 1, N'The Space Restaurant')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (4, 3, 1, N'The Thingverse')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (5, 3, 0, N'The Space Store')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (6, 3, 0, N'The Space Planet')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (7, 1, 1, N'The Magic Castle')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (8, 4, 1, N'The Huddle')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (9, 4, 0, N'The Streets')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (10, 4, 0, N'The Castle')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (11, 4, 0, N'The Tavern')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (12, 5, 1, N'Join The Guild')
INSERT [dbo].[Scene] ([SceneId], [GameId], [IsStart], [SceneName]) VALUES (13, 6, 1, N'The Huddle')
SET IDENTITY_INSERT [dbo].[Scene] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/1/2018 3:17:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Game] ADD  DEFAULT ((0)) FOR [Health]
GO
ALTER TABLE [dbo].[Game] ADD  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[Outcome] ADD  DEFAULT ((0)) FOR [Health]
GO
ALTER TABLE [dbo].[Outcome] ADD  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[PlayerCharacter] ADD  DEFAULT ((3)) FOR [HealthPoints]
GO
ALTER TABLE [dbo].[PlayerCharacter] ADD  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Ending]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([NegativeRoute])
REFERENCES [dbo].[EventChoice] ([EventChoiceId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([NegativeSceneRoute])
REFERENCES [dbo].[Scene] ([SceneId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([NegativeEndingId])
REFERENCES [dbo].[Ending] ([EndingId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([PositiveRoute])
REFERENCES [dbo].[EventChoice] ([EventChoiceId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([PositiveSceneRoute])
REFERENCES [dbo].[Scene] ([SceneId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([PositiveEndingId])
REFERENCES [dbo].[Ending] ([EndingId])
GO
ALTER TABLE [dbo].[EventChoice]  WITH CHECK ADD FOREIGN KEY([SceneId])
REFERENCES [dbo].[Scene] ([SceneId])
GO
ALTER TABLE [dbo].[Outcome]  WITH CHECK ADD FOREIGN KEY([EventChoiceId])
REFERENCES [dbo].[EventChoice] ([EventChoiceId])
GO
ALTER TABLE [dbo].[PlayerCharacter]  WITH CHECK ADD FOREIGN KEY([EventChoiceId])
REFERENCES [dbo].[EventChoice] ([EventChoiceId])
GO
ALTER TABLE [dbo].[PlayerCharacter]  WITH CHECK ADD FOREIGN KEY([PlayerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PlayerCharacter]  WITH CHECK ADD FOREIGN KEY([SceneId])
REFERENCES [dbo].[Scene] ([SceneId])
GO
ALTER TABLE [dbo].[Scene]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
GO
/****** Object:  StoredProcedure [dbo].[DbReset]    Script Date: 11/1/2018 3:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[DbReset] As
Begin
	Delete From PlayerCharacter;
	Delete From Outcome;
	Delete From EventChoice;
	Delete From Ending;
	Delete From Scene;
	Delete From Game;
	Delete From AspNetUsers where Id in ('00000000-0000-0000-0000-000000000000', '10000000-0000-0000-0000-000000000000', '20000000-0000-0000-0000-000000000000', 'a60f9be0-baff-48c7-beb6-049114db1a2d', '484946c7-b906-4a39-8b15-58e5629ac87e', '1cb4258e-b0ca-4fae-b746-e831f0cab106');

	DBCC CHECKIDENT ('PlayerCharacter', RESEED, 1);
	DBCC CHECKIDENT ('Game', RESEED, 1);
	DBCC CHECKIDENT ('Scene', RESEED, 1);
	DBCC CHECKIDENT ('Outcome', RESEED, 1);
	DBCC CHECKIDENT ('Ending', RESEED, 1);
	DBCC CHECKIDENT ('EventChoice', RESEED, 1);
		
	Set Identity_Insert Game On;

	Insert Into Game (GameId, GameTitle, IntroText, Health, Gold)
	Values
	('1', 'Fantasy Game', 'Hey there, this is a fantasy game.', 3, 2),
	('2', 'Bullied Student Sim', 'Hey there, this is a school sim game where you get bullied.', 5, 1),
	('3', 'Space Adventure Pt 13: The Arctonian Terradrax', 'Hey there, this is a space game where space stuff happens in space.', 2, 5)
		
	Set Identity_Insert Game Off;	
	
	Set Identity_Insert Scene On;

	Insert Into Scene (SceneId, GameId, IsStart, SceneName)
	Values
	('1', '1', '1', 'The Foyer'),
	('2', '2', '1', 'The Classroom'),
	('3', '3', '1', 'The Space Restaurant'),
	('4', '3', '1', 'The Thingverse'),
	('5', '3', '0', 'The Space Store'),
	('6', '3', '0', 'The Space Planet'),
	('7', '1', '1', 'The Magic Castle')
		
	Set Identity_Insert Scene Off;

	Set Identity_Insert Ending On;
	
	Insert Into Ending (EndingId, GameId, EndingName, EndingText)
	Values
	('1', '3', 'The End', 'The end is at hand.'),
	('2', '1', 'Bad End', 'Bad Ending here. Hi.'),
	('3', '1', 'Yo!', 'Yo. I''m the good ending.'),
	('4', '2', 'Sup.', 'Just end number 4 here. Sup.'),
	('5', '2', 'Fin', 'It''s over. You can leave now.'),
	('6', '1', 'Yawn', 'You have bored me. Leave now.'),
	('7', '3', 'Behold The Might Of Space', 'Space retaliates. You have "dead" now.')
		
	Set Identity_Insert Ending Off;

	Set Identity_Insert EventChoice On;

	Insert Into EventChoice (EventChoiceId, SceneId, GenerationNumber, ImgUrl, EventName, StartText,
	PositiveText, NegativeText, PositiveRoute, NegativeRoute, PositiveButton, NegativeButton,
	PositiveSceneRoute, NegativeSceneRoute, PositiveEndingId, NegativeEndingId)
	Values
	('1', '1', '0', 'https://static1.squarespace.com/static/5a023d01ace864fd7fef3370/5a025338a6525a7eeaae3341/5a02532ea6525a7eeaae30fe/1513028424278/Grand+Stir+Hall%2C+Black+and+White+Marble+Foyer%2C', 'Greeting Event', 'You are greeted in the foyer.', 'You are gracious to your host',
	 'You punch numerous holes in the foyer walls. A magical portal opens from one hole and you are teleported somewhere.', '2', null, 'Be gracious.', 'Punch holes in walls.',
	 null, '7', null, null),
	('2', '1', '1', 'https://images2.roomstogo.com/is/image/roomstogo/dr_rm_hillcreek_black_6_chrs_~Hill-Creek-Black-5-Pc-Rectangle-Dining-Room.jpeg?$pdp_gallery_945$', 'Post-Greeting Event', 'You travel from the foyer to the dining room.', 'You enjoy a hearty meal',
	 'You have a heart attack.', null, null, 'Enjoy.', 'Don''t enjoy',
	 null, null, '3', '2'),
	 ('3', '7', '0', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Alcazar_de_Segovia.JPG/1200px-Alcazar_de_Segovia.JPG', 'Fantasy Castle Event', 'You open your eyes to see an immense castle.', 'You bask in the glory of the castle',
	 'You are struck by a falling cherub and die.', null, null, 'Good Choice.', 'Bad Choice',
	 null, null, '3', '6'),
	 ('4', '2', '0', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Andrew_Classroom_De_La_Salle_University.jpeg/1200px-Andrew_Classroom_De_La_Salle_University.jpeg', 'Classroom Greeting Event', 'You are greeted in the classroom.', 'You are gracious to your teacher.',
	 'You are ungracious to your teacher.', null, null, 'Be gracious.', 'Be ungracious.',
	 null, null, '5', '4'),
	 ('5', '3', '0', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/International_Space_Station_after_undocking_of_STS-132.jpg/1200px-International_Space_Station_after_undocking_of_STS-132.jpg', 'Space Greeting Event', 'You are greeted in space.', 'You are gracious to space.',
	 'You snidely scoff at space.', null, null, 'Be gracious.', 'Scoff',
	 null, null, '1', '7')
		
	Set Identity_Insert EventChoice Off;
	
	Set Identity_Insert Outcome On;

	Insert Into Outcome (OutcomeId, EventChoiceId, Positive, Health, Gold)
	Values
	('1', '1', 1, 0, 10),
	('2', '1', 0, -1, 0),
	('3', '2', 1, 1, 0),
	('4', '2', 0, 0, -10),
	('5', '3', 1, 0, 0),
	('6', '3', 0, 1, 5),
	('7', '4', 1, -1, 1),
	('8', '4', 0, 2, 4)
		
	Set Identity_Insert Outcome Off;
	
	Insert Into AspNetUsers (Id, EmailConfirmed, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnabled, AccessFailedCount, UserName)
	Values
	('00000000-0000-0000-0000-000000000000', '1', '1', '1', '1', '1', 'Alvin'),
	('10000000-0000-0000-0000-000000000000', '1', '1', '1', '1', '1', 'Simon'),
	('20000000-0000-0000-0000-000000000000', '1', '1', '1', '1', '1', 'Piotr')

	INSERT INTO AspNetUsers
	VALUES ('a60f9be0-baff-48c7-beb6-049114db1a2d', 'admin@admin.com', 0, 'AF3Hwrh0a/lEb9IdlaGukHdXenGAR/XMV3v0bWs65PeLy7/sdOgeMcgnmbTNDOXu7g==', '0eb698b8-db7a-49ee-9489-ad0b1e923bf6', null, 0, 0, null, 1, 0, 'admin@admin.com', 'test', 'test'),
	('484946c7-b906-4a39-8b15-58e5629ac87e', 'user@user.com', 0, 'ADaS3zo0G3ILfELYHAJF8j3ngjmXJNqr04vxVwKfdkjbDtkkA5ks41BElXP49UybqQ==', '2937b5c7-b664-48da-a706-8e2f85821299', null, 0, 0, null, 1, 0, 'user@user.com', 'user', 'user'),
	('1cb4258e-b0ca-4fae-b746-e831f0cab106', 'creator@creator.com', 0, 'ANVmyOY5sJgmHtjlIzq0NuZ9MKlXP2GzBrdTN3oWBA+YJLzi2R5DH/hp6V9y6RORFw==', '6465c93e-597c-444d-b1f6-9450064c2735', null, 0, 0, null, 1, 0, 'creator@creator.com', 'creator', 'creator')


	Set Identity_Insert PlayerCharacter On;

	Insert Into PlayerCharacter (CharacterId, PlayerId, SceneId, EventChoiceId, CharacterName, HealthPoints, Gold)
	Values
	('1', '00000000-0000-0000-0000-000000000000', '1', '1', 'Player''s Character', '5', '12'),
	('2', '10000000-0000-0000-0000-000000000000', '2', '4', 'Lady Character', '3', '4'),
	('3', '20000000-0000-0000-0000-000000000000', '3', '5', 'Guy Character', '1', '0')
	--('4', '89cfef75-a0ab-487e-8bc1-7850865bc2e3', '2', '4', 'Test Char','10' , '10'),
	--('5', '89cfef75-a0ab-487e-8bc1-7850865bc2e3', '1', '3', 'Test Char NUMBER 2','15' , '1')

		
	Set Identity_Insert PlayerCharacter Off;
	
	Insert Into AspNetRoles(Id,[Name])
	VALUES(1, 'Admin'),
		(2, 'Creator'),
		(3, 'User')

	INSERT INTO AspNetUserRoles(UserId, RoleId)
	VALUES('a60f9be0-baff-48c7-beb6-049114db1a2d', 2), ('a60f9be0-baff-48c7-beb6-049114db1a2d', 1),
	('484946c7-b906-4a39-8b15-58e5629ac87e', 3),
	('1cb4258e-b0ca-4fae-b746-e831f0cab106', 2), ('1cb4258e-b0ca-4fae-b746-e831f0cab106', 3)

	UPDATE PlayerCharacter
	SET PlayerId = 'a60f9be0-baff-48c7-beb6-049114db1a2d'
	WHERE CharacterId = 1

	UPDATE PlayerCharacter
	SET PlayerId = '484946c7-b906-4a39-8b15-58e5629ac87e'
	WHERE CharacterId = 2

	UPDATE PlayerCharacter
	SET PlayerId = '1cb4258e-b0ca-4fae-b746-e831f0cab106'
	WHERE CharacterId = 3



End
GO
USE [master]
GO
ALTER DATABASE [BinaryTextAdventure] SET  READ_WRITE 
GO
