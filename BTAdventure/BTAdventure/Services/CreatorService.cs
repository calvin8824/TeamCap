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

            if (savedEventChoice.PositiveRoute != null)
            {
                UpdateGenerationNumber(savedEventChoice.PositiveRoute);
            }

            if (savedEventChoice.NegativeRoute != null)
            {
                UpdateGenerationNumber(savedEventChoice.NegativeRoute);
            }

            return savedEventChoice;
        }

        //Deletes events and recalculates the Gen# of related events.
        public void DeleteEventChoice(int? id)
        {
            if (id != null)
            {
                EventChoice deletedEvent = choiceRepo.FindById(id);

                if (choiceRepo.Delete((int)id))
                {
                    if (deletedEvent.NegativeRoute != null)
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
            //problems with foreign keys -danny
            ////If call deleted scene, find and delete all related events.
            //if (sceneRepo.Delete(id))
            //{
            //    //Events to delete
            //    List<EventChoice> eventChoices = choiceRepo.FindBySceneId(id).ToList();

            //    foreach (var c in eventChoices)
            //    {
            //        choiceRepo.Delete(c.EventChoiceId);
            //    }

            //    //List of scenes in game
            //    foreach (var s in sceneRepo.FindByGameId(id))
            //    {
            //        //List of events to check for references to this scene
            //        foreach (var c in choiceRepo.FindBySceneId(s.SceneId))
            //        {
            //            if (c.PositiveSceneRoute == id)
            //            {
            //                c.PositiveSceneRoute = null;

            //                if (c.NegativeSceneRoute == id)
            //                {
            //                    c.NegativeSceneRoute = null;
            //                    choiceRepo.Save(c);
            //                }

            //                choiceRepo.Save(c);
            //            }
            //            else if (c.NegativeSceneRoute == id)
            //            {
            //                c.NegativeSceneRoute = null;
            //                choiceRepo.Save(c);
            //            }
            //        }
            //    }
            //}

            var allEventsBySceneId = choiceRepo.All().Where(e => e.SceneId == id);
            foreach (var evnt in allEventsBySceneId)
            {
                var allPlayerCharacterByEventId = characterRepo.All().Where(c => c.EventChoiceId == evnt.EventChoiceId);
                var allOutcomeByEventId = outcomeRepo.All().Where(o => o.EventChoiceId == evnt.EventChoiceId);

                foreach (var character in allPlayerCharacterByEventId)
                {
                    characterRepo.Delete(character.CharacterId);
                }
                foreach (var outcome in allOutcomeByEventId)
                {
                    outcomeRepo.Delete(outcome.OutcomeId);
                }
                choiceRepo.Delete(evnt.EventChoiceId);
            }
            sceneRepo.Delete(id);

            foreach (var s in sceneRepo.FindByGameId(id))
            {
                //List of events to check for references to this scene
                foreach (var c in choiceRepo.FindBySceneId(s.SceneId))
                {
                    if (c.PositiveSceneRoute == id)
                    {
                        c.PositiveSceneRoute = null;

                        if (c.NegativeSceneRoute == id)
                        {
                            c.NegativeSceneRoute = null;
                            choiceRepo.Save(c);
                        }

                        choiceRepo.Save(c);
                    }
                    else if (c.NegativeSceneRoute == id)
                    {
                        c.NegativeSceneRoute = null;
                        choiceRepo.Save(c);
                    }
                }
            }
        }

        public void DeleteGame(int id)
        {
            //There were some problems in the database where foreign keys needed to be deleted first

            ////If call deleted game, find and delete all related events. 
            //if (gamerepo.Delete(id))
            //{
            //    List<Scene> scenes = sceneRepo.FindByGameId(id).ToList();

            //    foreach(var s in scenes)
            //    {
            //        DeleteScene(s.SceneId);
            //    }
            //}



            var allScenesByGameId = sceneRepo.FindByGameId(id);

            foreach (var scene in allScenesByGameId)
            {
                var allEventsBySceneId = choiceRepo.All().Where(e=>e.SceneId == scene.SceneId);
                foreach (var evnt in allEventsBySceneId)
                {
                    var allPlayerCharacterByEventId = characterRepo.All().Where(c=>c.EventChoiceId == evnt.EventChoiceId);
                    var allOutcomeByEventId = outcomeRepo.All().Where(o=>o.EventChoiceId == evnt.EventChoiceId);

                    foreach (var character in allPlayerCharacterByEventId)
                    {
                        characterRepo.Delete(character.CharacterId);
                    }
                    foreach(var outcome in allOutcomeByEventId)
                    {
                        outcomeRepo.Delete(outcome.OutcomeId);
                    }
                    choiceRepo.Delete(evnt.EventChoiceId);

                }
                sceneRepo.Delete(scene.SceneId);
            }

            var allEndingByGameId = endingRepo.All().Where(e=>e.GameId == id);
            foreach (var ending in allEndingByGameId)
            {
                endingRepo.Delete(ending.EndingId);
            }
            gamerepo.Delete(id);

        }

        public IEnumerable<Ending> GetAllEndings()
        {
            return endingRepo.All();
        }

        public Ending FindEndingById(int id)
        {
            return endingRepo.FindById(id);
        }

        public EventChoice FindEventById(int id)
        {
            return choiceRepo.FindById(id);
        }

        public Ending CreateEnding(Ending ending)
        {
            Ending newEnding = endingRepo.Save(ending);

            return newEnding;
        }

        public void DeleteEndingById(int id)
        {
            Ending ending = endingRepo.FindById(id);

            //If the ending is deleted, find all scenes in game. Then, check each event in scene to set event ending routes to null if they use this ending.
            if (endingRepo.Delete(id))
            {
                List<Scene> scenes = sceneRepo.FindByGameId(ending.GameId).ToList();

                foreach(var s in scenes)
                {
                    List<EventChoice> choices = choiceRepo.FindBySceneId(s.SceneId).ToList();

                    foreach(var c in choices)
                    {
                        if(c.PositiveEndingId == ending.EndingId)
                        {
                            c.PositiveEndingId = null;
                            choiceRepo.Save(c);
                        }

                        if (c.NegativeEndingId == ending.EndingId)
                        {
                            c.NegativeEndingId = null;
                            choiceRepo.Save(c);
                        }
                    }
                }
            }
        }

        //Same as create, for now. Separated in case they diverge later.
        public Ending EditEnding(Ending ending)
        {
            Ending editedEnding = endingRepo.Save(ending);

            return editedEnding;
        }

        public Game EditGame(Game game)
        {
            return gamerepo.Save(game);
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
