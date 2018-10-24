using BTAdventure.Interfaces;
using BTAdventure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BTAdventure.Services
{
    public class GameService
    {
        private IPlayerCharacterRepository characterRepo;
        private IGameRepository gamerepo;
        private IEventChoiceRepository choiceRepo;
        private IOutcomeRepository outcomeRepo;
        private IPlayerRepository playerRepo;
        private ISceneRepository sceneRepo;
        public GameService(IPlayerCharacterRepository characterRepo, IGameRepository gamerepo, IEventChoiceRepository choiceRepo,
            IOutcomeRepository outcomeRepo, IPlayerRepository playerRepo, ISceneRepository sceneRepo)
        {
            this.characterRepo = characterRepo;
            this.gamerepo = gamerepo;
            this.choiceRepo = choiceRepo;
            this.outcomeRepo = outcomeRepo;
            this.playerRepo = playerRepo;
            this.sceneRepo = sceneRepo;
        }

        public Scene FindSceneById(int id)
        {
            return sceneRepo.FindById(id);
        }

        public Outcome FindOutcomeById(int id)
        {
            return outcomeRepo.FindById(id);
        }

        public EventChoice FindEventChoiceById(int id)
        {
            return choiceRepo.FindById(id);
        }
        public PlayerCharacter FindPlayerCharacterById(int id)
        {
            return characterRepo.FindById(id);
        }

        public Player FindPlayerById(string id)
        {
            return playerRepo.FindById(id);
        }

        public Game FindGameById(int id)
        {
            return gamerepo.FindById(id);
        }

        public Player SavePlayer(Player player)
        {
            var allPlayers = playerRepo.All();
            player.PlayerId = allPlayers.Any() ? allPlayers.Count() + 1 : 1;
            return playerRepo.Save(player);
        }

        public PlayerCharacter SaveCurrentPlayerCharacterGame(string playerId, int characterId, int sceneId, int eventChoiceId)
        {
            PlayerCharacter currentCharacter;
            var allPlayerCharacter = characterRepo.All();
            currentCharacter = allPlayerCharacter.First(p => p.CharacterId == characterId && p.PlayerId == playerId);
            currentCharacter.SceneId = sceneId;
            currentCharacter.EventChoiceId = eventChoiceId;
            //need to figure out how to handle the gold and health
            return characterRepo.Save(currentCharacter);
        }


        public Game NewGame(int playerId, int playerCharacterId, int sceneId)
        {
            var game = gamerepo.FindById(sceneId);

            return game;
        }

        public List<PlayerCharacter> FindListOfPlayerCharactersByPlayerId(string playerId)
        {
            var characters = new List<PlayerCharacter>();

            //sceneId and characterId is stored in player character table which determines all the game the player has
            characters = characterRepo.All().Where(c => c.PlayerId == playerId).ToList();

            return characters;
        }

        public IEnumerable<Outcome> GetOutcomes()
        {
            return outcomeRepo.All();
        }

        public ReturnJSONObject CombineObject(ChoiceJSONObject choice)
        {
            ReturnJSONObject items = new ReturnJSONObject();
            items.PlayerCharacter = FindPlayerCharacterById(choice.CharacterId);
            
            var posOrNeg = choice.PositiveOrNegative;

            var currentEventChoice = FindEventChoiceById(choice.EventChoiceId); //takes in json object choiceid
            EventChoice NextEventChoice = null;
            if(posOrNeg == true)
            {
                if(currentEventChoice.PositiveRoute > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.PositiveRoute);
                }
                else if(currentEventChoice.PositiveSceneRoute > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.PositiveSceneRoute);
                }
                else if(currentEventChoice.PositiveEndingId > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.PositiveEndingId);
                }
            }
            else if (posOrNeg == false)
            {
                if (currentEventChoice.NegativeRoute > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.NegativeRoute);
                }
                else if (currentEventChoice.NegativeSceneRoute > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.NegativeSceneRoute);
                }
                else if (currentEventChoice.NegativeEndingId > 0)
                {
                    NextEventChoice = FindEventChoiceById(currentEventChoice.NegativeEndingId);
                }
            }
            items.EventChoice = NextEventChoice;
            items.Scene = FindSceneById(items.EventChoice.SceneId);
            items.Outcome = outcomeRepo.FindByEventChoice(items.EventChoice.EventChoiceId);
            return items;

        }

        public EventChoice FindChoiceBySceneId(int sceneRoute)
        {
            return choiceRepo.FindBySceneId(sceneRoute);
        }
    }
}
