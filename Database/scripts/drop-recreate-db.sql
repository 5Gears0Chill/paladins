USE [master]
GO

/****** Object:  Database [Paladins_DB]    Script Date: 2020/08/22 19:09:50 ******/
DROP DATABASE [Paladins_DB]
GO

/****** Object:  Database [Paladins_DB]    Script Date: 2020/08/22 19:09:50 ******/
CREATE DATABASE [Paladins_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Paladins_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Paladins_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Paladins_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Paladins_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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

ALTER DATABASE [Paladins_DB] SET  READ_WRITE 
GO



USE [Paladins_DB]
GO
/****** Object:  Table [dbo].[Ability]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ability](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[PAbilityId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Ability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Champion]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Champion](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[PChampionId] [int] NOT NULL,
	[Role] [varchar](200) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Lore] [varchar](max) NOT NULL,
	[Health] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[IsLatestChampion] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Champion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChampionAbilities]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChampionAbilities](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[AbilityId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
 CONSTRAINT [PK_ChampionAbilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChampionSkins]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChampionSkins](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[SkinId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
 CONSTRAINT [PK_ChampionSkins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[PPlayerId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[PItemId] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[ShortDescription] [varchar](max) NULL,
	[DeviceName] [varchar](250) NOT NULL,
	[PChampionId] [int] NOT NULL,
	[ItemIconUrl] [varchar](max) NULL,
	[Price] [int] NOT NULL,
	[ItemType] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsBought]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsBought](
	[Id] [int] NOT NULL  IDENTITY(1,1),
	[MatchDetailsId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[ItemName] [varchar](200) NOT NULL,
	[ItemLevel] [int] NOT NULL,
	[ItemOrder] [int] NOT NULL,
 CONSTRAINT [PK_ItemsBought] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PLanguageId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loadout]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loadout](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PlayerChampionStatsId] [int] NOT NULL,
	[ChampionId] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[LoadoutName] [varchar](200) NOT NULL,
	[PLoadoutId] [int] NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[PlayerName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Loadout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadoutItem]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadoutItem](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[LoadoutId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_LoadoutItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoadoutSelected]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoadoutSelected](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[MatchDetailsId] [int] NOT NULL,
	[PMatchId] [int] NOT NULL,
	[PPlayerId] [int] NOT NULL,
	[PItemId] [int] NOT NULL,
	[LoadoutItemLevel] [int] NOT NULL,
	[LoadoutItemName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_DeckPlayed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchBans]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchBans](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[MatchDetailsId] [int] NOT NULL,
	[PMatchId] [int] NOT NULL,
	[BanPosition] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
 CONSTRAINT [PK_MatchBans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchDetails]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchDetails](
	[Id] [int] NOT NULL IDENTITY(1,1),
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
 CONSTRAINT [PK_MatchDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PPlayerId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[AvatarUrl] [varchar](200) NOT NULL,
	[AvatarId] [int] NOT NULL,
	[MinutesPlayed] [int] NOT NULL,
	[HoursPlayed] [int] NOT NULL,
	[LastLoginTimeStamp] [varchar](50) NOT NULL,
	[Leaves] [int] NOT NULL,
	[AccountLevel] [int] NOT NULL,
	[LoadingFrame] [varchar](200) NOT NULL,
	[MasteryLevel] [varchar](200) NOT NULL,
	[PersonalStatusMessage] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerChampionStats]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerChampionStats](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PlayerId] [int] NOT NULL,
	[PChampionId] [int] NOT NULL,
	[Assists] [int] NOT NULL,
	[Deaths] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
 CONSTRAINT [PK_PlayerChampionStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerFriends]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerFriends](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PlayerId] [int] NOT NULL,
	[FriendId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerFriends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerMatchHistory]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerMatchHistory](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PlayerId] [int] NOT NULL,
	[MatchDetailsId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerMatchHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Queue]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Queue](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PQueueId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Queue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skin]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skin](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PChampionId] [int] NOT NULL,
	[Rarity] [varchar](100) NOT NULL,
	[PSkinId] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Skin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tier]    Script Date: 2020/08/22 19:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tier](
	[Id] [int] NOT NULL IDENTITY(1,1),
	[PTierId] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Tier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PAbilityId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[Ability] ADD  CONSTRAINT [CHK_PAbilityId] UNIQUE NONCLUSTERED 
(
	[PAbilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PChampionId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[Champion] ADD  CONSTRAINT [CHK_PChampionId] UNIQUE NONCLUSTERED 
(
	[PChampionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PItemId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [CHK_PItemId] UNIQUE NONCLUSTERED 
(
	[PItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PMatchId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[MatchDetails] ADD  CONSTRAINT [CHK_PMatchId] UNIQUE NONCLUSTERED 
(
	[PMatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PPlayerId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [CHK_PPlayerId] UNIQUE NONCLUSTERED 
(
	[PPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PQueueId]    Script Date: 2020/08/22 19:06:35 ******/
ALTER TABLE [dbo].[Queue] ADD  CONSTRAINT [CHK_PQueueId] UNIQUE NONCLUSTERED 
(
	[PQueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CHK_PTierId]    Script Date: 2020/08/22 19:06:35 ******/
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
ALTER TABLE [dbo].[Skin]  WITH CHECK ADD  CONSTRAINT [FK_Skin_Champion] FOREIGN KEY([PChampionId])
REFERENCES [dbo].[Champion] ([PChampionId])
GO
ALTER TABLE [dbo].[Skin] CHECK CONSTRAINT [FK_Skin_Champion]
GO
