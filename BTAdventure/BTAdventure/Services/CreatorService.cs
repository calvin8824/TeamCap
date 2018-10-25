using BTAdventure.Interfaces;
using BTAdventure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTAdventure.Services
{
    public class CreatorService
    {
        private IPlayerCharacterRepository characterRepo;
        private IGameRepository gamerepo;
        private IEventChoiceRepository choiceRepo;
        private IOutcomeRepository outcomeRepo;
        private IPlayerRepository playerRepo;
        private ISceneRepository sceneRepo;
        private IEndingRepository endingRepo;

        public CreatorService(IPlayerCharacterRepository characterRepo, IGameRepository gamerepo, IEventChoiceRepository choiceRepo,
            IOutcomeRepository outcomeRepo, IPlayerRepository playerRepo, ISceneRepository sceneRepo, IEndingRepository endingRepo)
        {
            this.characterRepo = characterRepo;
            this.gamerepo = gamerepo;
            this.choiceRepo = choiceRepo;
            this.outcomeRepo = outcomeRepo;
            this.playerRepo = playerRepo;
            this.sceneRepo = sceneRepo;
            this.endingRepo = endingRepo;
        }

        public Scene CreateScene(Scene scene)
        {
            return sceneRepo.Save(scene);

        }

        public EventChoice SaveEventChoice(EventChoice eventChoice)
        {
            EventChoice savedEventChoice = choiceRepo.Save(eventChoice);

            if(savedEventChoice.PositiveRoute != null)
            {
                UpdateGenerationNumber(savedEventChoice.PositiveRoute);
            }

            if(savedEventChoice.NegativeRoute != null)
            {
                UpdateGenerationNumber(savedEventChoice.NegativeRoute);
            }

            return savedEventChoice;
        }

        public Game CreateGame(Game game)
        {
            return gamerepo.Save(game);
        }

        public List<Game> GetAllGames()
        {
            return gamerepo.All().ToList();
        }

        public List<Scene> GetAllScenes()
        {
            return sceneRepo.All().ToList();
        }

        public List<EventChoice> GetAllEventChoice()
        {
            return choiceRepo.All().ToList();
        }

        private void UpdateGenerationNumber(int? pairedId)
        {
            if (pairedId != null)
            {
                EventChoice updateChoice = choiceRepo.FindById(pairedId);

                if(updateChoice != null)
                {
                    List<EventChoice> eventChoices = new List<EventChoice>();

                    foreach (var c in choiceRepo.All())
                    {
                        if (c.PositiveRoute == updateChoice.EventChoiceId || c.NegativeRoute == updateChoice.EventChoiceId)
                        {
                            eventChoices.Add(c);
                        }
                    }

                    if (eventChoices.Any())
                    {
                        int? max = eventChoices.Max(m => m.GenerationNumber);

                        updateChoice.GenerationNumber = max + 1;
                    }
                    else
                    {
                        updateChoice.GenerationNumber = null;
                    }
                }
            }
        }
    }
}
