USE [master]
GO
/****** Object:  Database [Paladins_DB]    Script Date: 2020/09/01 18:58:24 ******/
CREATE DATABASE [Paladins_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Paladins_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Paladins_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Paladins_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Paladins_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Paladins_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Paladins_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Paladins_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Paladins_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Paladins_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Paladins_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Paladins_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Paladins_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Paladins_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Paladins_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Paladins_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Paladins_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Paladins_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Paladins_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Paladins_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Paladins_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Paladins_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Paladins_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Paladins_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Paladins_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Paladins_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Paladins_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Paladins_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Paladins_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Paladins_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Paladins_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Paladins_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Paladins_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Paladins_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Paladins_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Paladins_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Paladins_DB] SET QUERY_STORE = OFF
GO
USE [Paladins_DB]
GO
/****** Object:  Table [dbo].[Ability]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PAbilityId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Ability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Champion]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Champion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PChampionId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Role] [varchar](200) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Lore] [varchar](max) NOT NULL,
	[Health] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[Url] [varchar](max) NOT NULL,
	[IsLatestChampion] [varchar](5) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Champion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChampionAbilities]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChampionAbilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AbilityId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ChampionAbilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChampionSkins]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChampionSkins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkinId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ChampionSkins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PItemId] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[ShortDescription] [varchar](max) NULL,
	[DeviceName] [varchar](250) NOT NULL,
	[PChampionId] [int] NOT NULL,
	[ItemIconUrl] [varchar](max) NULL,
	[Price] [int] NOT NULL,
	[ItemType] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsBought]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsBought](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchDetailsId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[ItemName] [varchar](200) NOT NULL,
	[ItemLevel] [int] NOT NULL,
	[ItemOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ItemsBought] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PLanguageId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loadout]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loadout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerChampionStatsId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[LoadoutName] [varchar](200) NOT NULL,
	[PLoadoutId] [int] NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[PlayerName] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Loadout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadoutItem]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadoutItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoadoutId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LoadoutItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadoutSelected]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadoutSelected](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchDetailsId] [int] NOT NULL,
	[PMatchId] [int] NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[LoadoutItemLevel] [int] NOT NULL,
	[LoadoutItemName] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DeckPlayed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchBans]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchBans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchDetailsId] [int] NOT NULL,
	[PMatchId] [int] NOT NULL,
	[BanPosition] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MatchBans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchDetails]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMatchId] [int] NOT NULL,
	[PQueueId] [int] NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[MapName] [varchar](max) NOT NULL,
	[PlayerName] [varchar](max) NOT NULL,
	[PlayerAccountLevel] [int] NOT NULL,
	[MapGameType] [varchar](max) NOT NULL,
	[HasReplay] [varchar](10) NOT NULL,
	[Length] [int] NOT NULL,
	[LengthInMinutes] [int] NOT NULL,
	[WinStatus] [varchar](200) NOT NULL,
	[Region] [varchar](50) NOT NULL,
	[TeamOneScore] [int] NOT NULL,
	[TeamTwoScore] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[PChampionSkinID] [int] NOT NULL,
	[SelfHealing] [int] NOT NULL,
	[GoldEarnedPerMinute] [int] NOT NULL,
	[GoldEarnedTotal] [int] NOT NULL,
	[HealingDone] [int] NOT NULL,
	[DamageDoneInHand] [int] NOT NULL,
	[DamageTaken] [int] NOT NULL,
	[DamageMitigated] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[KillingSpree] [int] NOT NULL,
	[KillsDouble] [int] NOT NULL,
	[KillsTriple] [int] NOT NULL,
	[KillsQuadra] [int] NOT NULL,
	[KillsPenta] [int] NOT NULL,
	[MultiKillMax] [int] NOT NULL,
	[LeagueLosses] [int] NOT NULL,
	[LeageWins] [int] NULL,
	[LeagueTier] [int] NOT NULL,
	[LeaguePoints] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MatchDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[AvatarUrl] [varchar](200) NOT NULL,
	[AvatarId] [int] NOT NULL,
	[MinutesPlayed] [int] NOT NULL,
	[HoursPlayed] [int] NOT NULL,
	[TotalLeaves] [int] NOT NULL,
	[ControllerTier] [int] NOT NULL,
	[KbmTier][int] NOT NULL,
	[ConquestTier][int] NOT NULL,
	[TotalWorshippers][int] NOT NULL,
	[TotalXp][int] NOT NULL,
	[TotalWins][int] NOT NULL,
	[AccountCreatedOnTimeStamp] [datetime] NOT NULL,
	[LastLoginTimeStamp] [datetime] NOT NULL,
	[AccountLevel] [int] NOT NULL,
	[LoadingFrame] [varchar](200) NOT NULL,
	[MasteryLevel] [int] NOT NULL,
	[PersonalStatusMessage] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerChampionStats]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerChampionStats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[Assists] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PlayerChampionStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerFriends]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerFriends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[FriendId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PlayerFriends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerMatchHistory]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerMatchHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[MatchDetailsId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PlayerMatchHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerRankDetails]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRankDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[RankName] [varchar](50) NOT NULL,
	[Leaves] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[PreviousRank] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[Season] [int] NOT NULL,
	[Tier] [int] NOT NULL,
	[Trend] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PlayerRankDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Queue]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Queue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PQueueId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Queue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skin]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PChampionId] [int] NOT NULL,
	[Rarity] [varchar](100) NOT NULL,
	[PSkinId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Skin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tier]    Script Date: 2020/09/01 18:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PTierId] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ability] ON 
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 12489, N'Revolver', N'A cursed semi-automatic revolver that deals 520 damage every 0.36s. Has a maximum Ammo count of 6 and is fully effective up to 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/revolver.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 13028, N'Healing Potion', N'Throw a potion that Heals allies for 1000 in a 50-unit radius on impact. Reactivate this ability to explode the potion in the air.', N'https://web2.hirez.com/paladins/champion-abilities/healing-potion.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 12681, N'Weightless', N'Launch yourself upwards and increase your jump height for 2.5s.', N'https://web2.hirez.com/paladins/champion-abilities/weightless.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 13027, N'Evil Mojo', N'Throw a mysterious flask that deals 200 damage on impact and Transforms enemies in a 40-unit radius into helpless chickens for 4s. Chickens have 1500 Health and return to their previous state and Health values when the effect ends.', N'https://web2.hirez.com/paladins/champion-abilities/evil-mojo.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 24548, N'Hellfire Gatling', N'An Abyssal, soul-shredding Gatling gun that spins up before firing. After 1s, it starts to fire, reaching its maximum Attack Speed after an additional 2s. At maximum rev, it deals 40 damage every 0.05s. Has a maximum Ammo count of 500, and is fully effective up to 80 units.<br><br>Passive: Every six shots that hit an enemy shatters a part of their soul, creating a Soul Fragment. Soul Fragments can be collected by colliding with them or by activating Soul Harvest.', N'https://web2.hirez.com/paladins/champion-abilities/hellfire-gatling.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 24776, N'Ignition', N'Ignite your Hellfire Gatling to immediately fully spin it up and cause it to consume no Ammo for 3s after activation.', N'https://web2.hirez.com/paladins/champion-abilities/ignition.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 24773, N'Soul Harvest', N'Harvest your enemies'' shattered souls, generating 2000 Soul Armor and drawing all loose Soul Fragments to you. Soul Fragments generate an additional 200 Soul Armor on pickup. You can have a maximum of 4000 Soul Armor.', N'https://web2.hirez.com/paladins/champion-abilities/soul-harvest.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 24774, N'Juggernaut', N'After 1.2s, charge for 3.5s, dealing 600 damage and applying a 900 Knockup to each player hit. You maintain limited turn control and reduce the effectiveness of Knockup effects applied to you while charging.', N'https://web2.hirez.com/paladins/champion-abilities/juggernaut.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 24772, N'Cataclysm', N'Savagely stomp the ground and send forth a shockwave in a 45-degree cone that deals 999 damage and Stuns enemies for 1.2s. This ability Pierces enemies, destroys Shields and Deployable walls, and has a range of 100 units. You are rooted and Immune to Crowd Control while using this ability. You can turn up to 60 degrees in either direction after activation.', N'https://web2.hirez.com/paladins/champion-abilities/cataclysm.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 14581, N'Miniguns', N'Miniguns that deal 40 damage every 0.05s once fully spun up. Continue firing to increase your rate of fire. Has a maximum Ammo count of 200 and is fully effective up to 85 units.', N'https://web2.hirez.com/paladins/champion-abilities/miniguns.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 19540, N'Missile Launcher', N'Fire two missiles at enemies that each deal 225 damage in a 15-unit-radius explosion. Fully effective up to 500 units. Has 3 charges.', N'https://web2.hirez.com/paladins/champion-abilities/missile-launcher.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 11434, N'Emitter', N'Project a Shield around yourself that blocks up to 2000 damage and lasts for 3.5s or until destroyed. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/emitter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 12635, N'Explosive Flask', N'Launch an explosive flask that deals 150 damage and Slows enemies by 50% for 2.5s in an area. Fully effective up to 6 units and will hit enemies up to 25 units away.', N'https://web2.hirez.com/paladins/champion-abilities/explosive-flask.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 14658, N'Advance', N'Quickly jet in the direction you are moving. You are able to fire while using Advance. This ability has 2 charges and has a range of 30 units.', N'https://web2.hirez.com/paladins/champion-abilities/advance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 16505, N'Soul Orb', N'Fire a magical projectile every 0.3s that deals 210 damage, Pierces enemies, and applies a Soul Orb stack. Soul Orb stacks up to 4 times. Has a maximum Ammo count of 14, and is fully effective up to 300 units. Soul Orb stacks can be detonated with Rend Soul.', N'https://web2.hirez.com/paladins/champion-abilities/soul-orb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 16589, N'Restore Soul', N'Target an ally and Heal them for 1500 over 1.5s. All allies within 50 units of your target are Healed for 40% of the Healing done. Has a range of 120 units.', N'https://web2.hirez.com/paladins/champion-abilities/restore-soul.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 16592, N'Rend Soul', N'Detonate your Soul Orb stacks, dealing 100 damage for each stack on an enemy. Each stack detonated Heals you for 15% of your maximum Health.', N'https://web2.hirez.com/paladins/champion-abilities/rend-soul.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 16590, N'Shadow Travel', N'Phase into another plane of existence over 0.8s, becoming Stealthed and Ethereal, avoiding all harmful effects for 4s. While Shadow Travel is active, your Movement Speed is increased by 25%. Activating this ability restores all your Ammo.', N'https://web2.hirez.com/paladins/champion-abilities/shadow-travel.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 16593, N'Convergence', N'Cast your Soul Core onto the battlefield, causing a tear in reality to manifest 0.5s after it lands. Enemies within 60 units are dragged in and Stunned for 1.4s.', N'https://web2.hirez.com/paladins/champion-abilities/convergence.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 14891, N'Longbow', N'A Longbow that draws back and releases an arrow for up to 1000 damage every 1.5s. Fully effective up to 450 units. Will travel less far and deal less damage if released before it is fully charged. A new arrow is nocked 0.5s after firing and is drawn back over 1s. Your Movement Speed is reduced by 10% while your bow is drawn.', N'https://web2.hirez.com/paladins/champion-abilities/longbow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 14928, N'Crippling Arrow', N'Causes the next shot from your Longbow to fire an arrow that Cripples enemies, preventing them from using movement abilities for 2s. Can be toggled by reactivating the ability.', N'https://web2.hirez.com/paladins/champion-abilities/crippling-arrow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 14988, N'Rapid Shot', N'Rapidly fire a maximum of 5 fully-charged arrows over 1.8s while moving, dealing 600 damage per arrow with a 200% increased draw speed. While using this ability your Movement Speed is decreased by 20%. Can be reactivated to cancel. Acts as a weapon shot.', N'https://web2.hirez.com/paladins/champion-abilities/rapid-shot.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 14989, N'Withdraw', N'Leap backwards 30 units and enter Stealth for 2s.', N'https://web2.hirez.com/paladins/champion-abilities/withdraw.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 15266, N'Heat Haze', N'Enter Stealth and increase your Movement Speed by 30% for 8s. While active, you draw your Longbow 50% faster and Reveal yourself each time you fire.', N'https://web2.hirez.com/paladins/champion-abilities/heat-haze.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 10762, N'Wrist Crossbow', N'A fast-firing wrist-mounted crossbow that deals 130 damage every 0.1s. Has a maximum Ammo count of 25 and is fully effective up to 30 units.', N'https://web2.hirez.com/paladins/champion-abilities/wrist-crossbow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 13218, N'Hexa Fire', N'After 1s, reveal 2 miniguns and rocket launchers that fire rapidly for 4s. The guns deal 120 damage every 0.04s and the launchers deal 250 damage every 0.25 seconds in a 10-unit-radius area. You take 10% reduced damage, but your Movement Speed is reduced by 75% while this effect is active. Ruckus is Immune to Crowd Control while this ability is active. Can be refired to cancel. Fully effective up to 200 units.', N'https://web2.hirez.com/paladins/champion-abilities/hexa-fire.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 11491, N'Poison Bolts', N'Fire 3 bolts in quick succession, each dealing 10% maximum Health as damage over 4s.', N'https://web2.hirez.com/paladins/champion-abilities/poison-bolts.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (28, 10773, N'Potion Launcher', N'Fires a volatile potion every 1s that deals 600 damage in an area. The explosion is fully effective up to 3 units and hits enemies up to 12 units away. Has a maximum Ammo count of 6.', N'https://web2.hirez.com/paladins/champion-abilities/potion-launcher.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (29, 20434, N'Scamper', N'Scamper forward for 1.5s, greatly increasing your Movement Speed.', N'https://web2.hirez.com/paladins/champion-abilities/scamper.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (30, 16702, N'The Law', N'Release an infallible surge of Judgement, destroying Shields and Executing enemies at or below 65% Health. Deals 600 damage to enemies above 65% Health. Has a range of 120 units.', N'https://web2.hirez.com/paladins/champion-abilities/the-law.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (31, 17115, N'Heirloom Rifle', N'An automatic rifle passed down through house Aico that deals 400 damage every 0.45s. Has a maximum Ammo count of 8 and is fully effective up to 90 units away.', N'https://web2.hirez.com/paladins/champion-abilities/heirloom-rifle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (32, 17181, N'Valor', N'Fire a charged shot dealing 400 damage to all enemies within 500 units in front of you. Acts as a weapon shot.', N'https://web2.hirez.com/paladins/champion-abilities/valor.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (33, 19137, N'Presence', N'Charge your rifle for 0.5s, then fire a long-range shot, Piercing enemies and dealing 800 damage to each. Acts as a weapon shot and has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/presence.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (34, 18498, N'Grace', N'Quickly dodge in the direction you are moving and fire a rifle shot, dealing 400 damage to the enemy nearest to where you are aiming. Acts as a weapon shot. This ability has a movement range of 30 units.', N'https://web2.hirez.com/paladins/champion-abilities/grace.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (35, 19078, N'Enlightenment', N'Channel the power of your noble blood, taking 50% reduced damage for 1s, then fire a powerful blast that pierces enemies, dealing 1600 damage. Killing an enemy with Enlightenment refunds 50% of the Ultimate charge. Has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/enlightenment.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (36, 16218, N'Daggers', N'Throw two Daggers every 1s, each dealing 400 damage. Fully effective up to 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/daggers.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (37, 16235, N'Pounce', N'Quickly dash forward. Colliding with an enemy stops you and performs a melee strike, dealing 400 damage and bouncing you backward. Pounce has a range of 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/pounce.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (38, 16306, N'Nine Lives', N'Reset the Cooldowns of Pounce and Prowl and Heal yourself for 400.', N'https://web2.hirez.com/paladins/champion-abilities/nine-lives.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (39, 16228, N'Prowl', N'Increase your Movement Speed by 50% and increase your jump height. This effect lasts 5s and will be canceled by using another ability or firing your weapon.', N'https://web2.hirez.com/paladins/champion-abilities/prowl.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (40, 16241, N'Midnight', N'Enemies within 300 units have their vision restricted to a 30-unit radius for 4s.', N'https://web2.hirez.com/paladins/champion-abilities/midnight.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (41, 20430, N'Bon Appetit', N'Cast an arcane spell that Transforms a single victim into a treat. Coming into contact with your Transformed victim Executes them and prevents ability-based Revival. Effective up to 500 units.', N'https://web2.hirez.com/paladins/champion-abilities/bon-appetit.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (42, 14182, N'Cannon', N'A salvaged ship cannon that fires a cannonball every 1s that deals 550 damage. Has a maximum Ammo count of 5 and is fully effective up to 75 units.', N'https://web2.hirez.com/paladins/champion-abilities/cannon.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (43, 14844, N'Shell Shield', N'Project a 4000-Health Shield around yourself in an area. This Shield lasts 4s or until destroyed. This ability can be refired to cancel. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/shell-shield.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (44, 14191, N'Shell Spin', N'Retreat into your shell and spin forward, passing through enemies, dealing 150 damage to them and applying a Knockback to anyone hit. Has a range of 44 units.', N'https://web2.hirez.com/paladins/champion-abilities/shell-spin.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (45, 14602, N'Ancient Rage', N'Call on the powers of the Ancients. Drop your cannon and start swinging your anchor, dealing 550 every 0.8s to enemies within 20 units in front of you. While this ability is active, you have 4000 increased maximum Health and are Immune to Crowd Control. This effect lasts 8s and can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/ancient-rage.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (46, 14600, N'Spitting Cobra', N'Fire a glob of venom in an arc every 0.55s, dealing 400 damage. Has a maximum Ammo count of 10. When 90% done with your reload, throw the Cobra, dealing 200 damage and Stunning for 1s on hit. Enemies stunned by the Cobra cannot be Stunned for another 3s.', N'https://web2.hirez.com/paladins/champion-abilities/spitting-cobra.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (47, 14822, N'Mending Spirits', N'Channel the spirits to enchant an ally at your crosshair location, restoring 81.25 Health every 0.25s for 4s.', N'https://web2.hirez.com/paladins/champion-abilities/mending-spirits.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (48, 14842, N'Gourd', N'Toss a potent alchemic gourd that explodes on the ground in a 25-unit radius for 4.8s. Allies standing inside the radius are Healed for 65 every 0.2s, while enemies are dealt 45 damage every 0.2s.', N'https://web2.hirez.com/paladins/champion-abilities/gourd.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (49, 15341, N'Slither', N'Quickly slither forward 54 units, becoming Untargetable for the duration.', N'https://web2.hirez.com/paladins/champion-abilities/slither.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (50, 14861, N'Dread Serpent', N'Fire a dark vessel that explodes when it impacts, causing all enemies in a 40-unit radius to become Feared for 2s. Reactivate this ability to detonate the vessel early.', N'https://web2.hirez.com/paladins/champion-abilities/dread-serpent.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (51, 20211, N'Familiar Spray', N'Deal 30 damage every 0.08s in a column of magical energy. Applies 1 Magic Mark to each enemy hit, stacking up to 10 Marks. Fully effective up to 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/familiar-spray.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (52, 20202, N'Familiar Spit', N'Deal 300 damage every 0.7s with a magical projectile. Deals increased damage at 8, 9, and 10 stacks of Magic Mark on the enemy up to 1000 damage at 10 stacks. Fully effective up to 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/familiar-spit.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (53, 20435, N'Magic Barrier', N'Project a Barrier around yourself that Absorbs all attacks made against you. Enemies that hit you while your Barrier is active receive 10 stacks of Magic Mark. This effect lasts for 2s.', N'https://web2.hirez.com/paladins/champion-abilities/magic-barrier.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (54, 14181, N'Dredge Anchor', N'Reel an enemy in, dealing damage, Stunning them, and pulling them in front of you. Deals 100 damage on initial hit. Cannot pull through walls. Has a range of 75 units.', N'https://web2.hirez.com/paladins/champion-abilities/dredge-anchor.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (55, 12656, N'Smoke Screen', N'Throw a bomb that creates a 25-unit-radius smoke cloud that lasts 5s. Being in Smoke Screen applies Stealth to you for 3s every 1s.', N'https://web2.hirez.com/paladins/champion-abilities/smoke-screen.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (56, 10275, N'Hidden', N'Enter Stealth, preventing enemy players from seeing you. This effect lasts 7.5s and can be canceled by refiring Hidden, using other abilities, or attacking. Getting too close to enemy players will Reveal you while you''re Stealthed.', N'https://web2.hirez.com/paladins/champion-abilities/hidden.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (57, 12984, N'Time Bomb', N'Throw a bomb that deals up to 3000 damage and destroys all Shields after a 2.5s fuse time. Fully effective up to 25 units and will hit players up to 75 units.', N'https://web2.hirez.com/paladins/champion-abilities/time-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (58, 14147, N'Crossfire', N'Increase your Attack Speed and Movement Speed by 40% for 4.5s. During this effect, weapon shots will not consume Ammo. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/crossfire.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (59, 14127, N'Assault Rifle', N'A Sentinel-issued military assault rifle. Deals 135 damage every 0.1s, has a maximum Ammo count of 30, and is fully effective up to 100 units. ', N'https://web2.hirez.com/paladins/champion-abilities/assault-rifle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (60, 14157, N'Iron Sights', N'Look down the barrel of your gun and increase your Accuracy. Your Movement Speed is reduced by 50% while using Iron Sights.', N'https://web2.hirez.com/paladins/champion-abilities/iron-sights.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (61, 14149, N'Frag Grenade', N'Throw a fragmentation grenade that deals up to 750 damage in an area. Holding <CMD=GBA_Ability_2> will cook the grenade and reduce its detonation time. Frag Grenade is fully effective up to 20 units and will hit enemies up to 30 units away.', N'https://web2.hirez.com/paladins/champion-abilities/frag-grenade.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (62, 14148, N'Hustle', N'Lower your weapon and increase your Movement Speed by 65%.', N'https://web2.hirez.com/paladins/champion-abilities/hustle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (63, 14351, N'Barrage', N'Bring up your targeting binoculars to rain down damage on enemies. Target an enemy player to guide an artillery shell to their location, dealing 1400 damage in an area. Using this ability consumes 40% of your Ultimate charge, and each shell consumes an additional 20%. While using Barrage, your Movement Speed is reduced by 40%. Barrage''s explosion has a radius of 20 units. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/barrage.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (64, 19710, N'Light Machine Gun', N'An automatic machine gun that deals 170 damage every 0.14s. Your Movement Speed is reduced by 50% while firing. Has a maximum Ammo count of 70 and is fully effective up to 90 units.', N'https://web2.hirez.com/paladins/champion-abilities/light-machine-gun.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (65, 19712, N'Precision Sights', N'Look down the barrel of your gun and increase your Accuracy. Reduce your Movement Speed by 50% while using Precision Sights. This Movement Speed reduction does not stack with firing your gun.', N'https://web2.hirez.com/paladins/champion-abilities/precision-sights.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (66, 19491, N'Deflector Shield', N'Project a Shield in front of your gun. This Shield has 1400 Health and lasts 6s or until destroyed. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/deflector-shield.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (67, 19761, N'Sensor Drone', N'Throw out a deployable Sensor that Reveals enemies within 45 units. You can have up to 2 of these Sensors out at a time. Each Sensor Drone has 250 Health and is affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/sensor-drone.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (68, 19741, N'Sentinels', N'Deploy 2 Sentinel Drones that fire energy blasts where you shoot your Light Machine Gun. Each Sentinel fires every 1s, dealing 200 damage in a 12-unit-radius area, and has 1600 Health. These Sentinel Drones last until you are killed or they are destroyed.', N'https://web2.hirez.com/paladins/champion-abilities/sentinels.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (69, 15571, N'Hunter''s Mark', N'Mark an enemy, Revealing them and increasing the damage they take from your weapon attacks by 15%. This ability lasts 5s and has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/hunters-mark.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (70, 16508, N'Wand of Overgrowth', N'Fire a blast of Fae energy every 0.75s to deal up to 500 damage to foes in an area. Has a maximum Ammo count of 8. The blast hits players up to 14 units away and is fully effective up to 1 unit away. The projectile has a range of 500 units.', N'https://web2.hirez.com/paladins/champion-abilities/wand-of-overgrowth.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (71, 16905, N'Seedling', N'Throw an explosive seed that explodes after 1s, dealing 400 damage in an area and spawning 4 additional seeds that each explode for 400 damage after 1s. The explosion is fully effective up to 5 units and will hit enemies up to 25 units away.', N'https://web2.hirez.com/paladins/champion-abilities/seedling.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (72, 16518, N'Flutter', N'Quickly flutter your wings, propelling yourself forwards and upwards. Has a range of 20 units and a gives a Speed boost on exit depending on the angle at which you used this ability.', N'https://web2.hirez.com/paladins/champion-abilities/flutter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (73, 16679, N'Fae Flight', N'Take to the skies and fly, gaining control of your movement in the air. Lasts 10s and can be refired to cancel. You are Immune to Crowd Control while this ability is active.', N'https://web2.hirez.com/paladins/champion-abilities/fae-flight.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (74, 13279, N'Illusory Mirror', N'Fire a burst of energy from your mirror every 0.5s, hitting 5 times over 0.2s and dealing 90 damage per hit. Has a maximum Ammo count of 8 and is fully effective up to 100 units.', N'https://web2.hirez.com/paladins/champion-abilities/illusory-mirror.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (75, 13284, N'Shatter', N'Shatter your Illusions, causing them to chase down enemies and explode for 500 damage. Shattered Illusions explode after 2s and are fully effective up to 35 units from the explosion.', N'https://web2.hirez.com/paladins/champion-abilities/shatter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (76, 10335, N'Illusion', N'Create a lifelike Illusion up to 70 units away that Heals an ally up to 85 units away from it for 400 every 1.6s. Up to two Illusions can be active at once. Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/illusion.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (77, 13283, N'Dimensional Link', N'Manipulate dimensions, swapping locations with your farthest Illusion. If no Illusions are active, Teleport to the location of the farthest last-active Illusion. For 4s after activation, refiring this ability will Teleport you back to your original location. You can target one of your Illusions to choose which one to Teleport to.', N'https://web2.hirez.com/paladins/champion-abilities/dimensional-link.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (78, 14048, N'Illusory Rift', N'Shatter your mirror, restoring 600 Health to all allies every 1s for 8s. While active, you may Teleport to any ally with Dimensional Link.', N'https://web2.hirez.com/paladins/champion-abilities/illusory-rift.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (79, 17129, N'Inferno Blade', N'Launch burning oil through the air every 2s, dealing 400 damage with the first two and 700 damage with the final, Piercing swing. Has a maximum Ammo count of 9 and is fully effective up to 90 units.', N'https://web2.hirez.com/paladins/champion-abilities/inferno-blade.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (80, 18226, N'Counter', N'Enter a Countering stance for 1.5s, absorbing all effects of the first frontal attack and Counter, dealing 600 damage. Counter''s projectile is fully effective up to 90 units.', N'https://web2.hirez.com/paladins/champion-abilities/counter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (81, 18235, N'Billow', N'Disperse into smoke, becoming Ethereal, and increase your Movement Speed by 30%. This effect lasts 2s.', N'https://web2.hirez.com/paladins/champion-abilities/billow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (82, 16902, N'Dead Zone', N'Launch a toxic spore that deals 100 damage and prevents all Healing in an area for 5s. Affected players who leave the area cannot be Healed for 1s. The infected area has a radius of 25 units and the Dead Zone projectile has a range of 500 units.', N'https://web2.hirez.com/paladins/champion-abilities/dead-zone.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (83, 15405, N'Fire Bomb', N'Hurl an incendiary device that leaves a pool of fire on impact. Enemies that contact the fire will burn for 9% of their maximum Health over 0.6s and have their Healing received reduced by 50%. Continued contact refreshes the effect. The pool spreads from the initial point of contact and does reduced damage to you. Fire Bomb has a range of 500 units.', N'https://web2.hirez.com/paladins/champion-abilities/fire-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (84, 15792, N'Nade Launcher', N'Launch a grenade from your rifle that explodes on impact, dealing 700 damage in an area. Nade Launcher''s explosion is fully effective up to 3 units and hits enemies up to 10 units away. Has a range of 500 units.', N'https://web2.hirez.com/paladins/champion-abilities/nade-launcher.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (85, 15201, N'Auto Rifle', N'An automatic rifle that fires every 0.09s, dealing 105 damage and Healing you for 15% of the damage dealt. Has a maximum Ammo count of 35 and is fully effective up to 115 units. ', N'https://web2.hirez.com/paladins/champion-abilities/auto-rifle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (86, 19108, N'Talon Rifle (Pistol)', N'Talon Rifle: A powerful rifle that fires every 1s, dealing 1200 damage. Has a maximum Ammo count of 5 and is fully effective up to 500 units.<br><br>Pistol: A semi-automatic pistol that shoots every 0.15s, dealing 165 damage. Has a maximum Ammo count of 15 and is fully effective up to 55 units.', N'https://web2.hirez.com/paladins/champion-abilities/talon-rifle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (87, 19111, N'Scope/Flair (Flare)', N'Scope: Look down your scope and greatly increase your Accuracy. <br><br>Flare: Fire a Flare that Reveals enemies in a large area. Hitting an enemy with Flare deals 200 damage and an additional 100 damage over 2s. The radius of Flare''s Reveal is 45 units and Flare persists for 7 seconds.', N'https://web2.hirez.com/paladins/champion-abilities/scope.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (88, 19138, N'Quick Switch', N'Swap between your Talon Rifle and Pistol.', N'https://web2.hirez.com/paladins/champion-abilities/quick-switch.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (89, 19145, N'Stealth', N'Enter Stealth and hide yourself from vision. Entering Stealth consumes 33% of your Energy and requires at least 40% Energy to cast. While Stealthed, your Energy is drained over time. Getting too close to an enemy will Reveal you to them. <br><br> Passive: You have Energy, which is used to Stealth and regenerates over time.', N'https://web2.hirez.com/paladins/champion-abilities/stealth.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (90, 19198, N'Flashbang', N'Throw a Flashbang grenade that detonates on contact, Blinding nearby enemies for 3s and dealing up to 150 damage. The explosion has a radius of 80 units.', N'https://web2.hirez.com/paladins/champion-abilities/flashbang.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (91, 17127, N'Veracharger', N'A fast-firing weapon that deals 110 damage every 0.095s. This weapon has a maximum Ammo count of 35 and is fully effective up to 45 units.', N'https://web2.hirez.com/paladins/champion-abilities/veracharger.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (92, 19331, N'Blitz Upper', N'Charge forward, damaging an enemy for 600 and applying Knockback straight back. Has a range of 40 units.', N'https://web2.hirez.com/paladins/champion-abilities/blitz-upper.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (93, 19479, N'Overcharge', N'Overcharge your weapon, increasing your Attack Speed by 25% and causing weapon shots to not consume Ammo. This effect lasts 3s.', N'https://web2.hirez.com/paladins/champion-abilities/overcharge.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (94, 19248, N'Rune of Travel', N'Inscribe a Rune on the ground that can be used to Teleport back to its location after 10s or reactivation of the ability. Teleporting Cleanses all effects and Heals you for 500.', N'https://web2.hirez.com/paladins/champion-abilities/rune-of-travel.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (95, 19480, N'True Power', N'After a brief charge-up, target an enemy and Teleport directly to them from anywhere, dealing 600 damage and applying Knockback. Time taken to Teleport depends on your distance from the targeted enemy.', N'https://web2.hirez.com/paladins/champion-abilities/true-power.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (96, 19433, N'Massacre Axe', N'Swing your axe in a large arc every 1.1s, hitting all enemies within 18 units for 650 damage.', N'https://web2.hirez.com/paladins/champion-abilities/massacre-axe.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (97, 19481, N'Calamity Blast', N'Fire a projectile from your hand that deals 250 damage. Fire an additional projectile on use for each Calamity Charge you have stored, up to a total of 5 with maximum Calamity Charges. Fully effective up to 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/calamity-blast.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (98, 19478, N'Power Siphon', N'Absorb enemy ranged attacks. For every 1200 damage Absorbed by Power Siphon, you generate and store a Calamity Charge. You may store up to 4 Calamity Charges. Your Power Siphon regenerates over time.', N'https://web2.hirez.com/paladins/champion-abilities/power-siphon.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (99, 19836, N'Shatterfall', N'Leap into the air and smash your axe down, dealing 500 damage and reducing the Movement Speed of enemies by 60% for 2s in a 50-unit area in front of you.', N'https://web2.hirez.com/paladins/champion-abilities/shatterfall.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (100, 19489, N'Reanimate', N'Usable for up to 4s after dying. After 2.5s, Revive, dealing up to 2,600 damage in a large necromantic explosion upon Revival. Fully effective up to 55 units.', N'https://web2.hirez.com/paladins/champion-abilities/reanimate.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (101, 24536, N'Bladed Chakrams', N'Sling Bladed Chakrams from your hand every 0.7s, each bouncing off floors and walls and dealing 650 damage to any enemy hit. The Chakrams can bounce up to 2 times before disappearing. Enemies hit by a Chakram after it bounces take 500 damage instead of 650.', N'https://web2.hirez.com/paladins/champion-abilities/bladed-chakrams.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (102, 24538, N'Heavy Blade', N'Throw your Heavy Blade in a straight line, Piercing through Shields and enemies. Deals 850 damage and reduces the Movement Speed of enemies hit by 50% for 3s.<br><br>Heavy Blade lodges itself into any environment it collides with and can be reactivated to recall the blade, passing through everything in the world. Heavy Blade deals 500 damage to enemies as it passes through after recall.
', N'https://web2.hirez.com/paladins/champion-abilities/heavy-blade.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (103, 24544, N'Combat Trance', N'Channel your energy, increasing your Attack Speed and Movement Speed by 30% for 4s.', N'https://web2.hirez.com/paladins/champion-abilities/combat-trance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (104, 24537, N'Crouching Tigron', N'Crouch down, then launch yourself forward through the air.', N'https://web2.hirez.com/paladins/champion-abilities/crouching-tigron.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (105, 25152, N'Blade Dance', N'Flourish your Heavy Blade and gain the ability to use Striking Tigron and Whirling Blades up to 5 times for 15s.<br><br>Striking Tigron: Instantly dash forward in any direction, passing through all enemies and dealing 650 damage to any enemy hit.<br><br>Whirling Blades: Launch yourself upwards, whirling your blade around you and becoming Immune to damage. On landing, deal 900 damage to all enemies within 30 units.', N'https://web2.hirez.com/paladins/champion-abilities/blade-dance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (106, 19720, N'Gauntlet', N'Fire a blast of energy every 0.25s that deals 180 damage. Has a maximum Ammo count of 15 and is fully effective up to 75 units.', N'https://web2.hirez.com/paladins/champion-abilities/gauntlet.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (107, 19731, N'Nullify', N'Channel a beam of energy onto a single enemy, Silencing them and dealing 800 damage over the duration. This beam lasts 2s and has a range of 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/nullify.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (108, 15793, N'Protection', N'Project a 500-Health Shield onto an ally in sight. This Shield lasts 4s or until destroyed and has a range of 175 units. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/protection.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (109, 15794, N'Recharge', N'Regenerate 2200 Shield over 1s.<br><br>Passive: You have a Passive 2000-Health Shield that persists and can be Recharged with this ability.', N'https://web2.hirez.com/paladins/champion-abilities/recharge.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (110, 15862, N'Hyper Beam', N'Channel a beam of energy that deals 55 damage every 0.1s and applies a massive Knockback to those caught in it. Hyper Beam lasts 2.35s, dealing up to 1293 damage, and has a range of 350 units. Cannot be canceled.', N'https://web2.hirez.com/paladins/champion-abilities/hyper-beam.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (111, 16535, N'Combat Slide', N'Quickly slide forward, retaining the ability to fire your weapons while sliding. This ability has a range of 40 units.', N'https://web2.hirez.com/paladins/champion-abilities/combat-slide.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (112, 18234, N'Whirl', N'Lunge forward while swinging your blade in a deadly arc, dealing 400 damage to nearby enemies.  Has a range of 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/whirl.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (113, 16534, N'Retribution', N'Activate Retribution to randomly select a new Retribution target.<br><br>Passive: You have a Retribution target who is Revealed through walls when within 120 units. Killing your Retribution target grants 30 Credits and 15 additional Credits for each kill in your target''s current Killstreak. You get half credits for an Elimination on your target that is not a Killing Blow.', N'https://web2.hirez.com/paladins/champion-abilities/retribution.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (114, 16530, N'Magnums', N'Dual semi-automatic Magnums that deal 320 damage every 0.25s. These Magnums have a maximum Ammo count of 12 and are fully effective up to 60 units.', N'https://web2.hirez.com/paladins/champion-abilities/magnums.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (115, 14924, N'Buck Wild', N'Go Buck Wild, refilling your Ammo and increasing your Attack Speed by 60% for 6s.', N'https://web2.hirez.com/paladins/champion-abilities/buck-wild.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (116, 10772, N'Crossbow', N'Fire a crossbow bolt every 0.75s that deals 680 damage. Has a maximum Ammo count of 6 and is fully effective up to 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/crossbow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (117, 14910, N'Disengage', N'Fire an arrow that deals 200 damage and applies a 1200 Knockback. Has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/disengage.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (118, 11450, N'Blast Shot', N'Fire an explosive bolt that deals 450 damage in an area. The explosion is fully effective up to 4 units and hits enemies up to 20 units away.', N'https://web2.hirez.com/paladins/champion-abilities/blast-shot.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (119, 10908, N'Dodge Roll', N'Quickly roll 40 units in the direction you are moving.', N'https://web2.hirez.com/paladins/champion-abilities/dodge-roll.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (120, 12983, N'Scout', N'Send your bird into the sky for 8s, Revealing enemies to allies and increasing your Movement Speed by 30%.', N'https://web2.hirez.com/paladins/champion-abilities/scout.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (121, 25317, N'Officer''s Pistol', N'An automatic Machine Pistol that sprays bullets at its enemies. Deals 70 damage every 0.07s, has a maximum Ammo count of 50, and is fully effective up to 110 units.			', N'https://web2.hirez.com/paladins/champion-abilities/officers-pistol.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (122, 25213, N'Abyssal Reconstruction', N'Target an ally to infuse them with the power of the Abyss. Heals for 350 over 0.5s and then a burst of 800 Health. Has a range of 120 units.			', N'https://web2.hirez.com/paladins/champion-abilities/abyssal-reconstruction.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (123, 25214, N'Mark of Fate', N'Target an ally to be Marked by fate. Marked allies will receive 55% of the Healing done to other allies with Abyssal Reconstruction. Directly Healing a marked ally will Heal that ally for an additional 10% and will reduce the Cooldown of Abyssal Reconstruction by 1s. Can be used through walls and can only Mark one ally at a time. This Mark will bounce to the nearest ally if the Marked falls.			', N'https://web2.hirez.com/paladins/champion-abilities/mark-of-fate.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (124, 25219, N'Projection', N'Project a manifestation of your will forward, Piercing enemies and stopping on walls or after traveling 120 units. Deals 400 damage and Slows enemies hit by 35% for 1.5s. Can reactivate to teleport during flight and for 3s after stopping. If you choose not to Teleport, the Cooldown of Projection is reduced by 1s.			', N'https://web2.hirez.com/paladins/champion-abilities/projection.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (125, 25321, N'Entropic Breach', N'Channel the secrets of the Abyss. Rise up into the air, decreasing the damage you take by 60% and becoming Immune to Crowd Control. While hovering, you have limited movement and can target an area on the ground, dealing 15% of enemy targets'' maximum Health as damage and creating a charged area that persists for 6s, dealing 6.25% maximum Health as damage every 0.5s and Slowing enemies caught in it by 45%. This Slow persists for 0.5s after leaving the area. Can be reactivated to cancel.			', N'https://web2.hirez.com/paladins/champion-abilities/entropic-breach.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (126, 11489, N'Heroic Leap', N'Leap forward a great height and distance based on the angle at which you activate this ability.', N'https://web2.hirez.com/paladins/champion-abilities/heroic-leap.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (127, 23600, N'Cursed Howitzer', N'Fire an explosive mortar every 0.7s that deals 850 damage in an area. Has a maximum Ammo count of 9, and the explosion is fully effective up to 4 units and hits enemies up to 15 units away. Reloading fires a secondary projectile that deals 850 damage on impact. You deal up to 200 self-damage if caught in your own explosion.', N'https://web2.hirez.com/paladins/champion-abilities/cursed-howitzer.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (128, 23612, N'Harpoon', N'Hurl a harpoon, dealing 800 damage and Slowing enemies hit by 50% for 2s. Harpoon Pierces enemies and has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/harpoon.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (129, 23622, N'Shortcut', N'Create a Shortcut, up to a maximum of 2. Traveling through a Shortcut will Teleport you to the other one after a 0.4s delay and destroy the one you used to Teleport. Going through a Shortcut will prevent this ability from being used for 10s.', N'https://web2.hirez.com/paladins/champion-abilities/shortcut.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (130, 23613, N'Kraken', N'Create a rift at your target location, unleashing the Abyssal Kraken after 1.7s in a 25-unit radius. The Kraken deals 2500 damage and applies a Knockback to enemies hit.', N'https://web2.hirez.com/paladins/champion-abilities/kraken.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (131, 13325, N'Rocket Launcher', N'Fire a rocket every 0.85s that deals 850 damage in an area. Has a maximum Ammo count of 6. The explosion is fully effective up to 4 units and hits enemies up to 10 units away. You deal up to 200 self-damage if caught in your own explosion. Has a range of 275 units.', N'https://web2.hirez.com/paladins/champion-abilities/rocket-launcher.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (132, 13327, N'Fire Spit', N'Spit out a flammable orb that deals 150 damage and causes enemies hit to take 30% additional damage from your rockets for 3s. Drogoz can ignite Fire Spit with Rocket Launcher or Salvo, dealing 900 damage in an area. This explosion is fully effective up to 30 units and hits enemies up to 35 units away. Has a range of 400 units.', N'https://web2.hirez.com/paladins/champion-abilities/fire-spit.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (133, 14140, N'Salvo', N'Load all remaining rockets into your Launcher and unleash them with your next attack, dealing 250 damage in an area for each rocket. The explosion is fully effective up to 10 units, hits enemies up to 15 units away, and deals 100% additional damage to Shields. Drogoz deals 150 self-damage if caught in the explosion. Has a range of 275 units. Salvo''s rockets count as weapon shots.', N'https://web2.hirez.com/paladins/champion-abilities/salvo.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (134, 13328, N'Thrust', N'Jet upwards into the air. Hold <CMD=GBA_Jump> to use your Booster, which slowly lifts you into the air. <br><br> Passive: You have a Booster that has a limited amount of fuel. Fuel regenerates when not in use. ', N'https://web2.hirez.com/paladins/champion-abilities/thrust.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (135, 13329, N'Dragon Punch', N'After 2s, unleash your fury to jet up to 400 units through the air, dealing 100% of your target''s maximum Health as damage to the first enemy you collide with. You are Immune to Crowd Control while flying. Cannot hit targets Immune to damage. Cannot be mitigated by reduced damage taken. Ending this ability without hitting anyone refunds 30% Ultimate charge.', N'https://web2.hirez.com/paladins/champion-abilities/dragon-punch.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (136, 10752, N'Ice Staff', N'Fire a frozen blast every 1s that explodes to deal damage in an area. Deals 850 damage, has a maximum Ammo count of 6, and has a range of 300 units. The explosion is fully effective up to 3 units and will hit enemies up to 10 units away.', N'https://web2.hirez.com/paladins/champion-abilities/ice-staff.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (137, 11414, N'Ice Block', N'Become Immune for 3s. During Ice Block, you are unable to move or attack. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/ice-block.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (138, 10315, N'Blink', N'Teleport forward a short distance. Has a range of 57.5 units.', N'https://web2.hirez.com/paladins/champion-abilities/blink.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (139, 23611, N'Broadside', N'Fire a burst of up to 3 depth charges over 0.3s that each deal 950 damage in an area. These charges arm when they hit the ground, slowly rising and exploding after 2s. The explosions are fully effective up to 10 units and hit enemies up to 17 units away. This ability consumes your Ammo to fire.', N'https://web2.hirez.com/paladins/champion-abilities/broadside.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (140, 12822, N'Soar', N'Hop on your staff and take flight for 2s. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/soar.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (141, 11224, N'Recovery', N'Channel your inner energy and Heal for 1000 over 1.5s. Cannot be canceled.', N'https://web2.hirez.com/paladins/champion-abilities/recovery.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (142, 12879, N'Shotgun', N'A massive shotgun that fires small pieces of shrapnel every 1s, dealing up to 700 damage. Has a maximum Ammo count of 5 and is fully effective up to 35 units.', N'https://web2.hirez.com/paladins/champion-abilities/shotgun.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (143, 13324, N'Defiance', N'Punch forward, striking enemies in front of you. Deals 520 damage and is fully effective up to 25 units.', N'https://web2.hirez.com/paladins/champion-abilities/defiance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (144, 13251, N'Reversal', N'Absorb enemy ranged attacks in front of you. After 1.4s, launch a blast that deals 75% of the damage you Absorbed.', N'https://web2.hirez.com/paladins/champion-abilities/reversal.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (145, 12658, N'Nether Step', N'Quickly dash in any direction up to 3 times before needing to recharge. Holding <CMD=GBA_Jump> reduces your fall speed in the air. Has a range of 31.5 units.', N'https://web2.hirez.com/paladins/champion-abilities/nether-step.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (146, 13254, N'Accursed Arm', N'Take flight for 4s and mutate your Revolver. Your mutated Revolver shoots every 0.5s and deals 1000 damage in a 15-unit-radius area. Using this ability consumes 40% of your Ultimate charge and each shot consumes an additional 15%. This Revolver has a maximum Ammo count of 4 and a range of 400 units. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/accursed-arm.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (147, 16708, N'Burst Cannon', N'Fire a burst of shrapnel every 0.9s that explodes, dealing up to 400 damage. This explosion is fully effective up to 7 units and will hit enemies up to 17 units away. Has a maximum Ammo count of 8 and a range of 80 units.', N'https://web2.hirez.com/paladins/champion-abilities/burst-cannon.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (148, 17221, N'Kinetic Burst', N'Superheat your next Burst Cannon shot. Your next shot will instantly explode in a frontal cone, dealing 450 damage and applying a Knockback to enemies hit. Fully effective up to 40 units.', N'https://web2.hirez.com/paladins/champion-abilities/kinetic-burst.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (149, 18671, N'Siege Shield', N'Create a Siege Shield that advances forward along the ground. This Shield has 4500 Health and lasts 6s or until destroyed. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/siege-shield.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (150, 17087, N'Shoulder Bash', N'Lower your shoulder and charge forward, dealing 800 damage and applying a strong Knockback. This ability has a range of 120 units.', N'https://web2.hirez.com/paladins/champion-abilities/shoulder-bash.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (151, 17222, N'Assert Dominance', N'Leap upward and forward through the air and slam your Banner into the ground, dealing 600 damage and Stunning enemies for 2s in an 30-unit radius on impact. This impact creates a Damage-Immune zone for yourself that lasts 8s. You must remain within the zone to receive its benefits.', N'https://web2.hirez.com/paladins/champion-abilities/assert-dominance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (152, 24033, N'Chrono-Cannon', N'A futuristic weapon that can be charged up over 1.4s, increasing your Accuracy and damage falloff range, and firing fewer shots depending on its charge. This weapon deals 840 damage, has a maximum Ammo count of 6, and is fully effective up to 50 units at base charge.', N'https://web2.hirez.com/paladins/champion-abilities/chrono-cannon.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (153, 24041, N'Setback', N'Fire a concentrated ball of chronon energy that Rewinds its victim back to where they physically were 4s in the past. This blast reverts their Health to its lowest point during that period.', N'https://web2.hirez.com/paladins/champion-abilities/setback.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (154, 12981, N'Net Shot', N'Throw a net that deals 200 damage to a single enemy and reduces their Movement Speed by 50% for 2s. Has a range of 250 units.', N'https://web2.hirez.com/paladins/champion-abilities/net-shot.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (155, 24055, N'Stasis Field', N'Create a temporal Barrier in front of you that Absorbs all ranged attacks and projectiles. This barrier lasts 5s.', N'https://web2.hirez.com/paladins/champion-abilities/stasis-field.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (156, 24400, N'Exile', N'Supercharge your chronon accelerator for 5s. While in this state, you have 3 modified chronon weapon shots that will Banish enemies for 4s. Banished enemies can not be interacted with by anyone. Using this ability consumes 40% of your Ultimate charge and each shot consumes an additional 20%. While using this ability, you are Immune to Crowd Control effects. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/exile.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (157, 11197, N'Blunderbuss', N'A Blunderbuss that shoots pellets, dealing up to 500 damage every 1s. Has a maximum Ammo count of 6 and is fully effective up to 40 units.', N'https://web2.hirez.com/paladins/champion-abilities/blunderbuss.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (158, 10272, N'Barricade', N'Create a Shield in front of you. This Shield has 3750 Health and lasts 6s or until destroyed. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/barricade.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (159, 12523, N'Turret', N'Deploy a Turret that deals 120 damage every 1s. Turrets have 1000 Health and last until they are destroyed or you die. A maximum of 2 Turrets can be Deployed at once. Deploying a third Turret destroys the oldest Turret. Has a target range of 100 units. Can only target 1 enemy at a time. Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/turret.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (160, 11496, N'Rocket Boots', N'Charge forward for 1s, greatly increasing your Movement Speed while maintaining turn control. Canceled if refired or if you attack.', N'https://web2.hirez.com/paladins/champion-abilities/rocket-boots.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (161, 13012, N'Dome Shield', N'Create a Dome Shield and Deploy an additional Flamethrower Turret that deals 600 damage per second to enemies within 22 units. Dome Shield has 10,000 Health and lasts for 6s or until destroyed. The Shield is affected by Wrecker and the Turret is affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/dome-shield.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (162, 14308, N'Sticky Bomb', N'Throw a Sticky Bomb every 0.7s that will stick to surfaces and enemy Champions and can be Detonated. Has a maximum Ammo count of 6 and a range of 500 units. Bombs stuck to Champions detach themselves after 2s and Sticky Bombs auto-detonate when hitting Shields or targets Immune to Crowd Control.', N'https://web2.hirez.com/paladins/champion-abilities/sticky-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (163, 14309, N'Detonate', N'Blow up your Sticky Bombs, dealing up to 850 damage per explosion. Fully effective up to 1.5 units and will hit enemies up to 11 units away.', N'https://web2.hirez.com/paladins/champion-abilities/detonate.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (164, 13412, N'Grumpy Bomb', N'Throw a Grumpy Bomb up to 200 units that, after hitting a surface, grows angrier and explodes after 3s. This explosion deals 800 damage and Stuns enemies for 2s. Fully effective up to 10 units and will hit enemies up to 45 units away from the explosion.', N'https://web2.hirez.com/paladins/champion-abilities/grumpy-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (165, 13407, N'Poppy Bomb', N'Throw an unstable Poppy Bomb that sticks to any surface. Detonating this bomb deals 150 damage to enemies and applies a Knockback to yourself and enemies. Has a range of 70 units. The explosion is fully effective up to 20 units.', N'https://web2.hirez.com/paladins/champion-abilities/poppy-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (166, 14050, N'King Bomb', N'Embody your reign and become the King Bomb for 5s, able to roll around and explode with <CMD=GBA_Fire> or by refiring the ability. While rolling, you are Immune to Crowd Control. This explosion deals 2500 damage, Stuns enemies for 2s, and applies a Knockback to yourself. This ability ignores Shields, is fully effective up to 5 units, and will hit enemies up to 45 units away. Colliding with an enemy will detonate King Bomb.', N'https://web2.hirez.com/paladins/champion-abilities/king-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (167, 24188, N'Second Chance', N'Rewind yourself to where you physically were 4s in the past. Your Health is reverted to its highest value during that period.', N'https://web2.hirez.com/paladins/champion-abilities/second-chance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (168, 12928, N'Ice Storm', N'Summon a massive Ice Storm that deals 40 damage every 0.25s, lasts 6s, and has a radius of 25 units. Enemies caught have their Movement Speed reduced by 60% and are Crippled.', N'https://web2.hirez.com/paladins/champion-abilities/ice-storm.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (169, 10774, N'Flame Lance', N'A flamethrower that deals 35 damage every 0.1s and applies an additional effect that deals 200 damage over 2s. Flame Lance recharges when not firing. Your Movement Speed is reduced by 35% while firing. Has a maximum Ammo count of 100 and is fully effective up to 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/flame-lance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (170, 11059, N'Shield', N'Expand your Shield for 8s to block up to 5500 damage. You cannot attack while Shield is active. Can be refired to cancel the ability. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/shield.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (171, 24293, N'Moonlight', N'Hold and channel Moonlight into an ally, Healing them for 150 every 0.15s. Moonlight regenerates when not in use. Has a maximum Moonlight of 150 and a range of 125 units.', N'https://web2.hirez.com/paladins/champion-abilities/moonlight.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (172, 24297, N'Guardian Spirit', N'Deploy Luna to fight alongside you. Luna will rush and Stun enemies that have been Marked by your Light Bow for 1s every 18s. Luna strikes enemies twice for 180 damage and a third time for 350 damage. Luna can be redeployed to a new location every 8s while alive. The deploy has a range of 50 units. Luna is able to capture objectives while summoned. Luna has 3000 Health and is affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/guardian-spirit.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (173, 24289, N'Lunar Leap', N'Quickly leap backwards and upwards through the air.', N'https://web2.hirez.com/paladins/champion-abilities/lunar-leap.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (174, 24622, N'Begone', N'Project an ethereal manifestation of Luna and send it forward. Enemies caught will be pulled along the travel path and take 800 damage if they collide with a wall. You are Immune to damage while releasing Luna.', N'https://web2.hirez.com/paladins/champion-abilities/begone.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (175, 17176, N'Star Splitter', N'An automatic carbine that channels the power of the cosmos. Deals 108 damage every 0.13s, has a maximum Ammo count of 30, and is fully effective up to 100 units.', N'https://web2.hirez.com/paladins/champion-abilities/star-splitter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (176, 17178, N'Astral Mark', N'Apply a celestial blessing to an ally at your reticle through all obstacles, Healing for 250 and an additional 180 every 1s for 10s. Has a range of 120 units.', N'https://web2.hirez.com/paladins/champion-abilities/astral-mark.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (177, 19187, N'Void Grip', N'Channel gravitational energy and lift an enemy up, dealing 360 damage over 2.5s. If the target manages to move while lifted, it will interrupt Void Grip. Has a range of 70 units.', N'https://web2.hirez.com/paladins/champion-abilities/void-grip.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (178, 19186, N'Stellar Wind', N'Lower your weapon and increase your Movement Speed by 65% while also increasing your jump height and lowering your fall speed.', N'https://web2.hirez.com/paladins/champion-abilities/stellar-wind.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (179, 18397, N'Through Time and Space', N'Lock yourself in place and concentrate for 1.2s, focusing the power of the cosmos to unleash a devastating beam of energy that passes through all obstacles and enemies, dealing 2400 damage. While charging this ability, you are Immune to Crowd Control effects.', N'https://web2.hirez.com/paladins/champion-abilities/through-time-and-space.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (180, 19692, N'Heavy Repeater', N'A handheld Repeater that deals 180 damage every 0.26s. Has a maximum Ammo count of 20 and is fully effective up to 170 units.', N'https://web2.hirez.com/paladins/champion-abilities/heavy-repeater.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (181, 19876, N'Bulwark', N'Activate your gauntlet''s Bulwark, creating a Shield that blocks up to 4250 damage. Bulwark regenerates while not active. Your Movement Speed is reduced by 30% while using this ability. Affected by Wrecker.', N'https://web2.hirez.com/paladins/champion-abilities/bulwark.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (182, 24291, N'Light Bow', N'A celestial bow that fires godly energy, dealing 400 damage every 0.6s. Has a maximum Ammo count of 10 and is fully effective up to 350 units. Hitting an enemy with Light Bow will Mark them for Luna to attack.', N'https://web2.hirez.com/paladins/champion-abilities/light-bow.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (183, 19748, N'Battle Shout', N'Shout, becoming Immune to damage for 1.2s and Healing yourself and allies within 40 units for 1000.', N'https://web2.hirez.com/paladins/champion-abilities/battle-shout.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (184, 22154, N'Overpower', N'Target an enemy in sight and drag them to you through the air. While Overpowered, they are helpless and take 220 damage over the total hold duration. Can be fired to launch the victim away, dealing 700 damage in an area if they impact a surface. You are Immune to Crowd Control while this ability is active. Missing refunds 30% Ultimate charge. Has a range of 180 units.', N'https://web2.hirez.com/paladins/champion-abilities/overpower.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (185, 12872, N'Sniper Rifle', N'A combination weapon that deals 180 damage every 0.15s as an energy carbine and modifies its weapon properties while in Sniper Mode. Has a maximum Ammo count of 24 and is fully effective up to 100 units.', N'https://web2.hirez.com/paladins/champion-abilities/sniper-rifle.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (186, 13142, N'Sniper Mode', N'Scope up and charge your Sniper Rifle over 1.3s, increasing the damage it deals up to 1200. Consumes 4 Ammo with each shot and is fully effective up to 450 units.', N'https://web2.hirez.com/paladins/champion-abilities/sniper-mode.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (187, 13184, N'Oppressor Mine', N'Throw out up to 2 Oppressor Mines that deal 25 damage every 0.2s to an enemy within 50 units. Oppressor Mines have 200 Health and are affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/oppressor-mine.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (188, 12869, N'Transporter', N'Throw out a teleporter up to 100 units away that Teleports you to its location after 1.1s.', N'https://web2.hirez.com/paladins/champion-abilities/transporter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (189, 13250, N'Headhunter', N'Channel your inner focus for 5s, dealing 50% increased damage with shots to the upper half of enemies. While this effect is active, Sniper Rifle shots do not consume Ammo.', N'https://web2.hirez.com/paladins/champion-abilities/headhunter.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (190, 23399, N'Submachine Guns (Hellkite Claws)', N'Submachine Guns: Dual Submachine Guns that fire two rounds every 0.06s, each dealing 40 damage. These guns have a maximum Ammo count of 70 and are fully effective up to 80 units.<br><br>Hellkite Claws: Cut the air, launching a fiery slash that deals 650 damage every 0.55s. Fully effective up to 120 units.

', N'https://web2.hirez.com/paladins/champion-abilities/submachine-guns.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (191, 23447, N'Shadow Step (Skewer)', N'Shadow Step: Quickly dash forward, becoming Ethereal for the 0.6s duration. Has a range of 40 units and consumes 1 unit of Energy. <br><br>Skewer: Dash forward and slash all enemies in front of you for 700 damage. Consumes all remaining Energy and has a range of 70 units.
', N'https://web2.hirez.com/paladins/champion-abilities/shadow-step.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (192, 23403, N'Dragon Stance', N'Unleash your Hellkite Claws to gain additional abilities. While in this stance, you are constantly consuming Energy. Requires at least 1 unit of Energy to activate.', N'https://web2.hirez.com/paladins/champion-abilities/dragon-stance.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (193, 23402, N'Agility', N'Increase your Movement Speed by 30% and increase your jump height for 4s. Consumes 1 unit of Energy.<br><br>Passive: Hold <CMD=GBA_Jump> when running into a wall to climb it.', N'https://web2.hirez.com/paladins/champion-abilities/agility.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (194, 23404, N'Cyclone Strike', N'Melt into the shadows, becoming Ethereal and dealing 1500 damage every 1s over 2s to anyone within 25 units of you. This damage bypasses Shields.', N'https://web2.hirez.com/paladins/champion-abilities/cyclone-strike.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (195, 19749, N'Commander''s Grab', N'Surge forward to grab and Stun an enemy for 1s, then throw them behind you. This ability deals 600 damage and has a range of 50 units.', N'https://web2.hirez.com/paladins/champion-abilities/commanders-grab.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (196, 16252, N'Seismic Crash', N'Throw your spear, Piercing Shields and impacting the ground. This impact Stuns enemies for 2s and deals 500 damage in a 40-unit radius around its impact. Has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/seismic-crash.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (197, 16248, N'Warder''s Field', N'Deploy a stone obelisk with 1500 Health that pulses every 1s, dealing 150 damage and reducing the Movement Speed of enemies within 20 units by 60%. Lasts 6s and can be refired to destroy the obelisk. Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/warders-field.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (198, 16250, N'Impasse', N'Deploy a rocky wall that grows from the ground. This wall has 5500 Health, lasts for 5s, and can be refired to cancel. Has a range of 80 units. Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/impasse.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (199, 11481, N'Fireball', N'Shoot a ball of fire that Pierces enemies, dealing 450 damage to each enemy hit. Has a range of 400 units.', N'https://web2.hirez.com/paladins/champion-abilities/fireball.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (200, 10289, N'Charge', N'Dash forward at great speed, Piercing enemies and dealing 400 damage to each enemy hit. Has a range of 45 units.', N'https://web2.hirez.com/paladins/champion-abilities/charge.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (201, 13008, N'Immortal', N'All allies, including yourself, within 70 units of you cannot be brought below 1500 Health or affected by Damage Over Time effects. This effect lasts 4s and can be refired to cancel. While channeling, you are Immune to Crowd Control and are able to fire Flame Lance, but your Movement Speed is reduced by 50%. This Slow does not stack with the Slow from Flame Lance.', N'https://web2.hirez.com/paladins/champion-abilities/immortal.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (202, 23302, N'Pyre Blade', N'A Pyre-forged weapon that deals 330 damage every 0.5s in a burst of bullets with a medium spread. Has a maximum Ammo count of 12 and is fully effective up to 35 units.<br><br>Passive: Healing allies generates Wrath, which increases your Attack Speed and decays over time. Each tier of Wrath increases your Attack Speed by 10% up to a 30% maximum increase. ', N'https://web2.hirez.com/paladins/champion-abilities/pyre-blade.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (203, 23306, N'Kindle Soul', N'Target an ally near your reticle and Heal them for 1000 and an additional 400 over 2s. Has a range of 125 units.', N'https://web2.hirez.com/paladins/champion-abilities/kindle-soul.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (204, 23309, N'Pyre Strike', N'Summon a beam of searing light that travels forward through obstacles. Enemies caught in its path are Stunned for 1s and take 400 damage. Remaining in the beam deals an additional 20 damage every 0.05s.', N'https://web2.hirez.com/paladins/champion-abilities/pyre-strike.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (205, 23325, N'Wings of Wrath', N'Propel yourself backwards and fire 3 projectiles that seek out enemies, dealing 200 damage each. You leap backwards 45 units', N'https://web2.hirez.com/paladins/champion-abilities/wings-of-wrath.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (206, 23308, N'Inflame', N'Channel the Pyre and become Immune for 2s. Afterwards, increase the Movement Speed and the damage done with weapons by 30% of you and your allies within 150 units. In addition, fully reload the weapons of all affected allies. This effect lasts 8s.', N'https://web2.hirez.com/paladins/champion-abilities/inflame.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (207, 10751, N'Lightning Staff', N'A staff that channels lightning, dealing 75 damage every 0.1s. Deals up to 30% increased damage the longer you are continuously hitting your target. The staff will recharge over time after a brief period of not firing if it has not fully depleted. Has a maximum Ammo count of 100 and is fully effective up to 80 units.', N'https://web2.hirez.com/paladins/champion-abilities/lightning-staff.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (208, 14475, N'Shock Pulse', N'Fire a shocking projectile that Chains between enemy players, dealing 150 damage per bounce. Chains to up to 5 enemies within 50 units and has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/shock-pulse.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (209, 12123, N'Healing Totem', N'Deploy a Healing Totem that Heals allies within 30 units for 300 every 1s. Healing Totem has 1250 Health and lasts 6s or until destroyed. This ability has 2 charges and has a Deployment range of 100 units.  Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/healing-totem.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (210, 12659, N'Ghost Walk', N'Become Ethereal and increase your Movement Speed by 50% for 2s. Removes negative effects on activation.', N'https://web2.hirez.com/paladins/champion-abilities/ghost-walk.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (211, 13009, N'Tempest', N'Surge with elemental power and take flight for 5s, increasing your Movement Speed while channeling. While this ability is active, Slow and strike up to 3 nearby enemies for 200 damage while Healing up to 3 nearby allies for 350 every 0.5s. Allies affected by your Tempest also have their Movement Speed increased by 50% for 2s. Your Tempest has a radius of 50 units. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/tempest.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (212, 13026, N'Throwing Axe', N'Hurl your axe through the air every 0.9s, dealing 300 damage.<br><br>Passive: The axe''s damage is increased based on distance traveled, up to 750 damage.', N'https://web2.hirez.com/paladins/champion-abilities/throwing-axe.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (213, 15123, N'Crippling Throw', N'Throw a vicious axe, dealing 400 damage and Crippling an enemy for 1s. Has a range of 300 units.', N'https://web2.hirez.com/paladins/champion-abilities/crippling-throw.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (214, 14190, N'Blossom', N'Activate this ability to Heal yourself and allies within 80 units for 800.<br><br>Passive: Heal yourself and allies within 80 units for 80 every 1s.', N'https://web2.hirez.com/paladins/champion-abilities/blossom.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (215, 13023, N'Vine', N'Throw a vine that latches onto the first ally or terrain that it touches and then pull yourself towards it. If Vine would fail to latch onto anything, it will not fire. Has a range of 95 units.', N'https://web2.hirez.com/paladins/champion-abilities/vine.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (216, 13068, N'Whirlwind', N'Rapidly Heal allies within 40 units for 2500 every 1s. This effect lasts 4s. Can be refired to cancel.', N'https://web2.hirez.com/paladins/champion-abilities/whirlwind.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (217, 23860, N'Frost Bolt (Pyre Ball)', N'Frost Bolt: In ice stance, throw a Frost Bolt every 0.8s that deals 650 damage and Slows enemies by 15% for 1s.
Pyre Ball: In fire stance, charge a Pyre Ball for up to 1.2s that deals 1000 damage at maximum charge.
Passive: Dealing damage with these abilities generates Mana. At full Mana, your next attack is instant. ', N'https://web2.hirez.com/paladins/champion-abilities/frost-bolt.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (218, 23852, N'Frost Bomb (Inferno Cannon)', N'Frost Bomb: In ice stance, launch a Bomb that deals up to 800 damage within 35 units of detonation, dealing damage based on the duration of travel, and Rooting enemies hit for 1s. Reactivating Frost Bomb will detonate it. Has a range of 300 units.<br><br>Inferno Cannon: In fire stance, channel an Inferno Cannon that deals 110 damage every 0.09s over 3s in a 120-unit Piercing column of fire.', N'https://web2.hirez.com/paladins/champion-abilities/frost-bomb.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (219, 23862, N'Elemental Shift', N'Shift your elemental alignment between freezing ice and scorching fire over 1s, gaining access to new abilities.', N'https://web2.hirez.com/paladins/champion-abilities/elemental-shift.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (220, 23897, N'Frostfire Glide', N'Channel the elements to glide through the air for 4s. You have limited turning capabilities and lose momentum when turning.', N'https://web2.hirez.com/paladins/champion-abilities/frostfire-glide.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (221, 23718, N'Dragon''s Call', N'Summon and control a FrostFire-breathing Draconic Avatar for 20s after 1.5s of channeling. Can be refired to cancel. <br><br><CMD=GBA_Fire>: FrostFire Breath -- Deals 170 damage every 0.1s and is fully effective up to 105 units.<br><CMD=GBA_Ability_2>: Fly upward. <br><CMD=GBA_Ability_3>: Fly downward. <br><br> Imani is Rooted and Immune to Crowd Control during this ability. Affected by Bulldozer.', N'https://web2.hirez.com/paladins/champion-abilities/dragons-call.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (222, 16246, N'Stone Spear', N'Fire a burst of 3 projectiles over 0.3s every 1.25s. Each projectile deals 225 damage. Has a maximum Ammo count of 5 and is fully effective up to 75 units.', N'https://web2.hirez.com/paladins/champion-abilities/stone-spear.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (223, 16251, N'Earthen Guard', N'Enter a defensive state. While in this state, reduce damage taken by your Deployables and you by 30% and increase Healing received by 40%. This effect lasts 5s.', N'https://web2.hirez.com/paladins/champion-abilities/earthen-guard.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (224, 16701, N'In Pursuit', N'Being rapidly firing your Magnums at the nearest enemy with perfect aim, dealing 960 damage over 1.4s. Acts as a weapon shot. Effective up to 200 units.', N'https://web2.hirez.com/paladins/champion-abilities/in-pursuit.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
INSERT [dbo].[Ability] ([Id], [PAbilityId], [Name], [Description], [Url], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (225, 18236, N'Spite', N'Launch forward and Stun an enemy with a series of vicious melee attacks, dealing 2000 damage over 1.5s. While attacking, you are Immune to Crowd Control. Has a range of 90 units. Failing to hit an enemy will refund 30% Ultimate charge.', N'https://web2.hirez.com/paladins/champion-abilities/spite.jpg', CAST(N'2020-08-28T18:17:33.297' AS DateTime), CAST(N'2020-08-28T18:17:33.297' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Ability] OFF
GO
SET IDENTITY_INSERT [dbo].[Champion] ON 
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 2205, N'Androxus', N'Paladins Flanker', N'The Godslayer', N'Androxus was once a noble lawman of the Outer Tribunal circuit judges. He and his former partner, Lex, were relentless in their pursuit of criminals and threats to the natural order. After a tragic confrontation with a deceitful being claiming to be a goddess, he became afflicted with an otherworldly disease, dooming him with an endless hunger for souls. Now he wanders the realm, adrift, in a never-ending quest to quell that hunger, stripped of his rank and duties with the Tribunal, and condemned to live with the curse for eternity.', 2100, 365, N'https://web2.hirez.com/paladins/champion-icons/androxus.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 2338, N'Maeve', N'Paladins Flanker', N'of Blades', N'After making a name for herself as a skilled thief and knife-fighter, the half-tigron Maeve decided to join the war for personal gain, selling her services to the highest bidder. She dashes from shadow to shadow with unnatural agility, concealed by her magical longcoat -- a souvenir from one of her most daring burglaries: the Magistrate’s fortress keep. While her employers find her talents useful, they often complain of suspiciously-misplaced valuables and lost coins after she moves on to the next fight.', 1900, 370, N'https://web2.hirez.com/paladins/champion-icons/maeve.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 2288, N'Makoa', N'Paladins Front Line', N'The Ancient', N'Once the dedicated protector of the island home of the Ska’drin, the ancient Makoa has now been summoned to the mainland. In his absence, he fears that he cannot ensure the safety of the volcanic islands. But with the greater threat in the Realm, he''s taken to the land, to make sure those he protects have a home to return to. With him, he brings the ocean''s fury and the tortoise''s indomitable resilience, as well as various naval implements, to bear against those who would defile the natural world.', 4500, 350, N'https://web2.hirez.com/paladins/champion-icons/makoa.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 2303, N'Mal''Damba', N'Paladins Support', N'Wekono''s Chosen', N'When Wekono, the Mother of Sorrow and Revenge, turns her gaze to the mortal world, she appoints a champion. In this cycle, the island witchdoctor Mal’Damba has been gifted with her powers and sent into the war to evangelize her faith by laying waste to any who would stand before his goddess. His mastery of dark magic and virulent poisons was already impressive before the insidious goddess imbued him with even greater abilities, rendering him one of the deadliest beings in the Realm, an extension of Wekono’s will.', 2200, 365, N'https://web2.hirez.com/paladins/champion-icons/maldamba.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 2481, N'Moji', N'Paladins Flanker', N'and Friends', N'While the rest of the rabbit-like leipori fled to the forests to avoid getting involved in the war raging across the Realm, Moji took it upon herself to summon the great nature spirits to defend the world. She charges into battle atop her trusty familiar, Po-Li, who carries her through the fray as she unleashes a maelstrom of sorcerous destruction on her enemies. Once the war is over and the Realm has returned to its natural state, she hopes to return to the forest to help her people begin the healing process and restore all that was lost.', 2200, 370, N'https://web2.hirez.com/paladins/champion-icons/moji.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 2056, N'Pip', N'Paladins Support', N'The Rogue Alchemist', N'Unlike most other vulpin, Pip chose to specialize in weaponized explosives instead of curative alchemy. He left Brightmarsh, his homeland, in search of adventure across the Realm. Now, he splits his time between brewing up all sorts of fiery concoctions to use against the Magistrate’s forces and creating restorative potions to aid his friends. While his allies have come to appreciate his assistance and expertise, they fully understand that the little fox is as unpredictable as his dangerous mixtures.', 2200, 350, N'https://web2.hirez.com/paladins/champion-icons/pip.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 2528, N'Raum', N'Paladins Front Line', N'Rage of the Abyss', N'All tremble at the mere mention of his name. He is wrath. He is fury. He is Raum, Rage of the Abyss. Consumed by burning conflict, tempered in the Abyss, his purpose is clear  -- annihilation. He has fought and triumphed over every entity in those war-scarred plains, shattering every soul that stands against his might. Few remain who are still worthy of his attention, and their conflicts grow stale. Now, he finds himself summoned to the Realm, a fertile ground teeming with new victims whose souls are too well-connected to their bodies.', 4500, 365, N'https://web2.hirez.com/paladins/champion-icons/raum.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 2149, N'Ruckus', N'Paladins Front Line', N'The Worst of Friends', N'While toiling in the gold mines, a particularly wily and inventive goblin named Ruckus stumbled upon the long-lost mind-stone of a fallen war-golem. He installed the relic into his mechanical digging suit, hoping it would provide the suit with enough power to outperform the other miners. He was quite surprised when the ancient sentience reawakened and brought the suit to life. Though it resented its situation, its pilot, and the name it was given, Bolt nonetheless agreed to a tentative partnership, one that freed them both to scour the Realm in search of fame, fortune, and upgrades.', 4000, 365, N'https://web2.hirez.com/paladins/champion-icons/ruckus.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 2372, N'Seris', N'Paladins Support', N'Oracle of the Abyss', N'A being from beyond the void, Seris has taken the name of the city she completely destroyed upon first setting foot in the world of the living. Draining the souls of her enemies and occasionally restoring them to her allies, however, pales in comparison to her unnatural prescience, granting her the ability to see into the past and predict the future all at once. She appears here and there in time and space, always at the opportune moment to change the course of events toward some unknown but seemingly inevitable fate.', 2200, 365, N'https://web2.hirez.com/paladins/champion-icons/seris.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 2307, N'Sha Lin', N'Paladins Damage', N'The Desert Wind', N'Tales of the legendary adventurer Sha Lin have spread far and wide across the Realm, recounting his heroic exploits and death-defying antics. During his short lifetime, he’s already helped topple warlords, recovered long-lost artifacts, and betrayed the infamous Thousand Hands Guild. He’s pierced as many hearts with his magical longbow as he has broken with his silver tongue, but even he has a stake in the current conflict between the Magistrate and the Resistance, standing up to the oppressive Magistrate on behalf of the common folk.', 2000, 350, N'https://web2.hirez.com/paladins/champion-icons/sha-lin.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 2057, N'Skye', N'Paladins Flanker', N'The Twilight Assassin', N'Noble by birth, Skye abandoned a life of luxury and wealth to pursue her dreams of excitement and adventure. During her time spent on the streets interacting with the criminal underworld of the Realm, she discovered her natural talent and boundless obsession with killing. When her career as a contract assassin brought her fame and fortune, she caught the Magistrate’s attention, and now serves as one of Grand Magister Karne’s closest advisors. To her, the War of the Realm is just a long-term contract, one that won’t end until the last of the Resistance is dealt with.', 2000, 380, N'https://web2.hirez.com/paladins/champion-icons/skye.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 2438, N'Strix', N'Paladins Damage', N'Ghost Feather', N'Having spent most of his life in the military, Strix was an invaluable member of the Sentinels, tasked with training their elite sharpshooters. He was reassigned after the unit was disbanded -- sent to the front lines with the regular army as it prepared to put down the Resistance. Always the calm and composed professional, he is a master of stealth and camouflage, able to pick off high-value targets before the enemy is even aware of his presence -- or that they are under attack at all.', 2000, 340, N'https://web2.hirez.com/paladins/champion-icons/strix.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 2472, N'Talus', N'Paladins Flanker', N'of the Ska''drin', N'Talus might still be young and overly-optimistic, but he’s got big plans. After almost losing his family to an angry mob who refused to accept the otherworldly Ska’drin as neighbors, he set out on a quest for knowledge. From the shores of an abandoned island paradise to the darkened corridors of the Deepwerks, he worked to uncover forgotten truths and unlock his inborn aptitude. When the Resistance rose up to oppose the Magistrate, he joined them, eager to put his newfound abilities to work and prove that the Ska’drin deserve a place in the Realm.', 1900, 385, N'https://web2.hirez.com/paladins/champion-icons/talus.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 2477, N'Terminus', N'Paladins Front Line', N'The Fallen', N'Whatever Terminus once was, he has since become an instrument of war fighting on behalf of the Magistrate. His mind and memories are long gone, his broken body bound by dark sorcery and unstable magic crystals. His form, stuck somewhere between life and death, may be a mere shadow of his former self, but it has also rid him of hesitation and fear. He obediently charges into battle with reckless abandon, hefting a terrifying battle axe that few mortals could lift and even fewer could hope to withstand.', 4000, 345, N'https://web2.hirez.com/paladins/champion-icons/terminus.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 2529, N'Tiberius', N'Paladins Damage', N'The Weapons Master', N'His is a tale of charm and daring -- heroic feats backed by deadly prowess. A traveler of the Realm looking for worthy foes to test his mettle, sharpening his skills and weapons alike. Adored by the people, feared in battle -- Tiberius, The Weapons-Master, knows no equal!  Born of the Tigron, Tiberius is the pinnacle of their values. A dashing legend -- bold, brash, and relentless -- anointed by an ancient blade, destined for battles that are nothing short of legendary.   With Chakrams, forged by the weapon-smiths of his ancestors; and a sword, forged from the heavens themselves -- an ancient artifact capable of banishing unspeakable evils from this world -- he is ready for any threat! Tiberius is exhilarated by the opportunity to match blades with a worthy foe. Snarling, he charges headlong into the fray, unleashing an unrelenting storm of steel, claw, and fang. En garde!', 2200, 360, N'https://web2.hirez.com/paladins/champion-icons/tiberius.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 2322, N'Torvald', N'Paladins Front Line', N'The Runic Sage', N'As the ranking scholar and preeminent authority on runic lore at the Deepwerks facility, Torvald is one of the architects of the wave of crystal-powered technology sweeping across the Realm. Though he would much rather have his nose buried in a dusty old history tome or reach into a swirling vortex of magical energy using his enhanced stone gauntlet, he understands that the Magistrate is the driving force behind all his research and has joined their effort to put down the Resistance. Once the war is over, he can once more get back to work.', 3000, 350, N'https://web2.hirez.com/paladins/champion-icons/torvald.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 2314, N'Tyra', N'Paladins Damage', N'The Untamed', N'Raised to shoot straight and survive the harsh winters of the frontier, Tyra signed on with the Magistrate army at a young age. After the Sentinels’ disastrous final mission, she returned to her homeland to make a living tracking down the monstrous threats to the common folk that lurked beyond the fringes of the Realm. Her unyielding stamina and pinpoint accuracy with the rifle serve her well in her new role: helping the Resistance fight back against the Magistrate and bring an end to the war that rages across the Realm.', 2400, 370, N'https://web2.hirez.com/paladins/champion-icons/tyra.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 2285, N'Viktor', N'Paladins Damage', N'The Lone Wolf', N'The former commander of the Sentinels, an elite Magistrate military unit, Viktor lives in the shadow of his former glory. He took the blame for what happened during their final mission, was stripped of his rank, and reassigned to a lower position by Grand Magister Karne. Though disgraced, his training and skill as a soldier remains unmatched, along with his unwavering loyalty to the Magistrate. Determined to regain his standing, he pushes himself well beyond his limits in battle against the Resistance, striving to end the rebellion before the conflict truly rages out of control.', 2200, 365, N'https://web2.hirez.com/paladins/champion-icons/viktor.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 2480, N'Vivian', N'Paladins Damage', N'The Cunning', N'Rapidly rising through the ranks of the Magistrate, Vivian’s clever, persistent scheming got her appointed to the Deepwerks facility, where she was the first to recognize the military potential of the research they were conducting. In the swirling chaos of the war with the Resistance, she sees only the opportunity to advance her station in life. Equipped with some of the most advanced crystal-powered weaponry ever created, she joins the battle not to prove herself or to follow orders, but to find and silence the lone witness of her true plans.', 2200, 370, N'https://web2.hirez.com/paladins/champion-icons/vivian.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 2393, N'Willo', N'Paladins Damage', N'of the Summer Court', N'Though short-lived and even-tempered, the faeries of the Summer Court wage an endless war against the encroachment of modern civilization. Willo might only have three summers to her name, but her aggressive demeanor more than makes up for her lack of experience. She charges into the fray with an eagerness and tenacity that worries the precious few remaining faeries. At a time when the fae should be regrouping to bolster their dwindling numbers, Willo has taken it upon herself to take arms against both the Magistrate and the Resistance.', 2200, 370, N'https://web2.hirez.com/paladins/champion-icons/willo.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 2417, N'Lian', N'Paladins Damage', N'Scion of House Aico', N'After a successful ploy to set herself up as the legitimate heiress to the Ruby Throne, nothing stood in Lian’s way. Her sincere dedication to her family’s legacy may have earned her the title of Scion, but her skill with the rifle is what won her the respect of her family’s Royal Guard. When the Magistrate called on all loyal houses to unite against the Resistance, she was honor-bound to accept, arriving from her far-off homeland to represent House Aico along with her faithful bodyguard and general, Khan.', 2000, 355, N'https://web2.hirez.com/paladins/champion-icons/lian.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 2267, N'Ying', N'Paladins Support', N'The Blossom', N'A talented young spellcaster, Ying is a master of illusions and trickery, able to befuddle her opponents with bewildering misdirection. That same magic can also soothe the minds of her allies to ease their suffering and mend their wounds. She made good use of those skills to escape imprisonment by a bandit king and during her time spent as an adventurer afterward. When the Magistrate began its campaign of conquest, subjugating the Realm in an attempt to restrict the use of magic by the common folk, she felt it was her responsibility to join the fight against their oppression.', 2200, 355, N'https://web2.hirez.com/paladins/champion-icons/ying.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 2362, N'Lex', N'Paladins Flanker', N'The Hand of Justice', N'The Outer Tribunal is made up of merciless, oathbound judges, with none more dedicated than Lex. His partner, Androxus, and he traversed the outskirts of the Realm together, tracking down infamous criminals and battling all manner of horrors on behalf of the Magistrate and its people. After encountering a sinister figure claiming to be a goddess, though, Androxus changed, abandoning his duties and quickly rising to the top of the most-wanted list. Lex, unable to turn his back on the law or his oaths to his partner, vowed to one day take his former friend in, dead or alive.', 2200, 385, N'https://web2.hirez.com/paladins/champion-icons/lex.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 2249, N'Kinessa', N'Paladins Damage', N'The Bounty Hunter', N'As a young recruit in the elite Sentinels, Kinessa took to her sniper lessons with an eagerness and enthusiasm that surprised her mentors. Frustrated by the rigors of military life, she left before she could complete her training and struck out on her own. As the Realm has descended into chaos and war, vigilante bounty contracts have been plentiful, earning her all the fame and fortune she’d lacked while in the service of the Magistrate. She still refuses to pick a side in the conflict, however, because there''s much more money to be made by playing both sides than by contracting with either.', 2100, 350, N'https://web2.hirez.com/paladins/champion-icons/kinessa.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 2404, N'Ash', N'Paladins Front Line', N'The War Machine', N'Ash made a name for herself in the Magistrate army by volunteering for front-line duty using experimental heavy armor and siege weaponry. Lacking finesse or subtlety, she more than makes up for it with brutal tactics and overkill. The War Machine, as she is called by her allies and enemies alike, earns the title every time the dust settles and she is all that remains on the scorched battlefield. When the Resistance emerged and brought the war to Crosswind Hold, Ash led the charge against them with fury and determination.', 4500, 340, N'https://web2.hirez.com/paladins/champion-icons/ash.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 2512, N'Atlas', N'Paladins Front Line', N'The Man Out of Time', N'There is no light in the future, only an all-consuming Darkness. The Realm is lost. Atlas will be born into this dark future as the son of a legendary Judge. Each day he fights to survive, and each night he finds solace in stories of the Realm that used to be. These stories give Realm-kind hope, but their final stand against the Darkness will fail tragically. All hope will be lost... save for one last glimmer. In a desperate bid, Atlas studied old books of Crystal magic, and mastered the control of time. He researched old tales of what could have been the source of this destruction -- of how the world had fallen. And then, Atlas stepped into the past, determined to save the Realm, and stop the Darkness, by changing the course of history itself.', 3500, 360, N'https://web2.hirez.com/paladins/champion-icons/atlas.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 2073, N'Barik', N'Paladins Front Line', N'The Master Mechanic', N'Long before he came to the Deepwerks and helped develop the crystal-powered technology spreading throughout the Realm, Barik was a clever inventor and resourceful engineer. Since then, his signature contributions have appeared in almost every field and vocation, from mechanized mining suits and rocket-powered wings, to the crystalline weapons used by Magistrate and Resistance soldiers alike. After a falling-out with the corrupt Magistrate commander assigned to oversee the security of the Deepwerks, he left and pledged his services to Valera and the Resistance.', 3400, 345, N'https://web2.hirez.com/paladins/champion-icons/barik.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (28, 2281, N'Bomb King', N'Paladins Damage', N'His Majesty', N'During a fortress siege long ago, a clever warlord decided that the best way to breach her enemy’s defenses would be to create walking bombs. Her warlock accidentally brought one of the larger bombs to life, creating the Bomb King. After destroying the warlord''s entire army by himself, Bomb King struck out on his own delusional quest to visit the lands under his rule, which happened to be all of them. The common folk knew better than to offend or even stand very close to him, as his regal demeanor can instantly change to furious, explosive rage at any moment.', 2200, 360, N'https://web2.hirez.com/paladins/champion-icons/bomb-king.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (29, 2147, N'Buck', N'Paladins Flanker', N'The Unyielding', N'Buck’s fighting style is informed by his diverse and complicated story, and is just as unique and esoteric. Pulling from his past experiences, he effectively combines the self-discipline of a devout monk, clever ambush tactics commonly used by underworld thugs, and the skills and weaponry of a front-line soldier into something more than the sum of its parts. Once a loyal member of an elite Magistrate unit, he has returned to where it all began, Crosswind Hold, to join the Resistance in their struggle against the Magistrate.', 2300, 370, N'https://web2.hirez.com/paladins/champion-icons/buck.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (30, 2092, N'Cassie', N'Paladins Damage', N'The Hunter''s Daughter', N'Watching all her friends leave the Greenwood to join the fight against the Magistrate, Cassie lamented the curse that bound her bloodline to her family’s homeland. When advice from a mysterious oracle offered her an escape from her obligations, she jumped at the chance, even though she knew the sacrifice she made would haunt her. Taking nothing but her father’s enchanted crossbow and her faithful hunting bird, Zigs, she raced off to join the Resistance in their fight against the relentless Magistrate.', 2200, 355, N'https://web2.hirez.com/paladins/champion-icons/cassie.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (31, 2533, N'Corvus', N'Paladins Support', N'The Magistrate''s Blade', N'The most difficult decisions test even the strongest of wills, but his will has never wavered, even in the face of seemingly insurmountable odds. He is Corvus, The Magistrate''s Blade. He is the son of Karne, the powerful leader of the Magistrate, but it is by his own merit that he has earned the absolute loyalty of his men and instilled fear in his enemies. A charismatic leader and brilliant tactician, Corvus will stop at nothing to see his goals realized: a peace to surpass that of the Golden Age, under the Magistrate''s rule. With the near-limitless energy of the Abyss, bent to his iron will, and those soldiers still loyal to his vision of peace, he is doing what no other is capable of. By his own strength, the Resistance will fall, and peace will be forged for the Realm''s citizens, with or without their cooperation.', 2200, 360, N'https://web2.hirez.com/paladins/champion-icons/corvus.jpg', N'y', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (32, 2495, N'Dredge', N'Paladins Damage', N'Admiral of the Abyss', N'Admiral Judd Roberts ruled the eight oceans as the Realm’s most-feared pirate, until one final treasure led to his doom. The admiral stole the Warders’ relics from the Resistance, but could not tame the dragons’ might. His ship was destroyed, his crew scattered, and he sank to certain death in the oceans'' depths. The Abyss intervened and bore the admiral -- now Admiral Dredge -- back into the Realm of the living. Now the undead pirate travels the seas again, and no soul, living or dead, will take his treasure from him.', 2200, 340, N'https://web2.hirez.com/paladins/champion-icons/dredge.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (33, 2277, N'Drogoz', N'Paladins Damage', N'The Greedy', N'Born wingless as a mere wyrin underling to a vicious dragon, Drogoz escaped his servitude using a pair of crystal-fueled mechanical wings crafted by a clever dwarven engineer. The draconic blood in his veins flowed with cruelty and greed, compelling him to continue on a Realm-wide rampage of destruction as he amassed his own hoard, one that will rival that of the true dragons. As the conflict between the Magistrate and the Resistance rages, Drogoz streaks through the sky above, swooping down to deal with his foes as quickly -- and as violently -- as possible.', 2200, 350, N'https://web2.hirez.com/paladins/champion-icons/drogoz.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (34, 2094, N'Evie', N'Paladins Flanker', N'The Winter Witch', N'After cleverly tricking and imprisoning a greater frost elemental in a magical gemstone, Evie went from apprentice sorceress to Winter Witch seemingly overnight. Though no longer welcome in her home village, which she left to an uncertain fate, she found her talents to be in high demand in the Resistance''s conflict with the Magistrate. Though powerful, her true motivations are as mysterious as the exact details of her background, causing her allies to question her loyalty as well as how long she can really hope to keep the vengeful elemental contained.', 1800, 365, N'https://web2.hirez.com/paladins/champion-icons/evie.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (35, 2071, N'Fernando', N'Paladins Front Line', N'The Self-Appointed Knight', N'Though not of noble birth, and never having been formally trained, Fernando assumed the mantle of knighthood when the knight he served met an untimely fate. From that moment on, he wandered from one heroic adventure to the next, making a name for himself throughout the Realm. When the Magistrate called on all loyal houses to join their them in their efforts against the Resistance, he heeded their summons with pride. If his valor in combat and charming confidence can keep his allies from discovering his closely-guarded secret, he might just live to become the champion he knows he can be.', 4600, 350, N'https://web2.hirez.com/paladins/champion-icons/fernando.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (36, 2491, N'Furia', N'Paladins Support', N'Angel of Vengeance', N'Sarah prayed to the Eternal Pyre for the strength to fight the Abyss and to avenge her fallen sister, cruelly sacrificed by the Magistrate. Her prayers were answered. She was saved from the Abyss and transformed into Furia: An avenging angel of cleansing flame -- Pyre-incarnate. Now the former sisters stand opposed, each a vessel for otherworldly powers far beyond that of mere mortals.', 2200, 365, N'https://web2.hirez.com/paladins/champion-icons/furia.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (37, 2093, N'Grohk', N'Paladins Support', N'The Lightning Orc', N'Being struck by lightning once is usually more than enough to kill someone, but after dozens of strikes, Grohk was still standing. Though it took him a while to realize it, he had been imbued with the power to control the lightning itself, and he put it to good use defending his tribe from a goblin attack that would have otherwise destroyed them. Seeing his newfound power as a sign from the weather-spirits, the rest of the Red River orcs immediately appointed him their chieftain. With the clash of the Magistrate and Resistance escalating, he sensed a new storm of a different sort brewing and joined the battle on behalf of his tribe.', 2200, 350, N'https://web2.hirez.com/paladins/champion-icons/grohk.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (38, 2254, N'Grover', N'Paladins Support', N'The Wild', N'The "soul of the forest" isn’t some invisible spirit or comforting poem about being "one with nature", it’s an angry, walking tree with a huge stone axe. After decades of peaceful slumber since the last time Grover had to walk the land -- to help put down the goblin scourge -- he has awakened once again to find the forests of the Realm threatened by the spread of humanoid civilizations, rampant industrialization, and the all-consuming fires of war. Hefting his trusty axe, he stomps into battle once again, intent on destroying anything and anyone who would harm the natural world.', 2300, 360, N'https://web2.hirez.com/paladins/champion-icons/grover.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (39, 2509, N'Imani', N'Paladins Damage', N'The Last Warder', N'Long ago, there was chaos and war. The dragons ruled the Realm, and everyone else was left to fight over the scraps. But one wise mage learned the dragons'' secrets. She became the first Warder, the first to command a dragon. It was that Warder’s actions that paved the way for the Paladins’ golden age of peace.The Warders were thought to be dead and gone, a relic of a bygone age. Yet, when a beacon was lit in their ancient homeland -- an alarm signal that the Warders, or what remained of them, were needed once again -- Imani answered that call. Little is known about the Last Warder’s past before she appeared in Dredge’s treasure trove to recover her stolen relics, but one thing is sure: she will uphold the legacy of her lineage, and stand against the darkness of the future looming over the Realm.', 2200, 350, N'https://web2.hirez.com/paladins/champion-icons/imani.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (40, 2348, N'Inara', N'Paladins Front Line', N'The Stone Warden', N'One of the few remaining stagalla, Inara was reluctant to join the Resistance in their time of need, but she was oath-bound to do so. Originally created to help the ancient order of the Paladins repel the first goblin scourge, the stone people slumbered for generations before being summoned to battle once again. Inara was slow to act, but after witnessing the savage acts committed by the Magistrate, she threw herself once more into the battle, this time on behalf of the Resistance, heeding the call of Valera and her Paladins once again.', 4700, 350, N'https://web2.hirez.com/paladins/champion-icons/inara.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (41, 2517, N'Io', N'Paladins Support', N'the Shattered Goddess', N'For eons, the moon goddess Io watched over the Realm. Then, disaster struck: the Darkness smothered the goddess’s light and shattered the moon that hung above the lands. Pieces of the moon fell to the Shattered Desert, where Io’s faithful watched over them. They kept vigil for the shattered goddess, praying that one day she would return to guide them. As the Magistrate marched on the desert sands, intending to claim the power of the moon shards in their vicious struggle with the Resistance, that day finally came. At the urging of her celestial contemporary, Jenos, Io revealed her true form to fight for her people and stand against those who would threaten their survival.', 2200, 370, N'https://web2.hirez.com/paladins/champion-icons/io.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (42, 2431, N'Jenos', N'Paladins Support', N'The Ascended', N'Jenos was merely a young monk in search of greater wisdom, and a reprieve from the ravages of the Second Scourge, when he climbed that mountain many generations ago. He found his answer written among the stars, and ascended into the heavens to dedicate himself to it. He vanished for many years, leaving behind only a small group of followers who were dedicated to carrying on his legacy in the Realm. Now, as the Realm descends into war once again, so too has Jenos descended from the stars to walk upon the ground once again, joining the battle for some arcane purpose that only he understands.', 2200, 360, N'https://web2.hirez.com/paladins/champion-icons/jenos.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (43, 2479, N'Khan', N'Paladins Front Line', N'Primus of house Aico', N'The Patriarch of House Aico issued a challenge to his captains: keep the house’s banner upright for the longest amount of time. Men strong enough to toss lesser men across the battlefield tried, but few were strong enough to last even a day with the banner in-hand. The last captain to attempt the test, a young man named Khan, held the banner in his hands for hours. As his arms tired, he beckoned to a common servant and tasked her with taking the banner from him and keeping it upright. “Even though I must fall,” he said, “the banner will remain.” Thus he passed the test, for this was no test of strength, but one of loyalty to House Aico. Khan proved himself worthy of command with his actions that day. Now, he serves Lian as advisor and protector, a steadfast supporter of House Aico.', 4000, 350, N'https://web2.hirez.com/paladins/champion-icons/khan.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (44, 2493, N'Koga', N'Paladins Flanker', N'The Lost Hand', N'Once, a nameless street-rat challenged the tyrant, Zhin. For the boy''s courage, and his remarkable skills, Zhin granted him a new life in the Thousand Hands Guild, along with a new name: Koga. The guild became Koga''s new family and he became their finest ninja. But, not all families get along. Out of jealousy, lies were spread and false evidence was planted. Zhin''s resulting fury forced Koga to flee. Now, the exiled ninja fights for his new family -- the Resistance -- as he searches for the one who betrayed him.', 2000, 375, N'https://web2.hirez.com/paladins/champion-icons/koga.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
INSERT [dbo].[Champion] ([Id], [PChampionId], [Name], [Role], [Title], [Lore], [Health], [Speed], [Url], [IsLatestChampion], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (45, 2420, N'Zhin', N'Paladins Flanker', N'The Tyrant', N'Robbed of his noble lineage, Zhin ruthlessly carved out his own throne atop the criminal underworld. By the time he was a man, he’d won the loyalty of enough thieves, assassins, and corrupt bureaucrats to build his own shadowy empire: the Thousand Hands Guild. Anyone scheming against him has a tendency to vanish in the middle of the night, while those who confront him directly meet their doom at the end of his wicked flaming sword. He refuses to pick a side in the war, as there’s more profit to be made playing them against each other.', 2000, 380, N'https://web2.hirez.com/paladins/champion-icons/zhin.jpg', N'n', CAST(N'2020-08-28T18:17:33.510' AS DateTime), CAST(N'2020-08-28T18:17:33.510' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Champion] OFF
GO
SET IDENTITY_INSERT [dbo].[ChampionAbilities] ON 
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 1, 1, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 2, 6, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 3, 6, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 4, 6, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 5, 7, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 6, 7, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 7, 7, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 8, 7, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 9, 7, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 10, 8, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 11, 8, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 12, 8, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 13, 6, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 14, 8, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 15, 9, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 16, 9, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 17, 9, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 18, 9, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 19, 9, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 20, 10, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 21, 10, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 22, 10, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 23, 10, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 24, 10, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 25, 11, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 26, 8, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 27, 11, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (28, 28, 6, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (29, 29, 5, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (30, 30, 23, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (31, 31, 21, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (32, 32, 21, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (33, 33, 21, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (34, 34, 21, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (35, 35, 21, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (36, 36, 2, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (37, 37, 2, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (38, 38, 2, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (39, 39, 2, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (40, 40, 2, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (41, 41, 5, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (42, 42, 3, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (43, 43, 3, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (44, 44, 3, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (45, 45, 3, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (46, 46, 4, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (47, 47, 4, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (48, 48, 4, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (49, 49, 4, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (50, 50, 4, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (51, 51, 5, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (52, 52, 5, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (53, 53, 5, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (54, 54, 3, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (55, 55, 11, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (56, 56, 11, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (57, 57, 11, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (58, 58, 17, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (59, 59, 18, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (60, 60, 18, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (61, 61, 18, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (62, 62, 18, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (63, 63, 18, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (64, 64, 19, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (65, 65, 19, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (66, 66, 19, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (67, 67, 19, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (68, 68, 19, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (69, 69, 17, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (70, 70, 20, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (71, 71, 20, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (72, 72, 20, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (73, 73, 20, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (74, 74, 22, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (75, 75, 22, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (76, 76, 22, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (77, 77, 22, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (78, 78, 22, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (79, 79, 45, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (80, 80, 45, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (81, 81, 45, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (82, 82, 20, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (83, 83, 17, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (84, 84, 17, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (85, 85, 17, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (86, 86, 12, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (87, 87, 12, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (88, 88, 12, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (89, 89, 12, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (90, 90, 12, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (91, 91, 13, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (92, 92, 13, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (93, 93, 13, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (94, 94, 13, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (95, 95, 13, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (96, 96, 14, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (97, 97, 14, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (98, 98, 14, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (99, 99, 14, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (100, 100, 14, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (101, 101, 15, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (102, 102, 15, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (103, 103, 15, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (104, 104, 15, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (105, 105, 15, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (106, 106, 16, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (107, 107, 16, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (108, 108, 16, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (109, 109, 16, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (110, 110, 16, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (111, 111, 23, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (112, 112, 45, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (113, 113, 23, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (114, 114, 23, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (115, 115, 29, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (116, 116, 30, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (117, 117, 30, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (118, 118, 30, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (119, 119, 30, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (120, 120, 30, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (121, 121, 31, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (122, 122, 31, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (123, 123, 31, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (124, 124, 31, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (125, 125, 31, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (126, 126, 29, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (127, 127, 32, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (128, 128, 32, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (129, 129, 32, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (130, 130, 32, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (131, 131, 33, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (132, 132, 33, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (133, 133, 33, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (134, 134, 33, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (135, 135, 33, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (136, 136, 34, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (137, 137, 34, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (138, 138, 34, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (139, 139, 32, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (140, 140, 34, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (141, 141, 29, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (142, 142, 29, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (143, 143, 1, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (144, 144, 1, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (145, 145, 1, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (146, 146, 1, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (147, 147, 25, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (148, 148, 25, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (149, 149, 25, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (150, 150, 25, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (151, 151, 25, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (152, 152, 26, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (153, 153, 26, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (154, 154, 29, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (155, 155, 26, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (156, 156, 26, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (157, 157, 27, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (158, 158, 27, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (159, 159, 27, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (160, 160, 27, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (161, 161, 27, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (162, 162, 28, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (163, 163, 28, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (164, 164, 28, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (165, 165, 28, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (166, 166, 28, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (167, 167, 26, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (168, 168, 34, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (169, 169, 35, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (170, 170, 35, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (171, 171, 41, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (172, 172, 41, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (173, 173, 41, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (174, 174, 41, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (175, 175, 42, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (176, 176, 42, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (177, 177, 42, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (178, 178, 42, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (179, 179, 42, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (180, 180, 43, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (181, 181, 43, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (182, 182, 41, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (183, 183, 43, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (184, 184, 43, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (185, 185, 24, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (186, 186, 24, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (187, 187, 24, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (188, 188, 24, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (189, 189, 24, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (190, 190, 44, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (191, 191, 44, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (192, 192, 44, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (193, 193, 44, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (194, 194, 44, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (195, 195, 43, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (196, 196, 40, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (197, 197, 40, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (198, 198, 40, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (199, 199, 35, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (200, 200, 35, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (201, 201, 35, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (202, 202, 36, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (203, 203, 36, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (204, 204, 36, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (205, 205, 36, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (206, 206, 36, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (207, 207, 37, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (208, 208, 37, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (209, 209, 37, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (210, 210, 37, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (211, 211, 37, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (212, 212, 38, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (213, 213, 38, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (214, 214, 38, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (215, 215, 38, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (216, 216, 38, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (217, 217, 39, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (218, 218, 39, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (219, 219, 39, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (220, 220, 39, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (221, 221, 39, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (222, 222, 40, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (223, 223, 40, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (224, 224, 23, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
INSERT [dbo].[ChampionAbilities] ([Id], [AbilityId], [ChampionId], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (225, 225, 45, CAST(N'2020-08-28T18:17:33.943' AS DateTime), CAST(N'2020-08-28T18:17:33.943' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[ChampionAbilities] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 13079, N'[Weapon] Your weapon shots deal {20}% increased Damage to Deployables, Pets, and Illusions.', N'[Weapon] Your weapon shots deal {20}% increased Damage to Deployables, Pets, and Illusions.', N'Bulldozer', 0, N'https://web2.hirez.com/paladins/champion-items/bulldozer.jpg', 150, N'Burn Card Damage Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 16050, N'[Armor] Reduce the damage you take by {scale=4|4}% while at or below 40% Health.', N'[Armor] Reduce the damage you take by {scale=4|4}% while at or below 40% Health.', N'Persistence', 2338, N'https://web2.hirez.com/paladins/champion-cards/persistence.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 12755, N'[Ghost Walk] Heal for {scale=100|100} over the duration of Ghost Walk.', N'[Ghost Walk] Heal for {scale=100|100} over the duration of Ghost Walk.', N'Phantom', 2093, N'https://web2.hirez.com/paladins/champion-cards/phantom.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 24481, N'[Setback] Reduce the Cooldown of Stasis Field by {scale=1|1}s after hitting an enemy with Setback.', N'[Setback] Reduce the Cooldown of Stasis Field by {scale=1|1}s after hitting an enemy with Setback.', N'Phantom Pain', 2512, N'https://web2.hirez.com/paladins/champion-cards/phantom-pain.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 17030, N'[Seedling] Increase the Projectile Speed of Seedling by {scale=6|6}%.', N'[Seedling] Increase the Projectile Speed of Seedling by {scale=6|6}%.', N'Photosynthesis', 2393, N'https://web2.hirez.com/paladins/champion-cards/photosynthesis.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 24018, N'[Frostfire Glide] Increase the duration of FrostFire Glide by {scale=0.5|0.5}s.', N'[Frostfire Glide] Increase the duration of FrostFire Glide by {scale=0.5|0.5}s.', N'Pilgrimage', 2509, N'https://web2.hirez.com/paladins/champion-cards/pilgrimage.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 23767, N'[Shortcut] Heal for {scale=100|100} after exiting a Shortcut.', N'[Shortcut] Heal for {scale=100|100} after exiting a Shortcut.', N'Plank Walker', 2495, N'https://web2.hirez.com/paladins/champion-cards/plank-walker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 20294, N'[Deflector Shield] Heal for {scale=20|20} every 1s while Deflector Shield is active.', N'[Deflector Shield] Heal for {scale=20|20} every 1s while Deflector Shield is active.', N'Plans Within Plans', 2480, N'https://web2.hirez.com/paladins/champion-cards/plans-within-plans.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 22872, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Platemail', 2479, N'https://web2.hirez.com/paladins/champion-cards/platemail.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 19976, N'[Power Siphon] Heal for {scale=3|3}% of the damage Absorbed by Power Siphon.', N'[Power Siphon] Heal for {scale=3|3}% of the damage Absorbed by Power Siphon.', N'Playing God', 2477, N'https://web2.hirez.com/paladins/champion-cards/playing-god.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 15659, N'[Armor] Reduce the Movement Speed penalty while drawing your Longbow by {scale=20|20}%.', N'[Armor] Reduce the Movement Speed penalty while drawing your Longbow by {scale=20|20}%.', N'Poise', 2307, N'https://web2.hirez.com/paladins/champion-cards/poise.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 15375, N'[Mending Spirits] Reduce your damage taken by {scale=4|4}% while Healing an ally with Mending Spirits.', N'[Mending Spirits] Reduce your damage taken by {scale=4|4}% while Healing an ally with Mending Spirits.', N'Possession', 2303, N'https://web2.hirez.com/paladins/champion-cards/possession.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 25178, N'[Crouching Tigron] Increase the jump strength of Crouching Tigron by {scale=8|8}%.', N'[Crouching Tigron] Increase the jump strength of Crouching Tigron by {scale=8|8}%.', N'Pouncing Tigron', 2529, N'https://web2.hirez.com/paladins/champion-cards/pouncing-tigron.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 15060, N'[Iron Sights] Gain {scale=5|5}% Lifesteal while using Iron Sights.', N'[Iron Sights] Gain {scale=5|5}% Lifesteal while using Iron Sights.', N'Predator', 2285, N'https://web2.hirez.com/paladins/champion-cards/predator.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 25174, N'[Combat Trance] Gain a {scale=60|60}-Health Shield for 4s after activating Combat Trance.', N'[Combat Trance] Gain a {scale=60|60}-Health Shield for 4s after activating Combat Trance.', N'Primal Haste', 2529, N'https://web2.hirez.com/paladins/champion-cards/primal-haste.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 19595, N'[Overcharge] Gain {scale=5|5}% Lifesteal while Overcharge is active.', N'[Overcharge] Gain {scale=5|5}% Lifesteal while Overcharge is active.', N'Primeval Might', 2472, N'https://web2.hirez.com/paladins/champion-cards/primeval-might.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 25378, N'[Abyssal Reconstruction] Healing an ally with Abyssal Reconstruction reduces the Cooldown of Projection by {scale=0.5|0.5}s. This effect can only occur once every 5s.', N'[Abyssal Reconstruction] Healing an ally with Abyssal Reconstruction reduces the Cooldown of Projection by {scale=0.5|0.5}s. This effect can only occur once every 5s.', N'Priority Targets', 2533, N'https://web2.hirez.com/paladins/champion-cards/priority-targets.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 13164, N'[Sniper Mode] Increase your Movement Speed while in Sniper Mode by {scale=25|25}%.', N'[Sniper Mode] Increase your Movement Speed while in Sniper Mode by {scale=25|25}%.', N'Prodigy', 2249, N'https://web2.hirez.com/paladins/champion-cards/prodigy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 14096, N'[Thrust] Increase the forward distance of Thrust by {scale=25|25}%.', N'[Thrust] Increase the forward distance of Thrust by {scale=25|25}%.', N'Propel', 2277, N'https://web2.hirez.com/paladins/champion-cards/propel.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 24561, N'[Guardian Spirit] Regenerate {scale=2|2}% Moonlight every 1s while within 30 units of Luna.', N'[Guardian Spirit] Regenerate {scale=2|2}% Moonlight every 1s while within 30 units of Luna.', N'Protectors', 2517, N'https://web2.hirez.com/paladins/champion-cards/protectors.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 11461, N'[Advance] Reduce your damage taken by {scale=3|3}% for 3s after activating Advance.', N'[Advance] Reduce your damage taken by {scale=3|3}% for 3s after activating Advance.', N'Proximity', 2149, N'https://web2.hirez.com/paladins/champion-cards/proximity.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 13400, N'[Shatter] Increase the Movement Speed of Illusions by {scale=8|8}% during Shatter.', N'[Shatter] Increase the Movement Speed of Illusions by {scale=8|8}% during Shatter.', N'Pursuit', 2267, N'https://web2.hirez.com/paladins/champion-cards/pursuit.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 13396, N'[Weapon] Increase your maximum Ammo by {scale=15|15}.', N'[Weapon] Increase your maximum Ammo by {scale=15|15}.', N'Pyre', 2071, N'https://web2.hirez.com/paladins/champion-cards/pyre.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 23340, N'[Wings of Wrath] Reduce the Cooldown of Wings of Wrath by {scale=0.6|0.6}s.', N'[Wings of Wrath] Reduce the Cooldown of Wings of Wrath by {scale=0.6|0.6}s.', N'Pyre Walker', 2491, N'https://web2.hirez.com/paladins/champion-cards/pyre-walker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 24014, N'[Frost Bomb] Increase the Projectile Speed of Frost Bomb by {scale=6|6}%.', N'[Frost Bomb] Increase the Projectile Speed of Frost Bomb by {scale=6|6}%.', N'Permafrost', 2509, N'https://web2.hirez.com/paladins/champion-cards/permafrost.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 23336, N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'Pyretic Dynamo', 2491, N'https://web2.hirez.com/paladins/champion-cards/pyretic-dynamo.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 18354, N'[Kinetic Burst] Increase the Knockback distance of Kinetic Burst by {scale=8|8}%.', N'[Kinetic Burst] Increase the Knockback distance of Kinetic Burst by {scale=8|8}%.', N'Percussion', 2404, N'https://web2.hirez.com/paladins/champion-cards/percussion.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (28, 24470, N'[Second Chance] Reduce the Cooldown of Second Chance by {scale=0.5|0.5}s.', N'[Second Chance] Reduce the Cooldown of Second Chance by {scale=0.5|0.5}s.', N'Paradox', 2512, N'https://web2.hirez.com/paladins/champion-cards/paradox.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (29, 13093, N'[Heroic Leap] Reduce your damage taken by {scale=5|5}% for 4s after using Heroic Leap.', N'[Heroic Leap] Reduce your damage taken by {scale=5|5}% for 4s after using Heroic Leap.', N'Momentum', 2147, N'https://web2.hirez.com/paladins/champion-cards/momentum.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (30, 12680, N'[Healing Totem] Increase the Health of Healing Totem by {scale=150|150}.', N'[Healing Totem] Increase the Health of Healing Totem by {scale=150|150}.', N'Monolith Totem', 2093, N'https://web2.hirez.com/paladins/champion-cards/monolith-totem.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (31, 24554, N'[Weapon] Generate {scale=2|2}% Moonlight for each enemy hit with Light Bow.', N'[Weapon] Generate {scale=2|2}% Moonlight for each enemy hit with Light Bow.', N'Moonlight Garden', 2517, N'https://web2.hirez.com/paladins/champion-cards/moonlight-garden.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (32, 24550, N'[Armor] Increase your maximum Moonlight capacity by {scale=8|8}%.', N'[Armor] Increase your maximum Moonlight capacity by {scale=8|8}%.', N'Moonwalk', 2517, N'https://web2.hirez.com/paladins/champion-cards/moonwalk.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (33, 22113, N'[Familiar Spit] Increase your Movement Speed by {scale=5|5}% for 4s after applying a Magic Mark to an unmarked enemy. This effect can occur once every 4s.', N'[Familiar Spit] Increase your Movement Speed by {scale=5|5}% for 4s after applying a Magic Mark to an unmarked enemy. This effect can occur once every 4s.', N'Morning Breath', 2481, N'https://web2.hirez.com/paladins/champion-cards/morning-breath.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (34, 23752, N'[Harpoon] Heal for {scale=80|80} for each enemy hit with Harpoon.', N'[Harpoon] Heal for {scale=80|80} for each enemy hit with Harpoon.', N'Mortal Skewer', 2495, N'https://web2.hirez.com/paladins/champion-cards/mortal-skewer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (35, 24121, N'[Frostfire Glide] Regenerate {scale=5|5}% Mana every 1s while using FrostFire Glide.', N'[Frostfire Glide] Regenerate {scale=5|5}% Mana every 1s while using FrostFire Glide.', N'Mystic Fire', 2509, N'https://web2.hirez.com/paladins/champion-cards/mystic-fire.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (36, 15927, N'[Fire Bomb] Activating Fire Bomb heals you for {scale=100|100} over 2s.', N'[Fire Bomb] Activating Fire Bomb heals you for {scale=100|100} over 2s.', N'Napalm', 2314, N'https://web2.hirez.com/paladins/champion-cards/napalm.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (37, 12956, N'[Vine] Increase your Movement Speed by {scale=8|8}% for 2s after using Vine.', N'[Vine] Increase your Movement Speed by {scale=8|8}% for 2s after using Vine.', N'Nature''s Quickness', 2254, N'https://web2.hirez.com/paladins/champion-cards/natures-quickness.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (38, 22885, N'[Battle Shout] Reduce the Cooldown of Battle Shout by {scale=0.6|0.6}s.', N'[Battle Shout] Reduce the Cooldown of Battle Shout by {scale=0.6|0.6}s.', N'Never Surrender!', 2479, N'https://web2.hirez.com/paladins/champion-cards/never-surrender.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (39, 25382, N'[Mark of Fate] Grant a {scale=50|50}-Health Shield to an ally for 2s when you Mark them.', N'[Mark of Fate] Grant a {scale=50|50}-Health Shield to an ally for 2s when you Mark them.', N'New Resolve', 2533, N'https://web2.hirez.com/paladins/champion-cards/new-resolve.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (40, 13374, N'[Hidden] Increase your Movement Speed by {scale=5|5}% while Hidden is active.', N'[Hidden] Increase your Movement Speed by {scale=5|5}% while Hidden is active.', N'Ninja', 2057, N'https://web2.hirez.com/paladins/champion-cards/ninja.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (41, 13356, N'[Weapon] Increase your Movement Speed by {scale=5|5}% for 5s after getting a Killing Blow or Elimination.', N'[Weapon] Increase your Movement Speed by {scale=5|5}% for 5s after getting a Killing Blow or Elimination.', N'No Escape', 2147, N'https://web2.hirez.com/paladins/champion-cards/no-escape.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (42, 24478, N'[Setback] Enemies hit by Setback are Rewound {scale=0.3|0.3}s further into the past.', N'[Setback] Enemies hit by Setback are Rewound {scale=0.3|0.3}s further into the past.', N'No One Escapes', 2512, N'https://web2.hirez.com/paladins/champion-cards/no-one-escapes.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (43, 18749, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Noble Crest', 2417, N'https://web2.hirez.com/paladins/champion-cards/noble-crest.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (44, 20271, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Numbed Heart', 2480, N'https://web2.hirez.com/paladins/champion-cards/numbed-heart.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (45, 15720, N'[Withdraw] Heal for {scale=80|80} after using Withdraw.', N'[Withdraw] Heal for {scale=80|80} after using Withdraw.', N'Oasis', 2307, N'https://web2.hirez.com/paladins/champion-cards/oasis.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (46, 13246, N'[Oppressor Mine] Increase the number of targets affected by Oppressor Mines by {scale=1|1}.', N'[Oppressor Mine] Increase the number of targets affected by Oppressor Mines by {scale=1|1}.', N'Octoppressor', 2249, N'https://web2.hirez.com/paladins/champion-cards/octoppressor.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (47, 24307, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Old Wounds', 2512, N'https://web2.hirez.com/paladins/champion-cards/old-wounds.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (48, 25377, N'[Abyssal Reconstruction] Generate {scale=2|2} Ammo after Healing an ally with Abyssal Reconstruction.', N'[Abyssal Reconstruction] Generate {scale=2|2} Ammo after Healing an ally with Abyssal Reconstruction.', N'Ominous Relic', 2533, N'https://web2.hirez.com/paladins/champion-cards/ominous-relic.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (49, 14971, N'[Missile Launcher] Heal for {scale=100|100} after using Missile Launcher.', N'[Missile Launcher] Heal for {scale=100|100} after using Missile Launcher.', N'Opulence', 2149, N'https://web2.hirez.com/paladins/champion-cards/opulence.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (50, 15352, N'[Slither] Gain a {scale=75|75}-health Shield for 3s after Slither ends.', N'[Slither] Gain a {scale=75|75}-health Shield for 3s after Slither ends.', N'Otherworldly', 2303, N'https://web2.hirez.com/paladins/champion-cards/otherworldly.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (51, 12655, N'[Healing Totem] Increase the deploy range of Healing Totem by {scale=15|15}%.', N'[Healing Totem] Increase the deploy range of Healing Totem by {scale=15|15}%.', N'Outreach', 2093, N'https://web2.hirez.com/paladins/champion-cards/outreach.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (52, 13134, N'[Healing Potion] Allies hit by Healing Potion have their Movement Speed increased by {scale=6|6}% for 3s.', N'[Healing Potion] Allies hit by Healing Potion have their Movement Speed increased by {scale=6|6}% for 3s.', N'Pep in the Step', 2056, N'https://web2.hirez.com/paladins/champion-cards/pep-in-the-step.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (53, 24019, N'[Frostfire Glide] FrostFire Glide travels {scale=5|5}% faster.', N'[Frostfire Glide] FrostFire Glide travels {scale=5|5}% faster.', N'Pyretic Momentum', 2509, N'https://web2.hirez.com/paladins/champion-cards/pyretic-momentum.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (54, 11928, N'[Weapon] Increase your Ammo count by {scale=1|1}.', N'[Weapon] Increase your Ammo count by {scale=1|1}.', N'Quick Draw', 2205, N'https://web2.hirez.com/paladins/champion-cards/quick-draw.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (55, 14955, N'[Weapon] Increase your Reload Speed by {scale=10|10}%.', N'[Weapon] Increase your Reload Speed by {scale=10|10}%.', N'Quick Loader', 2149, N'https://web2.hirez.com/paladins/champion-cards/quick-loader.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (56, 20269, N'[Weapon] Gain {scale=4|4}% Lifesteal.', N'[Weapon] Gain {scale=4|4}% Lifesteal.', N'Runic Ammunition', 2480, N'https://web2.hirez.com/paladins/champion-cards/runic-ammunition.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (57, 23370, N'[Armor] Decrease the rate of Wrath decay by {scale=10|10}%.', N'[Armor] Decrease the rate of Wrath decay by {scale=10|10}%.', N'Ruthless', 2491, N'https://web2.hirez.com/paladins/champion-cards/ruthless.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (58, 24509, N'[Armor] Increase your Healing received by {scale=6|6}% while Stasis Field is active.', N'[Armor] Increase your Healing received by {scale=6|6}% while Stasis Field is active.', N'Safe Haven', 2512, N'https://web2.hirez.com/paladins/champion-cards/safe-haven.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (59, 15894, N'[Fire Bomb] Reduce the damage you deal to yourself with Fire Bomb by {scale=20|20}%.', N'[Fire Bomb] Reduce the damage you deal to yourself with Fire Bomb by {scale=20|20}%.', N'Salamander Hide', 2314, N'https://web2.hirez.com/paladins/champion-cards/salamander-hide.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (60, 24555, N'[Moonlight] Regenerate {scale=1|1}% Moonlight every 1s while not using Moonlight.', N'[Moonlight] Regenerate {scale=1|1}% Moonlight every 1s while not using Moonlight.', N'Sanctum of Faith', 2517, N'https://web2.hirez.com/paladins/champion-cards/sanctum-of-faith.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (61, 16064, N'[Pounce] Increase your Movement Speed by {scale=10|10}% for 3s after using Pounce.', N'[Pounce] Increase your Movement Speed by {scale=10|10}% for 3s after using Pounce.', N'Scamper', 2338, N'https://web2.hirez.com/paladins/champion-cards/scamper.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (62, 16481, N'[Nine Lives] Reduce your damage taken by {scale=6|6}% for 2s after using Nine Lives.', N'[Nine Lives] Reduce your damage taken by {scale=6|6}% for 2s after using Nine Lives.', N'Scar Tissue', 2338, N'https://web2.hirez.com/paladins/champion-cards/scar-tissue.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (63, 22103, N'[Scamper] Reduce the Cooldown of Scamper by {scale=0.4|0.4}s.', N'[Scamper] Reduce the Cooldown of Scamper by {scale=0.4|0.4}s.', N'Scoot', 2481, N'https://web2.hirez.com/paladins/champion-cards/scoot.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (64, 23744, N'[Armor] Increase the Healing you receive by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase the Healing you receive by {scale=5|5}% while at or below 50% Health.', N'Sea Dogs', 2495, N'https://web2.hirez.com/paladins/champion-cards/sea-dogs.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (65, 14719, N'[Dredge Anchor] Heal for {scale=100|100} after hitting an enemy with Dredge Anchor.', N'[Dredge Anchor] Heal for {scale=100|100} after hitting an enemy with Dredge Anchor.', N'Sea Legs', 2288, N'https://web2.hirez.com/paladins/champion-cards/sea-legs.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (66, 14454, N'[Hustle] Increase your Movement Speed during Hustle by {scale=10|10}% for 1.5s after activating it.', N'[Hustle] Increase your Movement Speed during Hustle by {scale=10|10}% for 1.5s after activating it.', N'Second Wind', 2285, N'https://web2.hirez.com/paladins/champion-cards/second-wind.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (67, 11438, N'[Heroic Leap] Reduce the Cooldown of Heroic Leap by {scale=0.5|0.5}s.', N'[Heroic Leap] Reduce the Cooldown of Heroic Leap by {scale=0.5|0.5}s.', N'Seismic Wave', 2147, N'https://web2.hirez.com/paladins/champion-cards/seismic-wave.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (68, 25380, N'[Mark of Fate] Mark of Fate now provides to its target an additional {scale=2|2}% of the Healing done to other allies with Abyssal Reconstruction.', N'[Mark of Fate] Mark of Fate now provides to its target an additional {scale=2|2}% of the Healing done to other allies with Abyssal Reconstruction.', N'Shadow Tribunal', 2533, N'https://web2.hirez.com/paladins/champion-cards/shadow-tribunal.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (69, 25003, N'[Soul Harvest] Each Soul Fragment gathered Heals you for {scale=20|20}.', N'[Soul Harvest] Each Soul Fragment gathered Heals you for {scale=20|20}.', N'Shattered Essence', 2528, N'https://web2.hirez.com/paladins/champion-cards/shattered-essence.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (70, 16648, N'[Earthen Guard] Generate {scale=1|1} Ammo after activating Earthen Guard.', N'[Earthen Guard] Generate {scale=1|1} Ammo after activating Earthen Guard.', N'Shear', 2348, N'https://web2.hirez.com/paladins/champion-cards/shear.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (71, 16818, N'[Dead Zone] Increase your Movement Speed by {scale=5|5}% for 2.5s after activating Dead Zone.', N'[Dead Zone] Increase your Movement Speed by {scale=5|5}% for 2.5s after activating Dead Zone.', N'Shenanigans', 2393, N'https://web2.hirez.com/paladins/champion-cards/shenanigans.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (72, 15703, N'[Withdraw] Reset the Cooldown of Withdraw after dropping to or below {scale=15|15}% Health.', N'[Withdraw] Reset the Cooldown of Withdraw after dropping to or below {scale=15|15}% Health.', N'Shimmer', 2307, N'https://web2.hirez.com/paladins/champion-cards/shimmer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (73, 18777, N'[Valor] Reduce the Cooldown of Presence by {scale=0.4|0.4}s for each enemy hit by Valor.', N'[Valor] Reduce the Cooldown of Presence by {scale=0.4|0.4}s for each enemy hit by Valor.', N'Shining Topaz', 2417, N'https://web2.hirez.com/paladins/champion-cards/shining-topaz.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (74, 14362, N'[Detonate] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow with Detonate.', N'[Detonate] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow with Detonate.', N'Shock and Awe', 2281, N'https://web2.hirez.com/paladins/champion-cards/shock-and-awe.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (75, 13402, N'[Dimensional Link] Increase your Movement Speed by {scale=10|10}% while Dimensional Link is active.', N'[Dimensional Link] Increase your Movement Speed by {scale=10|10}% while Dimensional Link is active.', N'Shuffle', 2267, N'https://web2.hirez.com/paladins/champion-cards/shuffle.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (76, 18363, N'[Kinetic Burst] Reduce the Cooldown of Siege Shield by {scale=1|1}s for each enemy hit with Kinetic Burst.', N'[Kinetic Burst] Reduce the Cooldown of Siege Shield by {scale=1|1}s for each enemy hit with Kinetic Burst.', N'Siege Engine', 2404, N'https://web2.hirez.com/paladins/champion-cards/siege-engine.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (77, 18781, N'[Presence] Increase your Movement Speed by {scale=7|7}% for 3s after using Presence.', N'[Presence] Increase your Movement Speed by {scale=7|7}% for 3s after using Presence.', N'Signet Ring', 2417, N'https://web2.hirez.com/paladins/champion-cards/signet-ring.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (78, 24988, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Sinister Allies', 2528, N'https://web2.hirez.com/paladins/champion-cards/sinister-allies.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (79, 16209, N'[Nullify] Regenerate {scale=2|2} Ammo every 1s while using Nullify.', N'[Nullify] Regenerate {scale=2|2} Ammo every 1s while using Nullify.', N'Rune Torrent', 2322, N'https://web2.hirez.com/paladins/champion-cards/rune-torrent.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (80, 15063, N'[Hustle] Regenerate {scale=2|2} Ammo every 1s while using Hustle.', N'[Hustle] Regenerate {scale=2|2} Ammo every 1s while using Hustle.', N'Run and Gun', 2285, N'https://web2.hirez.com/paladins/champion-cards/run-and-gun.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (81, 18785, N'[Presence] Each enemy hit by Presence reduces Valor’s Cooldown by {scale=0.6|0.6}s.', N'[Presence] Each enemy hit by Presence reduces Valor’s Cooldown by {scale=0.6|0.6}s.', N'Royal Seal', 2417, N'https://web2.hirez.com/paladins/champion-cards/royal-seal.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (82, 14706, N'[Detonate] Increase your Reload Speed by {scale=6|6}% for 3s after using Detonate.', N'[Detonate] Increase your Reload Speed by {scale=6|6}% for 3s after using Detonate.', N'Royal Decree', 2281, N'https://web2.hirez.com/paladins/champion-cards/royal-decree.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (83, 13155, N'[Sniper Mode] Reduce scope-in and scope-out time by {scale=20|20}%.', N'[Sniper Mode] Reduce scope-in and scope-out time by {scale=20|20}%.', N'Quick Scope', 2249, N'https://web2.hirez.com/paladins/champion-cards/quick-scope.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (84, 11335, N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'Quiver', 2092, N'https://web2.hirez.com/paladins/champion-cards/quiver.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (85, 14073, N'[Thrust] Consume {scale=10|10}% less Booster fuel for 5s after using Thrust.', N'[Thrust] Consume {scale=10|10}% less Booster fuel for 5s after using Thrust.', N'Rain of Fire', 2277, N'https://web2.hirez.com/paladins/champion-cards/rain-of-fire.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (86, 24311, N'[Armor] Generate {scale=2|2}% Ultimate charge after getting an Elimination.', N'[Armor] Generate {scale=2|2}% Ultimate charge after getting an Elimination.', N'Ravages of Time', 2512, N'https://web2.hirez.com/paladins/champion-cards/ravages-of-time.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (87, 23472, N'[Agility] Increase the Movement Speed boost of Agility by {scale=4|4}%.', N'[Agility] Increase the Movement Speed boost of Agility by {scale=4|4}%.', N'Raw Talent', 2493, N'https://web2.hirez.com/paladins/champion-cards/raw-talent.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (88, 13037, N'[Disengage] Increase the Knockback applied to enemies by Disengage by {scale=8|8}%.', N'[Disengage] Increase the Knockback applied to enemies by Disengage by {scale=8|8}%.', N'Raze', 2092, N'https://web2.hirez.com/paladins/champion-cards/raze.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (89, 11561, N'[Armor] Increase your Healing received by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase your Healing received by {scale=5|5}% while at or below 50% Health.', N'Rebound', 2254, N'https://web2.hirez.com/paladins/champion-cards/rebound.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (90, 23748, N'[Broadside] Heal for {scale=50|50} for each enemy hit by Broadside.', N'[Broadside] Heal for {scale=50|50} for each enemy hit by Broadside.', N'Reckless Barrage', 2495, N'https://web2.hirez.com/paladins/champion-cards/reckless-barrage.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (91, 19591, N'[Overcharge] Reduce the Cooldown of Overcharge by {scale=0.5|0.5}s.', N'[Overcharge] Reduce the Cooldown of Overcharge by {scale=0.5|0.5}s.', N'Reclamation', 2472, N'https://web2.hirez.com/paladins/champion-cards/reclamation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (92, 13162, N'[Transporter] Activating Transporter generates {scale=4|4} Ammo.', N'[Transporter] Activating Transporter generates {scale=4|4} Ammo.', N'Reconfigure', 2249, N'https://web2.hirez.com/paladins/champion-cards/reconfigure.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (93, 12890, N'[Recovery] Reduce the Cooldown of Recovery by {scale=1|1}s.', N'[Recovery] Reduce the Cooldown of Recovery by {scale=1|1}s.', N'Reconstruction', 2147, N'https://web2.hirez.com/paladins/champion-cards/reconstruction.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (94, 13387, N'[Illusion] Generate {scale=1|1} Ammo after activating Illusion.', N'[Illusion] Generate {scale=1|1} Ammo after activating Illusion.', N'Mesmerism', 2267, N'https://web2.hirez.com/paladins/champion-cards/mesmerism.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (95, 12696, N'[Emitter] Generate {scale=5|5} Ammo every 1s while Emitter is active.', N'[Emitter] Generate {scale=5|5} Ammo every 1s while Emitter is active.', N'Regenerative Alloy', 2149, N'https://web2.hirez.com/paladins/champion-cards/regenerative-alloy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (96, 16724, N'[Combat Slide] Generate {scale=2|2} Ammo after activating Combat Slide.', N'[Combat Slide] Generate {scale=2|2} Ammo after activating Combat Slide.', N'Requip', 2362, N'https://web2.hirez.com/paladins/champion-cards/requip.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (97, 19474, N'[Quick Switch] While you have your Talon Rifle equipped, the Cooldown of Flare is reduced by {scale=0.2|0.2}s every 1s.', N'[Quick Switch] While you have your Talon Rifle equipped, the Cooldown of Flare is reduced by {scale=0.2|0.2}s every 1s.', N'Resourceful', 2438, N'https://web2.hirez.com/paladins/champion-cards/resourceful.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (98, 24556, N'[Moonlight] Heal for {scale=10|10} every time you Heal an ally with Moonlight.', N'[Moonlight] Heal for {scale=10|10} every time you Heal an ally with Moonlight.', N'Restored Faith', 2517, N'https://web2.hirez.com/paladins/champion-cards/restored-faith.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (99, 18769, N'[Valor] Heal for {scale=60|60} for each enemy hit with Valor.', N'[Valor] Heal for {scale=60|60} for each enemy hit with Valor.', N'Revitalizing Gem', 2417, N'https://web2.hirez.com/paladins/champion-cards/revitalizing-gem.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (100, 24480, N'[Stasis Field] Generate {scale=1|1} Ammo after using Second Chance.', N'[Stasis Field] Generate {scale=1|1} Ammo after using Second Chance.', N'Rewritten History', 2512, N'https://web2.hirez.com/paladins/champion-cards/rewritten-history.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (101, 12852, N'[Blink] Increase your Movement Speed by {scale=8|8}% for 2s after using Blink.', N'[Blink] Increase your Movement Speed by {scale=8|8}% for 2s after using Blink.', N'Riftwalk', 2094, N'https://web2.hirez.com/paladins/champion-cards/riftwalk.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (102, 23341, N'[Wings of Wrath] Increase the travel distance of Wings of Wrath by {scale=10|10}%.', N'[Wings of Wrath] Increase the travel distance of Wings of Wrath by {scale=10|10}%.', N'Righteous Path', 2491, N'https://web2.hirez.com/paladins/champion-cards/righteous-path.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (103, 25179, N'[Crouching Tigron] Gain a {scale=75|75}-Health Shield for 3s after activating Crouching Tigron.', N'[Crouching Tigron] Gain a {scale=75|75}-Health Shield for 3s after activating Crouching Tigron.', N'Rising Stardom', 2529, N'https://web2.hirez.com/paladins/champion-cards/rising-stardom.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (104, 15353, N'[Mending Spirits] Heal for {scale=15|15} every 1s while Healing an ally with Mending Spirits.', N'[Mending Spirits] Heal for {scale=15|15} every 1s while Healing an ally with Mending Spirits.', N'Ritual Magic', 2303, N'https://web2.hirez.com/paladins/champion-cards/ritual-magic.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (105, 16662, N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'Rolling Stones', 2348, N'https://web2.hirez.com/paladins/champion-cards/rolling-stones.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (106, 19472, N'[Scope] Hits with Talon Rifle generate {scale=1|1}% Ultimate charge.', N'[Scope] Hits with Talon Rifle generate {scale=1|1}% Ultimate charge.', N'Roost', 2438, N'https://web2.hirez.com/paladins/champion-cards/roost.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (107, 14720, N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'Reinforced Casing', 2281, N'https://web2.hirez.com/paladins/champion-cards/reinforced-casing.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (108, 16461, N'[Pounce] Reduce your damage taken by {scale=4|4}% for 2s after using Pounce.', N'[Pounce] Reduce your damage taken by {scale=4|4}% for 2s after using Pounce.', N'Sixth Sense', 2338, N'https://web2.hirez.com/paladins/champion-cards/sixth-sense.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (109, 23466, N'[Weapon] Increase your maximum Ammo by {scale=5|5}.', N'[Weapon] Increase your maximum Ammo by {scale=5|5}.', N'Memento', 2493, N'https://web2.hirez.com/paladins/champion-cards/memento.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (110, 13377, N'[Healing Potion] Increase the radius of Healing Potion by {scale=8|8}%.', N'[Healing Potion] Increase the radius of Healing Potion by {scale=8|8}%.', N'Medicinal Excellence', 2056, N'https://web2.hirez.com/paladins/champion-cards/medicinal-excellence.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (111, 11809, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Headstrong', 2249, N'https://web2.hirez.com/paladins/champion-cards/headstrong.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (112, 13055, N'[Smoke Screen] Heal for {scale=125|125} over 2s while in Smoke Screen.', N'[Smoke Screen] Heal for {scale=125|125} over 2s while in Smoke Screen.', N'Healing Vapors', 2057, N'https://web2.hirez.com/paladins/champion-cards/healing-vapors.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (113, 16167, N'[Protection] Generate {scale=75|75} Shield after using Protection.', N'[Protection] Generate {scale=75|75} Shield after using Protection.', N'Hearthwarder', 2322, N'https://web2.hirez.com/paladins/champion-cards/hearthwarder.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (114, 24012, N'[Pyre Ball] Dealing damage with Pyre Ball reduces the Cooldown of Frost Bomb by {scale=0.8|0.8}s.', N'[Pyre Ball] Dealing damage with Pyre Ball reduces the Cooldown of Frost Bomb by {scale=0.8|0.8}s.', N'Heat Sink', 2509, N'https://web2.hirez.com/paladins/champion-cards/heat-sink.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (115, 23750, N'[Broadside] Reduce the Cooldown of Harpoon by {scale=0.2|0.2}s for each enemy hit by Broadside.', N'[Broadside] Reduce the Cooldown of Harpoon by {scale=0.2|0.2}s for each enemy hit by Broadside.', N'Heave Away', 2495, N'https://web2.hirez.com/paladins/champion-cards/heave-away.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (116, 14252, N'[Vine] Gain a {scale=100|100} Shield for 3s after using Vine.', N'[Vine] Gain a {scale=100|100} Shield for 3s after using Vine.', N'Heavenly Agility', 2254, N'https://web2.hirez.com/paladins/champion-cards/heavenly-agility.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (117, 19177, N'[Void Grip] Increase the range at which you can use Void Grip by {scale=10|10}%.', N'[Void Grip] Increase the range at which you can use Void Grip by {scale=10|10}%.', N'Heavenly Pull', 2431, N'https://web2.hirez.com/paladins/champion-cards/heavenly-pull.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (118, 18797, N'[Grace] Increase travel speed during Grace by {scale=10|10}%.', N'[Grace] Increase travel speed during Grace by {scale=10|10}%.', N'Heir to the Throne', 2417, N'https://web2.hirez.com/paladins/champion-cards/heir-to-the-throne.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (119, 24499, N'[Weapon] Generate {scale=1|1} Ammo after hitting a fully-charged weapon shot.', N'[Weapon] Generate {scale=1|1} Ammo after hitting a fully-charged weapon shot.', N'Hell Hunter', 2512, N'https://web2.hirez.com/paladins/champion-cards/hell-hunter.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (120, 25009, N'[Ignition] Reduce your damage taken by {scale=3|3}% for 3s after activating Ignition. ', N'[Ignition] Reduce your damage taken by {scale=3|3}% for 3s after activating Ignition. ', N'Hellish Lodestones', 2528, N'https://web2.hirez.com/paladins/champion-cards/hellish-lodestones.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (121, 14444, N'[Armor] Increase your Movement Speed by {scale=5|5}% for 4s after getting an Elimination or Killing Blow.', N'[Armor] Increase your Movement Speed by {scale=5|5}% for 4s after getting an Elimination or Killing Blow.', N'Hit and Run', 2285, N'https://web2.hirez.com/paladins/champion-cards/hit-and-run.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (122, 22884, N'[Battle Shout] Heal for an additional {scale=80|80} after activating Battle Shout.', N'[Battle Shout] Heal for an additional {scale=80|80} after activating Battle Shout.', N'Hold the Line!', 2479, N'https://web2.hirez.com/paladins/champion-cards/hold-the-line.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (123, 25172, N'[Combat Trance] Generate {scale=0.6|0.6}% Ultimate charge every 1s while Combat Trance is active.', N'[Combat Trance] Generate {scale=0.6|0.6}% Ultimate charge every 1s while Combat Trance is active.', N'Honed Senses', 2529, N'https://web2.hirez.com/paladins/champion-cards/honed-senses.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (124, 22877, N'[Bulwark] Increase your Healing received by {scale=6|6}% while your Bulwark is active.', N'[Bulwark] Increase your Healing received by {scale=6|6}% while your Bulwark is active.', N'Hopeguard', 2479, N'https://web2.hirez.com/paladins/champion-cards/hopeguard.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (125, 14426, N'[Frag Grenade] Reduce the cook time of Frag Grenade by {scale=10|10}%.', N'[Frag Grenade] Reduce the cook time of Frag Grenade by {scale=10|10}%.', N'Hot Potato', 2285, N'https://web2.hirez.com/paladins/champion-cards/hot-potato.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (126, 14116, N'[Weapon] Increase your Reload Speed by {scale=10|10}% for 3s after hitting an enemy with your weapon.', N'[Weapon] Increase your Reload Speed by {scale=10|10}% for 3s after hitting an enemy with your weapon.', N'Hot Swap', 2277, N'https://web2.hirez.com/paladins/champion-cards/hot-swap.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (127, 22883, N'[Commander''s Grab] Reduce the Cooldown of Commander''s Grab by {scale=0.6|0.6}s.', N'[Commander''s Grab] Reduce the Cooldown of Commander''s Grab by {scale=0.6|0.6}s.', N'Hulking Strength', 2479, N'https://web2.hirez.com/paladins/champion-cards/hulking-strength.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (128, 23751, N'[Harpoon] Reduce the Cooldown of Harpoon by {scale=1.2|1.2}s.', N'[Harpoon] Reduce the Cooldown of Harpoon by {scale=1.2|1.2}s.', N'Hull Piercer', 2495, N'https://web2.hirez.com/paladins/champion-cards/hull-piercer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (129, 17042, N'[Flutter] Generate {scale=1|1} Ammo after activating Flutter.', N'[Flutter] Generate {scale=1|1} Ammo after activating Flutter.', N'Hummingbird', 2393, N'https://web2.hirez.com/paladins/champion-cards/hummingbird.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (130, 14218, N'[Salvo] Restore {scale=4|4}% of your Booster fuel each time Salvo hits an enemy.', N'[Salvo] Restore {scale=4|4}% of your Booster fuel each time Salvo hits an enemy.', N'Hyper Boost', 2277, N'https://web2.hirez.com/paladins/champion-cards/hyper-boost.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (131, 24047, N'[Frostfire Glide] Heal for {scale=50|50} every 1s while using FrostFire Glide.', N'[Frostfire Glide] Heal for {scale=50|50} every 1s while using FrostFire Glide.', N'Ice in her Veins', 2509, N'https://web2.hirez.com/paladins/champion-cards/ice-in-her-veins.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (132, 23367, N'[Pyre Strike] Reduce the Cooldown of Wings of Wrath by {scale=1|1}s after hitting an enemy with Pyre Strike.', N'[Pyre Strike] Reduce the Cooldown of Wings of Wrath by {scale=1|1}s after hitting an enemy with Pyre Strike.', N'Ignition', 2491, N'https://web2.hirez.com/paladins/champion-cards/ignition.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (133, 25170, N'[Heavy Blade] Reduce the Cooldown of Heavy Blade by {scale=0.6|0.6}s.', N'[Heavy Blade] Reduce the Cooldown of Heavy Blade by {scale=0.6|0.6}s.', N'Imbued with Purpose', 2529, N'https://web2.hirez.com/paladins/champion-cards/imbued-with-purpose.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (134, 23769, N'[Shortcut] Increase your Movement Speed by {scale=10|10}% for 2s after exiting a Shortcut.', N'[Shortcut] Increase your Movement Speed by {scale=10|10}% for 2s after exiting a Shortcut.', N'Haul on the Bowline', 2495, N'https://web2.hirez.com/paladins/champion-cards/haul-on-the-bowline.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (135, 14788, N'[Armor] Increase your Healing received from others by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase your Healing received from others by {scale=5|5}% while at or below 50% Health.', N'Immovable Object', 2071, N'https://web2.hirez.com/paladins/champion-cards/immovable-object.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (136, 23464, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Harsh Training', 2493, N'https://web2.hirez.com/paladins/champion-cards/harsh-training.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (137, 22108, N'[Magic Barrier] Reduce your damage taken by {scale=3|3}% for 2s after Magic Barrier ends.', N'[Magic Barrier] Reduce your damage taken by {scale=3|3}% for 2s after Magic Barrier ends.', N'Harmonious', 2481, N'https://web2.hirez.com/paladins/champion-cards/harmonious.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (138, 12929, N'[Barricade] Increase the duration of Barricade by {scale=0.6|0.6}s.', N'[Barricade] Increase the duration of Barricade by {scale=0.6|0.6}s.', N'Foundation', 2073, N'https://web2.hirez.com/paladins/champion-cards/foundation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (139, 12218, N'[Ice Block] Heal for {scale=50|50} every 1s while Ice Block is active.', N'[Ice Block] Heal for {scale=50|50} every 1s while Ice Block is active.', N'Frigid Field', 2094, N'https://web2.hirez.com/paladins/champion-cards/frigid-field.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (140, 12316, N'[Rocket Boots] Increase the duration of Rocket Boots by {scale=0.3|0.3}s.', N'[Rocket Boots] Increase the duration of Rocket Boots by {scale=0.3|0.3}s.', N'Fuel Efficiency', 2073, N'https://web2.hirez.com/paladins/champion-cards/fuel-efficiency.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (141, 18597, N'[Whirl] Increase your Movement Speed by {scale=5|5}% for 2s after using Whirl.', N'[Whirl] Increase your Movement Speed by {scale=5|5}% for 2s after using Whirl.', N'Fuel for the Fire', 2420, N'https://web2.hirez.com/paladins/champion-cards/fuel-for-the-fire.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (142, 24565, N'[Lunar Leap] Gain a {scale=100|100}-Health Shield for 3s after activating Lunar Leap.', N'[Lunar Leap] Gain a {scale=100|100}-Health Shield for 3s after activating Lunar Leap.', N'Full Moon', 2517, N'https://web2.hirez.com/paladins/champion-cards/full-moon.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (143, 18376, N'[Shoulder Bash] Increase the Knockback distance of Shoulder Bash by {scale=8|8}%.', N'[Shoulder Bash] Increase the Knockback distance of Shoulder Bash by {scale=8|8}%.', N'Furious Charge', 2404, N'https://web2.hirez.com/paladins/champion-cards/furious-charge.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (144, 23515, N'[Skewer] Generate {scale=15|15}% Energy after earning a Killing Blow with Skewer.', N'[Skewer] Generate {scale=15|15}% Energy after earning a Killing Blow with Skewer.', N'Gale Storm', 2493, N'https://web2.hirez.com/paladins/champion-cards/gale-storm.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (145, 13244, N'[Oppressor Mine] Reduce the Cooldown of Oppressor Mine by {scale=1.5|1.5}s.', N'[Oppressor Mine] Reduce the Cooldown of Oppressor Mine by {scale=1.5|1.5}s.', N'Generator', 2249, N'https://web2.hirez.com/paladins/champion-cards/generator.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (146, 12334, N'[Blossom] Increase your allies'' Movement Speed by {scale=5|5}% for 4s after they are Healed by Blossom.', N'[Blossom] Increase your allies'' Movement Speed by {scale=5|5}% for 4s after they are Healed by Blossom.', N'Gentle Breeze', 2254, N'https://web2.hirez.com/paladins/champion-cards/gentle-breeze.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (147, 17026, N'[Seedling] Generate {scale=1|1} Ammo after using Seedling.', N'[Seedling] Generate {scale=1|1} Ammo after using Seedling.', N'Germination', 2393, N'https://web2.hirez.com/paladins/champion-cards/germination.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (148, 22148, N'[Magic Barrier] Increase your Movement Speed by {scale=10|10}% for 2s after being hit while Magic Barrier is active.', N'[Magic Barrier] Increase your Movement Speed by {scale=10|10}% for 2s after being hit while Magic Barrier is active.', N'Glimmer', 2481, N'https://web2.hirez.com/paladins/champion-cards/glimmer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (149, 16116, N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'Glyph of Freedom', 2322, N'https://web2.hirez.com/paladins/champion-cards/glyph-of-freedom.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (150, 16120, N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'Glyph of the Fist', 2322, N'https://web2.hirez.com/paladins/champion-cards/glyph-of-the-fist.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (151, 14166, N'[Net Shot] Increase your Movement Speed by {scale=10|10}% for 3s after using Net Shot.', N'[Net Shot] Increase your Movement Speed by {scale=10|10}% for 3s after using Net Shot.', N'Gotcha', 2147, N'https://web2.hirez.com/paladins/champion-cards/gotcha.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (152, 25381, N'[Mark of Fate] Grants Marked ally {scale=5|5}% Lifesteal and Corvus shares 100% of the Healing done due to the Marked target''s granted Lifesteal.', N'[Mark of Fate] Grants Marked ally {scale=5|5}% Lifesteal and Corvus shares 100% of the Healing done due to the Marked target''s granted Lifesteal.', N'Grand Design', 2533, N'https://web2.hirez.com/paladins/champion-cards/grand-design.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (153, 23539, N'[Skewer] Heal for {scale=160|160} for each enemy hit with Skewer.', N'[Skewer] Heal for {scale=160|160} for each enemy hit with Skewer.', N'Guild Tactics', 2493, N'https://web2.hirez.com/paladins/champion-cards/guild-tactics.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (154, 23745, N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'Gun Deck', 2495, N'https://web2.hirez.com/paladins/champion-cards/gun-deck.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (155, 24563, N'[Lunar Leap] Reduce the Cooldown of Lunar Leap by {scale=0.8|0.8}s.', N'[Lunar Leap] Reduce the Cooldown of Lunar Leap by {scale=0.8|0.8}s.', N'Half Moon', 2517, N'https://web2.hirez.com/paladins/champion-cards/half-moon.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (156, 23369, N'[Pyre Strike] Generate {scale=10|10}% Wrath after hitting an enemy with Pyre Strike.', N'[Pyre Strike] Generate {scale=10|10}% Wrath after hitting an enemy with Pyre Strike.', N'Hallowed Sight', 2491, N'https://web2.hirez.com/paladins/champion-cards/hallowed-sight.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (157, 23746, N'[Armor] Gain a {scale=150|150}-Health Shield after dropping to or below 50% Health.', N'[Armor] Gain a {scale=150|150}-Health Shield after dropping to or below 50% Health.', N'Hangman''s Ire', 2495, N'https://web2.hirez.com/paladins/champion-cards/hangmans-ire.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (158, 25002, N'[Soul Harvest] Reduce the Cooldown of Juggernaut by {scale=1|1}s after activating Soul Harvest.', N'[Soul Harvest] Reduce the Cooldown of Juggernaut by {scale=1|1}s after activating Soul Harvest.', N'Harbinger', 2528, N'https://web2.hirez.com/paladins/champion-cards/harbinger.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (159, 14643, N'[Dredge Anchor] Reduce your damage taken by {scale=5|5}% for 2s after hitting an enemy with Dredge Anchor.', N'[Dredge Anchor] Reduce your damage taken by {scale=5|5}% for 2s after hitting an enemy with Dredge Anchor.', N'Harden', 2288, N'https://web2.hirez.com/paladins/champion-cards/harden.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (160, 16799, N'[In Pursuit] Decrease your damage taken by {scale=6|6}% while using In Pursuit.', N'[In Pursuit] Decrease your damage taken by {scale=6|6}% while using In Pursuit.', N'Hardiness', 2362, N'https://web2.hirez.com/paladins/champion-cards/hardiness.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (161, 15166, N'[Shatter] Heal for {scale=13|13}% of the damage dealt by Shatter.', N'[Shatter] Heal for {scale=13|13}% of the damage dealt by Shatter.', N'Harmony', 2267, N'https://web2.hirez.com/paladins/champion-cards/harmony.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (162, 15997, N'[Nade Launcher] Decrease your damage taken by {scale=4|4}% for 3s after using Nade Launcher.', N'[Nade Launcher] Decrease your damage taken by {scale=4|4}% for 3s after using Nade Launcher.', N'In The Fray', 2314, N'https://web2.hirez.com/paladins/champion-cards/in-the-fray.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (163, 23339, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Incandescent Being', 2491, N'https://web2.hirez.com/paladins/champion-cards/incandescent-being.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (164, 15342, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Incorporeal', 2303, N'https://web2.hirez.com/paladins/champion-cards/incorporeal.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (165, 16181, N'[Protection] Heal the target of your Protection for {scale=75|75}.', N'[Protection] Heal the target of your Protection for {scale=75|75}.', N'Lifegiver', 2322, N'https://web2.hirez.com/paladins/champion-cards/lifegiver.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (166, 23360, N'[Kindle Soul] Hitting Kindle Soul reduces the Cooldown of Pyre Strike by 5s. This effect can happen once every {scale=20|-3}s.', N'[Kindle Soul] Hitting Kindle Soul reduces the Cooldown of Pyre Strike by 5s. This effect can happen once every {scale=20|-3}s.', N'Light Forge', 2491, N'https://web2.hirez.com/paladins/champion-cards/light-forge.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (167, 23372, N'[Kindle Soul] Apply a {scale=35|35}-Health Shield for 2s to allies affected by Kindle Soul.', N'[Kindle Soul] Apply a {scale=35|35}-Health Shield for 2s to allies affected by Kindle Soul.', N'Light of Dawn', 2491, N'https://web2.hirez.com/paladins/champion-cards/light-of-dawn.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (168, 15064, N'[Weapon] Increase your Reload Speed by {scale=7|7}%.', N'[Weapon] Increase your Reload Speed by {scale=7|7}%.', N'Lighter Cannonballs', 2288, N'https://web2.hirez.com/paladins/champion-cards/lighter-cannonballs.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (169, 15348, N'[Gourd] Increase the Projectile Speed of Gourd by {scale=10|10}%.', N'[Gourd] Increase the Projectile Speed of Gourd by {scale=10|10}%.', N'Lighter Gourd', 2303, N'https://web2.hirez.com/paladins/champion-cards/lighter-gourd.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (170, 14213, N'[Shock Pulse] Heal for {scale=30|30} for each enemy hit with Shock Pulse.', N'[Shock Pulse] Heal for {scale=30|30} for each enemy hit with Shock Pulse.', N'Lightning Rod', 2093, N'https://web2.hirez.com/paladins/champion-cards/lightning-rod.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (171, 20283, N'[Precision Sights] Bring up Precision Sights {scale=15|15}% faster.', N'[Precision Sights] Bring up Precision Sights {scale=15|15}% faster.', N'Lightweight Alloy', 2480, N'https://web2.hirez.com/paladins/champion-cards/lightweight-alloy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (172, 19164, N'[Astral Mark] Increase the range of Astral Mark by {scale=4|4}%.', N'[Astral Mark] Increase the range of Astral Mark by {scale=4|4}%.', N'Lightyears', 2431, N'https://web2.hirez.com/paladins/champion-cards/lightyears.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (173, 15349, N'[Slither] Increase the travel distance of Slither by {scale=10|10}%.', N'[Slither] Increase the travel distance of Slither by {scale=10|10}%.', N'Liminal Passage', 2303, N'https://web2.hirez.com/paladins/champion-cards/liminal-passage.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (174, 16638, N'[Earthen Guard] Increase your Reload Speed by {scale=12|12}% while Earthen Guard is active.', N'[Earthen Guard] Increase your Reload Speed by {scale=12|12}% while Earthen Guard is active.', N'Living Stone', 2348, N'https://web2.hirez.com/paladins/champion-cards/living-stone.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (175, 16620, N'[Warder''s Field] Generate {scale=2|2} Ammo after activating Warder''s Field.', N'[Warder''s Field] Generate {scale=2|2} Ammo after activating Warder''s Field.', N'Lodestone', 2348, N'https://web2.hirez.com/paladins/champion-cards/lodestone.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (176, 14792, N'[Fireball] Reduce the Cooldown of Charge by {scale=0.6|0.6}s after hitting an enemy with Fireball.', N'[Fireball] Reduce the Cooldown of Charge by {scale=0.6|0.6}s after hitting an enemy with Fireball.', N'Looks That Kill', 2071, N'https://web2.hirez.com/paladins/champion-cards/looks-that-kill.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (177, 19158, N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'Lorentz Configuration', 2431, N'https://web2.hirez.com/paladins/champion-cards/lorentz-configuration.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (178, 24309, N'[Stasis Field] Heal for {scale=80|80} every 1s for 3s after activating Stasis Field.', N'[Stasis Field] Heal for {scale=80|80} every 1s for 3s after activating Stasis Field.', N'Lost Legacy', 2512, N'https://web2.hirez.com/paladins/champion-cards/lost-legacy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (179, 24562, N'[Guardian Spirit] Reduce the cooldown of Luna''s initial deploy by {scale=1.2|1.2}s.', N'[Guardian Spirit] Reduce the cooldown of Luna''s initial deploy by {scale=1.2|1.2}s.', N'Lunar Connection', 2517, N'https://web2.hirez.com/paladins/champion-cards/lunar-connection.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (180, 14087, N'[Fire Spit] Heal for {scale=50|50} for each enemy Champion hit with Fire Spit.', N'[Fire Spit] Heal for {scale=50|50} for each enemy Champion hit with Fire Spit.', N'Lung Capacity', 2277, N'https://web2.hirez.com/paladins/champion-cards/lung-capacity.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (181, 12765, N'[Dodge Roll] Increase the distance traveled when using Dodge Roll by {scale=10|10}%.', N'[Dodge Roll] Increase the distance traveled when using Dodge Roll by {scale=10|10}%.', N'Lunge', 2092, N'https://web2.hirez.com/paladins/champion-cards/lunge.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (182, 14366, N'[Grumpy Bomb] Increase your Movement Speed by {scale=7|7}% for 2s after using Grumpy Bomb.', N'[Grumpy Bomb] Increase your Movement Speed by {scale=7|7}% for 2s after using Grumpy Bomb.', N'Mad Bomber', 2281, N'https://web2.hirez.com/paladins/champion-cards/mad-bomber.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (183, 25373, N'[Armor] Gain a {scale=130|130}-Health Shield for 3s after dropping to or below 35% Health.', N'[Armor] Gain a {scale=130|130}-Health Shield for 3s after dropping to or below 35% Health.', N'Magistrate''s Might', 2533, N'https://web2.hirez.com/paladins/champion-cards/magistrates-might.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (184, 25168, N'[Heavy Blade] Heal for {scale=40|40} for each enemy hit by Heavy Blade.', N'[Heavy Blade] Heal for {scale=40|40} for each enemy hit by Heavy Blade.', N'Making the Cut', 2529, N'https://web2.hirez.com/paladins/champion-cards/making-the-cut.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (185, 18577, N'[Armor] Increase your Reload Speed by {scale=10|10}%.', N'[Armor] Increase your Reload Speed by {scale=10|10}%.', N'Malice', 2420, N'https://web2.hirez.com/paladins/champion-cards/malice.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (186, 18801, N'[Grace] Increase the travel distance of Grace by {scale=5|5} units.', N'[Grace] Increase the travel distance of Grace by {scale=5|5} units.', N'Manifest Destiny', 2417, N'https://web2.hirez.com/paladins/champion-cards/manifest-destiny.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (187, 13291, N'[Defiance] Generate {scale=1|1} Ammo after hitting an enemy with Defiance.', N'[Defiance] Generate {scale=1|1} Ammo after hitting an enemy with Defiance.', N'Marksman', 2205, N'https://web2.hirez.com/paladins/champion-cards/marksman.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (188, 24489, N'[Second Chance] Heal for an additional {scale=150|150} when using Second Chance.', N'[Second Chance] Heal for an additional {scale=150|150} when using Second Chance.', N'Life Unlived', 2512, N'https://web2.hirez.com/paladins/champion-cards/life-unlived.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (189, 12667, N'[Armor] After 1s of standing still, regenerate {scale=1|1} Ammo every 2s.', N'[Armor] After 1s of standing still, regenerate {scale=1|1} Ammo every 2s.', N'Lie in Wait', 2249, N'https://web2.hirez.com/paladins/champion-cards/lie-in-wait.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (190, 24479, N'[Setback] Gain a {scale=100|100}-Health Shield for 3s after hitting an enemy with Setback.', N'[Setback] Gain a {scale=100|100}-Health Shield for 3s after hitting an enemy with Setback.', N'Lessons of the Past', 2512, N'https://web2.hirez.com/paladins/champion-cards/lessons-of-the-past.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (191, 12643, N'[Charge] Increase the travel distance of Charge by {scale=15|15}%.', N'[Charge] Increase the travel distance of Charge by {scale=15|15}%.', N'Launch', 2071, N'https://web2.hirez.com/paladins/champion-cards/launch.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (192, 18340, N'[Armor] Gain {scale=10|10}% Lifesteal.', N'[Armor] Gain {scale=10|10}% Lifesteal.', N'Indomitable', 2404, N'https://web2.hirez.com/paladins/champion-cards/indomitable.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (193, 16165, N'[Recharge] Generate {scale=2|2} Ammo after activating Recharge.', N'[Recharge] Generate {scale=2|2} Ammo after activating Recharge.', N'Induction', 2322, N'https://web2.hirez.com/paladins/champion-cards/induction.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (194, 19150, N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'Inertia', 2431, N'https://web2.hirez.com/paladins/champion-cards/inertia.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (195, 16922, N'[Retribution] Increase your Movement Speed by {scale=5|5}% while you are within 60 units of your Retribution target.', N'[Retribution] Increase your Movement Speed by {scale=5|5}% while you are within 60 units of your Retribution target.', N'Inescapable', 2362, N'https://web2.hirez.com/paladins/champion-cards/inescapable.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (196, 24998, N'[Weapon] Increase your Reload Speed by {scale=7|7}%.', N'[Weapon] Increase your Reload Speed by {scale=7|7}%.', N'Infernal Reload', 2528, N'https://web2.hirez.com/paladins/champion-cards/infernal-reload.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (197, 24312, N'[Stasis Field] Your weapon doesn''t consume Ammo for {scale=1.6|1.6}s after activating Stasis Field.', N'[Stasis Field] Your weapon doesn''t consume Ammo for {scale=1.6|1.6}s after activating Stasis Field.', N'Infinity Engine', 2512, N'https://web2.hirez.com/paladins/champion-cards/infinity-engine.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (198, 19387, N'[Weapon] Increase the maximum Ammo count of both your weapons by {scale=1|1}.', N'[Weapon] Increase the maximum Ammo count of both your weapons by {scale=1|1}.', N'Infused Crystals', 2438, N'https://web2.hirez.com/paladins/champion-cards/infused-crystals.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (199, 16205, N'[Nullify] Heal for {scale=50|50} after activating Nullify.', N'[Nullify] Heal for {scale=50|50} after activating Nullify.', N'Infusion', 2322, N'https://web2.hirez.com/paladins/champion-cards/infusion.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (200, 23373, N'[Kindle Soul] Generate {scale=1|1} Ammo after Healing an ally with Kindle Soul.', N'[Kindle Soul] Generate {scale=1|1} Ammo after Healing an ally with Kindle Soul.', N'Inner Fire', 2491, N'https://web2.hirez.com/paladins/champion-cards/inner-fire.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (201, 25169, N'[Heavy Blade] Reduce the Cooldown of Combat Trance by {scale=0.4|0.4}s for each enemy hit by Heavy Blade.', N'[Heavy Blade] Reduce the Cooldown of Combat Trance by {scale=0.4|0.4}s for each enemy hit by Heavy Blade.', N'Instrument of Fate', 2529, N'https://web2.hirez.com/paladins/champion-cards/instrument-of-fate.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (202, 16670, N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'Insurmountable', 2348, N'https://web2.hirez.com/paladins/champion-cards/insurmountable.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (203, 12517, N'[Blast Shot] Apply a Knockback of {scale=250|250} to enemies hit by Blast Shot.', N'[Blast Shot] Apply a Knockback of {scale=250|250} to enemies hit by Blast Shot.', N'Megaton', 2092, N'https://web2.hirez.com/paladins/champion-cards/megaton.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (204, 13087, N'[Dodge Roll] Increase your Movement Speed by {scale=10|10}% for 1.5s after using Dodge Roll.', N'[Dodge Roll] Increase your Movement Speed by {scale=10|10}% for 1.5s after using Dodge Roll.', N'Intense Training', 2092, N'https://web2.hirez.com/paladins/champion-cards/intense-training.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (205, 19980, N'[Power Siphon] Reduce the Cooldown of Shatterfall by {scale=0.3|0.3}s for every 1s spent channeling Power Siphon.', N'[Power Siphon] Reduce the Cooldown of Shatterfall by {scale=0.3|0.3}s for every 1s spent channeling Power Siphon.', N'It Waits', 2477, N'https://web2.hirez.com/paladins/champion-cards/it-waits.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (206, 19926, N'[Armor] Generate {scale=3|3}% Power Siphon charge for each enemy hit with Massacre Axe.', N'[Armor] Generate {scale=3|3}% Power Siphon charge for each enemy hit with Massacre Axe.', N'It Watches', 2477, N'https://web2.hirez.com/paladins/champion-cards/it-watches.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (207, 14469, N'[Poppy Bomb] Increase the effect of Poppy Bomb’s Knockback by {scale=15|15}% and cause Poppy Bomb to explode on contact with any surface.', N'[Poppy Bomb] Increase the effect of Poppy Bomb’s Knockback by {scale=15|15}% and cause Poppy Bomb to explode on contact with any surface.', N'Jolt', 2281, N'https://web2.hirez.com/paladins/champion-cards/jolt.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (208, 20302, N'[Sensor Drone] Increase the range at which Sensor Drone Reveals targets by {scale=10|10}%.', N'[Sensor Drone] Increase the range at which Sensor Drone Reveals targets by {scale=10|10}%.', N'Joyless Eyes', 2480, N'https://web2.hirez.com/paladins/champion-cards/joyless-eyes.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (209, 16774, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Juke Boots', 2362, N'https://web2.hirez.com/paladins/champion-cards/juke-boots.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (210, 16782, N'[Retribution] Increase the range at which your Retribution target is Revealed by {scale=10|10} units.', N'[Retribution] Increase the range at which your Retribution target is Revealed by {scale=10|10} units.', N'Keen Sight', 2362, N'https://web2.hirez.com/paladins/champion-cards/keen-sight.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (211, 12867, N'[Armor] Increase maximum Health by {scale=30|30}.', N'[Armor] Increase maximum Health by {scale=30|30}.', N'Keep Moving', 2094, N'https://web2.hirez.com/paladins/champion-cards/keep-moving.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (212, 12835, N'[Soar] Reduce the Cooldown of Soar by {scale=20|20}% after getting a Killing Blow.', N'[Soar] Reduce the Cooldown of Soar by {scale=20|20}% after getting a Killing Blow.', N'Killing Frost', 2094, N'https://web2.hirez.com/paladins/champion-cards/killing-frost.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (213, 18593, N'[Whirl] Generate {scale=1|1} Ammo after activating Whirl.', N'[Whirl] Generate {scale=1|1} Ammo after activating Whirl.', N'Kindling', 2420, N'https://web2.hirez.com/paladins/champion-cards/kindling.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (214, 14683, N'[Blast Shot] Generate {scale=1|1} Ammo for each enemy hit by Blast Shot.', N'[Blast Shot] Generate {scale=1|1} Ammo for each enemy hit by Blast Shot.', N'Kinetics', 2092, N'https://web2.hirez.com/paladins/champion-cards/kinetics.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (215, 19559, N'[Weapon] Increase your maximum Ammo by {scale=4|4}.', N'[Weapon] Increase your maximum Ammo by {scale=4|4}.', N'Last Remnant', 2472, N'https://web2.hirez.com/paladins/champion-cards/last-remnant.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (216, 19909, N'[Calamity Blast] Increase your Movement Speed by {scale=2|2}% for each Calamity Charge you have.', N'[Calamity Blast] Increase your Movement Speed by {scale=2|2}% for each Calamity Charge you have.', N'It Follows', 2477, N'https://web2.hirez.com/paladins/champion-cards/it-follows.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (217, 19905, N'[Armor] Generate {scale=10|10}% of a Calamity Blast charge for each enemy hit with Massacre Axe.', N'[Armor] Generate {scale=10|10}% of a Calamity Blast charge for each enemy hit with Massacre Axe.', N'Forsaken', 2477, N'https://web2.hirez.com/paladins/champion-cards/forsaken.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (218, 15667, N'[Crippling Arrow] Hitting an enemy with Crippling Arrow reduces the Cooldown of Rapid Shot by {scale=0.6|0.6}s.', N'[Crippling Arrow] Hitting an enemy with Crippling Arrow reduces the Cooldown of Rapid Shot by {scale=0.6|0.6}s.', N'Skewer', 2307, N'https://web2.hirez.com/paladins/champion-cards/skewer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (219, 14601, N'[Armor] Increase your Movement Speed by {scale=7|7}% while Out of Combat.', N'[Armor] Increase your Movement Speed by {scale=7|7}% while Out of Combat.', N'Slip Away', 2057, N'https://web2.hirez.com/paladins/champion-cards/slip-away.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (220, 24674, N'[Moonlight] Allies being Healed by Moonlight take 15% reduced damage.', N'[Moonlight] Allies being Healed by Moonlight take 15% reduced damage.', N'Goddess'' Blessing', 2517, N'https://web2.hirez.com/paladins/champion-cards/goddess-blessing.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (221, 16368, N'[Reversal] Reversal always fires back and does an additional 800 damage.', N'[Reversal] Reversal always fires back and does an additional 800 damage.', N'Godslayer', 2205, N'https://web2.hirez.com/paladins/champion-cards/godslayer.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (222, 18303, N'[Spite] Spite deals 25% of its target''s maximum Health with each hit, and Increases your Ultimate charge rate by 15%.', N'[Spite] Spite deals 25% of its target''s maximum Health with each hit, and Increases your Ultimate charge rate by 15%.', N'Guillotine', 2420, N'https://web2.hirez.com/paladins/champion-cards/guillotine.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (223, 16525, N'[Shell Shield] Shell Shield is placed on the ground instead of channeled around you and lasts 2s longer.', N'[Shell Shield] Shell Shield is placed on the ground instead of channeled around you and lasts 2s longer.', N'Half Shell', 2288, N'https://web2.hirez.com/paladins/champion-cards/half-shell.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (224, 16807, N'[Combat Slide] Gain Immunity to Crowd Control and reduce your damage taken by 90% while using Combat Slide.', N'[Combat Slide] Gain Immunity to Crowd Control and reduce your damage taken by 90% while using Combat Slide.', N'Heroism', 2362, N'https://web2.hirez.com/paladins/champion-cards/heroism.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (225, 16448, N'[Hunter''s Mark] Hunter''s Mark has 2 charges and grants its benefits to allies.', N'[Hunter''s Mark] Hunter''s Mark has 2 charges and grants its benefits to allies.', N'Hunting Party', 2314, N'https://web2.hirez.com/paladins/champion-cards/hunting-party.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (226, 23688, N'[Harpoon] Harpoon no longer has a Cooldown, but no longer Slows enemies hit.', N'[Harpoon] Harpoon no longer has a Cooldown, but no longer Slows enemies hit.', N'Hurl', 2495, N'https://web2.hirez.com/paladins/champion-cards/hurl.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (227, 16382, N'[Blast Shot] Blast Shot has its damage increased by 150 and its Cooldown decreased by 2s.', N'[Blast Shot] Blast Shot has its damage increased by 150 and its Cooldown decreased by 2s.', N'Impulse', 2092, N'https://web2.hirez.com/paladins/champion-cards/impulse.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (228, 19623, N'[Rune of Travel] Reset the Cooldown of Overcharge and Blitz Upper when you Teleport using Rune of Travel.', N'[Rune of Travel] Reset the Cooldown of Overcharge and Blitz Upper when you Teleport using Rune of Travel.', N'Inner Strength', 2472, N'https://web2.hirez.com/paladins/champion-cards/inner-strength.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (229, 16432, N'[Ancient Rage] Increase your Ultimate charge rate by 15% and your Maximum Health by 500. Activating Ancient Rage resets the Cooldown of Dredge Anchor and Shell Spin.', N'[Ancient Rage] Increase your Ultimate charge rate by 15% and your Maximum Health by 500. Activating Ancient Rage resets the Cooldown of Dredge Anchor and Shell Spin.', N'Leviathan', 2288, N'https://web2.hirez.com/paladins/champion-cards/leviathan.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (230, 22888, N'[Bulwark] Your Shield regenerates at 100% effectiveness even while it is active.', N'[Bulwark] Your Shield regenerates at 100% effectiveness even while it is active.', N'Lian''s Shield', 2479, N'https://web2.hirez.com/paladins/champion-cards/lians-shield.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (231, 20359, N'[Shatter] Shatter instantly Heals your target for 700, but its Cooldown is increased by 1s and it no longer explodes your Illusions.', N'[Shatter] Shatter instantly Heals your target for 700, but its Cooldown is increased by 1s and it no longer explodes your Illusions.', N'Life Exchange', 2267, N'https://web2.hirez.com/paladins/champion-cards/life-exchange.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (232, 24673, N'[Guardian Spirit] [Guardian Spirit] Luna Heals allies around her for 200 per second.', N'[Guardian Spirit] [Guardian Spirit] Luna Heals allies around her for 200 per second.', N'Life Link', 2517, N'https://web2.hirez.com/paladins/champion-cards/life-link.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (233, 19223, N'[Astral Mark] Allies affected by your Astral Mark deal 15% increased weapon damage.', N'[Astral Mark] Allies affected by your Astral Mark deal 15% increased weapon damage.', N'Luminary', 2431, N'https://web2.hirez.com/paladins/champion-cards/luminary.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (234, 16378, N'[Shock Pulse] Your weapon shots reduce the Cooldown of Shock Pulse by 0.5s and Shock Pulse chains 4 additional times.', N'[Shock Pulse] Your weapon shots reduce the Cooldown of Shock Pulse by 0.5s and Shock Pulse chains 4 additional times.', N'Maelstrom', 2093, N'https://web2.hirez.com/paladins/champion-cards/maelstrom.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (235, 24136, N'[Armor] Remaining still for 1s creates a Mana Rift around you that generates Mana every 1s. Leaving the Mana Rift destroys it.', N'[Armor] Remaining still for 1s creates a Mana Rift around you that generates Mana every 1s. Leaving the Mana Rift destroys it.', N'Mana Rift', 2509, N'https://web2.hirez.com/paladins/champion-cards/mana-rift.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (236, 16376, N'[Healing Potion] Healing Potion''s Healing is increased by 100%.', N'[Healing Potion] Healing Potion''s Healing is increased by 100%.', N'Mega Potion', 2056, N'https://web2.hirez.com/paladins/champion-cards/mega-potion.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (237, 16458, N'[Nade Launcher] Nade Launcher has 3 charges.', N'[Nade Launcher] Nade Launcher has 3 charges.', N'Mercy Kill', 2314, N'https://web2.hirez.com/paladins/champion-cards/mercy-kill.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (238, 16609, N'[Restore Soul] Increase the range of Restore Soul by 300% and reduce the time between Healing ticks by 17%.', N'[Restore Soul] Increase the range of Restore Soul by 300% and reduce the time between Healing ticks by 17%.', N'Mortal Reach', 2372, N'https://web2.hirez.com/paladins/champion-cards/mortal-reach.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (239, 16601, N'[Earthen Guard] Reduce your damage taken by 20% and gain Immunity to Crowd Control while Earthen Guard is active.', N'[Earthen Guard] Reduce your damage taken by 20% and gain Immunity to Crowd Control while Earthen Guard is active.', N'Mother''s Grace', 2348, N'https://web2.hirez.com/paladins/champion-cards/mothers-grace.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (240, 20319, N'[Dead Zone] Dead Zone damage is increased to 500.', N'[Dead Zone] Dead Zone damage is increased to 500.', N'Nightshade', 2393, N'https://web2.hirez.com/paladins/champion-cards/nightshade.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (241, 19468, N'[Stealth] Reduce the rate of Stealth Energy consumption by 50%.', N'[Stealth] Reduce the rate of Stealth Energy consumption by 50%.', N'Nocturnal', 2438, N'https://web2.hirez.com/paladins/champion-cards/nocturnal.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (242, 19706, N'[True Power] Increase your Ultimate charge rate by 15% and enemies at or below 65% Health are Revealed to you.', N'[True Power] Increase your Ultimate charge rate by 15% and enemies at or below 65% Health are Revealed to you.', N'Nothing Personal', 2472, N'https://web2.hirez.com/paladins/champion-cards/nothing-personal.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (243, 16383, N'[Weapon] Damage dealt when hitting an enemy directly with Rocket Launcher or Salvo is increased by 25%.', N'[Weapon] Damage dealt when hitting an enemy directly with Rocket Launcher or Salvo is increased by 25%.', N'Fusillade', 2277, N'https://web2.hirez.com/paladins/champion-cards/fusillade.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (244, 20315, N'[Weapon] After firing continuously for 2s, gain 10% increased damage.', N'[Weapon] After firing continuously for 2s, gain 10% increased damage.', N'Opportunity in Chaos', 2480, N'https://web2.hirez.com/paladins/champion-cards/opportunity-in-chaos.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (245, 18556, N'[Siege Shield] Increase Siege Shield''s maximum Health by 2000 and its size by 50%, but reduce its Movement Speed by 80%.', N'[Siege Shield] Increase Siege Shield''s maximum Health by 2000 and its size by 50%, but reduce its Movement Speed by 80%.', N'Fortress Breaker', 2404, N'https://web2.hirez.com/paladins/champion-cards/fortress-breaker.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (246, 16381, N'[Armor] Heal for 55% of your maximum Health over 3s when you fall to or below 40% of your maximum Health. This can occur once every 45s.', N'[Armor] Heal for 55% of your maximum Health over 3s when you fall to or below 40% of your maximum Health. This can occur once every 45s.', N'Formidable', 2071, N'https://web2.hirez.com/paladins/champion-cards/formidable.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (247, 25371, N'[Abyssal Reconstruction] Your Marked ally gains 15% Crowd Control reduction, 10% Cooldown reduction, 15% Reload Speed increase, and they are Healed for 50 every 1s.
			', N'[Abyssal Reconstruction] Your Marked ally gains 15% Crowd Control reduction, 10% Cooldown reduction, 15% Reload Speed increase, and they are Healed for 50 every 1s.
			', N'Dark Gifts', 2533, N'https://web2.hirez.com/paladins/champion-cards/dark-gifts.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (248, 16909, N'[Weapon] Your weapon shots deal 680 damage every 0.7s, but your Ammo count is reduced.', N'[Weapon] Your weapon shots deal 680 damage every 0.7s, but your Ammo count is reduced.', N'Death Hastens', 2362, N'https://web2.hirez.com/paladins/champion-cards/death-hastens.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (249, 16374, N'[Poison Bolts] Increase the damage done by Poison Bolts by 25% and the rate at which they deal damage by 100%.', N'[Poison Bolts] Increase the damage done by Poison Bolts by 25% and the rate at which they deal damage by 100%.', N'Debilitate', 2057, N'https://web2.hirez.com/paladins/champion-cards/debilitate.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (250, 19944, N'[Calamity Blast] Each Calamity Blast deals an additional 100 damage.', N'[Calamity Blast] Each Calamity Blast deals an additional 100 damage.', N'Decimation', 2477, N'https://web2.hirez.com/paladins/champion-cards/decimation.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (251, 16582, N'[Crippling Throw] Crippling Throw will Root enemies hit and will Chain between nearby enemies up to 5 times.', N'[Crippling Throw] Crippling Throw will Root enemies hit and will Chain between nearby enemies up to 5 times.', N'Deep Roots', 2254, N'https://web2.hirez.com/paladins/champion-cards/deep-roots.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (252, 20085, N'[Defiance] Successful hits with your Revolver increase the damage of your next Defiance by 15%, stacking up to 100%.', N'[Defiance] Successful hits with your Revolver increase the damage of your next Defiance by 15%, stacking up to 100%.', N'Defiant Fist', 2205, N'https://web2.hirez.com/paladins/champion-cards/defiant-fist.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (253, 24477, N'[Setback] Setback becomes a lobbed explosive, capable of Rewinding multiple enemies.', N'[Setback] Setback becomes a lobbed explosive, capable of Rewinding multiple enemies.', N'Deja vu', 2512, N'https://web2.hirez.com/paladins/champion-cards/deja-vu.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (254, 16453, N'[Crippling Arrow] Crippling Arrow now silences enemies for 2s instead.', N'[Crippling Arrow] Crippling Arrow now silences enemies for 2s instead.', N'Desert Silence', 2307, N'https://web2.hirez.com/paladins/champion-cards/desert-silence.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (255, 16450, N'[Nullify] Double the range at which you can use Nullify.', N'[Nullify] Double the range at which you can use Nullify.', N'Direct Current', 2322, N'https://web2.hirez.com/paladins/champion-cards/direct-current.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (256, 16914, N'[Retribution] Increase the damage you deal to your Retribution target by 30%.', N'[Retribution] Increase the damage you deal to your Retribution target by 30%.', N'Discovery', 2362, N'https://web2.hirez.com/paladins/champion-cards/discovery.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (257, 23482, N'[Dragon Stance] Dragon Stance consumes Health instead of Energy at a rate of 200 Health per second. Dragon Stance requires at least 300 Health to activate and automatically cancels at 15 Health.', N'[Dragon Stance] Dragon Stance consumes Health instead of Energy at a rate of 200 Health per second. Dragon Stance requires at least 300 Health to activate and automatically cancels at 15 Health.', N'Dragon Fangs', 2493, N'https://web2.hirez.com/paladins/champion-cards/dragon-fangs.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (258, 16387, N'[Weapon] Increase the damage done by Headshots by an additional 25% of base for a total of 175% damage.', N'[Weapon] Increase the damage done by Headshots by an additional 25% of base for a total of 175% damage.', N'Eagle Eye', 2249, N'https://web2.hirez.com/paladins/champion-cards/eagle-eye.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (259, 24779, N'[Cataclysm] Increase your Ultimate charge rate by 60%.', N'[Cataclysm] Increase your Ultimate charge rate by 60%.', N'Earthsplitter', 2528, N'https://web2.hirez.com/paladins/champion-cards/earthsplitter.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (260, 18815, N'[Presence] Increase the damage of Presence by up to 50% based on the range at which it hits and reduce its Cooldown by 4s.', N'[Presence] Increase the damage of Presence by up to 50% based on the range at which it hits and reduce its Cooldown by 4s.', N'Eminence', 2417, N'https://web2.hirez.com/paladins/champion-cards/eminence.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (261, 24778, N'[Juggernaut] Reduce your damage taken by 50% while using Juggernaut.', N'[Juggernaut] Reduce your damage taken by 50% while using Juggernaut.', N'Enforcer', 2528, N'https://web2.hirez.com/paladins/champion-cards/enforcer.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (262, 16386, N'[Net Shot] Increase the damage you deal to targets Slowed by Net Shot by 20% and increases the duration of Net Shot''s Slow by 0.5s. The damage increase lasts a minimum of 2s.', N'[Net Shot] Increase the damage you deal to targets Slowed by Net Shot by 20% and increases the duration of Net Shot''s Slow by 0.5s. The damage increase lasts a minimum of 2s.', N'Ensnare', 2147, N'https://web2.hirez.com/paladins/champion-cards/ensnare.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (263, 16384, N'[Dodge Roll] For 8s after using Dodge Roll, your next weapon shot''s damage is increased by 30%.', N'[Dodge Roll] For 8s after using Dodge Roll, your next weapon shot''s damage is increased by 30%.', N'Exaction', 2092, N'https://web2.hirez.com/paladins/champion-cards/exaction.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (264, 23358, N'[Pyre Strike] When Pyre Strike hits an enemy champion it stops moving until it ends.', N'[Pyre Strike] When Pyre Strike hits an enemy champion it stops moving until it ends.', N'Exterminate', 2491, N'https://web2.hirez.com/paladins/champion-cards/exterminate.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (265, 19626, N'[Rune of Travel] Rune of Travel no longer automatically activates, and if the Rune is not used the Cooldown is reset.', N'[Rune of Travel] Rune of Travel no longer automatically activates, and if the Rune is not used the Cooldown is reset.', N'Faustian Bargain', 2472, N'https://web2.hirez.com/paladins/champion-cards/faustian-bargain.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (266, 16389, N'[Weapon] Increase your maximum damage scaling over distance by 60%.', N'[Weapon] Increase your maximum damage scaling over distance by 60%.', N'Ferocity', 2254, N'https://web2.hirez.com/paladins/champion-cards/ferocity.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (267, 16451, N'[Protection] Increase the damage done by allies by 10% while they are Shielded by Protection.', N'[Protection] Increase the damage done by allies by 10% while they are Shielded by Protection.', N'Field Study', 2322, N'https://web2.hirez.com/paladins/champion-cards/field-study.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (268, 16519, N'[Emitter] Increase the Shield granted by Emitter by 1000.', N'[Emitter] Increase the Shield granted by Emitter by 1000.', N'Flux Generator', 2149, N'https://web2.hirez.com/paladins/champion-cards/flux-generator.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (269, 16367, N'[Weapon] Deal an additional 200 damage to an enemy if you hit them with all 5 shots of Illusory Mirror.', N'[Weapon] Deal an additional 200 damage to an enemy if you hit them with all 5 shots of Illusory Mirror.', N'Focusing Lens', 2267, N'https://web2.hirez.com/paladins/champion-cards/focusing-lens.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (270, 16397, N'[Barricade] Increase the maximum Health of Barricade by 2000 and reduce its Cooldown by 3s.', N'[Barricade] Increase the maximum Health of Barricade by 2000 and reduce its Cooldown by 3s.', N'Fortify', 2073, N'https://web2.hirez.com/paladins/champion-cards/fortify.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (271, 16370, N'[Soar] Increase the damage you deal with your weapon shots by 20% for 3s after Soar ends.', N'[Soar] Increase the damage you deal with your weapon shots by 20% for 3s after Soar ends.', N'Over the Moon', 2094, N'https://web2.hirez.com/paladins/champion-cards/over-the-moon.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (272, 16433, N'[Dredge Anchor] For 4s after hitting an enemy with Dredge Anchor, your next weapon shot against that enemy deals 75% increased damage.', N'[Dredge Anchor] For 4s after hitting an enemy with Dredge Anchor, your next weapon shot against that enemy deals 75% increased damage.', N'Pluck', 2288, N'https://web2.hirez.com/paladins/champion-cards/pluck.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (273, 18814, N'[Weapon] Hitting an enemy with Heirloom Rifle increases your Heirloom Rifle damage against that enemy by 7% for 3s, stacking up to 4 times.', N'[Weapon] Hitting an enemy with Heirloom Rifle increases your Heirloom Rifle damage against that enemy by 7% for 3s, stacking up to 4 times.', N'Precision', 2417, N'https://web2.hirez.com/paladins/champion-cards/precision.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (274, 16456, N'[Sniper Mode] For 7s after hitting a fully-charged weapon shot, your next fully-charged shot will deal an additional 30% damage.', N'[Sniper Mode] For 7s after hitting a fully-charged weapon shot, your next fully-charged shot will deal an additional 30% damage.', N'Steady Aim', 2249, N'https://web2.hirez.com/paladins/champion-cards/steady-aim.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (275, 22890, N'[Weapon] Increase your Attack Speed by 40%, but reduce your damage-per-shot by 25%.', N'[Weapon] Increase your Attack Speed by 40%, but reduce your damage-per-shot by 25%.', N'Storm of Bullets', 2479, N'https://web2.hirez.com/paladins/champion-cards/storm-of-bullets.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (276, 20196, N'[Pounce] Pounce Executes targets at or below 35% Health.', N'[Pounce] Pounce Executes targets at or below 35% Health.', N'Street Justice', 2338, N'https://web2.hirez.com/paladins/champion-cards/street-justice.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (277, 25370, N'[Projection] Enemies hit by Projection are stunned for 1s and any enemy caught between your Projection and you when you Teleport takes 600 damage.			', N'[Projection] Enemies hit by Projection are stunned for 1s and any enemy caught between your Projection and you when you Teleport takes 600 damage.			', N'Stunning Visage', 2533, N'https://web2.hirez.com/paladins/champion-cards/stunning-visage.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (278, 24780, N'[Soul Harvest] Allies in a 40-Unit radius around you heal 100 health with each Soul Harvested.', N'[Soul Harvest] Allies in a 40-Unit radius around you heal 100 health with each Soul Harvested.', N'Subservience', 2528, N'https://web2.hirez.com/paladins/champion-cards/subservience.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (279, 20316, N'[Armor] The Health of Deflector Shield is increased by 350 and its Cooldown is reduced by half if it is destroyed by an enemy.', N'[Armor] The Health of Deflector Shield is increased by 350 and its Cooldown is reduced by half if it is destroyed by an enemy.', N'Suspect Everyone', 2480, N'https://web2.hirez.com/paladins/champion-cards/suspect-everyone.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (280, 24483, N'[Stasis Field] Greatly increase the size of Stasis Field, but its Cooldown is increased by 50%.', N'[Stasis Field] Greatly increase the size of Stasis Field, but its Cooldown is increased by 50%.', N'Temporal Divide', 2512, N'https://web2.hirez.com/paladins/champion-cards/temporal-divide.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (281, 20099, N'[Protection] Increase Protection''s Shield Health by 500.', N'[Protection] Increase Protection''s Shield Health by 500.', N'Thanks, Grandpa', 2322, N'https://web2.hirez.com/paladins/champion-cards/thanks-grandpa.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (282, 19190, N'[Void Grip] Enemies affected by Void Grip are Crippled and take an additional 480 damage over its duration.', N'[Void Grip] Enemies affected by Void Grip are Crippled and take an additional 480 damage over its duration.', N'The Power Cosmeum', 2431, N'https://web2.hirez.com/paladins/champion-cards/the-power-cosmeum.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (283, 25181, N'[Heavy Blade] Heavy Blade now explodes on reactivation instead of recalling, but the initial throw does reduced damage.', N'[Heavy Blade] Heavy Blade now explodes on reactivation instead of recalling, but the initial throw does reduced damage.', N'Tigron''s Fury', 2529, N'https://web2.hirez.com/paladins/champion-cards/tigrons-fury.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (284, 16400, N'[Weapon] Modify your Blunderbuss to fire a single slug that deals 480 damage.', N'[Weapon] Modify your Blunderbuss to fire a single slug that deals 480 damage.', N'Tinkerin', 2073, N'https://web2.hirez.com/paladins/champion-cards/tinkerin.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (285, 22053, N'[Scamper] Using Scamper Heals allies within 25 units and you for 600 over 3s.', N'[Scamper] Using Scamper Heals allies within 25 units and you for 600 over 3s.', N'Toot', 2481, N'https://web2.hirez.com/paladins/champion-cards/toot.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (286, 16377, N'[Healing Totem] Gain a third charge of Healing Totem and increase their healing by 30%.', N'[Healing Totem] Gain a third charge of Healing Totem and increase their healing by 30%.', N'Totemic Ward', 2093, N'https://web2.hirez.com/paladins/champion-cards/totemic-ward.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (287, 16600, N'[Warder''s Field] The radius of Warder''s Field is increased by 50% and it Cripples enemies within it.', N'[Warder''s Field] The radius of Warder''s Field is increased by 50% and it Cripples enemies within it.', N'Treacherous Ground', 2348, N'https://web2.hirez.com/paladins/champion-cards/treacherous-ground.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (288, 16605, N'[Impasse] Impasse now has 2 charges and its Cooldown is reduced to 12s, but you are unable to destroy your walls.', N'[Impasse] Impasse now has 2 charges and its Cooldown is reduced to 12s, but you are unable to destroy your walls.', N'Tremors', 2348, N'https://web2.hirez.com/paladins/champion-cards/tremors.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (289, 20279, N'[Flare] Flare deals 250% base damage, has significantly increased Projectile Speed, and has its Cooldown reduced by 10s, but no longer Reveals enemies.', N'[Flare] Flare deals 250% base damage, has significantly increased Projectile Speed, and has its Cooldown reduced by 10s, but no longer Reveals enemies.', N'Unauthorized Use', 2438, N'https://web2.hirez.com/paladins/champion-cards/unauthorized-use.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (290, 19943, N'[Armor] Reduce the damage you take by 20% while at or below 40% Health.', N'[Armor] Reduce the damage you take by 20% while at or below 40% Health.', N'Undying', 2477, N'https://web2.hirez.com/paladins/champion-cards/undying.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (291, 24487, N'[Second Chance] Activating Second Chance leaves behind an unstable fissure that explodes after 3s, dealing 900 damage.', N'[Second Chance] Activating Second Chance leaves behind an unstable fissure that explodes after 3s, dealing 900 damage.', N'Unstable Fissure', 2512, N'https://web2.hirez.com/paladins/champion-cards/unstable-fissure.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (292, 25182, N'[Crouching Tigron] Crouching Tigron now deals 700 damage in a 20-unit-radius area on landing.', N'[Crouching Tigron] Crouching Tigron now deals 700 damage in a 20-unit-radius area on landing.', N'Vicious Assault', 2529, N'https://web2.hirez.com/paladins/champion-cards/vicious-assault.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (293, 22891, N'[Commander''s Grab] Targets hit by Commander''s Grab are Stunned for an additional 1.2s.', N'[Commander''s Grab] Targets hit by Commander''s Grab are Stunned for an additional 1.2s.', N'Vortex Grip', 2479, N'https://web2.hirez.com/paladins/champion-cards/vortex-grip.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (294, 16364, N'[Armor] Increase your Movement Speed while using your Booster.', N'[Armor] Increase your Movement Speed while using your Booster.', N'W.Y.R.M. Jets', 2277, N'https://web2.hirez.com/paladins/champion-cards/wyrm-jets.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (295, 16494, N'[Weapon] Tossing your snake after reloading is faster and deals an additional 500 damage.', N'[Weapon] Tossing your snake after reloading is faster and deals an additional 500 damage.', N'Wekono''s Wrath', 2303, N'https://web2.hirez.com/paladins/champion-cards/wekonos-wrath.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (296, 16371, N'[Blink] Blink can be refired within 4s of its use to return to the initial casting location.', N'[Blink] Blink can be refired within 4s of its use to return to the initial casting location.', N'Wormhole', 2094, N'https://web2.hirez.com/paladins/champion-cards/wormhole.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (297, 25366, N'[Mark of Fate] Decrease the percentage of Healing given to Marked targets by 15%, but you can have two Marks out at a time.	', N'[Mark of Fate] Decrease the percentage of Healing given to Marked targets by 15%, but you can have two Marks out at a time.	', N'Spreading Influence', 2533, N'https://web2.hirez.com/paladins/champion-cards/spreading-influence.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (298, 24145, N'[Frost Bolt] Frost Bolt Chains to a nearby enemy within 30 units, dealing 350 damage.', N'[Frost Bolt] Frost Bolt Chains to a nearby enemy within 30 units, dealing 350 damage.', N'Splitting Ice', 2509, N'https://web2.hirez.com/paladins/champion-cards/splitting-ice.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (299, 20325, N'[Weapon] Hitting allies with your Lightning Staff Heals them for 700 per second.', N'[Weapon] Hitting allies with your Lightning Staff Heals them for 700 per second.', N'Spirit''s Domain', 2093, N'https://web2.hirez.com/paladins/champion-cards/spirits-domain.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (300, 16495, N'[Mending Spirits] Mending Spirits immediately Heals your target for an additional 250.', N'[Mending Spirits] Mending Spirits immediately Heals your target for an additional 250.', N'Spirit''s Chosen', 2303, N'https://web2.hirez.com/paladins/champion-cards/spirits-chosen.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (301, 25180, N'[Weapon] Bladed Chakrams are able to bounce 2 additional times before disappearing.', N'[Weapon] Bladed Chakrams are able to bounce 2 additional times before disappearing.', N'Predatory Instincts', 2529, N'https://web2.hirez.com/paladins/champion-cards/predatory-instincts.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (302, 16375, N'[Armor] Killing Blows reset your Cooldowns and Heal you for 500.', N'[Armor] Killing Blows reset your Cooldowns and Heal you for 500.', N'Preparation', 2057, N'https://web2.hirez.com/paladins/champion-cards/preparation.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (303, 24144, N'[Pyre Ball] Successfully landing two Pyre Balls will cause the next Pyre Ball thrown after the second hit to explode in a 30-unit-radius area.', N'[Pyre Ball] Successfully landing two Pyre Balls will cause the next Pyre Ball thrown after the second hit to explode in a 30-unit-radius area.', N'Pyromania', 2509, N'https://web2.hirez.com/paladins/champion-cards/pyromania.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (304, 16402, N'[Blossom] Allies Healed by Blossom will Heal for an additional 300 over 3s.', N'[Blossom] Allies Healed by Blossom will Heal for an additional 300 over 3s.', N'Rampant Blooming', 2254, N'https://web2.hirez.com/paladins/champion-cards/rampant-blooming.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (305, 16455, N'[Weapon] Increase the rate at which your Longbow charges by 25%.', N'[Weapon] Increase the rate at which your Longbow charges by 25%.', N'Recurve', 2307, N'https://web2.hirez.com/paladins/champion-cards/recurve.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (306, 20093, N'[Transporter] Using Transporter instantly Teleports you to its target location.', N'[Transporter] Using Transporter instantly Teleports you to its target location.', N'Reposition', 2249, N'https://web2.hirez.com/paladins/champion-cards/reposition.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (307, 16366, N'[Shatter] If an Illusion is killed or expires, it triggers a Shatter explosion, dealing 500 damage.', N'[Shatter] If an Illusion is killed or expires, it triggers a Shatter explosion, dealing 500 damage.', N'Resonance', 2267, N'https://web2.hirez.com/paladins/champion-cards/resonance.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (308, 20191, N'[Mending Spirits] Your Gourd no longer damages enemies, but it Heals for twice as much.', N'[Mending Spirits] Your Gourd no longer damages enemies, but it Heals for twice as much.', N'Ripened Gourd', 2303, N'https://web2.hirez.com/paladins/champion-cards/ripened-gourd.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (309, 20097, N'[Missile Launcher] Increase the radius of Missile Launcher''s explosions by 66%.', N'[Missile Launcher] Increase the radius of Missile Launcher''s explosions by 66%.', N'Rocket Barrage', 2149, N'https://web2.hirez.com/paladins/champion-cards/rocket-barrage.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (310, 16449, N'[Armor] Increase the damage done by Pounce by 10% and reset Pounce''s Cooldown after earning an Elimination.', N'[Armor] Increase the damage done by Pounce by 10% and reset Pounce''s Cooldown after earning an Elimination.', N'Rogue''s Gambit', 2338, N'https://web2.hirez.com/paladins/champion-cards/rogues-gambit.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (311, 20216, N'[Weapon] Increase the radius of Sticky Bombs'' explosions by 20%.', N'[Weapon] Increase the radius of Sticky Bombs'' explosions by 20%.', N'Royal Subjects', 2281, N'https://web2.hirez.com/paladins/champion-cards/royal-subjects.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (312, 16369, N'[Weapon] Your Revolver becomes automatic, dealing 600 damage every 0.5s.', N'[Weapon] Your Revolver becomes automatic, dealing 600 damage every 0.5s.', N'Cursed Revolver', 2205, N'https://web2.hirez.com/paladins/champion-cards/cursed-revolver.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (313, 24663, N'[Guardian Spirit] [Guardian Spirit] If Io falls below 200 Health while Luna is active, she trades places with Luna, Heals for 50% of her Health, and Luna dies in her stead.', N'[Guardian Spirit] [Guardian Spirit] If Io falls below 200 Health while Luna is active, she trades places with Luna, Heals for 50% of her Health, and Luna dies in her stead.', N'Sacrifice', 2517, N'https://web2.hirez.com/paladins/champion-cards/sacrifice.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (314, 16380, N'[Fireball] Increase the damage of Fireball by 30% and deal 20% increased damage for each subsequent target hit after the first. ', N'[Fireball] Increase the damage of Fireball by 30% and deal 20% increased damage for each subsequent target hit after the first. ', N'Scorch', 2071, N'https://web2.hirez.com/paladins/champion-cards/scorch.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (315, 17111, N'[Seedling] Increase the damage of each Seedling to 750 and reduce the time it takes for them to explode by 25%.', N'[Seedling] Increase the damage of each Seedling to 750 and reduce the time it takes for them to explode by 25%.', N'Scorn', 2393, N'https://web2.hirez.com/paladins/champion-cards/scorn.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (316, 23690, N'[Weapon] The projectile launched by reloading your Cursed Howitzer explodes in a 20-unit-radius area on contact.', N'[Weapon] The projectile launched by reloading your Cursed Howitzer explodes in a 20-unit-radius area on contact.', N'Scuttle', 2495, N'https://web2.hirez.com/paladins/champion-cards/scuttle.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (317, 20100, N'[Frag Grenade] Increase the radius of Frag Grenade''s explosion by 40%.', N'[Frag Grenade] Increase the radius of Frag Grenade''s explosion by 40%.', N'Shrapnel', 2285, N'https://web2.hirez.com/paladins/champion-cards/shrapnel.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (318, 20087, N'[Weapon] Your weapon shots travel 50% faster and 100% farther, but no longer explode.', N'[Weapon] Your weapon shots travel 50% faster and 100% farther, but no longer explode.', N'Slug Shot', 2404, N'https://web2.hirez.com/paladins/champion-cards/slug-shot.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (319, 20148, N'[Smoke Screen] Benefits from Smoke Screen cards in your loadout now also benefit allies who enter Smoke Screen. Additionally, allies are Healed for 150 every 1s while in your Smoke Screen.', N'[Smoke Screen] Benefits from Smoke Screen cards in your loadout now also benefit allies who enter Smoke Screen. Additionally, allies are Healed for 150 every 1s while in your Smoke Screen.', N'Smoke and Dagger', 2057, N'https://web2.hirez.com/paladins/champion-cards/smoke-and-dagger.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (320, 18302, N'[Billow] Heal for 15% of your maximum Health per second while using Billow.', N'[Billow] Heal for 15% of your maximum Health per second while using Billow.', N'Smolder', 2420, N'https://web2.hirez.com/paladins/champion-cards/smolder.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (321, 22033, N'[Armor] When you get an Elimination, drop a Health Pack that Heals the champion who picks it up for 600. Health Packs are visible to allies and are not able to be seen or interacted with by the opposing team.', N'[Armor] When you get an Elimination, drop a Health Pack that Heals the champion who picks it up for 600. Health Packs are visible to allies and are not able to be seen or interacted with by the opposing team.', N'Snack Attack', 2481, N'https://web2.hirez.com/paladins/champion-cards/snack-attack.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (322, 20235, N'[Ice Storm] Ice Storm has its damage increased by 100% and its Ultimate charge decreased by 50%, but its duration is reduced to 3s.', N'[Ice Storm] Ice Storm has its damage increased by 100% and its Ultimate charge decreased by 50%, but its duration is reduced to 3s.', N'Snow Globe', 2094, N'https://web2.hirez.com/paladins/champion-cards/snow-globe.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (323, 23362, N'[Pyre Strike] When Pyre Strike comes in contact with an ally it will stop and Heal anyone in its beam for 150 every 0.05s. Also reduces the speed of Pyre Strike by 30%.', N'[Pyre Strike] When Pyre Strike comes in contact with an ally it will stop and Heal anyone in its beam for 150 every 0.05s. Also reduces the speed of Pyre Strike by 30%.', N'Solar Blessing', 2491, N'https://web2.hirez.com/paladins/champion-cards/solar-blessing.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (324, 16610, N'[Rend Soul] Each Soul Charge you detonate with Rend Soul increases your maximum Health and weapon damage by 2% until you die. Stacks up to 15 times.', N'[Rend Soul] Each Soul Charge you detonate with Rend Soul increases your maximum Health and weapon damage by 2% until you die. Stacks up to 15 times.', N'Soul Collector', 2372, N'https://web2.hirez.com/paladins/champion-cards/soul-collector.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (325, 20263, N'[Crippling Arrow] Crippling Arrow now explodes in a 20-unit-radius area on contact, dealing 300 additional damage to enemies hit.', N'[Crippling Arrow] Crippling Arrow now explodes in a 20-unit-radius area on contact, dealing 300 additional damage to enemies hit.', N'Sand Trap', 2307, N'https://web2.hirez.com/paladins/champion-cards/sand-trap.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (326, 24553, N'[Armor] Lower your gravity and increase your air control by {scale=50|10}% while firing your Light Bow.', N'[Armor] Lower your gravity and increase your air control by {scale=50|10}% while firing your Light Bow.', N'Sky-Walker', 2517, N'https://web2.hirez.com/paladins/champion-cards/sky-walker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (327, 20028, N'[Shatterfall] Shatterfall Stuns enemies hit for 1s, but no longer Slows.', N'[Shatterfall] Shatterfall Stuns enemies hit for 1s, but no longer Slows.', N'Crush', 2477, N'https://web2.hirez.com/paladins/champion-cards/crush.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (328, 16514, N'[Fire Spit] Fire Spit applies a Knockback and deals an additional 300 damage over 2s.', N'[Fire Spit] Fire Spit applies a Knockback and deals an additional 300 damage over 2s.', N'Combustible', 2277, N'https://web2.hirez.com/paladins/champion-cards/combustible.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (329, 24016, N'[Inferno Cannon] Increase your Movement Speed while casting Inferno Cannon by {scale=20|20}%.', N'[Inferno Cannon] Increase your Movement Speed while casting Inferno Cannon by {scale=20|20}%.', N'Swift Sear', 2509, N'https://web2.hirez.com/paladins/champion-cards/swift-sear.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (330, 19463, N'[Stealth] Increase your Movement Speed by {scale=10|10}% for 2s after entering Stealth.', N'[Stealth] Increase your Movement Speed by {scale=10|10}% for 2s after entering Stealth.', N'Tactical Retreat', 2438, N'https://web2.hirez.com/paladins/champion-cards/tactical-retreat.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (331, 13357, N'[Net Shot] Increase the duration of Net Shot''s Slow by {scale=0.3|0.3}s.', N'[Net Shot] Increase the duration of Net Shot''s Slow by {scale=0.3|0.3}s.', N'Tangled', 2147, N'https://web2.hirez.com/paladins/champion-cards/tangled.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (332, 23468, N'[Shadow Step] Heal for {scale=40|40} after activating Shadow Step.', N'[Shadow Step] Heal for {scale=40|40} after activating Shadow Step.', N'Tenacious', 2493, N'https://web2.hirez.com/paladins/champion-cards/tenacious.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (333, 25175, N'[Combat Trance] Heal for {scale=50|50} every 1s while Combat Trance is active.', N'[Combat Trance] Heal for {scale=50|50} every 1s while Combat Trance is active.', N'Test of Strength', 2529, N'https://web2.hirez.com/paladins/champion-cards/test-of-strength.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (334, 25171, N'[Heavy Blade] Reduce the Cooldown of Crouching Tigron by {scale=0.4|0.4}s for each enemy hit by Heavy Blade.', N'[Heavy Blade] Reduce the Cooldown of Crouching Tigron by {scale=0.4|0.4}s for each enemy hit by Heavy Blade.', N'The Champion', 2529, N'https://web2.hirez.com/paladins/champion-cards/the-champion.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (335, 25376, N'[Abyssal Reconstruction] Heal for {scale=60|60} over 2s after Healing an ally with Abyssal Reconstruction.', N'[Abyssal Reconstruction] Heal for {scale=60|60} over 2s after Healing an ally with Abyssal Reconstruction.', N'The Price of Salvation', 2533, N'https://web2.hirez.com/paladins/champion-cards/the-price-of-salvation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (336, 13290, N'[Nether Step] Increase the distance of each Nether Step dash by {scale=5|5}%.', N'[Nether Step] Increase the distance of each Nether Step dash by {scale=5|5}%.', N'Through the Warp', 2205, N'https://web2.hirez.com/paladins/champion-cards/through-the-warp.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (337, 14800, N'[Weapon] Increase your maximum Ammo by {scale=10|10}%.', N'[Weapon] Increase your maximum Ammo by {scale=10|10}%.', N'Thunderlord', 2093, N'https://web2.hirez.com/paladins/champion-cards/thunderlord.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (338, 25011, N'[Ignition] Generate {scale=25|25} Ammo after activating Ignition.', N'[Ignition] Generate {scale=25|25} Ammo after activating Ignition.', N'Tormented Fissure', 2528, N'https://web2.hirez.com/paladins/champion-cards/tormented-fissure.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (339, 12597, N'[Shield] Reduce the Cooldown of Shield by {scale=0.8|0.8}s.', N'[Shield] Reduce the Cooldown of Shield by {scale=0.8|0.8}s.', N'Towering Barrier', 2071, N'https://web2.hirez.com/paladins/champion-cards/towering-barrier.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (340, 15891, N'[Hunter''s Mark] Increase your Movement Speed by {scale=5|5}% while Hunter''s Mark is active.', N'[Hunter''s Mark] Increase your Movement Speed by {scale=5|5}% while Hunter''s Mark is active.', N'Tracker', 2314, N'https://web2.hirez.com/paladins/champion-cards/tracker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (341, 15842, N'[Armor] Generate {scale=5|5} Ammo after getting a Killing Blow.', N'[Armor] Generate {scale=5|5} Ammo after getting a Killing Blow.', N'Trail Blazer', 2314, N'https://web2.hirez.com/paladins/champion-cards/trail-blazer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (342, 23470, N'[Dragon Stance] While in Dragon Stance, regenerate {scale=6|6} Ammo every 1s.', N'[Dragon Stance] While in Dragon Stance, regenerate {scale=6|6} Ammo every 1s.', N'Trained Killer', 2493, N'https://web2.hirez.com/paladins/champion-cards/trained-killer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (343, 19615, N'[Rune of Travel] Reduce the cooldown of Rune of Travel by {scale=1|1}s.', N'[Rune of Travel] Reduce the cooldown of Rune of Travel by {scale=1|1}s.', N'Transient', 2472, N'https://web2.hirez.com/paladins/champion-cards/transient.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (344, 18389, N'[Siege Shield] Generate {scale=2|2} Ammo after activating Siege Shield.', N'[Siege Shield] Generate {scale=2|2} Ammo after activating Siege Shield.', N'Trebuchet', 2404, N'https://web2.hirez.com/paladins/champion-cards/trebuchet.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (345, 23479, N'[Agility] Increase your jump height by {scale=20|20}% while Agility is active.', N'[Agility] Increase your jump height by {scale=20|20}% while Agility is active.', N'Trespasser', 2493, N'https://web2.hirez.com/paladins/champion-cards/trespasser.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (346, 19383, N'[Weapon] Reduce the maximum inaccuracy of your Pistol by {scale=8|8}%.', N'[Weapon] Reduce the maximum inaccuracy of your Pistol by {scale=8|8}%.', N'Trigger Control', 2438, N'https://web2.hirez.com/paladins/champion-cards/trigger-control.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (347, 23465, N'[Weapon] Increase your Healing received by {scale=5|5}% while firing your SMGs.', N'[Weapon] Increase your Healing received by {scale=5|5}% while firing your SMGs.', N'Trigger Happy', 2493, N'https://web2.hirez.com/paladins/champion-cards/trigger-happy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (348, 25001, N'[Soul Harvest] Heal for {scale=100|100} after activating Soul Harvest.', N'[Soul Harvest] Heal for {scale=100|100} after activating Soul Harvest.', N'Triumphant Ascension', 2528, N'https://web2.hirez.com/paladins/champion-cards/triumphant-ascension.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (349, 14667, N'[Shell Spin] Increase your Movement Speed by {scale=6|6}% for 3s after using Shell Spin.', N'[Shell Spin] Increase your Movement Speed by {scale=6|6}% for 3s after using Shell Spin.', N'Tsunami', 2288, N'https://web2.hirez.com/paladins/champion-cards/tsunami.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (350, 12342, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Tumble', 2092, N'https://web2.hirez.com/paladins/champion-cards/tumble.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (351, 15890, N'[Nade Launcher] Heal for {scale=60|60} for each enemy hit with Nade Launcher.', N'[Nade Launcher] Heal for {scale=60|60} for each enemy hit with Nade Launcher.', N'Turn The Table', 2314, N'https://web2.hirez.com/paladins/champion-cards/turn-the-table.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (352, 23471, N'[Dragon Stance] Reduce the time it takes to enter and exit Dragon Stance by {scale=10|10}%.', N'[Dragon Stance] Reduce the time it takes to enter and exit Dragon Stance by {scale=10|10}%.', N'Swift Hands', 2493, N'https://web2.hirez.com/paladins/champion-cards/swift-hands.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (353, 13236, N'[Armor] Increase your maximum Ammo by {scale=2|2}.', N'[Armor] Increase your maximum Ammo by {scale=2|2}.', N'Twilight Armor', 2057, N'https://web2.hirez.com/paladins/champion-cards/twilight-armor.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (354, 24559, N'[Moonlight] Increase allies'' Movement Speed by {scale=6|6}% while they are being Healed by Moonlight.', N'[Moonlight] Increase allies'' Movement Speed by {scale=6|6}% while they are being Healed by Moonlight.', N'Swift Arrows', 2517, N'https://web2.hirez.com/paladins/champion-cards/swift-arrows.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (355, 15844, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Survivalist', 2314, N'https://web2.hirez.com/paladins/champion-cards/survivalist.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (356, 15122, N'[Explosive Flask] Generate {scale=1|1} Ammo for each enemy hit by Explosive Flask.', N'[Explosive Flask] Generate {scale=1|1} Ammo for each enemy hit by Explosive Flask.', N'Smithereens', 2056, N'https://web2.hirez.com/paladins/champion-cards/smithereens.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (357, 23361, N'[Pyre Strike] Increase the radius of Pyre Strike by {scale=10|10}%.', N'[Pyre Strike] Increase the radius of Pyre Strike by {scale=10|10}%.', N'Solar Flare', 2491, N'https://web2.hirez.com/paladins/champion-cards/solar-flare.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (358, 19206, N'[Stellar Wind] Regenerate {scale=2|2} Ammo every 1s while Stellar Wind is active.', N'[Stellar Wind] Regenerate {scale=2|2} Ammo every 1s while Stellar Wind is active.', N'Solar Sails', 2431, N'https://web2.hirez.com/paladins/champion-cards/solar-sails.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (359, 23491, N'[Armor] Generate {scale=10|10}% Energy after falling to or below 50% Health.', N'[Armor] Generate {scale=10|10}% Energy after falling to or below 50% Health.', N'Something to Prove', 2493, N'https://web2.hirez.com/paladins/champion-cards/something-to-prove.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (360, 16869, N'[Weapon] Increase your Ultimate charge rate by {scale=5|5}%.', N'[Weapon] Increase your Ultimate charge rate by {scale=5|5}%.', N'Sorceress', 2372, N'https://web2.hirez.com/paladins/champion-cards/sorceress.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (361, 16857, N'[Restore Soul] Increase the range from the main target at which Restore Soul''s secondary Healing can target allies by {scale=6|6}%.', N'[Restore Soul] Increase the range from the main target at which Restore Soul''s secondary Healing can target allies by {scale=6|6}%.', N'Soul Forge', 2372, N'https://web2.hirez.com/paladins/champion-cards/soul-forge.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (362, 16816, N'[Dead Zone] Increase the duration of Dead Zone by {scale=0.5|0.5}s.', N'[Dead Zone] Increase the duration of Dead Zone by {scale=0.5|0.5}s.', N'Sparkle', 2393, N'https://web2.hirez.com/paladins/champion-cards/sparkle.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (363, 24557, N'[Moonlight] Reduce the Cooldown of Luna''s redeploy by {scale=0.1|0.1}s after healing with Moonlight.', N'[Moonlight] Reduce the Cooldown of Luna''s redeploy by {scale=0.1|0.1}s after healing with Moonlight.', N'Spirit Arrows', 2517, N'https://web2.hirez.com/paladins/champion-cards/spirit-arrows.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (364, 16861, N'[Restore Soul] Regenerate {scale=2|2} Ammo every 1s while channeling Restore Soul.', N'[Restore Soul] Regenerate {scale=2|2} Ammo every 1s while channeling Restore Soul.', N'Spirit Leech', 2372, N'https://web2.hirez.com/paladins/champion-cards/spirit-leech.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (365, 19563, N'[Armor] Increase your maximum Health by {scale=50|50}', N'[Armor] Increase your maximum Health by {scale=50|50}', N'Spirited', 2472, N'https://web2.hirez.com/paladins/champion-cards/spirited.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (366, 15024, N'[Defiance] Generate {scale=4|4}% Ultimate charge after getting a Killing Blow with Defiance.', N'[Defiance] Generate {scale=4|4}% Ultimate charge after getting a Killing Blow with Defiance.', N'Spiteful', 2205, N'https://web2.hirez.com/paladins/champion-cards/spiteful.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (367, 11302, N'[Weightless] Increase your jump speed by an additonal {scale=10|10}% while using Weightless.', N'[Weightless] Increase your jump speed by an additonal {scale=10|10}% while using Weightless.', N'Sprint', 2056, N'https://web2.hirez.com/paladins/champion-cards/sprint.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (368, 17038, N'[Flutter] Reduce your damage taken by {scale=5|5}% for 3s after activating Flutter.', N'[Flutter] Reduce your damage taken by {scale=5|5}% for 3s after activating Flutter.', N'Spritely', 2393, N'https://web2.hirez.com/paladins/champion-cards/spritely.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (369, 19459, N'[Stealth] Increase your Reload Speed by {scale=10|10}% while Stealth is active.', N'[Stealth] Increase your Reload Speed by {scale=10|10}% while Stealth is active.', N'Stalker', 2438, N'https://web2.hirez.com/paladins/champion-cards/stalker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (370, 24469, N'[Setback] Generate {scale=1|1} Ammo after hitting an enemy with Setback.', N'[Setback] Generate {scale=1|1} Ammo after hitting an enemy with Setback.', N'Steady Arm', 2512, N'https://web2.hirez.com/paladins/champion-cards/steady-arm.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (371, 23365, N'[Wings of Wrath] Reduce the Cooldown of Pyre Strike by {scale=0.8|0.8}s for each successful hit by Wings of Wrath.', N'[Wings of Wrath] Reduce the Cooldown of Pyre Strike by {scale=0.8|0.8}s for each successful hit by Wings of Wrath.', N'Stoke the Fire', 2491, N'https://web2.hirez.com/paladins/champion-cards/stoke-the-fire.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (372, 15045, N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'Street Sweeper', 2147, N'https://web2.hirez.com/paladins/champion-cards/street-sweeper.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (373, 15755, N'[Crippling Arrow] Heal for {scale=70|70} after hitting an enemy with Crippling Arrow.', N'[Crippling Arrow] Heal for {scale=70|70} after hitting an enemy with Crippling Arrow.', N'Strike True', 2307, N'https://web2.hirez.com/paladins/champion-cards/strike-true.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (374, 13406, N'[Weapon] Gain {scale=3|3}% Movement Speed.', N'[Weapon] Gain {scale=3|3}% Movement Speed.', N'Sturdy', 2056, N'https://web2.hirez.com/paladins/champion-cards/sturdy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (375, 25006, N'[Juggernaut] Increase the distance traveled by Juggernaut by {scale=8|8}%.', N'[Juggernaut] Increase the distance traveled by Juggernaut by {scale=8|8}%.', N'Subjugation', 2528, N'https://web2.hirez.com/paladins/champion-cards/subjugation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (376, 18761, N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'Superiority', 2417, N'https://web2.hirez.com/paladins/champion-cards/superiority.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (377, 14664, N'[Shell Spin] Increase the travel distance of Shell Spin by {scale=10|10}%.', N'[Shell Spin] Increase the travel distance of Shell Spin by {scale=10|10}%.', N'Surf', 2288, N'https://web2.hirez.com/paladins/champion-cards/surf.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (378, 23467, N'[Shadow Step] Generate {scale=5|5} Ammo after activating Shadow Step.', N'[Shadow Step] Generate {scale=5|5} Ammo after activating Shadow Step.', N'Surprise!', 2493, N'https://web2.hirez.com/paladins/champion-cards/surprise.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (379, 15345, N'[Armor] Increase your Healing received by {scale=8|8}% while at or below 50% Health.', N'[Armor] Increase your Healing received by {scale=8|8}% while at or below 50% Health.', N'Sustenance', 2303, N'https://web2.hirez.com/paladins/champion-cards/sustenance.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (380, 16773, N'[Weapon] Your Movement Speed is increased by {scale=8|8}% while any enemy is marked with a Soul Orb stack.', N'[Weapon] Your Movement Speed is increased by {scale=8|8}% while any enemy is marked with a Soul Orb stack.', N'Umbral Gait', 2372, N'https://web2.hirez.com/paladins/champion-cards/umbral-gait.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (381, 14375, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting a Killing Blow.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting a Killing Blow.', N'Uncontrolled', 2281, N'https://web2.hirez.com/paladins/champion-cards/uncontrolled.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (382, 25385, N'[Projection] Regenerate 8 Ammo every 0.5s for {scale=0.5|0.5}s after using Projection.', N'[Projection] Regenerate 8 Ammo every 0.5s for {scale=0.5|0.5}s after using Projection.', N'Unexpected Complications', 2533, N'https://web2.hirez.com/paladins/champion-cards/unexpected-complications.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (383, 23518, N'[Weapon] Generate 1 Energy for every 80 damage done with your Submachine Guns.', N'[Weapon] Generate 1 Energy for every 80 damage done with your Submachine Guns.', N'Adrenaline Junkie', 2493, N'https://web2.hirez.com/paladins/champion-cards/adrenaline-junkie.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (384, 16379, N'[Shield] Your Shield has an infinite duration and its Cooldown is reduced by 4s.', N'[Shield] Your Shield has an infinite duration and its Cooldown is reduced by 4s.', N'Aegis', 2071, N'https://web2.hirez.com/paladins/champion-cards/aegis.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (385, 16503, N'[Advance] Advance gains a 3rd charge and activating Advance while standing still causes you to jet upwards.', N'[Advance] Advance gains a 3rd charge and activating Advance while standing still causes you to jet upwards.', N'Aerial Assault', 2149, N'https://web2.hirez.com/paladins/champion-cards/aerial-assault.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (386, 16608, N'[Rend Soul] Rend Soul Stuns enemies for 1.5s when they are afflicted with 4 Soul Charges.', N'[Rend Soul] Rend Soul Stuns enemies for 1.5s when they are afflicted with 4 Soul Charges.', N'Agony', 2372, N'https://web2.hirez.com/paladins/champion-cards/agony.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (387, 18816, N'[Grace] Reduce the Cooldown of Grace by 1s and cause Grace to hit all enemies in front of you instead of only one.', N'[Grace] Reduce the Cooldown of Grace by 1s and cause Grace to hit all enemies in front of you instead of only one.', N'Alacrity', 2417, N'https://web2.hirez.com/paladins/champion-cards/alacrity.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (388, 12934, N'[Turret] Increase the damage of your Turrets by 20% and reduce their Cooldown by 3s.', N'[Turret] Increase the damage of your Turrets by 20% and reduce their Cooldown by 3s.', N'Architectonics', 2073, N'https://web2.hirez.com/paladins/champion-cards/architectonics.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (389, 18388, N'[Shoulder Bash] Reduce your damage taken by 75% while using Shoulder Bash.', N'[Shoulder Bash] Reduce your damage taken by 75% while using Shoulder Bash.', N'Battering Ram', 2404, N'https://web2.hirez.com/paladins/champion-cards/battering-ram.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (390, 16385, N'[Disengage] For 4s after hitting an enemy with Disengage, your weapon shots deal an additional 8% of that enemy''s maximum Health as damage.', N'[Disengage] For 4s after hitting an enemy with Disengage, your weapon shots deal an additional 8% of that enemy''s maximum Health as damage.', N'Big Game', 2092, N'https://web2.hirez.com/paladins/champion-cards/big-game.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (391, 20092, N'[Weapon] Star Splitter now deals 360 damage every 0.4s.', N'[Weapon] Star Splitter now deals 360 damage every 0.4s.', N'Binary Star', 2431, N'https://web2.hirez.com/paladins/champion-cards/binary-star.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (392, 17137, N'[Weapon] Hitting an enemy with your weapon shots increases the damage they take from weapon shots by 80 for 3s, stacking up to 3 times.', N'[Weapon] Hitting an enemy with your weapon shots increases the damage they take from weapon shots by 80 for 3s, stacking up to 3 times.', N'Blastflower', 2393, N'https://web2.hirez.com/paladins/champion-cards/blastflower.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (393, 23481, N'[Cyclone Strike] Cyclone Strike deals 115% of its target''s maximum Health as damage over its duration and your Movement Speed is increased by 15% during the attack.', N'[Cyclone Strike] Cyclone Strike deals 115% of its target''s maximum Health as damage over its duration and your Movement Speed is increased by 15% during the attack.', N'Blood Reaper', 2493, N'https://web2.hirez.com/paladins/champion-cards/blood-reaper.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (394, 21261, N'[Sensor Drone] Your Sensor Drones explode, dealing 600 damage and applying a Knockback to those hit when an enemy is within 20 units.', N'[Sensor Drone] Your Sensor Drones explode, dealing 600 damage and applying a Knockback to those hit when an enemy is within 20 units.', N'Booby Trap', 2480, N'https://web2.hirez.com/paladins/champion-cards/booby-trap.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (395, 22048, N'[Weapon] Detonating a Magic Mark also damages all enemies within 15 units of the victim for 75% of its damage.', N'[Weapon] Detonating a Magic Mark also damages all enemies within 15 units of the victim for 75% of its damage.', N'Boom Boom', 2481, N'https://web2.hirez.com/paladins/champion-cards/boom-boom.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (396, 12931, N'[Heroic Leap] Heroic Leap deals 600 damage and applies a Knockback to enemies within 20 units of your landing location.', N'[Heroic Leap] Heroic Leap deals 600 damage and applies a Knockback to enemies within 20 units of your landing location.', N'Bounce House', 2147, N'https://web2.hirez.com/paladins/champion-cards/bounce-house.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (397, 16392, N'[Recovery] Using Recovery instantly Heals you for 400 and increases your maximum Health by 300 for 5s.', N'[Recovery] Using Recovery instantly Heals you for 400 and increases your maximum Health by 300 for 5s.', N'Bulk Up', 2147, N'https://web2.hirez.com/paladins/champion-cards/bulk-up.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (398, 20230, N'[Fire Bomb] Fire Bomb deals 30% increased damage, Cripples enemies caught in it, and applies a 60% reduce healing effect.', N'[Fire Bomb] Fire Bomb deals 30% increased damage, Cripples enemies caught in it, and applies a 60% reduce healing effect.', N'Burn, Monster!', 2314, N'https://web2.hirez.com/paladins/champion-cards/burn-monster.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (399, 16429, N'[Weapon] Switch your rifle to Three-Shot-Burst mode, increasing your effective range and firing three 220-damage shots every 0.4s.', N'[Weapon] Switch your rifle to Three-Shot-Burst mode, increasing your effective range and firing three 220-damage shots every 0.4s.', N'Burst Mode', 2285, N'https://web2.hirez.com/paladins/champion-cards/burst-mode.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (400, 16431, N'[Hustle] Heal for 300 per second while using Hustle.', N'[Hustle] Heal for 300 per second while using Hustle.', N'Cardio', 2285, N'https://web2.hirez.com/paladins/champion-cards/cardio.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (401, 16406, N'[Prowl] Increase the damage of each of your daggers from your first dagger sets within 5s of Prowl ending by 30%.', N'[Prowl] Increase the damage of each of your daggers from your first dagger sets within 5s of Prowl ending by 30%.', N'Cat Burglar', 2338, N'https://web2.hirez.com/paladins/champion-cards/cat-burglar.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (402, 16391, N'[Explosive Flask] Enemies hit with Explosive Flask take 30% increased damage from your weapon shots for 3s.', N'[Explosive Flask] Enemies hit with Explosive Flask take 30% increased damage from your weapon shots for 3s.', N'Catalyst', 2056, N'https://web2.hirez.com/paladins/champion-cards/catalyst.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (403, 16426, N'[Detonate] Hitting with more than one Sticky Bomb on a use of Detonate increases the damage of each explosion after the first by 30% of its base damage, up to 150%.', N'[Detonate] Hitting with more than one Sticky Bomb on a use of Detonate increases the damage of each explosion after the first by 30% of its base damage, up to 150%.', N'Chain Reaction', 2281, N'https://web2.hirez.com/paladins/champion-cards/chain-reaction.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (404, 23394, N'[Kindle Soul] Kindle Soul Heals up to 15% additional Health based on your ally''s missing Health and its range is increased by 300%.', N'[Kindle Soul] Kindle Soul Heals up to 15% additional Health based on your ally''s missing Health and its range is increased by 300%.', N'Cherish', 2491, N'https://web2.hirez.com/paladins/champion-cards/cherish.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (405, 16516, N'[Weapon] Potion Launcher also Heals allies hit for 700. You no longer take damage from your weapon shots.', N'[Weapon] Potion Launcher also Heals allies hit for 700. You no longer take damage from your weapon shots.', N'Combat Medic', 2056, N'https://web2.hirez.com/paladins/champion-cards/combat-medic.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (406, 16427, N'[Grumpy Bomb] Reduces the time it takes for Grumpy Bomb to explode by 40%.', N'[Grumpy Bomb] Reduces the time it takes for Grumpy Bomb to explode by 40%.', N'Accelerant', 2281, N'https://web2.hirez.com/paladins/champion-cards/accelerant.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (407, 23807, N'[Harpoon] Harpoon lodges into terrain and explodes when an enemy comes within 20 units, dealing 1000 damage in a 35-unit-radius area.', N'[Harpoon] Harpoon lodges into terrain and explodes when an enemy comes within 20 units, dealing 1000 damage in a 35-unit-radius area.', N'Abyss Spike', 2495, N'https://web2.hirez.com/paladins/champion-cards/abyss-spike.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (408, 19930, N'[Shatterfall] Increase the leap distance of Shatterfall by {scale=10|10}%.', N'[Shatterfall] Increase the leap distance of Shatterfall by {scale=10|10}%.', N'Wrecking Ball', 2477, N'https://web2.hirez.com/paladins/champion-cards/wrecking-ball.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (409, 25176, N'[Crouching Tigron] Reset the Cooldown of Crouching Tigron after falling to or below {scale=15|15}% Health.', N'[Crouching Tigron] Reset the Cooldown of Crouching Tigron after falling to or below {scale=15|15}% Health.', N'World-traveler', 2529, N'https://web2.hirez.com/paladins/champion-cards/world-traveler.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (410, 19939, N'[Shatterfall] Reduce your damage taken by {scale=8|8}% for 3s after landing with Shatterfall.', N'[Shatterfall] Reduce your damage taken by {scale=8|8}% for 3s after landing with Shatterfall.', N'Unfeeling', 2477, N'https://web2.hirez.com/paladins/champion-cards/unfeeling.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (411, 14195, N'[Blossom] Reduce your damage taken by {scale=6|6}% for 4s after using Blossom.', N'[Blossom] Reduce your damage taken by {scale=6|6}% for 4s after using Blossom.', N'Unstoppable', 2254, N'https://web2.hirez.com/paladins/champion-cards/unstoppable.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (412, 14780, N'[Charge] Apply a Knockback of {scale=800|200} to enemies hit by Charge.', N'[Charge] Apply a Knockback of {scale=800|200} to enemies hit by Charge.', N'Unstoppable Force', 2071, N'https://web2.hirez.com/paladins/champion-cards/unstoppable-force.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (413, 23519, N'[Dragon Stance] Reduce the rate of Energy consumption while in Dragon Stance by {scale=6|6}%.', N'[Dragon Stance] Reduce the rate of Energy consumption while in Dragon Stance by {scale=6|6}%.', N'Unyielding', 2493, N'https://web2.hirez.com/paladins/champion-cards/unyielding.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (414, 25384, N'[Projection] Reduce the Cooldown of Projection by {scale=0.2|0.2}s for each enemy hit by it.', N'[Projection] Reduce the Cooldown of Projection by {scale=0.2|0.2}s for each enemy hit by it.', N'Unyielding Discipline', 2533, N'https://web2.hirez.com/paladins/champion-cards/unyielding-discipline.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (415, 18384, N'[Shoulder Bash] Reduce your damage taken by {scale=8|8}% for 2s after using Shoulder Bash.', N'[Shoulder Bash] Reduce your damage taken by {scale=8|8}% for 2s after using Shoulder Bash.', N'Vanguard', 2404, N'https://web2.hirez.com/paladins/champion-cards/vanguard.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (416, 16830, N'[Shadow Travel] Reduce the cast time of Shadow Travel by {scale=10|10}%.', N'[Shadow Travel] Reduce the cast time of Shadow Travel by {scale=10|10}%.', N'Veil', 2372, N'https://web2.hirez.com/paladins/champion-cards/veil.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (417, 15357, N'[Gourd] Standing in your Gourd grants yourself and allies {scale=6|6}% Lifesteal.', N'[Gourd] Standing in your Gourd grants yourself and allies {scale=6|6}% Lifesteal.', N'Venomous Gourd', 2303, N'https://web2.hirez.com/paladins/champion-cards/venomous-gourd.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (418, 18611, N'[Counter] Reduce the Cooldown of Counter by {scale=15|15}% after successfully hitting an enemy with Counter.', N'[Counter] Reduce the Cooldown of Counter by {scale=15|15}% after successfully hitting an enemy with Counter.', N'Viciousness', 2420, N'https://web2.hirez.com/paladins/champion-cards/viciousness.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (419, 12628, N'[Recovery] Regenerate 1 Ammo every 0.5s for {scale=0.5|0.5}s after activating Recovery.', N'[Recovery] Regenerate 1 Ammo every 0.5s for {scale=0.5|0.5}s after activating Recovery.', N'Vigor', 2147, N'https://web2.hirez.com/paladins/champion-cards/vigor.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (420, 22876, N'[Bulwark] Heal for {scale=25|25} every 1s while Bulwark is active.', N'[Bulwark] Heal for {scale=25|25} every 1s while Bulwark is active.', N'Vigorous Defense', 2479, N'https://web2.hirez.com/paladins/champion-cards/vigorous-defense.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (421, 19477, N'[Weapon] Talon Rifle now applies an additional 50 damage over 3s to enemies hit, stacking up to 3 times and refreshing on hit, but you are now unable to get headshots.', N'[Weapon] Talon Rifle now applies an additional 50 damage over 3s to enemies hit, stacking up to 3 times and refreshing on hit, but you are now unable to get headshots.', N'Crack Shot', 2438, N'https://web2.hirez.com/paladins/champion-cards/crack-shot.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (422, 25004, N'[Soul Harvest] Reduce your damage taken by {scale=5|5}% for 3s after activating Soul Harvest.', N'[Soul Harvest] Reduce your damage taken by {scale=5|5}% for 3s after activating Soul Harvest.', N'Void Lord', 2528, N'https://web2.hirez.com/paladins/champion-cards/void-lord.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (423, 15655, N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'Wanderlust', 2307, N'https://web2.hirez.com/paladins/champion-cards/wanderlust.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (424, 23480, N'[Agility] Regenerate {scale=4|4} Ammo every 1s while Agility is active.', N'[Agility] Regenerate {scale=4|4} Ammo every 1s while Agility is active.', N'Wanted', 2493, N'https://web2.hirez.com/paladins/champion-cards/wanted.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (425, 11471, N'[Emitter] Increase the duration of Emitter by {scale=1|1}s.', N'[Emitter] Increase the duration of Emitter by {scale=1|1}s.', N'Warden', 2149, N'https://web2.hirez.com/paladins/champion-cards/warden.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (426, 25008, N'[Weapon] Reduce the time it takes to spin up your Hellfire Gatling by {scale=4|4}%.', N'[Weapon] Reduce the time it takes to spin up your Hellfire Gatling by {scale=4|4}%.', N'War-torn Plains', 2528, N'https://web2.hirez.com/paladins/champion-cards/war-torn-plains.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (427, 18404, N'[Siege Shield] Increase the Health of Siege Shield by {scale=200|200}.', N'[Siege Shield] Increase the Health of Siege Shield by {scale=200|200}.', N'Watchtower', 2404, N'https://web2.hirez.com/paladins/champion-cards/watchtower.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (428, 16740, N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'Well-Oiled', 2362, N'https://web2.hirez.com/paladins/champion-cards/well-oiled.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (429, 16849, N'[Rend Soul] Reduce the Cooldown of Rend Soul by {scale=0.5|0.5}s.', N'[Rend Soul] Reduce the Cooldown of Rend Soul by {scale=0.5|0.5}s.', N'Wickedness', 2372, N'https://web2.hirez.com/paladins/champion-cards/wickedness.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (430, 22092, N'[Armor] Increase your Movement Speed by {scale=5|5}% for 4s after getting a Killing Blow or Elimination.', N'[Armor] Increase your Movement Speed by {scale=5|5}% for 4s after getting a Killing Blow or Elimination.', N'Will-o-the-Wisp', 2481, N'https://web2.hirez.com/paladins/champion-cards/will-o-the-wisp.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (431, 23478, N'[Agility] Heal for {scale=20|20} every 1s while Agility is active.', N'[Agility] Heal for {scale=20|20} every 1s while Agility is active.', N'Wind''s Embrace', 2493, N'https://web2.hirez.com/paladins/champion-cards/winds-embrace.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (432, 15711, N'[Rapid Shot] Each arrow of Rapid Shot reduces the Movement Speed of any enemy hit by {scale=5|5}% for 2s.', N'[Rapid Shot] Each arrow of Rapid Shot reduces the Movement Speed of any enemy hit by {scale=5|5}% for 2s.', N'Windwall', 2307, N'https://web2.hirez.com/paladins/champion-cards/windwall.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (433, 22104, N'[Scamper] Reduce your damage taken by {scale=8|8}% while using Scamper.', N'[Scamper] Reduce your damage taken by {scale=8|8}% while using Scamper.', N'Wobbles', 2481, N'https://web2.hirez.com/paladins/champion-cards/wobbles.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (434, 16445, N'[Prowl] Heal for {scale=40|40} every 1s while Prowl is active.', N'[Prowl] Heal for {scale=40|40} every 1s while Prowl is active.', N'Walk it Off', 2338, N'https://web2.hirez.com/paladins/champion-cards/walk-it-off.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (435, 12933, N'[Turret] Increase the Health of your Turret by {scale=150|150}.', N'[Turret] Increase the Health of your Turret by {scale=150|150}.', N'Forged Alloy', 2073, N'https://web2.hirez.com/paladins/champion-cards/forged-alloy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (436, 12282, N'[Armor] Gain a {scale=150|150}-Health Shield for 3s after dropping to or below 50% Health.', N'[Armor] Gain a {scale=150|150}-Health Shield for 3s after dropping to or below 50% Health.', N'Force of Nature', 2254, N'https://web2.hirez.com/paladins/champion-cards/force-of-nature.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (437, 18610, N'[Counter] Increase your Movement Speed by {scale=10|10}% for 3s after activating Counter.', N'[Counter] Increase your Movement Speed by {scale=10|10}% for 3s after activating Counter.', N'Footwork', 2420, N'https://web2.hirez.com/paladins/champion-cards/footwork.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (438, 20063, N'[Calamity Blast] Reduce your damage taken by up to {scale=4|4}% based on the number of Calamity Blast charges you have stored.', N'[Calamity Blast] Reduce your damage taken by up to {scale=4|4}% based on the number of Calamity Blast charges you have stored.', N'Strength of Stone', 2477, N'https://web2.hirez.com/paladins/champion-cards/strength-of-stone.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (439, 15066, N'[Dredge Anchor] Reduce the Cooldown of Dredge Anchor by {scale=0.6|0.6}s.', N'[Dredge Anchor] Reduce the Cooldown of Dredge Anchor by {scale=0.6|0.6}s.', N'Strongarm', 2288, N'https://web2.hirez.com/paladins/champion-cards/strongarm.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (440, 16634, N'[Impasse] Apply a Knockback of {scale=300|300} to yourself after using Impasse underneath yourself.', N'[Impasse] Apply a Knockback of {scale=300|300} to yourself after using Impasse underneath yourself.', N'Summit', 2348, N'https://web2.hirez.com/paladins/champion-cards/summit.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (441, 18773, N'[Valor] Reduce the Cooldown of Grace by {scale=0.5|0.5}s for each enemy hit with Valor.', N'[Valor] Reduce the Cooldown of Grace by {scale=0.5|0.5}s for each enemy hit with Valor.', N'Swift Jade', 2417, N'https://web2.hirez.com/paladins/champion-cards/swift-jade.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (442, 15355, N'[Mending Spirits] Increase the Movement Speed of allies affected by Mending Spirits by {scale=5|5}%.', N'[Mending Spirits] Increase the Movement Speed of allies affected by Mending Spirits by {scale=5|5}%.', N'Swift Spirits', 2303, N'https://web2.hirez.com/paladins/champion-cards/swift-spirits.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (443, 14770, N'[Soar] Increase your Movement Speed during Soar by {scale=5|5}%.', N'[Soar] Increase your Movement Speed during Soar by {scale=5|5}%.', N'Swift Witch', 2094, N'https://web2.hirez.com/paladins/champion-cards/swift-witch.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (444, 22093, N'[Armor] Increase the Healing you receive by {scale=7|7}% while at or below 50% Health.', N'[Armor] Increase the Healing you receive by {scale=7|7}% while at or below 50% Health.', N'Symbiotic', 2481, N'https://web2.hirez.com/paladins/champion-cards/symbiotic.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (445, 14679, N'[Disengage] Reduce the Cooldown of Disengage by {scale=1|1}s.', N'[Disengage] Reduce the Cooldown of Disengage by {scale=1|1}s.', N'Territorial', 2092, N'https://web2.hirez.com/paladins/champion-cards/territorial.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (446, 14065, N'[Thrust] Reduce the Cooldown of Thrust by {scale=15|15}% when you get a Killing Blow.', N'[Thrust] Reduce the Cooldown of Thrust by {scale=15|15}% when you get a Killing Blow.', N'Thrill of the Hunt', 2277, N'https://web2.hirez.com/paladins/champion-cards/thrill-of-the-hunt.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (447, 18380, N'[Shoulder Bash] Heal for {scale=200|200} after hitting an enemy with Shoulder Bash.', N'[Shoulder Bash] Heal for {scale=200|200} after hitting an enemy with Shoulder Bash.', N'Thrive', 2404, N'https://web2.hirez.com/paladins/champion-cards/thrive.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (448, 16172, N'[Protection] Generate {scale=2|2} Ammo for the target of your Protection.', N'[Protection] Generate {scale=2|2} Ammo for the target of your Protection.', N'Timeshaper', 2322, N'https://web2.hirez.com/paladins/champion-cards/timeshaper.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (449, 12781, N'[Armor] Gain a {scale=150|150}-Health Shield for 3s after dropping to or below 30% Health.', N'[Armor] Gain a {scale=150|150}-Health Shield for 3s after dropping to or below 30% Health.', N'Totemic Rescue', 2093, N'https://web2.hirez.com/paladins/champion-cards/totemic-rescue.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (450, 20270, N'[Weapon] Hitting an enemy with a weapon shot has a {scale=12|12}% chance to not consume Ammo.', N'[Weapon] Hitting an enemy with a weapon shot has a {scale=12|12}% chance to not consume Ammo.', N'Unchecked Ambition', 2480, N'https://web2.hirez.com/paladins/champion-cards/unchecked-ambition.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (451, 13384, N'[Defiance] Heal for {scale=225|225} after getting a Killing Blow with Defiance.', N'[Defiance] Heal for {scale=225|225} after getting a Killing Blow with Defiance.', N'Vengeance', 2205, N'https://web2.hirez.com/paladins/champion-cards/vengeance.jpg', 1, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (452, 12974, N'[Blossom] Increase the radius of Blossom by {scale=4|4}%.', N'[Blossom] Increase the radius of Blossom by {scale=4|4}%.', N'Verdant Expanse', 2254, N'https://web2.hirez.com/paladins/champion-cards/verdant-expanse.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (453, 11978, N'[Weapon] Increase your Movement Speed by {scale=10|10}% for 4s after getting an Elimination.', N'[Weapon] Increase your Movement Speed by {scale=10|10}% for 4s after getting an Elimination.', N'Victory Rush', 2057, N'https://web2.hirez.com/paladins/champion-cards/victory-rush.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (454, 16188, N'[Recharge] Heal for {scale=75|75} after activating Recharge.', N'[Recharge] Heal for {scale=75|75} after activating Recharge.', N'Vital Grasp', 2322, N'https://web2.hirez.com/paladins/champion-cards/vital-grasp.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (455, 15888, N'[Fire Bomb] Reduce the Cooldown of Fire Bomb by {scale=0.6|0.6}s.', N'[Fire Bomb] Reduce the Cooldown of Fire Bomb by {scale=0.6|0.6}s.', N'Volatile', 2314, N'https://web2.hirez.com/paladins/champion-cards/volatile.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (456, 18350, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'War Machine', 2404, N'https://web2.hirez.com/paladins/champion-cards/war-machine.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (457, 19899, N'[Armor] Receive {scale=5|5}% increased Healing while at or below 50% Health.', N'[Armor] Receive {scale=5|5}% increased Healing while at or below 50% Health.', N'We Can Rebuild Him', 2477, N'https://web2.hirez.com/paladins/champion-cards/we-can-rebuild-him.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (458, 13210, N'[Oppressor Mine] Activating Oppressor Mine generates {scale=3|3} Ammo.', N'[Oppressor Mine] Activating Oppressor Mine generates {scale=3|3} Ammo.', N'Well-Stocked', 2249, N'https://web2.hirez.com/paladins/champion-cards/well-stocked.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (459, 16787, N'[Combat Slide] Reduce the Cooldown of Combat Slide by {scale=5|5}% for each enemy hit by your weapons.', N'[Combat Slide] Reduce the Cooldown of Combat Slide by {scale=5|5}% for each enemy hit by your weapons.', N'Wicked Don''t Rest', 2362, N'https://web2.hirez.com/paladins/champion-cards/wicked-dont-rest.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (460, 18585, N'[Whirl] Reduce the Cooldown of Whirl by {scale=0.5|0.5}s for each enemy it hits.', N'[Whirl] Reduce the Cooldown of Whirl by {scale=0.5|0.5}s for each enemy it hits.', N'Wildfire', 2420, N'https://web2.hirez.com/paladins/champion-cards/wildfire.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (461, 16411, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Street Cred', 2338, N'https://web2.hirez.com/paladins/champion-cards/street-cred.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (462, 13320, N'[Nether Step] Heal for {scale=40|40} after activating Nether Step.', N'[Nether Step] Heal for {scale=40|40} after activating Nether Step.', N'Abyss Walker', 2205, N'https://web2.hirez.com/paladins/champion-cards/abyss-walker.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (463, 16674, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Steadfast', 2348, N'https://web2.hirez.com/paladins/champion-cards/steadfast.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (464, 17018, N'[Seedling] Reduce the Cooldown of Seedling by {scale=0.5|0.5}s for each enemy hit by it.', N'[Seedling] Reduce the Cooldown of Seedling by {scale=0.5|0.5}s for each enemy hit by it.', N'Sprouts', 2393, N'https://web2.hirez.com/paladins/champion-cards/sprouts.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (465, 12653, N'[Healing Potion] Reduce the Cooldown of Healing Potion by {scale=0.6|0.6}s for each ally it hits.', N'[Healing Potion] Reduce the Cooldown of Healing Potion by {scale=0.6|0.6}s for each ally it hits.', N'Reload', 2056, N'https://web2.hirez.com/paladins/champion-cards/reload.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (466, 13161, N'[Transporter] Heal for 25% of your maximum Health after Teleporting with Transporter.', N'[Transporter] Heal for 25% of your maximum Health after Teleporting with Transporter.', N'Restore', 2249, N'https://web2.hirez.com/paladins/champion-cards/restore.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (467, 19607, N'[Rune of Travel] Heal for {scale=100|100} after Teleporting to your Rune of Travel.', N'[Rune of Travel] Heal for {scale=100|100} after Teleporting to your Rune of Travel.', N'Revitalize', 2472, N'https://web2.hirez.com/paladins/champion-cards/revitalize.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (468, 13414, N'[Dimensional Link] Spawn an Illusion with {scale=20|20}% Health when you swap to the spot of a dead Illusion.', N'[Dimensional Link] Spawn an Illusion with {scale=20|20}% Health when you swap to the spot of a dead Illusion.', N'Rewind', 2267, N'https://web2.hirez.com/paladins/champion-cards/rewind.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (469, 15715, N'[Withdraw] Increase your Movement Speed by {scale=7|7}% for 3s after using Withdraw.', N'[Withdraw] Increase your Movement Speed by {scale=7|7}% for 3s after using Withdraw.', N'Run Like the Wind', 2307, N'https://web2.hirez.com/paladins/champion-cards/run-like-the-wind.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (470, 16612, N'[Warder''s Field] Reduce your damage taken by {scale=5|5}% while standing in Warder''s Field.', N'[Warder''s Field] Reduce your damage taken by {scale=5|5}% while standing in Warder''s Field.', N'Sacred Ground', 2348, N'https://web2.hirez.com/paladins/champion-cards/sacred-ground.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (471, 12526, N'[Charge] Gain a {scale=150|150}-Health Shield for 3s after you use Charge.', N'[Charge] Gain a {scale=150|150}-Health Shield for 3s after you use Charge.', N'Safe Travel', 2071, N'https://web2.hirez.com/paladins/champion-cards/safe-travel.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (472, 20289, N'[Deflector Shield] While Deflector Shield is active {scale=10|10}% of damage dealt to you is instead dealt to the Shield.', N'[Deflector Shield] While Deflector Shield is active {scale=10|10}% of damage dealt to you is instead dealt to the Shield.', N'Scapegoat', 2480, N'https://web2.hirez.com/paladins/champion-cards/scapegoat.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (473, 14457, N'[Hustle] Reduce damage taken by {scale=3|3}% while using Hustle.', N'[Hustle] Reduce damage taken by {scale=3|3}% while using Hustle.', N'Scramble', 2285, N'https://web2.hirez.com/paladins/champion-cards/scramble.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (474, 16201, N'[Nullify] Reduce the Cooldown of Nullify by {scale=1|1}s.', N'[Nullify] Reduce the Cooldown of Nullify by {scale=1|1}s.', N'Scribe''s Wit', 2322, N'https://web2.hirez.com/paladins/champion-cards/scribes-wit.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (475, 14654, N'[Weapon] Reduce the Cooldown of Reversal by {scale=0.5|0.5}s after hitting an enemy with your weapon.', N'[Weapon] Reduce the Cooldown of Reversal by {scale=0.5|0.5}s after hitting an enemy with your weapon.', N'Seething Hatred', 2205, N'https://web2.hirez.com/paladins/champion-cards/seething-hatred.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (476, 22879, N'[Bulwark] Increase the Health of your Bulwark by {scale=200|200}.', N'[Bulwark] Increase the Health of your Bulwark by {scale=200|200}.', N'Shield Wall', 2479, N'https://web2.hirez.com/paladins/champion-cards/shield-wall.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (477, 16466, N'[Pounce] Reduce the Cooldown of Pounce by {scale=0.5|0.5}s.', N'[Pounce] Reduce the Cooldown of Pounce by {scale=0.5|0.5}s.', N'Shred', 2338, N'https://web2.hirez.com/paladins/champion-cards/shred.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (478, 15058, N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'Shrewd Move', 2056, N'https://web2.hirez.com/paladins/champion-cards/shrewd-move.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (479, 12690, N'[Explosive Flask] Reduce the Cooldown of Explosive Flask by {scale=0.6|0.6}s.', N'[Explosive Flask] Reduce the Cooldown of Explosive Flask by {scale=0.6|0.6}s.', N'Side Tanks', 2056, N'https://web2.hirez.com/paladins/champion-cards/side-tanks.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (480, 13322, N'[Nether Step] Generate {scale=1|1} Ammo after activating Nether Step.', N'[Nether Step] Generate {scale=1|1} Ammo after activating Nether Step.', N'Sleight of Hand', 2205, N'https://web2.hirez.com/paladins/champion-cards/sleight-of-hand.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (481, 15343, N'[Armor] Increase your Movement Speed by {scale=2|2}%.', N'[Armor] Increase your Movement Speed by {scale=2|2}%.', N'Snake Pit', 2303, N'https://web2.hirez.com/paladins/champion-cards/snake-pit.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (482, 14687, N'[Armor] Reset the Cooldown of Dodge Roll after dropping to or below {scale=15|15}% Health.', N'[Armor] Reset the Cooldown of Dodge Roll after dropping to or below {scale=15|15}% Health.', N'Somersault', 2092, N'https://web2.hirez.com/paladins/champion-cards/somersault.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (483, 19241, N'[Stellar Wind] Increase your jump height by {scale=12|12}% while using Stellar Wind.', N'[Stellar Wind] Increase your jump height by {scale=12|12}% while using Stellar Wind.', N'Space Jam', 2431, N'https://web2.hirez.com/paladins/champion-cards/space-jam.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (484, 13239, N'[Smoke Screen] Generate {scale=4|4} Ammo after entering Smoke Screen. You must spend at least 4s out of Smoke Screen before this effect can apply again.', N'[Smoke Screen] Generate {scale=4|4} Ammo after entering Smoke Screen. You must spend at least 4s out of Smoke Screen before this effect can apply again.', N'Specter', 2057, N'https://web2.hirez.com/paladins/champion-cards/specter.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (485, 14449, N'[Weapon] Generate {scale=7|7} Ammo after getting a Killing Blow or Elimination.', N'[Weapon] Generate {scale=7|7} Ammo after getting a Killing Blow or Elimination.', N'Speed Load', 2285, N'https://web2.hirez.com/paladins/champion-cards/speed-load.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (486, 11463, N'[Healing Totem] Allies inside your Healing Totem gain {scale=8|8}% increased Movement Speed for 1s.', N'[Healing Totem] Allies inside your Healing Totem gain {scale=8|8}% increased Movement Speed for 1s.', N'Spirit''s Grace', 2093, N'https://web2.hirez.com/paladins/champion-cards/spirits-grace.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (487, 14622, N'[Shell Spin] Heal for {scale=250|250} for each enemy hit with Shell Spin.', N'[Shell Spin] Heal for {scale=250|250} for each enemy hit with Shell Spin.', N'Spring Tide', 2288, N'https://web2.hirez.com/paladins/champion-cards/spring-tide.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (488, 13390, N'[Illusion] Increase the Health of each of your Illusions by {scale=100|100}.', N'[Illusion] Increase the Health of each of your Illusions by {scale=100|100}.', N'Squadron', 2267, N'https://web2.hirez.com/paladins/champion-cards/squadron.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (489, 14810, N'[Defiance] Reduce the Cooldown of Nether Step by {scale=1.2|1.2}s after hitting an enemy with Defiance.', N'[Defiance] Reduce the Cooldown of Nether Step by {scale=1.2|1.2}s after hitting an enemy with Defiance.', N'Abyssal Touch', 2205, N'https://web2.hirez.com/paladins/champion-cards/abyssal-touch.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (490, 12741, N'[Barricade] Passing through your Barricade increases the Movement Speed of yourself or your allies by {scale=6|6}% for 5s.', N'[Barricade] Passing through your Barricade increases the Movement Speed of yourself or your allies by {scale=6|6}% for 5s.', N'Accelerator Field', 2073, N'https://web2.hirez.com/paladins/champion-cards/accelerator-field.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (491, 14392, N'[Poppy Bomb] Increase your air control by {scale=10|10}% until you land after launching yourself with Poppy Bomb.', N'[Poppy Bomb] Increase your air control by {scale=10|10}% until you land after launching yourself with Poppy Bomb.', N'Air Blast', 2281, N'https://web2.hirez.com/paladins/champion-cards/air-blast.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (492, 18809, N'[Grace] Gain {scale=5|5}% Movement Speed for 3s after using Grace.', N'[Grace] Gain {scale=5|5}% Movement Speed for 3s after using Grace.', N'Divine Right', 2417, N'https://web2.hirez.com/paladins/champion-cards/divine-right.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (493, 12792, N'[Blast Shot] Heal for {scale=75|75} over 2s for each enemy hit by Blast Shot.', N'[Blast Shot] Heal for {scale=75|75} over 2s for each enemy hit by Blast Shot.', N'Drain Life', 2092, N'https://web2.hirez.com/paladins/champion-cards/drain-life.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (494, 18765, N'[Valor] Generate {scale=1|1} Ammo for each enemy hit with Valor.', N'[Valor] Generate {scale=1|1} Ammo for each enemy hit with Valor.', N'Eagle''s Emerald', 2417, N'https://web2.hirez.com/paladins/champion-cards/eagles-emerald.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (495, 15346, N'[Mending Spirits] Reduce the Cooldown of Mending Spirits by {scale=0.5|0.5}s if you miss.', N'[Mending Spirits] Reduce the Cooldown of Mending Spirits by {scale=0.5|0.5}s if you miss.', N'Eerie Presence', 2303, N'https://web2.hirez.com/paladins/champion-cards/eerie-presence.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (496, 16166, N'[Recharge] Increase your Movement Speed by {scale=10|10}% while using Recharge.', N'[Recharge] Increase your Movement Speed by {scale=10|10}% while using Recharge.', N'Eldritch Speed', 2322, N'https://web2.hirez.com/paladins/champion-cards/eldritch-speed.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (497, 19476, N'[Stealth] Heal for {scale=100|100} after entering Stealth at or below 65% Health.', N'[Stealth] Heal for {scale=100|100} after entering Stealth at or below 65% Health.', N'Escape Plan', 2438, N'https://web2.hirez.com/paladins/champion-cards/escape-plan.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (498, 19619, N'[Rune of Travel] Increase your Movement Speed by {scale=8|8}% while Rune of Travel is active.', N'[Rune of Travel] Increase your Movement Speed by {scale=8|8}% while Rune of Travel is active.', N'Evanescent', 2472, N'https://web2.hirez.com/paladins/champion-cards/evanescent.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (499, 22874, N'[Weapon] Increase your maximum Ammo by {scale=3|3}.', N'[Weapon] Increase your maximum Ammo by {scale=3|3}.', N'Excessive Force', 2479, N'https://web2.hirez.com/paladins/champion-cards/excessive-force.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (500, 13081, N'[Heroic Leap] Hitting at least one champion with Heroic Leap reduces its Cooldown by {scale=1|1}s.', N'[Heroic Leap] Hitting at least one champion with Heroic Leap reduces its Cooldown by {scale=1|1}s.', N'Exhilarate', 2147, N'https://web2.hirez.com/paladins/champion-cards/exhilarate.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (501, 14280, N'[Advance] Generate {scale=15|15} Ammo after using Advance.', N'[Advance] Generate {scale=15|15} Ammo after using Advance.', N'Extended Magazines', 2149, N'https://web2.hirez.com/paladins/champion-cards/extended-magazines.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (502, 16881, N'[Restore Soul] Reduce the Cooldown of Shadow Travel by {scale=0.8|0.8}s after activating Restore Soul.', N'[Restore Soul] Reduce the Cooldown of Shadow Travel by {scale=0.8|0.8}s after activating Restore Soul.', N'Fade to Black', 2372, N'https://web2.hirez.com/paladins/champion-cards/fade-to-black.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (503, 14404, N'[Grumpy Bomb] Increase Grumpy Bomb’s Stun duration by {scale=0.1|0.1}s.', N'[Grumpy Bomb] Increase Grumpy Bomb’s Stun duration by {scale=0.1|0.1}s.', N'Fallout', 2281, N'https://web2.hirez.com/paladins/champion-cards/fallout.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (504, 12793, N'[Weapon] Increase your Reload Speed by {scale=12|12}% for 5s after getting an Elimination.', N'[Weapon] Increase your Reload Speed by {scale=12|12}% for 5s after getting an Elimination.', N'Fatal Sign', 2092, N'https://web2.hirez.com/paladins/champion-cards/fatal-sign.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (505, 15344, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Feed the Spirits', 2303, N'https://web2.hirez.com/paladins/champion-cards/feed-the-spirits.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (506, 14423, N'[Iron Sights] Increase your Movement Speed by {scale=10|10}% while using Iron Sights.', N'[Iron Sights] Increase your Movement Speed by {scale=10|10}% while using Iron Sights.', N'Firing Stance', 2285, N'https://web2.hirez.com/paladins/champion-cards/firing-stance.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (507, 16819, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Flora', 2393, N'https://web2.hirez.com/paladins/champion-cards/flora.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (508, 16791, N'[In Pursuit] Heal for {scale=25|25} for each shot hit while using In Pursuit.', N'[In Pursuit] Heal for {scale=25|25} for each shot hit while using In Pursuit.', N'Fortitude', 2362, N'https://web2.hirez.com/paladins/champion-cards/fortitude.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (509, 13401, N'[Shatter] Heal your Illusions for {scale=20|20}% of their maximum Health after activating Shatter.', N'[Shatter] Heal your Illusions for {scale=20|20}% of their maximum Health after activating Shatter.', N'Fracture', 2267, N'https://web2.hirez.com/paladins/champion-cards/fracture.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (510, 14079, N'[Armor] Increase your Booster fuel capacity by {scale=10|10}%.', N'[Armor] Increase your Booster fuel capacity by {scale=10|10}%.', N'Fuel Tank', 2277, N'https://web2.hirez.com/paladins/champion-cards/fuel-tank.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (511, 18372, N'[Shoulder Bash] Reduce the Cooldown of Shoulder Bash by {scale=0.8|0.8}s.', N'[Shoulder Bash] Reduce the Cooldown of Shoulder Bash by {scale=0.8|0.8}s.', N'Gate-Crasher', 2404, N'https://web2.hirez.com/paladins/champion-cards/gate-crasher.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (512, 13340, N'[Healing Potion] Heal yourself for {scale=20|20}% of Healing Potion''s effect if you hit an ally but not yourself.', N'[Healing Potion] Heal yourself for {scale=20|20}% of Healing Potion''s effect if you hit an ally but not yourself.', N'Gift-Giver', 2056, N'https://web2.hirez.com/paladins/champion-cards/gift-giver.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (513, 16124, N'[Armor] Gain a {scale=100|100}-Health Shield after getting an Elimination.', N'[Armor] Gain a {scale=100|100}-Health Shield after getting an Elimination.', N'Glyph of Siphoning', 2322, N'https://web2.hirez.com/paladins/champion-cards/glyph-of-siphoning.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (514, 12008, N'[Explosive Flask] Increase the duration of Explosive Flask''s Slow by {scale=0.25|0.25}s.', N'[Explosive Flask] Increase the duration of Explosive Flask''s Slow by {scale=0.25|0.25}s.', N'Graviton', 2056, N'https://web2.hirez.com/paladins/champion-cards/graviton.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (515, 19996, N'[Calamity Blast] Heal for {scale=60|60} for each enemy hit by Calamity Blast.', N'[Calamity Blast] Heal for {scale=60|60} for each enemy hit by Calamity Blast.', N'Devastation', 2477, N'https://web2.hirez.com/paladins/champion-cards/devastation.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (516, 15056, N'[Recovery] Reduce your damage taken by {scale=6|6}% for 2s after using Recovery.', N'[Recovery] Reduce your damage taken by {scale=6|6}% for 2s after using Recovery.', N'Deep Breath', 2147, N'https://web2.hirez.com/paladins/champion-cards/deep-breath.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (517, 16834, N'[Shadow Travel] Increase your Movement Speed by {scale=8|8}% while Shadow Travel is active.', N'[Shadow Travel] Increase your Movement Speed by {scale=8|8}% while Shadow Travel is active.', N'Dark Whisper', 2372, N'https://web2.hirez.com/paladins/champion-cards/dark-whisper.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (518, 16838, N'[Rend Soul] Every Soul Charge you detonate generates {scale=1|1} Ammo.', N'[Rend Soul] Every Soul Charge you detonate generates {scale=1|1} Ammo.', N'Dark Sight', 2372, N'https://web2.hirez.com/paladins/champion-cards/dark-sight.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (519, 13213, N'[Oppressor Mine] Increase the range of Oppressor Mine beams by {scale=20|20}%.', N'[Oppressor Mine] Increase the range of Oppressor Mine beams by {scale=20|20}%.', N'Amplitude', 2249, N'https://web2.hirez.com/paladins/champion-cards/amplitude.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (520, 19599, N'[Overcharge] Increase the duration of Overcharge by {scale=0.2|0.2}s.', N'[Overcharge] Increase the duration of Overcharge by {scale=0.2|0.2}s.', N'Antediluvian', 2472, N'https://web2.hirez.com/paladins/champion-cards/antediluvian.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (521, 16197, N'[Nullify] Gain a {scale=100|100}-Health Shield after activating Nullify.', N'[Nullify] Gain a {scale=100|100}-Health Shield after activating Nullify.', N'Arcane Etching', 2322, N'https://web2.hirez.com/paladins/champion-cards/arcane-etching.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (522, 13058, N'[Armor] Increase your Movement Speed by {scale=8|8}% for 5s after getting a Killing Blow.', N'[Armor] Increase your Movement Speed by {scale=8|8}% for 5s after getting a Killing Blow.', N'Avalanche', 2094, N'https://web2.hirez.com/paladins/champion-cards/avalanche.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (523, 14386, N'[Detonate] Reduce the Cooldown of Poppy Bomb by {scale=0.1|0.1}s for each Sticky Bomb you Detonate.', N'[Detonate] Reduce the Cooldown of Poppy Bomb by {scale=0.1|0.1}s for each Sticky Bomb you Detonate.', N'Backdraft', 2281, N'https://web2.hirez.com/paladins/champion-cards/backdraft.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (524, 15886, N'[Nade Launcher] Reduce the Cooldown of Nade Launcher by {scale=0.5|0.5}s.', N'[Nade Launcher] Reduce the Cooldown of Nade Launcher by {scale=0.5|0.5}s.', N'Bandolier', 2314, N'https://web2.hirez.com/paladins/champion-cards/bandolier.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (525, 12954, N'[Armor] Increase your maximum Health by {scale=75|75}.', N'[Armor] Increase your maximum Health by {scale=75|75}.', N'Barkskin', 2254, N'https://web2.hirez.com/paladins/champion-cards/barkskin.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (526, 18368, N'[Siege Shield] Increase the duration of Siege Shield by {scale=0.6|0.6}s.', N'[Siege Shield] Increase the duration of Siege Shield by {scale=0.6|0.6}s.', N'Battlement', 2404, N'https://web2.hirez.com/paladins/champion-cards/battlement.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (527, 18589, N'[Whirl] Increase the travel distance of Whirl by {scale=8|8}%.', N'[Whirl] Increase the travel distance of Whirl by {scale=8|8}%.', N'Blade Dancer', 2420, N'https://web2.hirez.com/paladins/champion-cards/blade-dancer.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (528, 20050, N'[Shatterfall] Gain {scale=6|6}% Power Siphon charge for each enemy hit by Shatterfall.', N'[Shatterfall] Gain {scale=6|6}% Power Siphon charge for each enemy hit by Shatterfall.', N'Blood and Stone', 2477, N'https://web2.hirez.com/paladins/champion-cards/blood-and-stone.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (529, 13152, N'[Transporter] Increase your Movement Speed by {scale=27|27}% for 2s after Teleporting with Transporter.', N'[Transporter] Increase your Movement Speed by {scale=27|27}% for 2s after Teleporting with Transporter.', N'Bob and Weave', 2249, N'https://web2.hirez.com/paladins/champion-cards/bob-and-weave.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (530, 19575, N'[Blitz Upper] Increase the Knockback of Blitz Upper by {scale=15|15}%', N'[Blitz Upper] Increase the Knockback of Blitz Upper by {scale=15|15}%', N'Relic Affinity', 2472, N'https://web2.hirez.com/paladins/champion-cards/relic-affinity.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (531, 14382, N'[Weapon] Reduce the damage you deal to yourself with Sticky Bombs by {scale=20|20}%.', N'[Weapon] Reduce the damage you deal to yourself with Sticky Bombs by {scale=20|20}%.', N'Bomb Shelter', 2281, N'https://web2.hirez.com/paladins/champion-cards/bomb-shelter.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (532, 18362, N'[Kinetic Burst] Heal for {scale=120|120} over 2s for each enemy hit by Kinetic Burst.', N'[Kinetic Burst] Heal for {scale=120|120} over 2s for each enemy hit by Kinetic Burst.', N'Brawl', 2404, N'https://web2.hirez.com/paladins/champion-cards/brawl.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (533, 12689, N'[Net Shot] Gain {scale=12|12}% Lifesteal against targets Slowed by Net Shot.', N'[Net Shot] Gain {scale=12|12}% Lifesteal against targets Slowed by Net Shot.', N'Bully', 2147, N'https://web2.hirez.com/paladins/champion-cards/bully.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (534, 19455, N'[Quick Switch] Swapping to your Pistol grants {scale=10|10}% Lifesteal for 3s.', N'[Quick Switch] Swapping to your Pistol grants {scale=10|10}% Lifesteal for 3s.', N'Bushwhack', 2438, N'https://web2.hirez.com/paladins/champion-cards/bushwhack.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (535, 14216, N'[Reversal] Generate {scale=2|2} Ammo after activating Reversal.', N'[Reversal] Generate {scale=2|2} Ammo after activating Reversal.', N'Buying Time', 2205, N'https://web2.hirez.com/paladins/champion-cards/buying-time.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (536, 11593, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Cavalier', 2071, N'https://web2.hirez.com/paladins/champion-cards/cavalier.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (537, 15120, N'[Fire Spit] Reduce the Cooldown of Thrust by {scale=1.2|1.2}s for each enemy Champion hit with Fire Spit.', N'[Fire Spit] Reduce the Cooldown of Thrust by {scale=1.2|1.2}s for each enemy Champion hit with Fire Spit.', N'Condescension', 2277, N'https://web2.hirez.com/paladins/champion-cards/condescension.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (538, 20282, N'[Precision Sights] Reduce the Cooldown of Sensor Drone by {scale=0.08|0.08}s for every enemy hit while Precision Sights is active. ', N'[Precision Sights] Reduce the Cooldown of Sensor Drone by {scale=0.08|0.08}s for every enemy hit while Precision Sights is active. ', N'Controlling Nature', 2480, N'https://web2.hirez.com/paladins/champion-cards/controlling-nature.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (539, 13123, N'[Healing Totem] Increase the duration of Healing Totem by {scale=0.2|0.2}s.', N'[Healing Totem] Increase the duration of Healing Totem by {scale=0.2|0.2}s.', N'Crackle', 2093, N'https://web2.hirez.com/paladins/champion-cards/crackle.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (540, 14698, N'[Shell Spin] Reduce the Cooldown of Shell Spin by {scale=1|1}s for each enemy it hits.', N'[Shell Spin] Reduce the Cooldown of Shell Spin by {scale=1|1}s for each enemy it hits.', N'Crashing Wave', 2288, N'https://web2.hirez.com/paladins/champion-cards/crashing-wave.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (541, 14970, N'[Missile Launcher] Reduce the Cooldown of Missile Launcher by {scale=0.7|0.7}s.', N'[Missile Launcher] Reduce the Cooldown of Missile Launcher by {scale=0.7|0.7}s.', N'Crystal Capacitor', 2149, N'https://web2.hirez.com/paladins/champion-cards/crystal-capacitor.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (542, 19579, N'[Blitz Upper] Heal for {scale=70|70} after activating Blitz Upper.', N'[Blitz Upper] Heal for {scale=70|70} after activating Blitz Upper.', N'Daredevil', 2472, N'https://web2.hirez.com/paladins/champion-cards/daredevil.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (543, 12942, N'[Rocket Boots] Gain a {scale=150|150}-Health Shield for 3s after activating Rocket Boots.', N'[Rocket Boots] Gain a {scale=150|150}-Health Shield for 3s after activating Rocket Boots.', N'Bowling Ball', 2073, N'https://web2.hirez.com/paladins/champion-cards/bowling-ball.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (544, 12865, N'[Soar] Increase the duration of Soar by {scale=0.5|0.5}s.', N'[Soar] Increase the duration of Soar by {scale=0.5|0.5}s.', N'Great Distance', 2094, N'https://web2.hirez.com/paladins/champion-cards/great-distance.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (545, 19441, N'[Weapon] Reduce the Movement Speed penalty of Scope by {scale=20|20}%.', N'[Weapon] Reduce the Movement Speed penalty of Scope by {scale=20|20}%.', N'Relentless', 2438, N'https://web2.hirez.com/paladins/champion-cards/relentless.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (546, 12824, N'[Emitter] Reduce the Cooldown of Emitter by {scale=1|1}s.', N'[Emitter] Reduce the Cooldown of Emitter by {scale=1|1}s.', N'Refraction', 2149, N'https://web2.hirez.com/paladins/champion-cards/refraction.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (547, 13214, N'[Weapon] Hitting an enemy with your Sniper Rifle in Carbine mode lowers the Cooldown of Transporter by {scale=0.15|0.15}s.', N'[Weapon] Hitting an enemy with your Sniper Rifle in Carbine mode lowers the Cooldown of Transporter by {scale=0.15|0.15}s.', N'Calibrate', 2249, N'https://web2.hirez.com/paladins/champion-cards/calibrate.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (548, 18358, N'[Kinetic Burst] Reduce the Cooldown of Kinetic Burst by {scale=0.6|0.6}s.', N'[Kinetic Burst] Reduce the Cooldown of Kinetic Burst by {scale=0.6|0.6}s.', N'Castle-Forged', 2404, N'https://web2.hirez.com/paladins/champion-cards/castle-forged.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (549, 16438, N'[Prowl] Increase the Movement Speed bonus while using Prowl by {scale=10|10}%.', N'[Prowl] Increase the Movement Speed bonus while using Prowl by {scale=10|10}%.', N'Chase', 2338, N'https://web2.hirez.com/paladins/champion-cards/chase.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (550, 15161, N'[Crippling Throw] Reduce the Cooldown of Crippling Throw by {scale=0.6|0.6}s.', N'[Crippling Throw] Reduce the Cooldown of Crippling Throw by {scale=0.6|0.6}s.', N'Chop Down', 2254, N'https://web2.hirez.com/paladins/champion-cards/chop-down.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (551, 11422, N'[Hidden] Increase the duration of Hidden by {scale=1|1}s.', N'[Hidden] Increase the duration of Hidden by {scale=1|1}s.', N'Cloak', 2057, N'https://web2.hirez.com/paladins/champion-cards/cloak.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (552, 22880, N'[Commander''s Grab] Reduce your damage taken by {scale=8|8}% for 2s after hitting an enemy with Commander''s Grab.', N'[Commander''s Grab] Reduce your damage taken by {scale=8|8}% for 2s after hitting an enemy with Commander''s Grab.', N'Close and Personal', 2479, N'https://web2.hirez.com/paladins/champion-cards/close-and-personal.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (553, 14758, N'[Ice Block] Reduce the Cooldown of Ice Block by {scale=1|1}s.', N'[Ice Block] Reduce the Cooldown of Ice Block by {scale=1|1}s.', N'Cold-Blooded', 2094, N'https://web2.hirez.com/paladins/champion-cards/cold-blooded.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (554, 16803, N'[In Pursuit] Reduce the Cooldown of In Pursuit by {scale=1.2|1.2}s.', N'[In Pursuit] Reduce the Cooldown of In Pursuit by {scale=1.2|1.2}s.', N'Compel', 2362, N'https://web2.hirez.com/paladins/champion-cards/compel.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (555, 11437, N'[Net Shot] Reduce the Cooldown of Net Shot by {scale=1|1}s.', N'[Net Shot] Reduce the Cooldown of Net Shot by {scale=1|1}s.', N'Concussion', 2147, N'https://web2.hirez.com/paladins/champion-cards/concussion.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (556, 16735, N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'Conditioned', 2362, N'https://web2.hirez.com/paladins/champion-cards/conditioned.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (557, 14355, N'[Grumpy Bomb] Reduce the Cooldown of Grumpy Bomb by {scale=0.6|0.6}s.', N'[Grumpy Bomb] Reduce the Cooldown of Grumpy Bomb by {scale=0.6|0.6}s.', N'Countdown', 2281, N'https://web2.hirez.com/paladins/champion-cards/countdown.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (558, 13394, N'[Armor] Gain a {scale=150|150}-Health Shield for 4s after dropping to or below 30% Health.', N'[Armor] Gain a {scale=150|150}-Health Shield for 4s after dropping to or below 30% Health.', N'Countermeasure', 2149, N'https://web2.hirez.com/paladins/champion-cards/countermeasure.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (559, 22110, N'[Magic Barrier] Heal for {scale=50|50} every 1s while Magic Barrier is active.', N'[Magic Barrier] Heal for {scale=50|50} every 1s while Magic Barrier is active.', N'Cozy', 2481, N'https://web2.hirez.com/paladins/champion-cards/cozy.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (560, 19934, N'[Shatterfall] Heal for {scale=100|100} for each enemy hit with Shatterfall.', N'[Shatterfall] Heal for {scale=100|100} for each enemy hit with Shatterfall.', N'Despoiler', 2477, N'https://web2.hirez.com/paladins/champion-cards/despoiler.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (561, 19451, N'[Quick Switch] Reduce the time it takes to Quick Switch to your Pistol by {scale=10|10}%.', N'[Quick Switch] Reduce the time it takes to Quick Switch to your Pistol by {scale=10|10}%.', N'Dexterous', 2438, N'https://web2.hirez.com/paladins/champion-cards/dexterous.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (562, 14710, N'[Armor] Reduce the Cooldown of Shell Spin by {scale=20|20}% after falling to or below 40% Health.', N'[Armor] Reduce the Cooldown of Shell Spin by {scale=20|20}% after falling to or below 40% Health.', N'Ebb and Flow', 2288, N'https://web2.hirez.com/paladins/champion-cards/ebb-and-flow.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (563, 16876, N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'Ebon Dynamo', 2372, N'https://web2.hirez.com/paladins/champion-cards/ebon-dynamo.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (564, 15068, N'[Armor] Reduce your active Cooldowns by {scale=1|1}s after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=1|1}s after getting an Elimination.', N'Encouragement', 2267, N'https://web2.hirez.com/paladins/champion-cards/encouragement.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (565, 16845, N'[Rend Soul] Increase the Healing done by Rend Soul by {scale=8|8}%.', N'[Rend Soul] Increase the Healing done by Rend Soul by {scale=8|8}%.', N'Essence Rip', 2372, N'https://web2.hirez.com/paladins/champion-cards/essence-rip.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (566, 14409, N'[Poppy Bomb] Heal for {scale=75|75} after using Poppy Bomb.', N'[Poppy Bomb] Heal for {scale=75|75} after using Poppy Bomb.', N'Explosive Entrance', 2281, N'https://web2.hirez.com/paladins/champion-cards/explosive-entrance.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (567, 19232, N'[Void Grip] Reduce your active Cooldowns by {scale=20|20}% if a victim of your Void Grip dies within 4s of being hit by the ability.', N'[Void Grip] Reduce your active Cooldowns by {scale=20|20}% if a victim of your Void Grip dies within 4s of being hit by the ability.', N'Falling Star', 2431, N'https://web2.hirez.com/paladins/champion-cards/falling-star.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (568, 12803, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Fearless Leader', 2071, N'https://web2.hirez.com/paladins/champion-cards/fearless-leader.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (569, 12710, N'[Turret] Heal for {scale=20|20} each time one of your Turrets hits an enemy.', N'[Turret] Heal for {scale=20|20} each time one of your Turrets hits an enemy.', N'Field Deploy', 2073, N'https://web2.hirez.com/paladins/champion-cards/field-deploy.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (570, 15699, N'[Weapon] Reduce your active Cooldowns by {scale=10|10}% when you get an Elimination.', N'[Weapon] Reduce your active Cooldowns by {scale=10|10}% when you get an Elimination.', N'Bullseye', 2307, N'https://web2.hirez.com/paladins/champion-cards/bullseye.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (571, 15350, N'[Slither] Reduce the Cooldown of Slither by {scale=0.6|0.6}s.', N'[Slither] Reduce the Cooldown of Slither by {scale=0.6|0.6}s.', N'Fleeting', 2303, N'https://web2.hirez.com/paladins/champion-cards/fleeting.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (572, 15149, N'[Shatter] Reduce the Cooldown of Shatter by {scale=0.5|0.5}s.', N'[Shatter] Reduce the Cooldown of Shatter by {scale=0.5|0.5}s.', N'Brittle', 2267, N'https://web2.hirez.com/paladins/champion-cards/brittle.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (573, 18805, N'[Grace] Generate {scale=1|1} Ammo after using Grace.', N'[Grace] Generate {scale=1|1} Ammo after using Grace.', N'Bloodline', 2417, N'https://web2.hirez.com/paladins/champion-cards/bloodline.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (574, 13075, N'[Weapon] Your weapon shots reduce the effect of healing on your target by {25}% for 1.5s.', N'[Weapon] Your weapon shots reduce the effect of healing on your target by {25}% for 1.5s.', N'Cauterize', 0, N'https://web2.hirez.com/paladins/champion-items/cauterize.jpg', 250, N'Burn Card Damage Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (575, 13235, N'[Weapon] Increase your Reload Speed by {20}%.', N'[Weapon] Increase your Reload Speed by {20}%.', N'Deft Hands', 0, N'https://web2.hirez.com/paladins/champion-items/deft-hands.jpg', 250, N'Burn Card Damage Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (576, 13071, N'[Weapon] Your weapon attacks deal {20}% increased Damage to Shields.', N'[Weapon] Your weapon attacks deal {20}% increased Damage to Shields.', N'Wrecker', 0, N'https://web2.hirez.com/paladins/champion-items/wrecker.jpg', 250, N'Burn Card Damage Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (577, 13228, N'[Armor] Reduce the Damage you take from Area of Effect attacks by {7}%.', N'[Armor] Reduce the Damage you take from Area of Effect attacks by {7}%.', N'Blast Shields', 0, N'https://web2.hirez.com/paladins/champion-items/blast-shields.jpg', 300, N'Burn Card Defense Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (578, 13229, N'[Armor] Reduce the Damage you take from Direct attacks by {7}%.', N'[Armor] Reduce the Damage you take from Direct attacks by {7}%.', N'Haven', 0, N'https://web2.hirez.com/paladins/champion-items/haven.jpg', 300, N'Burn Card Defense Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (579, 13253, N'[Armor] Increase the range at which you see nearby stealthed targets by {15} units.', N'[Armor] Increase the range at which you see nearby stealthed targets by {15} units.', N'Illuminate', 0, N'https://web2.hirez.com/paladins/champion-items/illuminate.jpg', 150, N'Burn Card Defense Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (580, 11683, N'[Armor] Reduce the duration and effectiveness of Crowd Control and Slows by {20}%.', N'[Armor] Reduce the duration and effectiveness of Crowd Control and Slows by {20}%.', N'Resilience', 0, N'https://web2.hirez.com/paladins/champion-items/resilience.jpg', 150, N'Burn Card Defense Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (581, 11797, N'[Armor] Getting a kill or elimination heals you for {300} Health.', N'[Armor] Getting a kill or elimination heals you for {300} Health.', N'Kill to Heal', 0, N'https://web2.hirez.com/paladins/champion-items/kill-to-heal.jpg', 200, N'Burn Card Healing Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (582, 12010, N'[Weapon] Your weapon shots gain +{10}% Lifesteal.', N'[Weapon] Your weapon shots gain +{10}% Lifesteal.', N'Life Rip', 0, N'https://web2.hirez.com/paladins/champion-items/life-rip.jpg', 200, N'Burn Card Healing Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (583, 14633, N'[Armor] Receive {5}% more healing from other players.', N'[Armor] Receive {5}% more healing from other players.', N'Rejuvenate', 0, N'https://web2.hirez.com/paladins/champion-items/rejuvenate.jpg', 150, N'Burn Card Healing Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (584, 13224, N'[Armor] Heal for an additional {5}% of your max Health every second when out of combat.', N'[Armor] Heal for an additional {5}% of your max Health every second when out of combat.', N'Veteran', 0, N'https://web2.hirez.com/paladins/champion-items/veteran.jpg', 150, N'Burn Card Healing Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (585, 11723, N'[Armor] Reduce the Cooldown of all your abilities by {10}%.', N'[Armor] Reduce the Cooldown of all your abilities by {10}%.', N'Chronos', 0, N'https://web2.hirez.com/paladins/champion-items/chronos.jpg', 300, N'Burn Card Utility Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (586, 11646, N'[Armor] Increase your Mount Speed by {15}%.', N'[Armor] Increase your Mount Speed by {15}%.', N'Master Riding', 0, N'https://web2.hirez.com/paladins/champion-items/master-riding.jpg', 250, N'Burn Card Utility Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (587, 13165, N'[Armor] Increase your Ultimate charge rate by {10}%.', N'[Armor] Increase your Ultimate charge rate by {10}%.', N'Morale Boost', 0, N'https://web2.hirez.com/paladins/champion-items/morale-boost.jpg', 250, N'Burn Card Utility Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (588, 11826, N'[Armor] Gain {7}% Movement Speed.', N'[Armor] Gain {7}% Movement Speed.', N'Nimble', 0, N'https://web2.hirez.com/paladins/champion-items/nimble.jpg', 150, N'Burn Card Utility Vendor', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (589, 12442, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Adrenaline', 2254, N'https://web2.hirez.com/paladins/champion-cards/adrenaline.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (590, 14090, N'[Armor] Restore {scale=20|20}% of your maximum Booster fuel after getting a Killing Blow or Elimination.', N'[Armor] Restore {scale=20|20}% of your maximum Booster fuel after getting a Killing Blow or Elimination.', N'Altitude', 2277, N'https://web2.hirez.com/paladins/champion-cards/altitude.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (591, 19603, N'[Overcharge] Reduce the Cooldown of Blitz Upper by {scale=0.5|0.5}s for each enemy hit while Overcharge is active.', N'[Overcharge] Reduce the Cooldown of Blitz Upper by {scale=0.5|0.5}s for each enemy hit while Overcharge is active.', N'Ancient Power', 2472, N'https://web2.hirez.com/paladins/champion-cards/ancient-power.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (592, 12722, N'[Shock Pulse] Increase the Chain range of Shock Pulse by {scale=8|8}%.', N'[Shock Pulse] Increase the Chain range of Shock Pulse by {scale=8|8}%.', N'Arc Lightning', 2093, N'https://web2.hirez.com/paladins/champion-cards/arc-lightning.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (593, 14864, N'[Shell Shield] Reduce the Cooldown of Shell Shield by {scale=1|1}s for every 2500 damage Absorbed.', N'[Shell Shield] Reduce the Cooldown of Shell Shield by {scale=1|1}s for every 2500 damage Absorbed.', N'Barrier Reef', 2288, N'https://web2.hirez.com/paladins/champion-cards/barrier-reef.jpg', 1, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (594, 14154, N'[Salvo] Heal for {scale=35|35} for each enemy hit by your Salvo rockets.', N'[Salvo] Heal for {scale=35|35} for each enemy hit by your Salvo rockets.', N'Bask', 2277, N'https://web2.hirez.com/paladins/champion-cards/bask.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (595, 12213, N'[Blast Shot] Reduce the Cooldown of Blast Shot by {scale=0.5|0.5}s for each enemy it hits.', N'[Blast Shot] Reduce the Cooldown of Blast Shot by {scale=0.5|0.5}s for each enemy it hits.', N'Blast Shower', 2092, N'https://web2.hirez.com/paladins/champion-cards/blast-shower.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (596, 16853, N'[Restore Soul] Heal for {scale=70|70} every 1s while channeling Restore Soul.', N'[Restore Soul] Heal for {scale=70|70} every 1s while channeling Restore Soul.', N'Blood Pact', 2372, N'https://web2.hirez.com/paladins/champion-cards/blood-pact.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (597, 22105, N'[Scamper] Increase your Movement Speed by {scale=8|8}% for 2s after using Scamper.', N'[Scamper] Increase your Movement Speed by {scale=8|8}% for 2s after using Scamper.', N'Boop', 2481, N'https://web2.hirez.com/paladins/champion-cards/boop.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (598, 14220, N'[Blink] Heal for {scale=50|50} after using Blink.', N'[Blink] Heal for {scale=50|50} after using Blink.', N'Flicker', 2094, N'https://web2.hirez.com/paladins/champion-cards/flicker.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (599, 17034, N'[Flutter] Reduce the Cooldown of Flutter by {scale=0.6|0.6}s.', N'[Flutter] Reduce the Cooldown of Flutter by {scale=0.6|0.6}s.', N'Flitter', 2393, N'https://web2.hirez.com/paladins/champion-cards/flitter.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (600, 12733, N'[Weightless] Reduces the Cooldown of Weightless by {scale=0.6|0.6}s.', N'[Weightless] Reduces the Cooldown of Weightless by {scale=0.6|0.6}s.', N'From Above', 2056, N'https://web2.hirez.com/paladins/champion-cards/from-above.jpg', 1, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (601, 15663, N'[Rapid Shot] Reduce the Cooldown of Rapid Shot by {scale=0.6|0.6}s.', N'[Rapid Shot] Reduce the Cooldown of Rapid Shot by {scale=0.6|0.6}s.', N'Master Archer', 2307, N'https://web2.hirez.com/paladins/champion-cards/master-archer.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (602, 12485, N'[Fire Spit] Reduce the Cooldown of Fire Spit by {scale=0.5|0.5}s for each enemy hit by it.', N'[Fire Spit] Reduce the Cooldown of Fire Spit by {scale=0.5|0.5}s for each enemy hit by it.', N'Masterful', 2277, N'https://web2.hirez.com/paladins/champion-cards/masterful.jpg', 1, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (603, 14963, N'[Missile Launcher] Reduce your damage taken by {scale=3|3}% for 2s after using Missile Launcher.', N'[Missile Launcher] Reduce your damage taken by {scale=3|3}% for 2s after using Missile Launcher.', N'Metal March', 2149, N'https://web2.hirez.com/paladins/champion-cards/metal-march.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (604, 19922, N'[Power Siphon] Reduce the damage required to generate a Calamity Blast charge by {scale=120|120}.', N'[Power Siphon] Reduce the damage required to generate a Calamity Blast charge by {scale=120|120}.', N'Necromantic Might', 2477, N'https://web2.hirez.com/paladins/champion-cards/necromantic-might.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (605, 16826, N'[Shadow Travel] Heal for {scale=50|50} every 1s while using Shadow Travel.', N'[Shadow Travel] Heal for {scale=50|50} every 1s while using Shadow Travel.', N'Nether Siphon', 2372, N'https://web2.hirez.com/paladins/champion-cards/nether-siphon.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (606, 14981, N'[Poison Bolts] Increase your Reload Speed by {scale=10|10}% for 5s after using Poison Bolts.', N'[Poison Bolts] Increase your Reload Speed by {scale=10|10}% for 5s after using Poison Bolts.', N'Nimble Fingers', 2057, N'https://web2.hirez.com/paladins/champion-cards/nimble-fingers.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (607, 20303, N'[Sensor Drone] Sensor Drone''s Reveal persists for {scale=1|1}s after an enemy leaves its Reveal range.', N'[Sensor Drone] Sensor Drone''s Reveal persists for {scale=1|1}s after an enemy leaves its Reveal range.', N'Nowhere to Hide', 2480, N'https://web2.hirez.com/paladins/champion-cards/nowhere-to-hide.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (608, 14733, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'One Man''s Treasure', 2073, N'https://web2.hirez.com/paladins/champion-cards/one-mans-treasure.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (609, 13243, N'[Sniper Mode] Hitting an enemy with a fully-charged Sniper Mode shot generates {scale=1|1} Ammo.', N'[Sniper Mode] Hitting an enemy with a fully-charged Sniper Mode shot generates {scale=1|1} Ammo.', N'Open Season', 2249, N'https://web2.hirez.com/paladins/champion-cards/open-season.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (610, 12955, N'[Vine] Reset the Cooldown of Vine after dropping to or below {scale=15|15}% Health.', N'[Vine] Reset the Cooldown of Vine after dropping to or below {scale=15|15}% Health.', N'Overgrowth', 2254, N'https://web2.hirez.com/paladins/champion-cards/overgrowth.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (611, 12932, N'[Barricade] Reduce the Cooldown of Barricade by {scale=0.4|0.4}s.', N'[Barricade] Reduce the Cooldown of Barricade by {scale=0.4|0.4}s.', N'Palisade', 2073, N'https://web2.hirez.com/paladins/champion-cards/palisade.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (612, 16480, N'[Nine Lives] Heal for an additional {scale=80|80} with Nine Lives.', N'[Nine Lives] Heal for an additional {scale=80|80} with Nine Lives.', N'Patch Up', 2338, N'https://web2.hirez.com/paladins/champion-cards/patch-up.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (613, 19154, N'[Weapon] Gain {scale=7|7}% Lifesteal.', N'[Weapon] Gain {scale=7|7}% Lifesteal.', N'Penumbra', 2431, N'https://web2.hirez.com/paladins/champion-cards/penumbra.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (614, 18602, N'[Counter] Heal for {scale=100|100} after using Counter.', N'[Counter] Heal for {scale=100|100} after using Counter.', N'Perfect Block', 2420, N'https://web2.hirez.com/paladins/champion-cards/perfect-block.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (615, 19571, N'[Weapon] Gain {scale=10|10}% Lifesteal while at or below 40% Health.', N'[Weapon] Gain {scale=10|10}% Lifesteal while at or below 40% Health.', N'Perseverance', 2472, N'https://web2.hirez.com/paladins/champion-cards/perseverance.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (616, 17011, N'[Dead Zone] Heal for {scale=65|65} every 1s while standing in Dead Zone.', N'[Dead Zone] Heal for {scale=65|65} every 1s while standing in Dead Zone.', N'Pixie Dust', 2393, N'https://web2.hirez.com/paladins/champion-cards/pixie-dust.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (617, 13319, N'[Reversal] Reduce the Cooldown of Nether Step by {scale=20|20}% after hitting an enemy with Reversal.', N'[Reversal] Reduce the Cooldown of Nether Step by {scale=20|20}% after hitting an enemy with Reversal.', N'Power of the Abyss', 2205, N'https://web2.hirez.com/paladins/champion-cards/power-of-the-abyss.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (618, 15887, N'[Nade Launcher] Generate {scale=2|2} Ammo after using Nade Launcher.', N'[Nade Launcher] Generate {scale=2|2} Ammo after using Nade Launcher.', N'Quick Release', 2314, N'https://web2.hirez.com/paladins/champion-cards/quick-release.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (619, 15693, N'[Crippling Arrow] Reduce the Cooldown of Crippling Arrow by {scale=0.6|0.6}s.', N'[Crippling Arrow] Reduce the Cooldown of Crippling Arrow by {scale=0.6|0.6}s.', N'Quicksand', 2307, N'https://web2.hirez.com/paladins/champion-cards/quicksand.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (620, 18364, N'[Siege Shield] Reduce the Cooldown of Siege Shield by {scale=0.5|0.5}s.', N'[Siege Shield] Reduce the Cooldown of Siege Shield by {scale=0.5|0.5}s.', N'Ramparts', 2404, N'https://web2.hirez.com/paladins/champion-cards/ramparts.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (621, 12665, N'[Armor] Increase your Healing received by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase your Healing received by {scale=5|5}% while at or below 50% Health.', N'Rapid Sustain', 2147, N'https://web2.hirez.com/paladins/champion-cards/rapid-sustain.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (622, 14728, N'[Rocket Boots] Reduce the Cooldown of Rocket Boots by {scale=0.8|0.8}s.', N'[Rocket Boots] Reduce the Cooldown of Rocket Boots by {scale=0.8|0.8}s.', N'Red Streak', 2073, N'https://web2.hirez.com/paladins/champion-cards/red-streak.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (623, 14429, N'[Iron Sights] Reduce the time it takes to bring up Iron Sights by {scale=15|15}%.', N'[Iron Sights] Reduce the time it takes to bring up Iron Sights by {scale=15|15}%.', N'Reflexes', 2285, N'https://web2.hirez.com/paladins/champion-cards/reflexes.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (624, 15347, N'[Gourd] Reduce the Cooldown of Gourd by {scale=0.5|0.5}s.', N'[Gourd] Reduce the Cooldown of Gourd by {scale=0.5|0.5}s.', N'Many Gourds', 2303, N'https://web2.hirez.com/paladins/champion-cards/many-gourds.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (625, 15841, N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'Locked and Loaded', 2314, N'https://web2.hirez.com/paladins/champion-cards/locked-and-loaded.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (626, 22875, N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'Lifetaker', 2479, N'https://web2.hirez.com/paladins/champion-cards/lifetaker.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (627, 12697, N'[Heroic Leap] Increase the jump strength of Heroic Leap by {scale=5|5}%.', N'[Heroic Leap] Increase the jump strength of Heroic Leap by {scale=5|5}%.', N'Leg Day', 2147, N'https://web2.hirez.com/paladins/champion-cards/leg-day.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (628, 12735, N'[Advance] Increase the travel distance of Advance by {scale=7|7}%.', N'[Advance] Increase the travel distance of Advance by {scale=7|7}%.', N'Fuel Reserves', 2149, N'https://web2.hirez.com/paladins/champion-cards/fuel-reserves.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (629, 11466, N'[Ghost Walk] Decrease the Cooldown of Healing Totem by {scale=0.6|0.6}s after activating Ghost Walk.', N'[Ghost Walk] Decrease the Cooldown of Healing Totem by {scale=0.6|0.6}s after activating Ghost Walk.', N'Gale', 2093, N'https://web2.hirez.com/paladins/champion-cards/gale.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (630, 16658, N'[Earthen Guard] Reduce the Cooldown of Earthen Guard by {scale=0.5|0.5}s.', N'[Earthen Guard] Reduce the Cooldown of Earthen Guard by {scale=0.5|0.5}s.', N'Geomancer', 2348, N'https://web2.hirez.com/paladins/champion-cards/geomancer.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (631, 12545, N'[Recovery] Increase your movement speed by {scale=10|10} while Recovery is active', N'[Recovery] Increase your movement speed by {scale=10|10} while Recovery is active', N'Giga Siphon', 2147, N'https://web2.hirez.com/paladins/champion-cards/giga-siphon.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (632, 16111, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Glyph of Health', 2322, N'https://web2.hirez.com/paladins/champion-cards/glyph-of-health.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (633, 22149, N'[Familiar Spit] Gain {scale=6|6}% Lifesteal against enemies with the maximum number of Magic Marks.', N'[Familiar Spit] Gain {scale=6|6}% Lifesteal against enemies with the maximum number of Magic Marks.', N'Greater Good', 2481, N'https://web2.hirez.com/paladins/champion-cards/greater-good.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (634, 14435, N'[Frag Grenade] Reduce the Cooldown of Frag Grenade by {scale=1|1}s for each enemy hit by it.', N'[Frag Grenade] Reduce the Cooldown of Frag Grenade by {scale=1|1}s for each enemy hit by it.', N'Grenadier', 2285, N'https://web2.hirez.com/paladins/champion-cards/grenadier.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (635, 19379, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Grizzled', 2438, N'https://web2.hirez.com/paladins/champion-cards/grizzled.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (636, 19475, N'[Stealth] Generate {scale=15|15} Energy after getting an Elimination.', N'[Stealth] Generate {scale=15|15} Energy after getting an Elimination.', N'Guerrilla Tactics', 2438, N'https://web2.hirez.com/paladins/champion-cards/guerrilla-tactics.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (637, 18789, N'[Presence] Hitting an enemy with Presence reduces its Cooldown by {scale=1|1}s.', N'[Presence] Hitting an enemy with Presence reduces its Cooldown by {scale=1|1}s.', N'Heraldry', 2417, N'https://web2.hirez.com/paladins/champion-cards/heraldry.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (638, 20280, N'[Precision Sights] Every weapon shot made while Precision Sights is active has an {scale=8|8}% chance to not consume Ammo.', N'[Precision Sights] Every weapon shot made while Precision Sights is active has an {scale=8|8}% chance to not consume Ammo.', N'Hidden Reserves', 2480, N'https://web2.hirez.com/paladins/champion-cards/hidden-reserves.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (639, 19226, N'[Astral Mark] Heal for {scale=40|40} every 1s for 10s after applying Astral Mark.', N'[Astral Mark] Heal for {scale=40|40} every 1s for 10s after applying Astral Mark.', N'Relativity', 2431, N'https://web2.hirez.com/paladins/champion-cards/relativity.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (640, 18617, N'[Billow] Reduce the Cooldown of Whirl by {scale=1|1}s after using Billow.', N'[Billow] Reduce the Cooldown of Whirl by {scale=1|1}s after using Billow.', N'Hideout', 2420, N'https://web2.hirez.com/paladins/champion-cards/hideout.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (641, 15892, N'[Hunter''s Mark] Heal for {scale=200|200} after getting a Killing Blow on an enemy affected by Hunter’s Mark.', N'[Hunter''s Mark] Heal for {scale=200|200} after getting a Killing Blow on an enemy affected by Hunter’s Mark.', N'Hunting Season', 2314, N'https://web2.hirez.com/paladins/champion-cards/hunting-season.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (642, 11886, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting a Killing Blow.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting a Killing Blow.', N'Impact', 2094, N'https://web2.hirez.com/paladins/champion-cards/impact.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (643, 11317, N'[Fireball] Reduce the Cooldown of Fireball by {scale=0.4|0.4}s.', N'[Fireball] Reduce the Cooldown of Fireball by {scale=0.4|0.4}s.', N'Incinerate', 2071, N'https://web2.hirez.com/paladins/champion-cards/incinerate.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (644, 12736, N'[Dodge Roll] Reduce the Cooldown of Dodge Roll by {scale=0.8|0.8}s if you hit an enemy with your first weapon shot after using Dodge Roll.', N'[Dodge Roll] Reduce the Cooldown of Dodge Roll by {scale=0.8|0.8}s if you hit an enemy with your first weapon shot after using Dodge Roll.', N'Incitement', 2092, N'https://web2.hirez.com/paladins/champion-cards/incitement.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (645, 18573, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Infamy', 2420, N'https://web2.hirez.com/paladins/champion-cards/infamy.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (646, 22887, N'[Battle Shout] Increase your Movement Speed by {scale=8|8}% for 3s after activating Battle Shout.', N'[Battle Shout] Increase your Movement Speed by {scale=8|8}% for 3s after activating Battle Shout.', N'Into the Breach!', 2479, N'https://web2.hirez.com/paladins/champion-cards/into-the-breach.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (647, 16999, N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=8|8}% after getting an Elimination.', N'Just Believe!', 2393, N'https://web2.hirez.com/paladins/champion-cards/just-believe.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (648, 16939, N'[Retribution] Heal for {scale=15|15}% of your maximum Health after getting a Killing Blow on your Retribution target.', N'[Retribution] Heal for {scale=15|15}% of your maximum Health after getting a Killing Blow on your Retribution target.', N'Justice Served', 2362, N'https://web2.hirez.com/paladins/champion-cards/justice-served.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (649, 14741, N'[Detonate] Heal for {scale=15|15} for each Sticky Bomb you Detonate.', N'[Detonate] Heal for {scale=15|15} for each Sticky Bomb you Detonate.', N'King''s Court', 2281, N'https://web2.hirez.com/paladins/champion-cards/kings-court.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (650, 14696, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'King''s New Cloak', 2281, N'https://web2.hirez.com/paladins/champion-cards/kings-new-cloak.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (651, 12809, N'[Shield] Heal for {scale=100|100} every 1s while Shield is active and you are at or below 40% Health.', N'[Shield] Heal for {scale=100|100} every 1s while Shield is active and you are at or below 40% Health.', N'Last Stand', 2071, N'https://web2.hirez.com/paladins/champion-cards/last-stand.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (652, 18757, N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'[Armor] Increase your Movement Speed by {scale=3|3}%.', N'Highborn', 2417, N'https://web2.hirez.com/paladins/champion-cards/highborn.jpg', 0, N'Card Vendor Rank 1 Epic', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (653, 15694, N'[Rapid Shot] Regenerate {scale=50|50} Health every 1s during while using Rapid Shot.', N'[Rapid Shot] Regenerate {scale=50|50} Health every 1s during while using Rapid Shot.', N'Grounded', 2307, N'https://web2.hirez.com/paladins/champion-cards/grounded.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (654, 15062, N'[Hustle] Reduce the Cooldown of Frag Grenade by {scale=0.2|0.2}s every 1s while Hustle is active.', N'[Hustle] Reduce the Cooldown of Frag Grenade by {scale=0.2|0.2}s every 1s while Hustle is active.', N'Guerrilla Warfare', 2285, N'https://web2.hirez.com/paladins/champion-cards/guerrilla-warfare.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (655, 19567, N'[Armor] Reduce your damage taken by {scale=5|5}% while at or below 40% Health.', N'[Armor] Reduce your damage taken by {scale=5|5}% while at or below 40% Health.', N'Guts', 2472, N'https://web2.hirez.com/paladins/champion-cards/guts.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (656, 14432, N'[Iron Sights] Reduce your weapon recoil by {scale=20|20}% while using Iron Sights.', N'[Iron Sights] Reduce your weapon recoil by {scale=20|20}% while using Iron Sights.', N'Compensator', 2285, N'https://web2.hirez.com/paladins/champion-cards/compensator.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (657, 25375, N'[Armor] Increase the Healing you do by {scale=2|2}% while at or below 60% Health.', N'[Armor] Increase the Healing you do by {scale=2|2}% while at or below 60% Health.', N'Condemnation', 2533, N'https://web2.hirez.com/paladins/champion-cards/condemnation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (658, 16128, N'[Recharge] Reduce the Cooldown of Recharge by {scale=0.4|0.4}s.', N'[Recharge] Reduce the Cooldown of Recharge by {scale=0.4|0.4}s.', N'Conduction', 2322, N'https://web2.hirez.com/paladins/champion-cards/conduction.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (659, 14862, N'[Shock Pulse] Increase your Movement Speed by {scale=6|6}% for 3s after hitting an enemy with Shock Pulse.', N'[Shock Pulse] Increase your Movement Speed by {scale=6|6}% for 3s after hitting an enemy with Shock Pulse.', N'Conduit', 2093, N'https://web2.hirez.com/paladins/champion-cards/conduit.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (660, 13238, N'[Poison Bolts] Reduce the Cooldown of Smoke Screen by {scale=0.5|0.5}s for each enemy hit by Poison Bolts.', N'[Poison Bolts] Reduce the Cooldown of Smoke Screen by {scale=0.5|0.5}s for each enemy hit by Poison Bolts.', N'Confound', 2057, N'https://web2.hirez.com/paladins/champion-cards/confound.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (661, 20288, N'[Deflector Shield] Increase Deflector Shield''s Health by {scale=170|170}.', N'[Deflector Shield] Increase Deflector Shield''s Health by {scale=170|170}.', N'Contingency', 2480, N'https://web2.hirez.com/paladins/champion-cards/contingency.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (662, 24314, N'[Second Chance] Second Chance sends you {scale=0.4|0.4}s further into the past.', N'[Second Chance] Second Chance sends you {scale=0.4|0.4}s further into the past.', N'Continuum Shift', 2512, N'https://web2.hirez.com/paladins/champion-cards/continuum-shift.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (663, 23368, N'[Pyre Strike] Increase the Stun duration of Pyre Strike by {scale=0.15|0.15}s.', N'[Pyre Strike] Increase the Stun duration of Pyre Strike by {scale=0.15|0.15}s.', N'Conviction', 2491, N'https://web2.hirez.com/paladins/champion-cards/conviction.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (664, 19473, N'[Quick Switch] Your inactive weapon generates {scale=2|2} Ammo every 2s.', N'[Quick Switch] Your inactive weapon generates {scale=2|2} Ammo every 2s.', N'Cooled Mags', 2438, N'https://web2.hirez.com/paladins/champion-cards/cooled-mags.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (665, 24110, N'[Frost Bolt] Dealing damage with Frost Bolt reduces the Cooldown of Inferno Cannon by {scale=0.5|0.5}s.', N'[Frost Bolt] Dealing damage with Frost Bolt reduces the Cooldown of Inferno Cannon by {scale=0.5|0.5}s.', N'Cooling Runes', 2509, N'https://web2.hirez.com/paladins/champion-cards/cooling-runes.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (666, 19215, N'[Stellar Wind] Reduce your damage taken by {scale=5|5}% while Stellar Wind is active.', N'[Stellar Wind] Reduce your damage taken by {scale=5|5}% while Stellar Wind is active.', N'Cosmic Barrier', 2431, N'https://web2.hirez.com/paladins/champion-cards/cosmic-barrier.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (667, 20298, N'[Sensor Drone] Gain {scale=8|8}% Lifesteal against enemies Revealed by Sensor Drone.', N'[Sensor Drone] Gain {scale=8|8}% Lifesteal against enemies Revealed by Sensor Drone.', N'Crack the Whip', 2480, N'https://web2.hirez.com/paladins/champion-cards/crack-the-whip.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (668, 16633, N'[Impasse] Heal for {scale=150|150} after activating Impasse.', N'[Impasse] Heal for {scale=150|150} after activating Impasse.', N'Crag', 2348, N'https://web2.hirez.com/paladins/champion-cards/crag.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (669, 24564, N'[Lunar Leap] Reset the Cooldown of Lunar Leap after dropping to or below {scale=15|15}% Health.', N'[Lunar Leap] Reset the Cooldown of Lunar Leap after dropping to or below {scale=15|15}% Health.', N'Crescent', 2517, N'https://web2.hirez.com/paladins/champion-cards/crescent.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (670, 23469, N'[Dragon Stance] Gain {scale=5|5}% Lifesteal while in Dragon Stance.', N'[Dragon Stance] Gain {scale=5|5}% Lifesteal while in Dragon Stance.', N'Criminal Record', 2493, N'https://web2.hirez.com/paladins/champion-cards/criminal-record.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (671, 25173, N'[Combat Trance] Generate {scale=1|1} Ammo after activating Combat Trance.', N'[Combat Trance] Generate {scale=1|1} Ammo after activating Combat Trance.', N'Crowd-Pleaser', 2529, N'https://web2.hirez.com/paladins/champion-cards/crowd-pleaser.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (672, 23747, N'[Broadside] Hitting yourself with Broadside now applies a Knockback of {scale=500|100}.', N'[Broadside] Hitting yourself with Broadside now applies a Knockback of {scale=500|100}.', N'Crow''s Nest', 2495, N'https://web2.hirez.com/paladins/champion-cards/crows-nest.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (673, 25383, N'[Mark of Fate] Increase the Movement Speed of any ally Marked by Mark of Fate by {scale=3|3}%.', N'[Mark of Fate] Increase the Movement Speed of any ally Marked by Mark of Fate by {scale=3|3}%.', N'Crushing Expectations', 2533, N'https://web2.hirez.com/paladins/champion-cards/crushing-expectations.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (674, 23753, N'[Harpoon] Generate {scale=1|1} Ammo for each enemy hit by Harpoon.', N'[Harpoon] Generate {scale=1|1} Ammo for each enemy hit by Harpoon.', N'Cursed Weaponry', 2495, N'https://web2.hirez.com/paladins/champion-cards/cursed-weaponry.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (675, 16054, N'[Armor] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow or Elimination.', N'[Armor] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow or Elimination.', N'Cut and Run', 2338, N'https://web2.hirez.com/paladins/champion-cards/cut-and-run.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (676, 14306, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Dampener', 2149, N'https://web2.hirez.com/paladins/champion-cards/dampener.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (677, 15707, N'[Rapid Shot] Increase your Movement Speed by {scale=10|10}% for 3s after Rapid Shot ends.', N'[Rapid Shot] Increase your Movement Speed by {scale=10|10}% for 3s after Rapid Shot ends.', N'Daring Escape', 2307, N'https://web2.hirez.com/paladins/champion-cards/daring-escape.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (678, 23777, N'[Shortcut] Heal for {scale=50|50} every 1s while standing near a Shortcut.', N'[Shortcut] Heal for {scale=50|50} every 1s while standing near a Shortcut.', N'Dark Bargain', 2495, N'https://web2.hirez.com/paladins/champion-cards/dark-bargain.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (679, 16720, N'[Combat Slide] Increase the travel distance of Combat Slide by {scale=10|10}%.', N'[Combat Slide] Increase the travel distance of Combat Slide by {scale=10|10}%.', N'Commencement', 2362, N'https://web2.hirez.com/paladins/champion-cards/commencement.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (680, 19587, N'[Blitz Upper] Generate {scale=3|3}% Ultimate charge after hitting an enemy with Blitz Upper.', N'[Blitz Upper] Generate {scale=3|3}% Ultimate charge after hitting an enemy with Blitz Upper.', N'Dark Vision', 2472, N'https://web2.hirez.com/paladins/champion-cards/dark-vision.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (681, 12853, N'[Turret] Heal your Turret for {scale=100|100} every 1s while you are standing near it.', N'[Turret] Heal your Turret for {scale=100|100} every 1s while you are standing near it.', N'Combat Repair', 2073, N'https://web2.hirez.com/paladins/champion-cards/combat-repair.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (682, 16628, N'[Impasse] Increase the Health of Impasse by {scale=250|250}.', N'[Impasse] Increase the Health of Impasse by {scale=250|250}.', N'Cloudbreaker', 2348, N'https://web2.hirez.com/paladins/champion-cards/cloudbreaker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (683, 13257, N'[Transporter] Increase the Flight Speed of Transporter by {scale=10|10}%.', N'[Transporter] Increase the Flight Speed of Transporter by {scale=10|10}%.', N'Beam Me Up', 2249, N'https://web2.hirez.com/paladins/champion-cards/beam-me-up.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (684, 25165, N'[Armor] Gain a {scale=50|50}-Health Shield for 3s after falling to or below 50% Health.', N'[Armor] Gain a {scale=50|50}-Health Shield for 3s after falling to or below 50% Health.', N'Beast-Slayer', 2529, N'https://web2.hirez.com/paladins/champion-cards/beast-slayer.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (685, 24506, N'[Stasis Field] Passing through Stasis Field increases your allies'' or your own Movement Speed by {scale=7|7}% for 3s.', N'[Stasis Field] Passing through Stasis Field increases your allies'' or your own Movement Speed by {scale=7|7}% for 3s.', N'Beyond The Veil', 2512, N'https://web2.hirez.com/paladins/champion-cards/beyond-the-veil.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (686, 14242, N'[Ice Block] Generate {scale=2|2} Ammo after activating Ice Block.', N'[Ice Block] Generate {scale=2|2} Ammo after activating Ice Block.', N'Biting Cold', 2094, N'https://web2.hirez.com/paladins/champion-cards/biting-cold.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (687, 22873, N'[Armor] Gain {scale=4|4}% Lifesteal.', N'[Armor] Gain {scale=4|4}% Lifesteal.', N'Bloodthirst', 2479, N'https://web2.hirez.com/paladins/champion-cards/bloodthirst.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (688, 23754, N'[Harpoon] Enemies hit by Harpoon’s Slow have their Movement Speed reduced by an additional {scale=6|6}%.', N'[Harpoon] Enemies hit by Harpoon’s Slow have their Movement Speed reduced by an additional {scale=6|6}%.', N'Blow the Man Down', 2495, N'https://web2.hirez.com/paladins/champion-cards/blow-the-man-down.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (689, 25167, N'[Weapon] Hitting enemies with Bladed Chakrams Heals you for {scale=15|15}.', N'[Weapon] Hitting enemies with Bladed Chakrams Heals you for {scale=15|15}.', N'Bragging Rights', 2529, N'https://web2.hirez.com/paladins/champion-cards/bragging-rights.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (690, 11630, N'[Fireball] Heal for {scale=100|100} for each enemy hit with Fireball.', N'[Fireball] Heal for {scale=100|100} for each enemy hit with Fireball.', N'Brand', 2071, N'https://web2.hirez.com/paladins/champion-cards/brand.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (691, 14856, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Brave and Bold', 2073, N'https://web2.hirez.com/paladins/champion-cards/brave-and-bold.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (692, 24560, N'[Guardian Spirit] Increase Luna''s deploy range by {scale=20|20}%.', N'[Guardian Spirit] Increase Luna''s deploy range by {scale=20|20}%.', N'Broken Deity', 2517, N'https://web2.hirez.com/paladins/champion-cards/broken-deity.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (693, 12369, N'[Barricade] Increase the Health of Barricade by {scale=200|200}.', N'[Barricade] Increase the Health of Barricade by {scale=200|200}.', N'Bunker', 2073, N'https://web2.hirez.com/paladins/champion-cards/bunker.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (694, 23371, N'[Kindle Soul] Heal for {scale=105|105} over 3s after Healing an ally with Kindle Soul.', N'[Kindle Soul] Heal for {scale=105|105} over 3s after Healing an ally with Kindle Soul.', N'Burning Oath', 2491, N'https://web2.hirez.com/paladins/champion-cards/burning-oath.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (695, 25374, N'[Weapon] Increase your maximum Ammo by {scale=3|3}.', N'[Weapon] Increase your maximum Ammo by {scale=3|3}.', N'By My Will', 2533, N'https://web2.hirez.com/paladins/champion-cards/by-my-will.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (696, 14766, N'[Soar] Generate {scale=1|1} Ammo after activating Soar.', N'[Soar] Generate {scale=1|1} Ammo after activating Soar.', N'Cantrip', 2094, N'https://web2.hirez.com/paladins/champion-cards/cantrip.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (697, 14900, N'[Shell Shield] Increase the Health of Shell Shield by {scale=200|200}.', N'[Shell Shield] Increase the Health of Shell Shield by {scale=200|200}.', N'Carapace', 2288, N'https://web2.hirez.com/paladins/champion-cards/carapace.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (698, 16616, N'[Warder''s Field] Heal for {scale=20|20} every 1s while standing in Warder''s Field.', N'[Warder''s Field] Heal for {scale=20|20} every 1s while standing in Warder''s Field.', N'Caretaker', 2348, N'https://web2.hirez.com/paladins/champion-cards/caretaker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (699, 13388, N'[Illusion] Increase the duration of your Illusions by {scale=1|1}s.', N'[Illusion] Increase the duration of your Illusions by {scale=1|1}s.', N'Carry On', 2267, N'https://web2.hirez.com/paladins/champion-cards/carry-on.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (700, 19583, N'[Blitz Upper] Increase your Movement Speed by {scale=10|10}% for 3s after hitting an enemy with Blitz Upper.', N'[Blitz Upper] Increase your Movement Speed by {scale=10|10}% for 3s after hitting an enemy with Blitz Upper.', N'Carry through', 2472, N'https://web2.hirez.com/paladins/champion-cards/carry-through.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (701, 24549, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Celestial Body', 2517, N'https://web2.hirez.com/paladins/champion-cards/celestial-body.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (702, 25166, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Charisma', 2529, N'https://web2.hirez.com/paladins/champion-cards/charisma.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (703, 12220, N'[Blink] Increase your Reload Speed by {scale=8|8}% for 4s after using Blink.', N'[Blink] Increase your Reload Speed by {scale=8|8}% for 4s after using Blink.', N'Chilled', 2094, N'https://web2.hirez.com/paladins/champion-cards/chilled.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (704, 22882, N'[Commander''s Grab] Heal for {scale=100|100} after activating Commander''s Grab.', N'[Commander''s Grab] Heal for {scale=100|100} after activating Commander''s Grab.', N'Chokehold', 2479, N'https://web2.hirez.com/paladins/champion-cards/chokehold.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (705, 14204, N'[Crippling Throw] Heal for {scale=100|100} after hitting an enemy with Crippling Throw.', N'[Crippling Throw] Heal for {scale=100|100} after hitting an enemy with Crippling Throw.', N'Chopper', 2254, N'https://web2.hirez.com/paladins/champion-cards/chopper.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (706, 13408, N'[Weapon] Your weapon deals {scale=60|10}% less Self-Damage and no longer applies a Knockback to yourself.', N'[Weapon] Your weapon deals {scale=60|10}% less Self-Damage and no longer applies a Knockback to yourself.', N'Cold Acclimation', 2094, N'https://web2.hirez.com/paladins/champion-cards/cold-acclimation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (707, 14113, N'[Salvo] Increase the explosion radius of Salvo by {scale=15|15}%.', N'[Salvo] Increase the explosion radius of Salvo by {scale=15|15}%.', N'Decimate', 2277, N'https://web2.hirez.com/paladins/champion-cards/decimate.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (708, 25007, N'[Juggernaut] Increase the potency of Juggernaut''s Knockup by {scale=7|7}%.', N'[Juggernaut] Increase the potency of Juggernaut''s Knockup by {scale=7|7}%.', N'Declaration of War', 2528, N'https://web2.hirez.com/paladins/champion-cards/declaration-of-war.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (709, 14279, N'[Poison Bolts] You do not consume Ammo for {scale=0.5|0.5}s after hitting an enemy with Poison Bolts.', N'[Poison Bolts] You do not consume Ammo for {scale=0.5|0.5}s after hitting an enemy with Poison Bolts.', N'Decrepify', 2057, N'https://web2.hirez.com/paladins/champion-cards/decrepify.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (710, 24566, N'[Lunar Leap] Generate {scale=2|2} Ammo after using Lunar Leap.', N'[Lunar Leap] Generate {scale=2|2} Ammo after using Lunar Leap.', N'Eternal Reliquary', 2517, N'https://web2.hirez.com/paladins/champion-cards/eternal-reliquary.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (711, 12716, N'[Disengage] Reduce the Cooldown of Dodge Roll by {scale=1|1}s after hitting an enemy with Disengage.', N'[Disengage] Reduce the Cooldown of Dodge Roll by {scale=1|1}s after hitting an enemy with Disengage.', N'Excitement', 2092, N'https://web2.hirez.com/paladins/champion-cards/excitement.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (712, 23772, N'[Shortcut] Jump height is increased for your first jump within {scale=1|1}s after exiting a Shortcut.', N'[Shortcut] Jump height is increased for your first jump within {scale=1|1}s after exiting a Shortcut.', N'Expansive Vault', 2495, N'https://web2.hirez.com/paladins/champion-cards/expansive-vault.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (713, 25386, N'[Projection] Increase your Movement Speed by {scale=6|6}% for 3s after activating Projection.', N'[Projection] Increase your Movement Speed by {scale=6|6}% for 3s after activating Projection.', N'Extraplanar Power', 2533, N'https://web2.hirez.com/paladins/champion-cards/extraplanar-power.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (714, 20281, N'[Precision Sights] Reduce your weapon recoil by {scale=20|20}% while using Precision Sights.', N'[Precision Sights] Reduce your weapon recoil by {scale=20|20}% while using Precision Sights.', N'Eyes on the Prize', 2480, N'https://web2.hirez.com/paladins/champion-cards/eyes-on-the-prize.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (715, 11916, N'[Armor] Reset the Cooldown of Rocket Boots after falling to or below {scale=10|10}% Health.', N'[Armor] Reset the Cooldown of Rocket Boots after falling to or below {scale=10|10}% Health.', N'Failsafe', 2073, N'https://web2.hirez.com/paladins/champion-cards/failsafe.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (716, 18629, N'[Billow] Reduce the Cooldown of Billow by {scale=20|20}% after getting a Killing Blow.', N'[Billow] Reduce the Cooldown of Billow by {scale=20|20}% after getting a Killing Blow.', N'Fan the Flames', 2420, N'https://web2.hirez.com/paladins/champion-cards/fan-the-flames.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (717, 25000, N'[Juggernaut] Gain a {scale=150|150}-Health Shield for 3s after activating Juggernaut.', N'[Juggernaut] Gain a {scale=150|150}-Health Shield for 3s after activating Juggernaut.', N'Fanning the Flames', 2528, N'https://web2.hirez.com/paladins/champion-cards/fanning-the-flames.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (718, 13052, N'[Crippling Throw] Hitting an enemy with Crippling Throw reduces the Cooldown of Blossom by {scale=0.6|0.6}s.', N'[Crippling Throw] Hitting an enemy with Crippling Throw reduces the Cooldown of Blossom by {scale=0.6|0.6}s.', N'Fatalis', 2254, N'https://web2.hirez.com/paladins/champion-cards/fatalis.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (719, 16817, N'[Armor] Increase your Movement Speed by {scale=8|8}% when Out of Combat.', N'[Armor] Increase your Movement Speed by {scale=8|8}% when Out of Combat.', N'Fauna', 2393, N'https://web2.hirez.com/paladins/champion-cards/fauna.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (720, 15893, N'[Hunter''s Mark] Increase the duration of Hunter''s Mark by {scale=0.6|0.6}s.', N'[Hunter''s Mark] Increase the duration of Hunter''s Mark by {scale=0.6|0.6}s.', N'Favored Quarry', 2314, N'https://web2.hirez.com/paladins/champion-cards/favored-quarry.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (721, 16428, N'[Prowl] Reduce your damage taken by {scale=5|5}% while Prowl is active.', N'[Prowl] Reduce your damage taken by {scale=5|5}% while Prowl is active.', N'Featherlite', 2338, N'https://web2.hirez.com/paladins/champion-cards/featherlite.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (722, 13316, N'[Armor] Heal for {scale=50|50} every 1s while drifting.', N'[Armor] Heal for {scale=50|50} every 1s while drifting.', N'Featherweight', 2205, N'https://web2.hirez.com/paladins/champion-cards/featherweight.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (723, 24558, N'[Guardian Spirit] Increase Luna''s Health by {scale=225|225}.', N'[Guardian Spirit] Increase Luna''s Health by {scale=225|225}.', N'Feral Strength', 2517, N'https://web2.hirez.com/paladins/champion-cards/feral-strength.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (724, 18345, N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'Fervor', 2404, N'https://web2.hirez.com/paladins/champion-cards/fervor.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (725, 16475, N'[Nine Lives] Increase your Movement Speed by {scale=10|10}% for 4s after you activate Nine Lives.', N'[Nine Lives] Increase your Movement Speed by {scale=10|10}% for 4s after you activate Nine Lives.', N'Fight or Flight', 2338, N'https://web2.hirez.com/paladins/champion-cards/fight-or-flight.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (726, 15061, N'[Frag Grenade] Generate {scale=6|6} Ammo for each enemy hit with Frag Grenade.', N'[Frag Grenade] Generate {scale=6|6} Ammo for each enemy hit with Frag Grenade.', N'Fire in the Hole', 2285, N'https://web2.hirez.com/paladins/champion-cards/fire-in-the-hole.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (727, 23366, N'[Wings of Wrath] Heal for {scale=75|75} for each enemy hit with Wings of Wrath.', N'[Wings of Wrath] Heal for {scale=75|75} for each enemy hit with Wings of Wrath.', N'Fire Siphon', 2491, N'https://web2.hirez.com/paladins/champion-cards/fire-siphon.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (728, 14578, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Flak Jacket', 2285, N'https://web2.hirez.com/paladins/champion-cards/flak-jacket.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (729, 19447, N'[Flare] Increase the area that Flare will Reveal enemies by {scale=10|10}%.', N'[Flare] Increase the area that Flare will Reveal enemies by {scale=10|10}%.', N'Flare XL', 2438, N'https://web2.hirez.com/paladins/champion-cards/flare-xl.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (730, 22090, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Fluffy', 2481, N'https://web2.hirez.com/paladins/champion-cards/fluffy.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (731, 25164, N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'[Weapon] Increase your maximum Ammo by {scale=1|1}.', N'Flying Chakrams', 2529, N'https://web2.hirez.com/paladins/champion-cards/flying-chakrams.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (732, 14827, N'[Fire Spit] Increase the size of your Fire Spit by {scale=24|24}%.', N'[Fire Spit] Increase the size of your Fire Spit by {scale=24|24}%.', N'Follow the Scent', 2277, N'https://web2.hirez.com/paladins/champion-cards/follow-the-scent.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (733, 19611, N'[Rune of Travel] Increase the duration of Rune of Travel by {scale=1|1}s.', N'[Rune of Travel] Increase the duration of Rune of Travel by {scale=1|1}s.', N'Eternal', 2472, N'https://web2.hirez.com/paladins/champion-cards/eternal.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (734, 14630, N'[Weightless] Increase the duration of Weightless by {scale=0.2|0.2}s.', N'[Weightless] Increase the duration of Weightless by {scale=0.2|0.2}s.', N'Escape Artist', 2056, N'https://web2.hirez.com/paladins/champion-cards/escape-artist.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (735, 13399, N'[Reversal] Heal for {scale=10|10}% of the damage Absorbed by Reversal.', N'[Reversal] Heal for {scale=10|10}% of the damage Absorbed by Reversal.', N'Equivalent Exchange', 2205, N'https://web2.hirez.com/paladins/champion-cards/equivalent-exchange.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (736, 15069, N'[Weapon] Increase your Reload Speed by {scale=8|8}%.', N'[Weapon] Increase your Reload Speed by {scale=8|8}%.', N'Ephemeral', 2267, N'https://web2.hirez.com/paladins/champion-cards/ephemeral.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (737, 22106, N'[Familiar Spit] Increase the duration of your Magic Marks by {scale=0.8|0.8}s.', N'[Familiar Spit] Increase the duration of your Magic Marks by {scale=0.8|0.8}s.', N'Dense Woods', 2481, N'https://web2.hirez.com/paladins/champion-cards/dense-woods.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (738, 24997, N'[Armor] Gain a {scale=250|250}-Health Shield for 3s after dropping to or below 30% Health.', N'[Armor] Gain a {scale=250|250}-Health Shield for 3s after dropping to or below 30% Health.', N'Desperation', 2528, N'https://web2.hirez.com/paladins/champion-cards/desperation.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (739, 15065, N'[Armor] Increase your Healing received from other players by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase your Healing received from other players by {scale=5|5}% while at or below 50% Health.', N'Determination', 2288, N'https://web2.hirez.com/paladins/champion-cards/determination.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (740, 23338, N'[Weapon] Generate {scale=1|1} Ammo after earning an Elimination.', N'[Weapon] Generate {scale=1|1} Ammo after earning an Elimination.', N'Devout Dexterity', 2491, N'https://web2.hirez.com/paladins/champion-cards/devout-dexterity.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (741, 12749, N'[Shield] Increase your Movement Speed by {scale=8|8}% while using Shield.', N'[Shield] Increase your Movement Speed by {scale=8|8}% while using Shield.', N'Dire Need', 2071, N'https://web2.hirez.com/paladins/champion-cards/dire-need.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (742, 13392, N'[Armor] Increase your Movement Speed by {scale=7|7}% while Out of Combat.', N'[Armor] Increase your Movement Speed by {scale=7|7}% while Out of Combat.', N'Disappear', 2267, N'https://web2.hirez.com/paladins/champion-cards/disappear.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (743, 24153, N'[Elemental Shift] Elemental Shift reduces the Cooldown of Frostfire Glide by {scale=0.6|0.6}s.', N'[Elemental Shift] Elemental Shift reduces the Cooldown of Frostfire Glide by {scale=0.6|0.6}s.', N'Discipline', 2509, N'https://web2.hirez.com/paladins/champion-cards/discipline.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (744, 14655, N'[Reversal] Reduce the Cooldown of Reversal by {scale=1.2|1.2}s.', N'[Reversal] Reduce the Cooldown of Reversal by {scale=1.2|1.2}s.', N'Disrupt', 2205, N'https://web2.hirez.com/paladins/champion-cards/disrupt.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (745, 12796, N'[Smoke Screen] Increase your Movement Speed by {scale=8|8}% for 2s after entering Smoke Screen.', N'[Smoke Screen] Increase your Movement Speed by {scale=8|8}% for 2s after entering Smoke Screen.', N'Dissipate', 2057, N'https://web2.hirez.com/paladins/champion-cards/dissipate.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (746, 24310, N'[Armor] Increase your Healing received from others by {scale=5|5}% while at or below 50% Health.', N'[Armor] Increase your Healing received from others by {scale=5|5}% while at or below 50% Health.', N'Distant Memory', 2512, N'https://web2.hirez.com/paladins/champion-cards/distant-memory.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (747, 14370, N'[Grumpy Bomb] Heal for {scale=75|75} after using Grumpy Bomb.', N'[Grumpy Bomb] Heal for {scale=75|75} after using Grumpy Bomb.', N'Doomsday', 2281, N'https://web2.hirez.com/paladins/champion-cards/doomsday.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (748, 25372, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Battle-Ready', 2533, N'https://web2.hirez.com/paladins/champion-cards/battle-ready.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (749, 12215, N'[Rocket Boots] Heal for {scale=50|50} every 1s for 3s after activating Rocket Boots.', N'[Rocket Boots] Heal for {scale=50|50} every 1s for 3s after activating Rocket Boots.', N'Double-Time', 2073, N'https://web2.hirez.com/paladins/champion-cards/double-time.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (750, 18569, N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'[Armor] Increase your maximum Ammo by {scale=1|1}.', N'Dragon Oil', 2420, N'https://web2.hirez.com/paladins/champion-cards/dragon-oil.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (751, 23743, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Dreadnought', 2495, N'https://web2.hirez.com/paladins/champion-cards/dreadnought.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (752, 16822, N'[Shadow Travel] Reduce the Cooldown of Shadow Travel by {scale=0.6|0.6}s.', N'[Shadow Travel] Reduce the Cooldown of Shadow Travel by {scale=0.6|0.6}s.', N'Dusk-Walker', 2372, N'https://web2.hirez.com/paladins/champion-cards/dusk-walker.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (753, 19160, N'[Void Grip] Heal for {scale=50|50} every 1s while using Void Grip.', N'[Void Grip] Heal for {scale=50|50} every 1s while using Void Grip.', N'Eclipse', 2431, N'https://web2.hirez.com/paladins/champion-cards/eclipse.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (754, 13385, N'[Dimensional Link] Reduce the Cooldown of Dimensional Link by {scale=1|1}s.', N'[Dimensional Link] Reduce the Cooldown of Dimensional Link by {scale=1|1}s.', N'Efficiency', 2267, N'https://web2.hirez.com/paladins/champion-cards/efficiency.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (755, 14808, N'[Weapon] Increase your Ammo regeneration speed by {scale=12|12}%.', N'[Weapon] Increase your Ammo regeneration speed by {scale=12|12}%.', N'Electrostatic', 2093, N'https://web2.hirez.com/paladins/champion-cards/electrostatic.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (756, 24154, N'[Elemental Shift] Heal for {scale=50|50} after using Elemental Shift.', N'[Elemental Shift] Heal for {scale=50|50} after using Elemental Shift.', N'Elemental Barrier', 2509, N'https://web2.hirez.com/paladins/champion-cards/elemental-barrier.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (757, 24011, N'[Armor] Gain a {scale=100|100}-health Shield for 3s after dropping to or below 50% Health.', N'[Armor] Gain a {scale=100|100}-health Shield for 3s after dropping to or below 50% Health.', N'Elemental Grace', 2509, N'https://web2.hirez.com/paladins/champion-cards/elemental-grace.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (758, 13293, N'[Nether Step] Increase your Movement Speed by {scale=10|10}% for 3s after activating Nether Step.', N'[Nether Step] Increase your Movement Speed by {scale=10|10}% for 3s after activating Nether Step.', N'Elusive', 2205, N'https://web2.hirez.com/paladins/champion-cards/elusive.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (759, 18621, N'[Billow] Regenerate 2 Ammo every 0.5s for {scale=0.5|0.5}s after activating Billow.', N'[Billow] Regenerate 2 Ammo every 0.5s for {scale=0.5|0.5}s after activating Billow.', N'Embers', 2420, N'https://web2.hirez.com/paladins/champion-cards/embers.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (760, 12693, N'[Hidden] Automatically enter Stealth after dropping to or below 30% Health. This can happen once every {scale=25|-5}s.', N'[Hidden] Automatically enter Stealth after dropping to or below 30% Health. This can happen once every {scale=25|-5}s.', N'Emergency Exit', 2057, N'https://web2.hirez.com/paladins/champion-cards/emergency-exit.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (761, 24113, N'[Elemental Shift] Elemental Shift reduces the Cooldown of Frost Bomb and Inferno Cannon by {scale=0.6|0.6}s.', N'[Elemental Shift] Elemental Shift reduces the Cooldown of Frost Bomb and Inferno Cannon by {scale=0.6|0.6}s.', N'Draconic Will', 2509, N'https://web2.hirez.com/paladins/champion-cards/draconic-will.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (762, 16772, N'[Rend Soul] Every Soul Orb stack you detonate increases your Movement Speed by {scale=1|1}% for 3s, up to a maximum of 15%.', N'[Rend Soul] Every Soul Orb stack you detonate increases your Movement Speed by {scale=1|1}% for 3s, up to a maximum of 15%.', N'Bane', 2372, N'https://web2.hirez.com/paladins/champion-cards/bane.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (763, 14969, N'[Missile Launcher] Generate {scale=5|5} Ammo for each enemy hit by Missile Launcher.', N'[Missile Launcher] Generate {scale=5|5} Ammo for each enemy hit by Missile Launcher.', N'At The Ready', 2149, N'https://web2.hirez.com/paladins/champion-cards/at-the-ready.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (764, 12764, N'[Ghost Walk] Increase your Movement Speed while using Ghost Walk by {scale=10|10}%.', N'[Ghost Walk] Increase your Movement Speed while using Ghost Walk by {scale=10|10}%.', N'Astral Traveler', 2093, N'https://web2.hirez.com/paladins/champion-cards/astral-traveler.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (765, 22091, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Peppy', 2481, N'https://web2.hirez.com/paladins/champion-cards/peppy.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (766, 12988, N'[Blossom] Reduce the Cooldown of Blossom by {scale=0.4|0.4}s.', N'[Blossom] Reduce the Cooldown of Blossom by {scale=0.4|0.4}s.', N'Perennial', 2254, N'https://web2.hirez.com/paladins/champion-cards/perennial.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (767, 14193, N'[Crippling Throw] Reduce the Cooldown of Vine by {scale=1|1}s after hitting an enemy with Crippling Throw.', N'[Crippling Throw] Reduce the Cooldown of Vine by {scale=1|1}s after hitting an enemy with Crippling Throw.', N'Pick Up', 2254, N'https://web2.hirez.com/paladins/champion-cards/pick-up.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (768, 16629, N'[Impasse] Gain a {scale=75|75}-Health Shield for 3s after activating Impasse.', N'[Impasse] Gain a {scale=75|75}-Health Shield for 3s after activating Impasse.', N'Plateau', 2348, N'https://web2.hirez.com/paladins/champion-cards/plateau.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (769, 13148, N'[Poison Bolts] Reduce the Cooldown of Poison Bolts by {scale=0.8|0.8}s.', N'[Poison Bolts] Reduce the Cooldown of Poison Bolts by {scale=0.8|0.8}s.', N'Poisoner', 2057, N'https://web2.hirez.com/paladins/champion-cards/poisoner.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (770, 13217, N'[Armor] Reset the Cooldown of Transporter after dropping to or below {scale=12|12}% Health.', N'[Armor] Reset the Cooldown of Transporter after dropping to or below {scale=12|12}% Health.', N'Power Supply', 2249, N'https://web2.hirez.com/paladins/champion-cards/power-supply.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (771, 19917, N'[Power Siphon] Reduce the Movement Speed penalty during Power Siphon by {scale=15|15}%.', N'[Power Siphon] Reduce the Movement Speed penalty during Power Siphon by {scale=15|15}%.', N'Powerslave', 2477, N'https://web2.hirez.com/paladins/champion-cards/powerslave.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (772, 16407, N'[Armor] Reduce the Cooldown of Prowl by {scale=0.2|0.2}s each time you hit an enemy with a dagger.', N'[Armor] Reduce the Cooldown of Prowl by {scale=0.2|0.2}s each time you hit an enemy with a dagger.', N'Predation', 2338, N'https://web2.hirez.com/paladins/champion-cards/predation.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (773, 18793, N'[Presence] Heal for {scale=100|100} after using Presence.', N'[Presence] Heal for {scale=100|100} after using Presence.', N'Present Arms', 2417, N'https://web2.hirez.com/paladins/champion-cards/present-arms.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (774, 15843, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Primal Might', 2314, N'https://web2.hirez.com/paladins/champion-cards/primal-might.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (775, 15404, N'[Gourd] Heal for {scale=75|75} after activating Gourd.', N'[Gourd] Heal for {scale=75|75} after activating Gourd.', N'Pungent Gourd', 2303, N'https://web2.hirez.com/paladins/champion-cards/pungent-gourd.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (776, 13249, N'[Smoke Screen] Reduce the Cooldown of Smoke Screen by {scale=0.6|0.6}s.', N'[Smoke Screen] Reduce the Cooldown of Smoke Screen by {scale=0.6|0.6}s.', N'Quick Smoker', 2057, N'https://web2.hirez.com/paladins/champion-cards/quick-smoker.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (777, 14640, N'[Armor] Increase your Movement Speed by {scale=8|8}% for 4s after getting an Elimination.', N'[Armor] Increase your Movement Speed by {scale=8|8}% for 4s after getting an Elimination.', N'Rampage', 2288, N'https://web2.hirez.com/paladins/champion-cards/rampage.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (778, 15857, N'[Hunter''s Mark] Reduce the Cooldown of Hunter’s Mark by {scale=1|1}s.', N'[Hunter''s Mark] Reduce the Cooldown of Hunter’s Mark by {scale=1|1}s.', N'Ranger', 2314, N'https://web2.hirez.com/paladins/champion-cards/ranger.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (779, 22878, N'[Bulwark] Increase the recharge rate of your Bulwark by {scale=6|6}%.', N'[Bulwark] Increase the recharge rate of your Bulwark by {scale=6|6}%.', N'Ready for War', 2479, N'https://web2.hirez.com/paladins/champion-cards/ready-for-war.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (780, 12662, N'[Weightless] Heal for {scale=60|60} every 1s while Weightless is active.', N'[Weightless] Heal for {scale=60|60} every 1s while Weightless is active.', N'Refreshing Jog', 2056, N'https://web2.hirez.com/paladins/champion-cards/refreshing-jog.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (781, 16778, N'[Weapon] Generate {scale=1|1} Ammo after getting a Killing Blow or Elimination.', N'[Weapon] Generate {scale=1|1} Ammo after getting a Killing Blow or Elimination.', N'Restock', 2362, N'https://web2.hirez.com/paladins/champion-cards/restock.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (782, 19173, N'[Astral Mark] Reduce the Cooldown of Astral Mark by {scale=0.4|0.4}s.', N'[Astral Mark] Reduce the Cooldown of Astral Mark by {scale=0.4|0.4}s.', N'Retrograde', 2431, N'https://web2.hirez.com/paladins/champion-cards/retrograde.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (783, 16865, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Revenant', 2372, N'https://web2.hirez.com/paladins/champion-cards/revenant.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (784, 15717, N'[Crippling Arrow] Increase the duration of the Cripple effect applied by Crippling Arrow by {scale=0.1|0.1}s.', N'[Crippling Arrow] Increase the duration of the Cripple effect applied by Crippling Arrow by {scale=0.1|0.1}s.', N'Run Them Down', 2307, N'https://web2.hirez.com/paladins/champion-cards/run-them-down.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (785, 13341, N'[Charge] Increase your Movement Speed by {scale=10|10}% for 3s after using Charge.', N'[Charge] Increase your Movement Speed by {scale=10|10}% for 3s after using Charge.', N'Running Start', 2071, N'https://web2.hirez.com/paladins/champion-cards/running-start.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (786, 15067, N'[Dredge Anchor] Regenerate 1 Ammo every 0.5s for {scale=0.5|0.5}s after activating Dredge Anchor.', N'[Dredge Anchor] Regenerate 1 Ammo every 0.5s for {scale=0.5|0.5}s after activating Dredge Anchor.', N'Salvage', 2288, N'https://web2.hirez.com/paladins/champion-cards/salvage.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (787, 16424, N'[Pounce] Heal for {scale=70|70} after using Pounce.', N'[Pounce] Heal for {scale=70|70} after using Pounce.', N'Savagery', 2338, N'https://web2.hirez.com/paladins/champion-cards/savagery.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (788, 19445, N'[Flare] Flare lasts {scale=0.6|0.6}s longer.', N'[Flare] Flare lasts {scale=0.6|0.6}s longer.', N'Overburn', 2438, N'https://web2.hirez.com/paladins/champion-cards/overburn.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (789, 22886, N'[Battle Shout] Generate {scale=4|4} Ammo after activating Battle Shout.', N'[Battle Shout] Generate {scale=4|4} Ammo after activating Battle Shout.', N'Open Fire!', 2479, N'https://web2.hirez.com/paladins/champion-cards/open-fire.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (790, 12737, N'[Dodge Roll] Activating Dodge Roll heals you for {scale=40|40}.', N'[Dodge Roll] Activating Dodge Roll heals you for {scale=40|40}.', N'Onslaught', 2092, N'https://web2.hirez.com/paladins/champion-cards/onslaught.jpg', 1, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (791, 20275, N'[Armor] Increase your Movement Speed by {scale=6|6}%.', N'[Armor] Increase your Movement Speed by {scale=6|6}%.', N'One Step Ahead', 2480, N'https://web2.hirez.com/paladins/champion-cards/one-step-ahead.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (792, 12458, N'[Ghost Walk] Reduce the Cooldown of Ghost Walk by {scale=0.6|0.6}s.', N'[Ghost Walk] Reduce the Cooldown of Ghost Walk by {scale=0.6|0.6}s.', N'Haunting', 2093, N'https://web2.hirez.com/paladins/champion-cards/haunting.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (793, 12415, N'[Turret] Heal for {scale=25|25} every 1s while standing near your Turret.', N'[Turret] Heal for {scale=25|25} every 1s while standing near your Turret.', N'Healing Station', 2073, N'https://web2.hirez.com/paladins/champion-cards/healing-station.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (794, 18581, N'[Armor] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow.', N'[Armor] Increase your Movement Speed by {scale=10|10}% for 4s after getting a Killing Blow.', N'Heartless', 2420, N'https://web2.hirez.com/paladins/champion-cards/heartless.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (795, 13403, N'[Shield] Reduce the Cooldown of Charge by {scale=0.5|0.5}s for every 1000 damage your Shield takes.', N'[Shield] Reduce the Cooldown of Charge by {scale=0.5|0.5}s for every 1000 damage your Shield takes.', N'Heat Transfer', 2071, N'https://web2.hirez.com/paladins/champion-cards/heat-transfer.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (796, 18336, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Heavy Metal', 2404, N'https://web2.hirez.com/paladins/champion-cards/heavy-metal.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (797, 17046, N'[Flutter] Heal for {scale=50|50} after activating Flutter.', N'[Flutter] Heal for {scale=50|50} after activating Flutter.', N'Hijinks', 2393, N'https://web2.hirez.com/paladins/champion-cards/hijinks.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (798, 13397, N'[Fireball] Increase your Movement Speed by {scale=8|8}% for 3s after hitting an enemy with Fireball.', N'[Fireball] Increase your Movement Speed by {scale=8|8}% for 3s after hitting an enemy with Fireball.', N'Hot Pursuit', 2071, N'https://web2.hirez.com/paladins/champion-cards/hot-pursuit.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (799, 13338, N'[Ice Block] Increase your Movement Speed by {scale=10|10}% for 4s after Ice Block ends.', N'[Ice Block] Increase your Movement Speed by {scale=10|10}% for 4s after Ice Block ends.', N'Howling Gale', 2094, N'https://web2.hirez.com/paladins/champion-cards/howling-gale.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (800, 19913, N'[Armor] Increase your maximum Health by {scale=150|150}.', N'[Armor] Increase your maximum Health by {scale=150|150}.', N'Hulking Monstrosity', 2477, N'https://web2.hirez.com/paladins/champion-cards/hulking-monstrosity.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (801, 15889, N'[Fire Bomb] Increase your Movement Speed by {scale=8|8}% for 4s after using Fire Bomb.', N'[Fire Bomb] Increase your Movement Speed by {scale=8|8}% for 4s after using Fire Bomb.', N'Incensed', 2314, N'https://web2.hirez.com/paladins/champion-cards/incensed.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (802, 20309, N'[Sensor Drone] Heal for {scale=85|85} after an enemy that is Revealed by your Sensor Drone dies.', N'[Sensor Drone] Heal for {scale=85|85} after an enemy that is Revealed by your Sensor Drone dies.', N'Informants', 2480, N'https://web2.hirez.com/paladins/champion-cards/informants.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (803, 22094, N'[Scamper] Heal for {scale=100|100} over the duration of Scamper.', N'[Scamper] Heal for {scale=100|100} over the duration of Scamper.', N'Scurry', 2481, N'https://web2.hirez.com/paladins/champion-cards/scurry.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (804, 18753, N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after earning an Elimination.', N'[Armor] Reduce your active Cooldowns by {scale=10|10}% after earning an Elimination.', N'Inheritance', 2417, N'https://web2.hirez.com/paladins/champion-cards/inheritance.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (805, 22881, N'[Commander''s Grab] Generate {scale=5|5} Ammo after activating Commander''s Grab.', N'[Commander''s Grab] Generate {scale=5|5} Ammo after activating Commander''s Grab.', N'Martial Law', 2479, N'https://web2.hirez.com/paladins/champion-cards/martial-law.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (806, 18606, N'[Counter] Reduce the Cooldown of Whirl by {scale=1|1}s after successfully hitting an enemy with Counter.', N'[Counter] Reduce the Cooldown of Whirl by {scale=1|1}s after successfully hitting an enemy with Counter.', N'Master Stance', 2420, N'https://web2.hirez.com/paladins/champion-cards/master-stance.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (807, 15650, N'[Withdraw] Reduce the Cooldown of Withdraw by {scale=0.6|0.6}s.', N'[Withdraw] Reduce the Cooldown of Withdraw by {scale=0.6|0.6}s.', N'Mirage', 2307, N'https://web2.hirez.com/paladins/champion-cards/mirage.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (808, 15057, N'[Armor] Increase your Healing received by {scale=6|6}% while at or below 50% Health.', N'[Armor] Increase your Healing received by {scale=6|6}% while at or below 50% Health.', N'Moxie', 2056, N'https://web2.hirez.com/paladins/champion-cards/moxie.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (809, 11446, N'[Emitter] Heal for {scale=50|50} every 1s while Emitter is active.', N'[Emitter] Heal for {scale=50|50} every 1s while Emitter is active.', N'Nanotechnology', 2149, N'https://web2.hirez.com/paladins/champion-cards/nanotechnology.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (810, 22150, N'[Familiar Spit] Generate {scale=0.4|0.4}% Ultimate charge for each unmarked enemy to which you apply a Magic Mark.', N'[Familiar Spit] Generate {scale=0.4|0.4}% Ultimate charge for each unmarked enemy to which you apply a Magic Mark.', N'Nature''s Blessing', 2481, N'https://web2.hirez.com/paladins/champion-cards/natures-blessing.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (811, 17022, N'[Seedling] Heal for {scale=75|75} after using Seedling.', N'[Seedling] Heal for {scale=75|75} after using Seedling.', N'Nectar', 2393, N'https://web2.hirez.com/paladins/champion-cards/nectar.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (812, 13395, N'[Weapon] Increase your Movement Speed while firing by {scale=5|5}%.', N'[Weapon] Increase your Movement Speed while firing by {scale=5|5}%.', N'No Chill', 2149, N'https://web2.hirez.com/paladins/champion-cards/no-chill.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (813, 16472, N'[Nine Lives] Reduce the Cooldown of Nine Lives by {scale=1|1}s.', N'[Nine Lives] Reduce the Cooldown of Nine Lives by {scale=1|1}s.', N'On Edge', 2338, N'https://web2.hirez.com/paladins/champion-cards/on-edge.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (814, 14438, N'[Frag Grenade] Gain {scale=8|8}% Movement Speed for 2s after using Frag Grenade.', N'[Frag Grenade] Gain {scale=8|8}% Movement Speed for 2s after using Frag Grenade.', N'On The Move', 2285, N'https://web2.hirez.com/paladins/champion-cards/on-the-move.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (815, 14814, N'[Armor] When a Turret is destroyed, reduce your active Cooldowns by {scale=6|6}%.', N'[Armor] When a Turret is destroyed, reduce your active Cooldowns by {scale=6|6}%.', N'One Man''s Scrap', 2073, N'https://web2.hirez.com/paladins/champion-cards/one-mans-scrap.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (816, 19209, N'[Void Grip] Reduce the Cooldown of Void Grip by {scale=1.2|1.2}s.', N'[Void Grip] Reduce the Cooldown of Void Grip by {scale=1.2|1.2}s.', N'Inner Peace', 2431, N'https://web2.hirez.com/paladins/champion-cards/inner-peace.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (817, 20222, N'[Weapon] Your heavy hit with Inferno Blade deals an additional 150 damage.', N'[Weapon] Your heavy hit with Inferno Blade deals an additional 150 damage.', N'Yomi', 2420, N'https://web2.hirez.com/paladins/champion-cards/yomi.jpg', 0, N'Inventory Vendor - Talents', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (818, 13355, N'[Hidden] Reduce the Cooldown of Hidden by {scale=1|1}s.', N'[Hidden] Reduce the Cooldown of Hidden by {scale=1|1}s.', N'Shadow Affinity', 2057, N'https://web2.hirez.com/paladins/champion-cards/shadow-affinity.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (819, 22109, N'[Magic Barrier] Reduce the Cooldown of Magic Barrier by {scale=0.5|0.5}s.', N'[Magic Barrier] Reduce the Cooldown of Magic Barrier by {scale=0.5|0.5}s.', N'Shimmering', 2481, N'https://web2.hirez.com/paladins/champion-cards/shimmering.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (820, 16177, N'[Protection] Increase the Movement Speed of your Protection target by {scale=10|10}% for 2s.', N'[Protection] Increase the Movement Speed of your Protection target by {scale=10|10}% for 2s.', N'Winddancer', 2322, N'https://web2.hirez.com/paladins/champion-cards/winddancer.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (821, 14441, N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'[Weapon] Increase your maximum Ammo by {scale=2|2}.', N'XL Mag', 2285, N'https://web2.hirez.com/paladins/champion-cards/xl-mag.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (822, 25010, N'[Ignition] Reduce the Cooldown of Ignition by {scale=0.6|0.6}s.', N'[Ignition] Reduce the Cooldown of Ignition by {scale=0.6|0.6}s.', N'Abhorrent Vista', 2528, N'https://web2.hirez.com/paladins/champion-cards/abhorrent-vista.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (823, 14713, N'[Poppy Bomb] Heal for {scale=100|100} for each enemy hit with Poppy Bomb.', N'[Poppy Bomb] Heal for {scale=100|100} for each enemy hit with Poppy Bomb.', N'Ablative Coating', 2281, N'https://web2.hirez.com/paladins/champion-cards/ablative-coating.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (824, 20043, N'[Calamity Blast] Generate {scale=2|2}% Power Siphon charge for each enemy hit with Calamity Blast.', N'[Calamity Blast] Generate {scale=2|2}% Power Siphon charge for each enemy hit with Calamity Blast.', N'Abomination', 2477, N'https://web2.hirez.com/paladins/champion-cards/abomination.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (825, 23749, N'[Broadside] Generate {scale=1|1} Ammo for each enemy hit by Broadside.', N'[Broadside] Generate {scale=1|1} Ammo for each enemy hit by Broadside.', N'Abyss Cannon', 2495, N'https://web2.hirez.com/paladins/champion-cards/abyss-cannon.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (826, 25005, N'[Ignition] Gain a {scale=100|100}-Health Shield for 3s after activating Ignition.', N'[Ignition] Gain a {scale=100|100}-Health Shield for 3s after activating Ignition.', N'Abyssal Connections', 2528, N'https://web2.hirez.com/paladins/champion-cards/abyssal-connections.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (827, 25379, N'[Abyssal Reconstruction] Reduce the damage taken by an ally Healed by Abyssal Reconstruction by 5% for {scale=0.3|0.3}s after being Healed.', N'[Abyssal Reconstruction] Reduce the damage taken by an ally Healed by Abyssal Reconstruction by 5% for {scale=0.3|0.3}s after being Healed.', N'Abyssal Effluxion', 2533, N'https://web2.hirez.com/paladins/champion-cards/abyssal-effluxion.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (828, 25387, N'[Projection] Reduce your damage taken by {scale=3|3}% while Projection is out.', N'[Projection] Reduce your damage taken by {scale=3|3}% while Projection is out.', N'Abyssal Shift', 2533, N'https://web2.hirez.com/paladins/champion-cards/abyssal-shift.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (829, 12668, N'[Weapon] Reduce the Cooldown of Healing Potion by {scale=0.1|0.1}s after hitting an enemy with your weapon.', N'[Weapon] Reduce the Cooldown of Healing Potion by {scale=0.1|0.1}s after hitting an enemy with your weapon.', N'Acrobat''s Trick', 2056, N'https://web2.hirez.com/paladins/champion-cards/acrobats-trick.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (830, 12840, N'[Explosive Flask] Gain {scale=10|10}% Lifesteal against enemies Slowed by your Explosive Flask.', N'[Explosive Flask] Gain {scale=10|10}% Lifesteal against enemies Slowed by your Explosive Flask.', N'Acumen', 2056, N'https://web2.hirez.com/paladins/champion-cards/acumen.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (831, 24017, N'[Elemental Shift] Reduce the Cooldown of Elemental Shift by {scale=1|1}s.', N'[Elemental Shift] Reduce the Cooldown of Elemental Shift by {scale=1|1}s.', N'Affinity', 2509, N'https://web2.hirez.com/paladins/champion-cards/affinity.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (832, 13146, N'[Advance] Heal for {scale=80|80} after activating Advance.', N'[Advance] Heal for {scale=80|80} after activating Advance.', N'Air-Cooled', 2149, N'https://web2.hirez.com/paladins/champion-cards/air-cooled.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (833, 25177, N'[Crouching Tigron] Reduce the Cooldown of Crouching Tigron by {scale=0.6|0.6}s.', N'[Crouching Tigron] Reduce the Cooldown of Crouching Tigron by {scale=0.6|0.6}s.', N'Alley-Cat', 2529, N'https://web2.hirez.com/paladins/champion-cards/alley-cat.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (834, 24010, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Ancient Duty', 2509, N'https://web2.hirez.com/paladins/champion-cards/ancient-duty.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (835, 14906, N'[Shell Shield] Increase the duration of Shell Shield by {scale=0.6|0.6}s.', N'[Shell Shield] Increase the duration of Shell Shield by {scale=0.6|0.6}s.', N'Ancient Resolve', 2288, N'https://web2.hirez.com/paladins/champion-cards/ancient-resolve.jpg', 1, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (836, 16814, N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'Antics', 2393, N'https://web2.hirez.com/paladins/champion-cards/antics.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (837, 14103, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Apex Predator', 2277, N'https://web2.hirez.com/paladins/champion-cards/apex-predator.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (838, 24999, N'[Juggernaut] Heal for {scale=150|150} for each champion hit by Juggernaut.', N'[Juggernaut] Heal for {scale=150|150} for each champion hit by Juggernaut.', N'Apocalypse', 2528, N'https://web2.hirez.com/paladins/champion-cards/apocalypse.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (839, 24111, N'[Inferno Cannon] Increase the Mana generation of Inferno Cannon by {scale=15|15}%.', N'[Inferno Cannon] Increase the Mana generation of Inferno Cannon by {scale=15|15}%.', N'Arcane Flame', 2509, N'https://web2.hirez.com/paladins/champion-cards/arcane-flame.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (840, 24112, N'[Frost Bomb] Increase the Mana generation of Frost Bomb by {scale=15|15}%.', N'[Frost Bomb] Increase the Mana generation of Frost Bomb by {scale=15|15}%.', N'Arcane Ice', 2509, N'https://web2.hirez.com/paladins/champion-cards/arcane-ice.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (841, 16795, N'[In Pursuit] Generate {scale=3|3} Ammo after activating In Pursuit.', N'[In Pursuit] Generate {scale=3|3} Ammo after activating In Pursuit.', N'Assail', 2362, N'https://web2.hirez.com/paladins/champion-cards/assail.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (842, 19169, N'[Astral Mark] Increase the duration of Astral Mark by {scale=0.4|0.4}s.', N'[Astral Mark] Increase the duration of Astral Mark by {scale=0.4|0.4}s.', N'Astral Cycle', 2431, N'https://web2.hirez.com/paladins/champion-cards/astral-cycle.jpg', 0, N'Inventory Vendor - Champion Cards', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (843, 19440, N'[Weapon] Reduce the recoil of your Pistol by {scale=6|6}%.', N'[Weapon] Reduce the recoil of your Pistol by {scale=6|6}%.', N'White Knuckle', 2438, N'https://web2.hirez.com/paladins/champion-cards/white-knuckle.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (844, 16666, N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'[Weapon] Increase your Reload Speed by {scale=5|5}%.', N'Whetstone', 2348, N'https://web2.hirez.com/paladins/champion-cards/whetstone.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (845, 14834, N'[Armor] Reduce all active Cooldowns by {scale=10|10}% after getting an Elimination.', N'[Armor] Reduce all active Cooldowns by {scale=10|10}% after getting an Elimination.', N'Watchful', 2205, N'https://web2.hirez.com/paladins/champion-cards/watchful.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (846, 16716, N'[Combat Slide] Increase your Movement Speed by {scale=10|10}% for 2s after Combat Slide ends.', N'[Combat Slide] Increase your Movement Speed by {scale=10|10}% for 2s after Combat Slide ends.', N'Warrants Out', 2362, N'https://web2.hirez.com/paladins/champion-cards/warrants-out.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (847, 19146, N'[Weapon] Increase your maximum Health by {scale=50|50}.', N'[Weapon] Increase your maximum Health by {scale=50|50}.', N'Sidereal', 2431, N'https://web2.hirez.com/paladins/champion-cards/sidereal.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (848, 12734, N'[Disengage] Heal for {scale=125|125} after hitting an enemy with Disengage.', N'[Disengage] Heal for {scale=125|125} after hitting an enemy with Disengage.', N'Sky Warden', 2092, N'https://web2.hirez.com/paladins/champion-cards/sky-warden.jpg', 1, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (849, 15351, N'[Slither] Heal for {scale=80|80} after using Slither.', N'[Slither] Heal for {scale=80|80} after using Slither.', N'Spirit''s Touch', 2303, N'https://web2.hirez.com/paladins/champion-cards/spirits-touch.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (850, 14100, N'[Salvo] Reduce the Cooldown of Salvo by {scale=0.25|0.25}s each time Salvo hits an  enemy with its rockets.', N'[Salvo] Reduce the Cooldown of Salvo by {scale=0.25|0.25}s each time Salvo hits an  enemy with its rockets.', N'Spitfire', 2277, N'https://web2.hirez.com/paladins/champion-cards/spitfire.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (851, 13391, N'[Illusion] Reduce the Cooldown of Illusion by {scale=0.5|0.5}s when an Illusion dies to an enemy.', N'[Illusion] Reduce the Cooldown of Illusion by {scale=0.5|0.5}s when an Illusion dies to an enemy.', N'Spring Bloom', 2267, N'https://web2.hirez.com/paladins/champion-cards/spring-bloom.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (852, 13405, N'[Dimensional Link] Increase the duration of Dimensional Link by {scale=0.7|0.7}s.', N'[Dimensional Link] Increase the duration of Dimensional Link by {scale=0.7|0.7}s.', N'Spring Forward', 2267, N'https://web2.hirez.com/paladins/champion-cards/spring-forward.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (853, 16624, N'[Warder''s Field] Reduce the Cooldown of Warder''s Field by {scale=1|1}s.', N'[Warder''s Field] Reduce the Cooldown of Warder''s Field by {scale=1|1}s.', N'Standing Stones', 2348, N'https://web2.hirez.com/paladins/champion-cards/standing-stones.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (854, 19202, N'[Stellar Wind] Increase your air control while using Stellar Wind by {scale=14|14}%.', N'[Stellar Wind] Increase your air control while using Stellar Wind by {scale=14|14}%.', N'Star Seeker', 2431, N'https://web2.hirez.com/paladins/champion-cards/star-seeker.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (855, 13354, N'[Weapon] Reduce all active Cooldowns by {scale=15|15}% after getting a Killing Blow.', N'[Weapon] Reduce all active Cooldowns by {scale=15|15}% after getting a Killing Blow.', N'Stomping Ground', 2147, N'https://web2.hirez.com/paladins/champion-cards/stomping-ground.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (856, 16654, N'[Earthen Guard] Heal for {scale=25|25} every 1s while Earthen Guard is active.', N'[Earthen Guard] Heal for {scale=25|25} every 1s while Earthen Guard is active.', N'Stone Bulwark', 2348, N'https://web2.hirez.com/paladins/champion-cards/stone-bulwark.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (857, 16442, N'[Prowl] Increase the duration of Prowl by {scale=0.5|0.5}s.', N'[Prowl] Increase the duration of Prowl by {scale=0.5|0.5}s.', N'Streetrunner', 2338, N'https://web2.hirez.com/paladins/champion-cards/streetrunner.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (858, 14796, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Shamanic Might', 2093, N'https://web2.hirez.com/paladins/champion-cards/shamanic-might.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (859, 14068, N'[Thrust] Reduce the Cooldown of Thrust by 100% after dropping to or below {scale=10|10}% Health.', N'[Thrust] Reduce the Cooldown of Thrust by 100% after dropping to or below {scale=10|10}% Health.', N'Survival', 2277, N'https://web2.hirez.com/paladins/champion-cards/survival.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (860, 13057, N'[Weapon] Generate {scale=4|4} Ammo after getting an Elimination.', N'[Weapon] Generate {scale=4|4} Ammo after getting an Elimination.', N'Tactical Reload', 2057, N'https://web2.hirez.com/paladins/champion-cards/tactical-reload.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (861, 13411, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Tangible', 2267, N'https://web2.hirez.com/paladins/champion-cards/tangible.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (862, 11416, N'[Blink] Increase the distance traveled by Blink by {scale=6|6}%.', N'[Blink] Increase the distance traveled by Blink by {scale=6|6}%.', N'Teleport', 2094, N'https://web2.hirez.com/paladins/champion-cards/teleport.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (863, 16784, N'[Retribution] You gain {scale=10|10}% Lifesteal against your Retribution target.', N'[Retribution] You gain {scale=10|10}% Lifesteal against your Retribution target.', N'The Hunted', 2362, N'https://web2.hirez.com/paladins/champion-cards/the-hunted.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (864, 13125, N'[Shock Pulse] Generate {scale=6|6}% of your Ammo for each unique enemy hit by Shock Pulse.', N'[Shock Pulse] Generate {scale=6|6}% of your Ammo for each unique enemy hit by Shock Pulse.', N'Thunderstruck', 2093, N'https://web2.hirez.com/paladins/champion-cards/thunderstruck.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (865, 14903, N'[Shell Shield] Heal for {scale=50|50} every 1s while Shell Shield is active.', N'[Shell Shield] Heal for {scale=50|50} every 1s while Shell Shield is active.', N'Tidal Grace', 2288, N'https://web2.hirez.com/paladins/champion-cards/tidal-grace.jpg', 1, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (866, 13345, N'[Sniper Mode] Hitting an enemy with a fully-charged Sniper Mode shot Heals you for {scale=100|100}.', N'[Sniper Mode] Hitting an enemy with a fully-charged Sniper Mode shot Heals you for {scale=100|100}.', N'True Grit', 2249, N'https://web2.hirez.com/paladins/champion-cards/true-grit.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (867, 17003, N'[Dead Zone] Reduce the Cooldown of Dead Zone by {scale=0.8|0.8}s.', N'[Dead Zone] Reduce the Cooldown of Dead Zone by {scale=0.8|0.8}s.', N'Twilight', 2393, N'https://web2.hirez.com/paladins/champion-cards/twilight.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (868, 20290, N'[Deflector Shield] Increase the duration of Deflector Shield by {scale=1|1}s.', N'[Deflector Shield] Increase the duration of Deflector Shield by {scale=1|1}s.', N'Unfair Advantage', 2480, N'https://web2.hirez.com/paladins/champion-cards/unfair-advantage.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (869, 18625, N'[Billow] Increase your Movement Speed by {scale=8|8}% while Billow is active.', N'[Billow] Increase your Movement Speed by {scale=8|8}% while Billow is active.', N'Up in Smoke', 2420, N'https://web2.hirez.com/paladins/champion-cards/up-in-smoke.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (870, 14219, N'[Vine] Increase the range of Vine by {scale=10|10}%.', N'[Vine] Increase the range of Vine by {scale=10|10}%.', N'Vine Grasp', 2254, N'https://web2.hirez.com/paladins/champion-cards/vine-grasp.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (871, 15695, N'[Armor] Increase your maximum Health by {scale=50|50}.', N'[Armor] Increase your maximum Health by {scale=50|50}.', N'Swagger', 2307, N'https://web2.hirez.com/paladins/champion-cards/swagger.jpg', 0, N'Card Vendor Rank 1 Rare', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
INSERT [dbo].[Item] ([Id], [PItemId], [Description], [ShortDescription], [DeviceName], [PChampionId], [ItemIconUrl], [Price], [ItemType], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (872, 19230, N'[Astral Mark] Applying Astral Mark heals you for 160 Health per second over 10 seconds.', N'[Astral Mark] Applying Astral Mark heals you for 160 Health per second over 10 seconds.', N'Relativity', 2431, N'https://web2.hirez.com/paladins/champion-cards/relativity.jpg', 0, N'zDeprecated Card Vendor Rank 4', CAST(N'2020-08-28T18:17:30.163' AS DateTime), CAST(N'2020-08-28T18:17:30.163' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 1, N'English', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 2, N'German', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 3, N'French', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 5, N'Chinese', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 7, N'Spanish', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 9, N'Spanish (Latin America)', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 10, N'Portuguese', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 11, N'Russian', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 12, N'Polish', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
INSERT [dbo].[Language] ([Id], [PLanguageId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 13, N'Turkish', CAST(N'2020-08-28T18:17:25.643' AS DateTime), CAST(N'2020-08-28T18:17:25.643' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Queue] ON 
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 424, N'LIVE Siege', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 459, N'Custom Siege Splitstone Quarry', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 458, N'Custom Siege Brightmarsh', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 440, N'Custom Siege Serpent Beach', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 439, N'Custom Siege Ice Mines', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 438, N'Custom Siege Jaguar Falls', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 433, N'Custom Siege Frog Isle', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 432, N'Custom Siege Frozen Guard', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 431, N'Custom Siege Fish Market', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 430, N'Custom Siege Timber Mill', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 423, N'Custom Siege Stone Keep', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 472, N'Custom Team Deathmatch Magistrate''s Archives', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 471, N'Custom Team Deathmatch Foreman''s Rise', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 468, N'Custom Team Deathmatch Trade District', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 470, N'LIVE Team Deathmatch Practice', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 469, N'LIVE Team Deathmatch', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 465, N'Classic Siege', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 453, N'LIVE Onslaught Practice', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 452, N'LIVE Onslaught', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 445, N'LIVE Test Maps', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 426, N'LIVE Competitive', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 425, N'LIVE Practice Siege', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 454, N'Custom Onslaught Snowfall Junction', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
INSERT [dbo].[Queue] ([Id], [PQueueId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 455, N'Custom Onslaught Primal Court', CAST(N'2020-08-28T18:17:27.097' AS DateTime), CAST(N'2020-08-28T18:17:27.097' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Queue] OFF
GO
SET IDENTITY_INSERT [dbo].[Skin] ON 
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 2205, N'Epic', 55488, N'Battlesuit Godslayer', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 2205, N'Common', 15144, N'Wraith', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 2205, N'Common', 20591, N'Wraith', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 2205, N'Epic', 25750, N'Steam Demon', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 2205, N'Epic', 17156, N'Steam Demon', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 2205, N'Epic', 24081, N'Steam Demon', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 2205, N'Rare', 15145, N'Stage 4', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 2205, N'Rare', 22293, N'Stage 4', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 2205, N'Rare', 26731, N'Obsidian Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 2205, N'Rare', 19124, N'Obsidian Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 2205, N'Rare', 26666, N'Obsidian Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 2205, N'Rare', 22285, N'X', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 2205, N'Rare', 20189, N'Imperator', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 2205, N'Rare', 16405, N'Exalted', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 2205, N'Rare', 23004, N'Exalted', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 2205, N'', 12199, N'Default Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 2205, N'', 20911, N'Default Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 2205, N'Rare', 23040, N'Dasher''s Antlers', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 2205, N'Rare', 21901, N'Dasher''s Antlers', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 2205, N'Epic', 26746, N'Cosmic Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 2205, N'Epic', 19125, N'Cosmic Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 2205, N'Epic', 26669, N'Cosmic Androxus', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 2205, N'Epic', 23950, N'Battlesuit Godslayer', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 2205, N'Rare', 37627, N'Imperator', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 2205, N'Rare', 15146, N'X', CAST(N'2020-08-31T09:18:24.853' AS DateTime), CAST(N'2020-08-31T09:18:24.853' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 2404, N'Rare', 60919, N'Heirloom Crest', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 2404, N'Rare', 23042, N'Heirloom Crest', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (28, 2404, N'Uncommon', 26348, N'Hellion', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (29, 2404, N'Uncommon', 18865, N'Hellion', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (30, 2404, N'Epic', 26909, N'Ronin', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (31, 2404, N'Epic', 19257, N'Ronin', CAST(N'2020-08-31T09:18:26.660' AS DateTime), CAST(N'2020-08-31T09:18:26.660' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (32, 2073, N'', 20914, N'Default Barik', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (33, 2073, N'', 12200, N'Default Barik', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (34, 2073, N'Common', 20670, N'Foreman', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (35, 2073, N'Common', 15225, N'Foreman', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (36, 2073, N'Rare', 36451, N'Hi-Tek', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (37, 2073, N'Rare', 19683, N'Hi-Tek', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (38, 2073, N'Rare', 24124, N'Stone-Cut', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (39, 2073, N'Rare', 17197, N'Stone-Cut', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (40, 2073, N'Rare', 25718, N'Stone-Cut', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (41, 2073, N'Epic', 36465, N'Swashbuckler', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (42, 2073, N'Epic', 19686, N'Swashbuckler', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (43, 2073, N'Epic', 20610, N'Team Fortress 2', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (44, 2073, N'Epic', 14870, N'Team Fortress 2', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (45, 2073, N'Epic', 20656, N'Team Fortress 2', CAST(N'2020-08-31T09:18:28.150' AS DateTime), CAST(N'2020-08-31T09:18:28.150' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (46, 2281, N'Epic', 37625, N'A-bomb-inable', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (47, 2281, N'Epic', 20145, N'A-bomb-inable', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (48, 2281, N'Rare', 23782, N'Biz-King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (49, 2281, N'Rare', 17079, N'Biz-King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (50, 2281, N'', 20917, N'Default Bomb King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (51, 2281, N'', 13336, N'Default Bomb King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (52, 2281, N'Epic', 45298, N'Love Machine', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (53, 2281, N'Epic', 21268, N'Love Machine', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (54, 2281, N'Uncommon', 21477, N'Monarch', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (55, 2281, N'Uncommon', 14359, N'Monarch', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (56, 2281, N'Epic', 21250, N'Pumpking', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (57, 2281, N'Epic', 15568, N'Pumpking', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (58, 2281, N'Epic', 45492, N'Twitch Prime King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (59, 2281, N'Epic', 14998, N'Twitch Prime King', CAST(N'2020-08-31T09:18:28.717' AS DateTime), CAST(N'2020-08-31T09:18:28.717' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (60, 2147, N'Rare', 21411, N'Brawler', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (61, 2147, N'Epic', 14314, N'Triggerman', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (62, 2147, N'Epic', 19852, N'Triggerman', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (63, 2147, N'Common', 15601, N'Summit', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (64, 2147, N'Common', 21414, N'Summit', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (65, 2147, N'Rare', 26734, N'Obsidian Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (66, 2147, N'Rare', 19126, N'Obsidian Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (67, 2147, N'Rare', 26667, N'Obsidian Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (68, 2147, N'Epic', 15602, N'Kingpin', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (69, 2147, N'Epic', 21404, N'Kingpin', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (70, 2147, N'Legendary', 26383, N'Golden Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (71, 2147, N'Legendary', 65360, N'Golden Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (72, 2147, N'Rare', 13274, N'Envy', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (73, 2147, N'Rare', 21494, N'Envy', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (74, 2147, N'Epic', 26743, N'Cosmic Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (75, 2147, N'Epic', 19127, N'Cosmic Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (76, 2147, N'Epic', 26670, N'Cosmic Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (77, 2147, N'Rare', 13273, N'Commando', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (78, 2147, N'Rare', 18353, N'Commando', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (79, 2147, N'Epic', 17144, N'Buck Wild', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (80, 2147, N'Epic', 25570, N'Buck Wild', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (81, 2147, N'Rare', 15608, N'Brawler', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (82, 2147, N'', 20920, N'z--Unused--Default Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (83, 2147, N'', 13216, N'z--Unused--Default Buck', CAST(N'2020-08-31T09:18:29.940' AS DateTime), CAST(N'2020-08-31T09:18:29.940' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (84, 2092, N'Epic', 25684, N'Blood Moon Raiment', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (85, 2092, N'Rare', 13301, N'Timber', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (86, 2092, N'Rare', 21486, N'Timber', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (87, 2092, N'Epic', 18846, N'Sun Kissed', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (88, 2092, N'Epic', 26149, N'Sun Kissed', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (89, 2092, N'Rare', 12786, N'Northern Watch', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (90, 2092, N'Rare', 18334, N'Northern Watch', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (91, 2092, N'Epic', 13267, N'Night Bane''s Raiment', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (92, 2092, N'Epic', 19586, N'Night Bane''s Raiment', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (93, 2092, N'Rare', 22086, N'Tinder', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (94, 2092, N'Epic', 20070, N'Dune Crawler', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (95, 2092, N'', 12201, N'Default Cassie', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (96, 2092, N'', 20922, N'Default Cassie', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (97, 2092, N'Common', 15951, N'Coral', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (98, 2092, N'Common', 20879, N'Coral', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (99, 2092, N'Epic', 19397, N'Copacabana', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (100, 2092, N'Epic', 27191, N'Copacabana', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (101, 2092, N'Epic', 26594, N'Blood Moon Raiment', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (102, 2092, N'Epic', 18615, N'Blood Moon Raiment', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (103, 2092, N'Epic', 37451, N'Dune Crawler', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (104, 2092, N'Rare', 15949, N'Tinder', CAST(N'2020-08-31T09:18:31.090' AS DateTime), CAST(N'2020-08-31T09:18:31.090' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (105, 2277, N'Epic', 25934, N'Cosmic Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (106, 2277, N'Epic', 19335, N'Terrormorph', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (107, 2277, N'Epic', 27042, N'Terrormorph', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (108, 2277, N'Rare', 26188, N'Obsidian Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (109, 2277, N'Rare', 18679, N'Obsidian Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (110, 2277, N'Rare', 25936, N'Obsidian Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (111, 2277, N'Rare', 19971, N'HRX 2018', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (112, 2277, N'Rare', 37182, N'HRX 2018', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (113, 2277, N'Legendary', 26393, N'Golden Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (114, 2277, N'Legendary', 65362, N'Golden Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (115, 2277, N'Epic', 19787, N'DZ-03 Draco', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (116, 2277, N'Epic', 36758, N'DZ-03 Draco', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (117, 2277, N'Epic', 16558, N'Dreadhunter', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (118, 2277, N'Epic', 23239, N'Dreadhunter', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (119, 2277, N'', 13404, N'Default Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (120, 2277, N'', 20924, N'Default Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (121, 2277, N'Epic', 26206, N'Cosmic Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (122, 2277, N'Epic', 18680, N'Cosmic Drogoz', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (123, 2277, N'Uncommon', 20876, N'Tyrant', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (124, 2277, N'Uncommon', 14132, N'Tyrant', CAST(N'2020-08-31T09:18:33.183' AS DateTime), CAST(N'2020-08-31T09:18:33.183' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (125, 2094, N'Epic', 36654, N'Bewitching', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (126, 2094, N'Rare', 17162, N'Star Glam', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (127, 2094, N'Rare', 25467, N'Star Glam', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (128, 2094, N'Rare', 19054, N'Obsidian Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (129, 2094, N'Rare', 26400, N'Obsidian Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (130, 2094, N'Epic', 15863, N'Merrymaker', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (131, 2094, N'Epic', 21939, N'Merrymaker', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (132, 2094, N'Common', 15216, N'Evocation', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (133, 2094, N'Common', 20674, N'Evocation', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (134, 2094, N'', 12202, N'Default Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (135, 2094, N'', 20929, N'Default Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (136, 2094, N'Epic', 19055, N'Cosmic Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (137, 2094, N'Epic', 26399, N'Cosmic Evie', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (138, 2094, N'Rare', 13266, N'Black Ice', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (139, 2094, N'Rare', 18335, N'Black Ice', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (140, 2094, N'Epic', 19743, N'Bewitching', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (141, 2094, N'Epic', 20666, N'Troublemaker', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (142, 2094, N'Epic', 15211, N'Troublemaker', CAST(N'2020-08-31T09:18:34.157' AS DateTime), CAST(N'2020-08-31T09:18:34.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (143, 2071, N'Common', 20695, N'Daring', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (144, 2071, N'Common', 14805, N'Daring', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (145, 2071, N'', 20932, N'Default Fernando', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (146, 2071, N'', 12203, N'Default Fernando', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (147, 2071, N'Epic', 37019, N'Enforcer', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (148, 2071, N'Epic', 19879, N'Enforcer', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (149, 2071, N'Epic', 27606, N'FN-01 Erebos', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (150, 2071, N'Epic', 19538, N'FN-01 Erebos', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (151, 2071, N'Epic', 23364, N'FN-01 Helios', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (152, 2071, N'Epic', 16685, N'FN-01 Helios', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (153, 2071, N'Epic', 18332, N'God of War', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (154, 2071, N'Epic', 12785, N'God of War', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (155, 2071, N'Rare', 21986, N'Invitational 2017', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (156, 2071, N'Rare', 15922, N'Invitational 2017', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (157, 2071, N'Rare', 18336, N'Onslaught', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (158, 2071, N'Rare', 12784, N'Onslaught', CAST(N'2020-08-31T09:18:35.157' AS DateTime), CAST(N'2020-08-31T09:18:35.157' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (159, 2093, N'Uncommon', 21227, N'Beast', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (160, 2093, N'Uncommon', 13298, N'Beast', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (161, 2093, N'Epic', 37624, N'Brimstone', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (162, 2093, N'Epic', 14129, N'Brimstone', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (163, 2093, N'', 20935, N'Default Grohk', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (164, 2093, N'', 12204, N'Default Grohk', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (165, 2093, N'Rare', 49746, N'Grohk Lobster', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (166, 2093, N'Rare', 22526, N'Grohk Lobster', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (167, 2093, N'Rare', 18337, N'Tribesman', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (168, 2093, N'Rare', 13264, N'Tribesman', CAST(N'2020-08-31T09:18:36.603' AS DateTime), CAST(N'2020-08-31T09:18:36.603' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (169, 2254, N'Common', 18348, N'Autumn', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (170, 2254, N'Common', 13275, N'Autumn', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (171, 2254, N'', 20938, N'Default Grover', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (172, 2254, N'', 12940, N'Default Grover', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (173, 2254, N'Epic', 23785, N'Doom Shroom', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (174, 2254, N'Epic', 17082, N'Doom Shroom', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (175, 2254, N'Rare', 21902, N'Frosty Foliage', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (176, 2254, N'Rare', 23045, N'Frosty Foliage', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (177, 2254, N'Rare', 22794, N'Rosebud Canopy', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (178, 2254, N'Rare', 23046, N'Rosebud Canopy', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (179, 2254, N'Rare', 19655, N'Winter', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (180, 2254, N'Rare', 14144, N'Winter', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (181, 2254, N'Epic', 21994, N'z-- Frosty Foliage', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (182, 2254, N'Epic', 15838, N'z-- Frosty Foliage', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (183, 2254, N'Rare', 22797, N'z-- Rosebud Canopy', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (184, 2254, N'Rare', 16243, N'z-- Rosebud Canopy', CAST(N'2020-08-31T09:18:37.163' AS DateTime), CAST(N'2020-08-31T09:18:37.163' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (185, 2348, N'', 24130, N'Default Inara', CAST(N'2020-08-31T09:18:38.450' AS DateTime), CAST(N'2020-08-31T09:18:38.450' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (186, 2348, N'', 16245, N'Default Inara', CAST(N'2020-08-31T09:18:38.450' AS DateTime), CAST(N'2020-08-31T09:18:38.450' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (187, 2348, N'Epic', 26180, N'Ice Walker', CAST(N'2020-08-31T09:18:38.450' AS DateTime), CAST(N'2020-08-31T09:18:38.450' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (188, 2348, N'Epic', 18870, N'Ice Walker', CAST(N'2020-08-31T09:18:38.450' AS DateTime), CAST(N'2020-08-31T09:18:38.450' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (189, 2517, N'Rare', 57201, N'Starfall', CAST(N'2020-08-31T09:18:39.093' AS DateTime), CAST(N'2020-08-31T09:18:39.093' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (190, 2517, N'Rare', 24475, N'Starfall', CAST(N'2020-08-31T09:18:39.093' AS DateTime), CAST(N'2020-08-31T09:18:39.093' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (191, 2431, N'Rare', 27775, N'Eclipse', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (192, 2431, N'Rare', 19520, N'Eclipse', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (193, 2431, N'Epic', 47687, N'Exarch', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (194, 2431, N'Epic', 21123, N'Exarch', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (195, 2431, N'Uncommon', 27193, N'Millennium', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (196, 2431, N'Uncommon', 19392, N'Millennium', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (197, 2431, N'Rare', 37008, N'Resplendent', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (198, 2431, N'Rare', 19866, N'Resplendent', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (199, 2431, N'Epic', 47767, N'Soul Eater', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (200, 2431, N'Epic', 22869, N'Soul Eater', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (201, 2431, N'Rare', 49747, N'Squidbert', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (202, 2431, N'Rare', 22527, N'Squidbert', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (203, 2431, N'Rare', 36741, N'z--Unused--Ghoulish Goalie', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (204, 2431, N'Rare', 19757, N'z--Unused--Ghoulish Goalie', CAST(N'2020-08-31T09:18:39.867' AS DateTime), CAST(N'2020-08-31T09:18:39.867' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (205, 2249, N'Rare', 21903, N'Chillweave Beanie', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (206, 2249, N'Rare', 23048, N'Chillweave Beanie', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (207, 2249, N'Rare', 19851, N'Cutthroat', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (208, 2249, N'Rare', 14274, N'Cutthroat', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (209, 2249, N'', 20940, N'Default Kinessa', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (210, 2249, N'', 12941, N'Default Kinessa', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (211, 2249, N'Legendary', 58904, N'Golden Kinessa', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (212, 2249, N'Legendary', 24676, N'Golden Kinessa', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (213, 2249, N'Epic', 23366, N'Nova Strike', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (214, 2249, N'Epic', 16693, N'Nova Strike', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (215, 2249, N'Epic', 36516, N'Star Silver', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (216, 2249, N'Epic', 19717, N'Star Silver', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (217, 2249, N'Rare', 20808, N'Viking', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (218, 2249, N'Rare', 14335, N'Viking', CAST(N'2020-08-31T09:18:41.380' AS DateTime), CAST(N'2020-08-31T09:18:41.380' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (219, 2362, N'Epic', 25712, N'Cosmic Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (220, 2362, N'Epic', 20082, N'Renegade', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (221, 2362, N'Epic', 37626, N'Renegade', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (222, 2362, N'Rare', 26191, N'Obsidian Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (223, 2362, N'Rare', 18643, N'Obsidian Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (224, 2362, N'Rare', 25711, N'Obsidian Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (225, 2362, N'Epic', 18843, N'Longboard', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (226, 2362, N'Epic', 26150, N'Longboard', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (227, 2362, N'Epic', 19338, N'L-Exo Suit', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (228, 2362, N'Epic', 27043, N'L-Exo Suit', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (229, 2362, N'Common', 16950, N'Lawbringer', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (230, 2362, N'Common', 23622, N'Lawbringer', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (231, 2362, N'', 16531, N'Default Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (232, 2362, N'', 24133, N'Default Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (233, 2362, N'Rare', 22528, N'Croakie', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (234, 2362, N'Rare', 49748, N'Croakie', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (235, 2362, N'Epic', 26209, N'Cosmic Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (236, 2362, N'Epic', 18644, N'Cosmic Lex', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (237, 2362, N'Epic', 27085, N'Sarrada', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (238, 2362, N'Epic', 19354, N'Sarrada', CAST(N'2020-08-31T09:18:42.787' AS DateTime), CAST(N'2020-08-31T09:18:42.787' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (239, 2417, N'Uncommon', 26996, N'Dusk', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (240, 2417, N'Uncommon', 19316, N'Dusk', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (241, 2417, N'Epic', 27771, N'Goddess', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (242, 2417, N'Epic', 19486, N'Goddess', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (243, 2417, N'Legendary', 58745, N'Golden Lian', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (244, 2417, N'Legendary', 24668, N'Golden Lian', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (245, 2417, N'Epic', 38799, N'High Elf', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (246, 2417, N'Epic', 20419, N'High Elf', CAST(N'2020-08-31T09:18:43.467' AS DateTime), CAST(N'2020-08-31T09:18:43.467' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (247, 2338, N'Rare', 23776, N'Alley Cat', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (248, 2338, N'Legendary', 19275, N'Raeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (249, 2338, N'Legendary', 36630, N'Raeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (250, 2338, N'Rare', 26195, N'Obsidian Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (251, 2338, N'Rare', 18651, N'Obsidian Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (252, 2338, N'Rare', 25768, N'Obsidian Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (253, 2338, N'Legendary', 24756, N'Golden Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (254, 2338, N'Legendary', 59273, N'Golden Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (255, 2338, N'Common', 23185, N'Vagrant', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (256, 2338, N'Rare', 26501, N'Dreamhack', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (257, 2338, N'Rare', 25587, N'Dreamhack', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (258, 2338, N'', 16216, N'Default Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (259, 2338, N'', 24135, N'Default Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (260, 2338, N'Epic', 26213, N'Cosmic Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (261, 2338, N'Epic', 18652, N'Cosmic Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (262, 2338, N'Epic', 25767, N'Cosmic Maeve', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (263, 2338, N'Rare', 17074, N'Alley Cat', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (264, 2338, N'Rare', 18564, N'Dreamhack', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (265, 2338, N'Common', 16510, N'Vagrant', CAST(N'2020-08-31T09:18:44.023' AS DateTime), CAST(N'2020-08-31T09:18:44.023' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (266, 2288, N'Epic', 24006, N'Cosmic Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (267, 2288, N'Epic', 20432, N'Prosperous', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (268, 2288, N'Epic', 39165, N'Prosperous', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (269, 2288, N'Epic', 15648, N'Plushy', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (270, 2288, N'Epic', 21532, N'Plushy', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (271, 2288, N'Rare', 26199, N'Obsidian Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (272, 2288, N'Rare', 17090, N'Obsidian Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (273, 2288, N'Rare', 24008, N'Obsidian Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (274, 2288, N'Common', 14914, N'Montego', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (275, 2288, N'Common', 20377, N'Montego', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (276, 2288, N'Epic', 19680, N'Dutchman', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (277, 2288, N'Epic', 36456, N'Dutchman', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (278, 2288, N'', 14465, N'Default Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (279, 2288, N'', 20838, N'Default Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (280, 2288, N'Epic', 15649, N'Cuddly', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (281, 2288, N'Epic', 21533, N'Cuddly', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (282, 2288, N'Epic', 26217, N'Cosmic Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (283, 2288, N'Epic', 17091, N'Cosmic Makoa', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (284, 2288, N'Epic', 23374, N'Volcanic', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (285, 2288, N'Epic', 16688, N'Volcanic', CAST(N'2020-08-31T09:18:44.993' AS DateTime), CAST(N'2020-08-31T09:18:44.993' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (286, 2303, N'Epic', 23377, N'Chancellor', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (287, 2303, N'Rare', 22529, N'Prickly', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (288, 2303, N'Rare', 49749, N'Prickly', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (289, 2303, N'Rare', 19065, N'Obsidian Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (290, 2303, N'Rare', 26507, N'Obsidian Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (291, 2303, N'Legendary', 58565, N'Golden Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (292, 2303, N'Legendary', 24529, N'Golden Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (293, 2303, N'Legendary', 57258, N'Golden Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (294, 2303, N'Epic', 36696, N'Wickerman', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (295, 2303, N'Rare', 19258, N'Defiler', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (296, 2303, N'', 14587, N'Default Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (297, 2303, N'', 21124, N'Default Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (298, 2303, N'Common', 15425, N'Cursed', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (299, 2303, N'Common', 21083, N'Cursed', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (300, 2303, N'Epic', 19066, N'Cosmic Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (301, 2303, N'Epic', 26508, N'Cosmic Mal''Damba', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (302, 2303, N'Epic', 16682, N'Chancellor', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (303, 2303, N'Rare', 27205, N'Defiler', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (304, 2303, N'Epic', 19752, N'Wickerman', CAST(N'2020-08-31T09:18:45.863' AS DateTime), CAST(N'2020-08-31T09:18:45.863' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (305, 2056, N'Rare', 37628, N'Arctic', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (306, 2056, N'Common', 13277, N'Sulfur', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (307, 2056, N'Common', 18350, N'Sulfur', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (308, 2056, N'Rare', 14336, N'Raider', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (309, 2056, N'Rare', 20650, N'Raider', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (310, 2056, N'Rare', 26227, N'Pandamonium', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (311, 2056, N'Rare', 18224, N'Pandamonium', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (312, 2056, N'Rare', 25345, N'Pandamonium', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (313, 2056, N'Rare', 19545, N'Tactical', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (314, 2056, N'Epic', 14832, N'Mad Scientist', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (315, 2056, N'Rare', 23050, N'Love Specs', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (316, 2056, N'Rare', 22790, N'Love Specs', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (317, 2056, N'Epic', 17135, N'Invader', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (318, 2056, N'Epic', 25395, N'Invader', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (319, 2056, N'', 12198, N'Default Pip', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (320, 2056, N'', 20943, N'Default Pip', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (321, 2056, N'Rare', 20156, N'Arctic', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (322, 2056, N'Epic', 20644, N'Mad Scientist', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (323, 2056, N'Rare', 13276, N'Tactical', CAST(N'2020-08-31T09:18:47.473' AS DateTime), CAST(N'2020-08-31T09:18:47.473' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (324, 2149, N'Rare', 27133, N'B.E.T.A.', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (325, 2149, N'Rare', 18848, N'B.E.T.A.', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (326, 2149, N'', 20946, N'Default Ruckus', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (327, 2149, N'', 12206, N'Default Ruckus', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (328, 2149, N'Legendary', 59276, N'Golden Ruckus and Bolt', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (329, 2149, N'Legendary', 24764, N'Golden Ruckus and Bolt', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (330, 2149, N'Rare', 18338, N'H.A.W.K.', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (331, 2149, N'Rare', 13271, N'H.A.W.K.', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (332, 2149, N'Common', 21825, N'Sprocket', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (333, 2149, N'Common', 15812, N'Sprocket', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (334, 2149, N'Legendary', 21828, N'Star Slayer', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (335, 2149, N'Legendary', 13272, N'Star Slayer', CAST(N'2020-08-31T09:18:48.960' AS DateTime), CAST(N'2020-08-31T09:18:48.960' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (336, 2372, N'Epic', 56593, N'Cottontail', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (337, 2372, N'Epic', 24282, N'Cottontail', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (338, 2372, N'', 24147, N'Default Seris', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (339, 2372, N'', 16584, N'Default Seris', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (340, 2372, N'Epic', 37622, N'Divine', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (341, 2372, N'Epic', 20184, N'Divine', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (342, 2372, N'Rare', 37054, N'Expo 2018', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (343, 2372, N'Rare', 19891, N'Expo 2018', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (344, 2372, N'Epic', 26922, N'Infernal', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (345, 2372, N'Epic', 19276, N'Infernal', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (346, 2372, N'Epic', 48092, N'Jade Priestess', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (347, 2372, N'Epic', 22897, N'Jade Priestess', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (348, 2372, N'Epic', 45321, N'Madame', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (349, 2372, N'Epic', 20428, N'Madame', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (350, 2372, N'Common', 24119, N'Taboo', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (351, 2372, N'Common', 17193, N'Taboo', CAST(N'2020-08-31T09:18:49.743' AS DateTime), CAST(N'2020-08-31T09:18:49.743' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (352, 2307, N'Common', 21735, N'Bravado', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (353, 2307, N'Common', 15762, N'Bravado', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (354, 2307, N'Rare', 23381, N'Burrito Jersey', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (355, 2307, N'Rare', 16691, N'Burrito Jersey', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (356, 2307, N'Epic', 24073, N'Crime Fighter', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (357, 2307, N'Epic', 17151, N'Crime Fighter', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (358, 2307, N'', 21745, N'Default Sha Lin', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (359, 2307, N'', 14890, N'Default Sha Lin', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (360, 2307, N'Legendary', 65364, N'Golden Shalin', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (361, 2307, N'Legendary', 26392, N'Golden Shalin', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (362, 2307, N'Epic', 24074, N'Guardian', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (363, 2307, N'Epic', 17152, N'Guardian', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (364, 2307, N'Rare', 49750, N'In the Bag', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (365, 2307, N'Rare', 22530, N'In the Bag', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (366, 2307, N'Epic', 24072, N'Vigilante', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (367, 2307, N'Epic', 17150, N'Vigilante', CAST(N'2020-08-31T09:18:50.627' AS DateTime), CAST(N'2020-08-31T09:18:50.627' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (368, 2057, N'Epic', 45961, N'Academic', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (369, 2057, N'Epic', 22173, N'Academic', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (370, 2057, N'Rare', 18340, N'Chrome', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (371, 2057, N'Rare', 12787, N'Chrome', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (372, 2057, N'', 20948, N'Default Skye', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (373, 2057, N'', 12207, N'Default Skye', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (374, 2057, N'Epic', 22933, N'Heartbreaker', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (375, 2057, N'Epic', 16344, N'Heartbreaker', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (376, 2057, N'Epic', 27295, N'Kunoichi', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (377, 2057, N'Epic', 19290, N'Kunoichi', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (378, 2057, N'Rare', 18339, N'Operative', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (379, 2057, N'Rare', 13263, N'Operative', CAST(N'2020-08-31T09:18:51.497' AS DateTime), CAST(N'2020-08-31T09:18:51.497' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (380, 2438, N'Rare', 49751, N'Bad Mother Clucker', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (381, 2438, N'Rare', 22531, N'Bad Mother Clucker', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (382, 2438, N'Rare', 37434, N'Coldsnap', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (383, 2438, N'Rare', 20061, N'Coldsnap', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (384, 2438, N'Legendary', 59275, N'Golden Strix', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (385, 2438, N'Legendary', 24763, N'Golden Strix', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (386, 2438, N'Epic', 40546, N'Infiltrator', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (387, 2438, N'Epic', 21155, N'Infiltrator', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (388, 2438, N'Epic', 45032, N'Mercenary', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (389, 2438, N'Epic', 20200, N'Mercenary', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (390, 2438, N'Rare', 36646, N'Raven', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (391, 2438, N'Rare', 19734, N'Raven', CAST(N'2020-08-31T09:18:52.237' AS DateTime), CAST(N'2020-08-31T09:18:52.237' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (392, 2472, N'Epic', 37000, N'Oni', CAST(N'2020-08-31T09:18:52.870' AS DateTime), CAST(N'2020-08-31T09:18:52.870' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (393, 2472, N'Epic', 19864, N'Oni', CAST(N'2020-08-31T09:18:52.870' AS DateTime), CAST(N'2020-08-31T09:18:52.870' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (394, 2477, N'Epic', 37623, N'Jotunn', CAST(N'2020-08-31T09:18:53.407' AS DateTime), CAST(N'2020-08-31T09:18:53.407' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (395, 2477, N'Epic', 20174, N'Jotunn', CAST(N'2020-08-31T09:18:53.407' AS DateTime), CAST(N'2020-08-31T09:18:53.407' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (396, 2322, N'Common', 22842, N'Arcanist', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (397, 2322, N'Common', 16296, N'Arcanist', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (398, 2322, N'Epic', 27081, N'Clockwork', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (399, 2322, N'Epic', 19233, N'Clockwork', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (400, 2322, N'Epic', 26923, N'Cosmic Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (401, 2322, N'Epic', 19284, N'Cosmic Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (402, 2322, N'Epic', 37450, N'Dark Lord', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (403, 2322, N'Epic', 20069, N'Dark Lord', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (404, 2322, N'', 24141, N'Default Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (405, 2322, N'', 15810, N'Default Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (406, 2322, N'Rare', 26928, N'Obsidian Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (407, 2322, N'Rare', 19283, N'Obsidian Torvald', CAST(N'2020-08-31T09:18:54.773' AS DateTime), CAST(N'2020-08-31T09:18:54.773' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (408, 2314, N'Common', 22265, N'Alluvial', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (409, 2314, N'Rare', 26202, N'Obsidian Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (410, 2314, N'Rare', 18677, N'Obsidian Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (411, 2314, N'Rare', 25937, N'Obsidian Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (412, 2314, N'Rare', 20423, N'Lotus', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (413, 2314, N'Rare', 38805, N'Lotus', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (414, 2314, N'Epic', 20142, N'Drakefire', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (415, 2314, N'Epic', 43757, N'Drakefire', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (416, 2314, N'Epic', 19003, N'Dire Wolf', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (417, 2314, N'Epic', 26395, N'Dire Wolf', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (418, 2314, N'', 15822, N'Default Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (419, 2314, N'', 24142, N'Default Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (420, 2314, N'Epic', 26220, N'Cosmic Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (421, 2314, N'Epic', 18678, N'Cosmic Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (422, 2314, N'Epic', 25935, N'Cosmic Tyra', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (423, 2314, N'Rare', 16571, N'Baroness', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (424, 2314, N'Rare', 23258, N'Baroness', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (425, 2314, N'Common', 16096, N'Alluvial', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (426, 2314, N'Epic', 37023, N'Red Winter', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (427, 2314, N'Epic', 19882, N'Red Winter', CAST(N'2020-08-31T09:18:55.667' AS DateTime), CAST(N'2020-08-31T09:18:55.667' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (428, 2285, N'Rare', 20642, N'Charcoal', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (429, 2285, N'Epic', 26910, N'V1-KTOR', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (430, 2285, N'Rare', 15177, N'Soldier +', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (431, 2285, N'Rare', 22810, N'Soldier +', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (432, 2285, N'Epic', 22099, N'Reaver', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (433, 2285, N'Epic', 45861, N'Reaver', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (434, 2285, N'Rare', 26204, N'Obsidian Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (435, 2285, N'Rare', 17103, N'Obsidian Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (436, 2285, N'Rare', 24007, N'Obsidian Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (437, 2285, N'Rare', 23057, N'Lone Heart Patch', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (438, 2285, N'Rare', 22949, N'Lone Heart Patch', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (439, 2285, N'Common', 14477, N'Khaki', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (440, 2285, N'Common', 19969, N'Khaki', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (441, 2285, N'Rare', 15961, N'Invitational 2017', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (442, 2285, N'Epic', 19259, N'V1-KTOR', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (443, 2285, N'Rare', 22072, N'Invitational 2017', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (444, 2285, N'', 20950, N'Default Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (445, 2285, N'Epic', 26223, N'Cosmic Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (446, 2285, N'Epic', 17104, N'Cosmic Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (447, 2285, N'Epic', 24004, N'Cosmic Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (448, 2285, N'Epic', 16308, N'Code Green Trooper', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (449, 2285, N'Epic', 22910, N'Code Green Trooper', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (450, 2285, N'Epic', 16309, N'Code Green Grenadier', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (451, 2285, N'Epic', 22911, N'Code Green Grenadier', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (452, 2285, N'Epic', 16311, N'Code Green Comms', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (453, 2285, N'Epic', 22913, N'Code Green Comms', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (454, 2285, N'Epic', 16310, N'Code Green Bandolier', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (455, 2285, N'Epic', 22912, N'Code Green Bandolier', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (456, 2285, N'Rare', 14588, N'Charcoal', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (457, 2285, N'', 14173, N'Default Viktor', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (458, 2285, N'Epic', 27632, N'V1-KTOR', CAST(N'2020-08-31T09:18:56.880' AS DateTime), CAST(N'2020-08-31T09:18:56.880' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (459, 2480, N'Epic', 45299, N'Full Throttle', CAST(N'2020-08-31T09:18:57.543' AS DateTime), CAST(N'2020-08-31T09:18:57.543' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (460, 2480, N'Epic', 22051, N'Full Throttle', CAST(N'2020-08-31T09:18:57.543' AS DateTime), CAST(N'2020-08-31T09:18:57.543' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (461, 2480, N'Legendary', 57039, N'Golden Vivian', CAST(N'2020-08-31T09:18:57.543' AS DateTime), CAST(N'2020-08-31T09:18:57.543' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (462, 2480, N'Legendary', 24353, N'Golden Vivian', CAST(N'2020-08-31T09:18:57.543' AS DateTime), CAST(N'2020-08-31T09:18:57.543' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (463, 2393, N'Common', 25387, N'Bluebell', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (464, 2393, N'Rare', 25589, N'Viceroy', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (465, 2393, N'Rare', 26737, N'Obsidian Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (466, 2393, N'Rare', 19128, N'Obsidian Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (467, 2393, N'Rare', 26668, N'Obsidian Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (468, 2393, N'Rare', 20139, N'Jolly Holly', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (469, 2393, N'Rare', 37654, N'Jolly Holly', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (470, 2393, N'Rare', 18311, N'Viceroy', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (471, 2393, N'Epic', 19245, N'Hemlock', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (472, 2393, N'Epic', 20424, N'Firecracker', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (473, 2393, N'Epic', 38806, N'Firecracker', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (474, 2393, N'Epic', 26740, N'Cosmic Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (475, 2393, N'Epic', 19129, N'Cosmic Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (476, 2393, N'Epic', 26671, N'Cosmic Willo', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (477, 2393, N'Common', 18313, N'Bluebell', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (478, 2393, N'Epic', 26903, N'Hemlock', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (479, 2393, N'Rare', 26374, N'Viceroy', CAST(N'2020-08-31T09:18:58.370' AS DateTime), CAST(N'2020-08-31T09:18:58.370' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (480, 2267, N'Rare', 21941, N'Convention 2017', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (481, 2267, N'Common', 15434, N'Seer', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (482, 2267, N'Common', 21105, N'Seer', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (483, 2267, N'Epic', 20906, N'Replicant', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (484, 2267, N'Epic', 18559, N'Replicant', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (485, 2267, N'Epic', 25583, N'Replicant', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (486, 2267, N'Rare', 26589, N'Quicksilver', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (487, 2267, N'Rare', 18656, N'Quicksilver', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (488, 2267, N'Rare', 25814, N'Quicksilver', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (489, 2267, N'Rare', 17096, N'Obsidian Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (490, 2267, N'Rare', 24009, N'Obsidian Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (491, 2267, N'Epic', 16220, N'Genie', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (492, 2267, N'Epic', 22787, N'Genie', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (493, 2267, N'', 13212, N'Default Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (494, 2267, N'', 20953, N'Default Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (495, 2267, N'Epic', 17097, N'Cosmic Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (496, 2267, N'Epic', 24005, N'Cosmic Ying', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (497, 2267, N'Rare', 15867, N'Convention 2017', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (498, 2267, N'Rare', 19810, N'Snapdragon', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (499, 2267, N'Rare', 14215, N'Snapdragon', CAST(N'2020-08-31T09:18:58.923' AS DateTime), CAST(N'2020-08-31T09:18:58.923' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (500, 2420, N'Epic', 27365, N'Conqueror', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (501, 2420, N'Epic', 19347, N'Conqueror', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (502, 2420, N'Epic', 47755, N'Demon Slayer', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (503, 2420, N'Epic', 22863, N'Demon Slayer', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (504, 2420, N'Epic', 37686, N'Ebon Star', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (505, 2420, N'Epic', 20204, N'Ebon Star', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (506, 2420, N'Uncommon', 26575, N'Nomad', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
INSERT [dbo].[Skin] ([Id], [PChampionId], [Rarity], [PSkinId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (507, 2420, N'Uncommon', 19085, N'Nomad', CAST(N'2020-08-31T09:18:59.597' AS DateTime), CAST(N'2020-08-31T09:18:59.597' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Skin] OFF
GO
SET IDENTITY_INSERT [dbo].[Tier] ON 
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (1, 1, N'Bronze V', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (2, 25, N'Diamond I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (3, 24, N'Diamond II', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (4, 23, N'Diamond III', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (5, 22, N'Diamond VI', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (6, 21, N'Diamond V', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (7, 20, N'Platinum I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (8, 19, N'Platinum II', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (9, 18, N'Platinum III', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (10, 17, N'Platinum VI', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (11, 16, N'Platinum V', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (12, 15, N'Gold I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (13, 26, N'Masters I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (14, 14, N'Gold II', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (15, 12, N'Gold VI', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (16, 11, N'Gold V', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (17, 10, N'Silver I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (18, 9, N'Silver II', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (19, 8, N'Silver III', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (20, 7, N'Silver IV', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (21, 6, N'Silver V', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (22, 5, N'Bronze I', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (23, 4, N'Bronze II', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (24, 3, N'Bronze III', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (25, 2, N'Bronze IV', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (26, 13, N'Gold III', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
INSERT [dbo].[Tier] ([Id], [PTierId], [Name], [CreatedOn], [LastUpdatedOn], [IsActive]) VALUES (27, 27, N'Grandmaster', CAST(N'2020-08-28T18:17:27.177' AS DateTime), CAST(N'2020-08-28T18:17:27.177' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Tier] OFF
GO
/****** Object:  Index [CHK_PAbilityId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Ability] ADD  CONSTRAINT [CHK_PAbilityId] UNIQUE NONCLUSTERED 
(
	[PAbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PChampionId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Champion] ADD  CONSTRAINT [CHK_PChampionId] UNIQUE NONCLUSTERED 
(
	[PChampionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PItemId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [CHK_PItemId] UNIQUE NONCLUSTERED 
(
	[PItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PMatchId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[MatchDetails] ADD  CONSTRAINT [CHK_PMatchId] UNIQUE NONCLUSTERED 
(
	[PMatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PPlayerId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [CHK_PPlayerId] UNIQUE NONCLUSTERED 
(
	[PPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PQueueId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Queue] ADD  CONSTRAINT [CHK_PQueueId] UNIQUE NONCLUSTERED 
(
	[PQueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PTierId]    Script Date: 2020/09/01 18:58:25 ******/
ALTER TABLE [dbo].[Tier] ADD  CONSTRAINT [CHK_PTierId] UNIQUE NONCLUSTERED 
(
	[PTierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChampionAbilities]  WITH CHECK ADD  CONSTRAINT [FK_ChampionAbilities_Ability] FOREIGN KEY([AbilityId])
REFERENCES [dbo].[Ability] ([Id])
GO
ALTER TABLE [dbo].[ChampionAbilities] CHECK CONSTRAINT [FK_ChampionAbilities_Ability]
GO
ALTER TABLE [dbo].[ChampionAbilities]  WITH CHECK ADD  CONSTRAINT [FK_ChampionAbilities_Champion] FOREIGN KEY([ChampionId])
REFERENCES [dbo].[Champion] ([Id])
GO
ALTER TABLE [dbo].[ChampionAbilities] CHECK CONSTRAINT [FK_ChampionAbilities_Champion]
GO
ALTER TABLE [dbo].[ChampionSkins]  WITH CHECK ADD  CONSTRAINT [FK_ChampionSkins_Champion] FOREIGN KEY([ChampionId])
REFERENCES [dbo].[Champion] ([Id])
GO
ALTER TABLE [dbo].[ChampionSkins] CHECK CONSTRAINT [FK_ChampionSkins_Champion]
GO
ALTER TABLE [dbo].[ChampionSkins]  WITH CHECK ADD  CONSTRAINT [FK_ChampionSkins_Skin] FOREIGN KEY([SkinId])
REFERENCES [dbo].[Skin] ([Id])
GO
ALTER TABLE [dbo].[ChampionSkins] CHECK CONSTRAINT [FK_ChampionSkins_Skin]
GO
ALTER TABLE [dbo].[ItemsBought]  WITH CHECK ADD  CONSTRAINT [FK_ItemsBought_MatchDetails] FOREIGN KEY([MatchDetailsId])
REFERENCES [dbo].[MatchDetails] ([Id])
GO
ALTER TABLE [dbo].[ItemsBought] CHECK CONSTRAINT [FK_ItemsBought_MatchDetails]
GO
ALTER TABLE [dbo].[Loadout]  WITH CHECK ADD  CONSTRAINT [FK_Loadout_PlayerChampionStats] FOREIGN KEY([PlayerChampionStatsId])
REFERENCES [dbo].[PlayerChampionStats] ([Id])
GO
ALTER TABLE [dbo].[Loadout] CHECK CONSTRAINT [FK_Loadout_PlayerChampionStats]
GO
ALTER TABLE [dbo].[LoadoutItem]  WITH CHECK ADD  CONSTRAINT [FK_LoadoutItem_Item] FOREIGN KEY([PItemId])
REFERENCES [dbo].[Item] ([PItemId])
GO
ALTER TABLE [dbo].[LoadoutItem] CHECK CONSTRAINT [FK_LoadoutItem_Item]
GO
ALTER TABLE [dbo].[LoadoutItem]  WITH CHECK ADD  CONSTRAINT [FK_LoadoutItem_Loadout] FOREIGN KEY([LoadoutId])
REFERENCES [dbo].[Loadout] ([Id])
GO
ALTER TABLE [dbo].[LoadoutItem] CHECK CONSTRAINT [FK_LoadoutItem_Loadout]
GO
ALTER TABLE [dbo].[LoadoutSelected]  WITH CHECK ADD  CONSTRAINT [FK_LoadoutSelected_MatchDetails] FOREIGN KEY([MatchDetailsId])
REFERENCES [dbo].[MatchDetails] ([Id])
GO
ALTER TABLE [dbo].[LoadoutSelected] CHECK CONSTRAINT [FK_LoadoutSelected_MatchDetails]
GO
ALTER TABLE [dbo].[LoadoutSelected]  WITH CHECK ADD  CONSTRAINT [FK_LoadoutSelected_MatchDetails1] FOREIGN KEY([PMatchId])
REFERENCES [dbo].[MatchDetails] ([PMatchId])
GO
ALTER TABLE [dbo].[LoadoutSelected] CHECK CONSTRAINT [FK_LoadoutSelected_MatchDetails1]
GO
ALTER TABLE [dbo].[MatchBans]  WITH CHECK ADD  CONSTRAINT [FK_MatchBans_Champion] FOREIGN KEY([PChampionId])
REFERENCES [dbo].[Champion] ([PChampionId])
GO
ALTER TABLE [dbo].[MatchBans] CHECK CONSTRAINT [FK_MatchBans_Champion]
GO
ALTER TABLE [dbo].[MatchBans]  WITH CHECK ADD  CONSTRAINT [FK_MatchBans_MatchDetails] FOREIGN KEY([MatchDetailsId])
REFERENCES [dbo].[MatchDetails] ([Id])
GO
ALTER TABLE [dbo].[MatchBans] CHECK CONSTRAINT [FK_MatchBans_MatchDetails]
GO
ALTER TABLE [dbo].[MatchBans]  WITH CHECK ADD  CONSTRAINT [FK_MatchBans_MatchDetails1] FOREIGN KEY([PMatchId])
REFERENCES [dbo].[MatchDetails] ([PMatchId])
GO
ALTER TABLE [dbo].[MatchBans] CHECK CONSTRAINT [FK_MatchBans_MatchDetails1]
GO
ALTER TABLE [dbo].[MatchDetails]  WITH CHECK ADD  CONSTRAINT [FK_MatchDetails_Queue] FOREIGN KEY([PQueueId])
REFERENCES [dbo].[Queue] ([PQueueId])
GO
ALTER TABLE [dbo].[MatchDetails] CHECK CONSTRAINT [FK_MatchDetails_Queue]
GO
ALTER TABLE [dbo].[MatchDetails]  WITH CHECK ADD  CONSTRAINT [FK_MatchDetails_Tier] FOREIGN KEY([LeagueTier])
REFERENCES [dbo].[Tier] ([PTierId])
GO
ALTER TABLE [dbo].[MatchDetails] CHECK CONSTRAINT [FK_MatchDetails_Tier]
GO
ALTER TABLE [dbo].[PlayerChampionStats]  WITH CHECK ADD  CONSTRAINT [FK_PlayerChampionStats_Champion] FOREIGN KEY([PChampionId])
REFERENCES [dbo].[Champion] ([PChampionId])
GO
ALTER TABLE [dbo].[PlayerChampionStats] CHECK CONSTRAINT [FK_PlayerChampionStats_Champion]
GO
ALTER TABLE [dbo].[PlayerChampionStats]  WITH CHECK ADD  CONSTRAINT [FK_PlayerChampionStats_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[PlayerChampionStats] CHECK CONSTRAINT [FK_PlayerChampionStats_Player]
GO
ALTER TABLE [dbo].[PlayerFriends]  WITH CHECK ADD  CONSTRAINT [FK_PlayerFriends_Friends] FOREIGN KEY([FriendId])
REFERENCES [dbo].[Friends] ([Id])
GO
ALTER TABLE [dbo].[PlayerFriends] CHECK CONSTRAINT [FK_PlayerFriends_Friends]
GO
ALTER TABLE [dbo].[PlayerFriends]  WITH CHECK ADD  CONSTRAINT [FK_PlayerFriends_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[PlayerFriends] CHECK CONSTRAINT [FK_PlayerFriends_Player]
GO
ALTER TABLE [dbo].[PlayerMatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_PlayerMatchHistory_MatchDetails] FOREIGN KEY([MatchDetailsId])
REFERENCES [dbo].[MatchDetails] ([Id])
GO
ALTER TABLE [dbo].[PlayerMatchHistory] CHECK CONSTRAINT [FK_PlayerMatchHistory_MatchDetails]
GO
ALTER TABLE [dbo].[PlayerMatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_PlayerMatchHistory_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[PlayerMatchHistory] CHECK CONSTRAINT [FK_PlayerMatchHistory_Player]
GO
ALTER TABLE [dbo].[PlayerRankDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlayerRankDetails_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[PlayerRankDetails] CHECK CONSTRAINT [FK_PlayerRankDetails_Player]
GO
ALTER TABLE [dbo].[Skin]  WITH CHECK ADD  CONSTRAINT [FK_Skin_Champion] FOREIGN KEY([PChampionId])
REFERENCES [dbo].[Champion] ([PChampionId])
GO
ALTER TABLE [dbo].[Skin] CHECK CONSTRAINT [FK_Skin_Champion]
GO
USE [master]
GO
ALTER DATABASE [Paladins_DB] SET  READ_WRITE 
GO
