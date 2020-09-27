using Paladins.Common.ClientModels.Match;
using Paladins.Common.ClientModels.Player;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;

namespace Paladins.Common.Models
{
    public class PlayerModel
    {
        public PlayerModel()
        {
            Friends = new List<FriendModel>();
            ChampionStats = new List<PlayerChampionStatsModel>();
            Loadouts = new List<PlayerLoadoutModel>();
            MatchHistories = new List<PlayerMatchHistoryModel>();
        }
        public int PlayerId { get; set; }
        public int PaladinsPlayerId { get; set; }
        public string Name { get; set; }
        public Uri AvatarUrl { get; set; }
        public int AvatarId { get; set; }
        public int MinutesPlayed { get; set; }
        public int HoursPlayed { get; set; }
        public int TotalLeaves { get; set; }
        public int ControllerTier { get; set; }
        public int KbmTier { get; set; }
        public int ConquestTier { get; set; }
        public int TotalWorshippers { get; set; }
        public int TotalXp { get; set; }
        public int TotalWins { get; set; }
        public DateTime LastLoginTimeStamp { get; set; }
        public DateTime AccountCreatedOnTimeStamp { get; set; }
        public int AccountLevel { get; set; }
        public string LoadingFrame { get; set; }
        public int MasteryLevel { get; set; }
        public string PersonalStatusMessage { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastUpdatedOn { get; set; }
        public bool IsActive { get; set; }
        public List<RankDetailsModel> RankDetailsModel { get; set; }
        public List<FriendModel> Friends { get; set; }
        public List<PlayerChampionStatsModel> ChampionStats { get; set; }
        public List<PlayerLoadoutModel> Loadouts { get; set; }
        public List<PlayerMatchHistoryModel> MatchHistories { get; set; }
        public void PopulateFriends(IList<PlayerFriendsClientModel> friends)
        {
            Friends.AddRange(from f in friends
                             select new FriendModel
                             {
                                 PaladinsPlayerId = Convert.ToInt32(f.PlayerId),
                                 AccountId = Convert.ToInt32(f.AccountId),
                                 Name = f.Name
                             });
        }

        public void PopulateChampionStats(IList<PlayerChampionRanksClientModel> championStats)
        {
            ChampionStats.AddRange(from c in championStats
                                   select new PlayerChampionStatsModel
                                   {
                                       Assists = Convert.ToInt32(c.Assists),
                                       Deaths = Convert.ToInt32(c.Deaths),
                                       Kills = Convert.ToInt32(c.Kills),
                                       Losses = Convert.ToInt32(c.Losses),
                                       PaladinsChampionId = Convert.ToInt32(c.ChampionId),
                                       PlayerId = PlayerId,
                                       Rank = Convert.ToInt32(c.Rank),
                                       Wins = Convert.ToInt32(c.Wins),
                                   });
        }

        public void PopulateLoadouts(IList<PlayerLoadoutsClientModel> loadouts)
        {
            Loadouts.AddRange(from l in loadouts
                              select new PlayerLoadoutModel
                              {
                                  LoadoutName = l.DeckName,
                                  PlayerName = l.PlayerName,
                                  PaladinsPlayerId = Convert.ToInt32(l.PlayerId),
                                  PaladinsChampionId = Convert.ToInt32(l.ChampionId),
                                  LoadoutItems = (from li in l.LoadoutItems
                                                  select new PlayerLoadoutItemModel
                                                  {
                                                      CardName = li.ItemName,
                                                      PaladinsItemId = Convert.ToInt32(li.ItemId),
                                                      PointsAssignedToItem = Convert.ToInt32(li.Points)
                                                  }).ToList()
                              });
        }

        public void PopulateMatchHistory(IList<MatchDetailsClientModel> matchHistories)
        {
            MatchHistories.AddRange(from m in matchHistories
                                    select new PlayerMatchHistoryModel
                                    {
                                        Assists = Convert.ToInt32(m.Assists),
                                        Deaths = Convert.ToInt32(m.Deaths),
                                        Kills = Convert.ToInt32(m.Kills),
                                        MatchResult = m.WinStatus,
                                        //EntryDateTime = DateTime.ParseExact(m.EntryDatetime, "M/d/yyyy h:mm:ss tt", CultureInfo.InvariantCulture),
                                        PaladinsChampionId = Convert.ToInt32(m.ChampionId),
                                        PaladinsPlayerId = Convert.ToInt32(m.PlayerId),
                                        PaladinsMatchId = Convert.ToInt32(m.Match),
                                    });
        }
    }
}
