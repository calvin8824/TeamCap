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
            //Returns the result of the Save call to return a new scene with the id.
            Scene newScene = sceneRepo.Save(scene);

            //Creates a default event as the start event in the scene. Gen# 0 denotes starting point.
            EventChoice originChoice = new EventChoice()
            {
                EventName = "Default Name",
                GenerationNumber = 0,
                PositiveButton = "Default Button Text",
                NegativeButton = "Default Button Text",
                SceneId = scene.SceneId,
                StartText = "Default Start Text",
                PositiveText = "Default Result Text",
                NegativeText = "Default Result Text"
            };

            choiceRepo.Save(originChoice);

            return newScene;
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

        //Deletes events and recalculates the Gen# of related events.
        public void DeleteEventChoice(int? id)
        {
            if(id != null)
            {
                EventChoice deletedEvent = choiceRepo.FindById(id);

                if (choiceRepo.Delete((int)id))
                {
                    if(deletedEvent.NegativeRoute != null)
                    {
                        //    EventChoice nChoice = choiceRepo.FindById(deletedEvent.NegativeRoute);
                        //    nChoice.GenerationNumber = null;

                        //    choiceRepo.Save(nChoice);
                        UpdateGenerationNumber(deletedEvent.NegativeRoute);
                    }

                    if (deletedEvent.PositiveRoute != null)
                    {
                        //    EventChoice pChoice = choiceRepo.FindById(deletedEvent.PositiveRoute);
                        //    pChoice.GenerationNumber = null;

                        //    choiceRepo.Save(pChoice);

                        UpdateGenerationNumber(deletedEvent.PositiveRoute);
                    }
                }
            }
        }

        public void DeleteScene(int id)
        {
            //If call deleted scene, find and delete all related events.
            if (sceneRepo.Delete(id))
            {
                List<EventChoice> eventChoices = choiceRepo.FindBySceneId(id).ToList();

                foreach(var c in eventChoices)
                {
                    choiceRepo.Delete(c.EventChoiceId);
                }
            }
        }

        public void DeleteGame(int id)
        {
            //If call deleted game, find and delete all related events. 
            if (gamerepo.Delete(id))
            {
                List<Scene> scenes = sceneRepo.FindByGameId(id).ToList();

                foreach(var s in scenes)
                {
                    DeleteScene(s.SceneId);
                }
            }
        }

        //Reset gen number on delete
        //Delete related scenes and events on game delete
        //Delete related events on scene delete

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

        //Recalculates the Gen# of the related event.
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

                    choiceRepo.Save(updateChoice);
                }
            }
        }
    }
}
