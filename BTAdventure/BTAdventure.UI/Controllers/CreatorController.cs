using BTAdventure.Models;
using BTAdventure.Services;
using BTAdventure.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTAdventure.UI.Controllers
{
    public class CreatorController : Controller
    {        
        private CreatorService creatorService;
        public CreatorController(CreatorService creatorService)
        {
            this.creatorService = creatorService;
        }

        // GET: Creator
        public ActionResult Index()
        {
            return View();
        }

        // this will probably be removed. will look into it later
        public ActionResult ListGames()
        {
            var allScene = creatorService.GetAllScenes();
            return View(allScene);
        }

        public ActionResult NewOrEditGame(int id = 0)
        {
            Game game = new Game();
            if (id > 0)
            {
                game = creatorService.GetAllGames().Where(g => g.GameId == id).FirstOrDefault();
            }

            return View(game);
        }


        public ActionResult EditGame()
        {
            var allGames = creatorService.GetAllGames();

            //this is mock data
            //var something = new Game
            //{
            //    GameId = 1,
            //    GameTitle = "The Title",
            //    IntroText = "The Intro"
            //};
            //allGames.Add(something);
            //allGames.Add(something);
            //allGames.Add(something);
            //allGames.Add(something);
            //allGames.Add(something);
            return View(allGames);
        }

        public ActionResult SceneMain(int id = 0)
        {
            IEnumerable<Scene> allScenesFromGameId = new List<Scene>();
            if (id > 0)
            {

                allScenesFromGameId = creatorService.GetAllScenes().Where(s => s.GameId == id);
                ViewBag.GameTitle = creatorService.GetAllGames().Where(g => g.GameId == id).First().GameTitle;
                ViewBag.GameId = creatorService.GetAllGames().Where(g => g.GameId == id).First().GameId;
            }
            

            return View(allScenesFromGameId);
        }

        [HttpPost]
        public ActionResult SceneMain(Game game)
        {
            //Note: Added game just to see if this would compile. Also replaced Add(game) with Add(scene). Sorry to step on any toes. Don't hate me. - Rich
            //Game game = new Game();
            if (game.GameId == 0)
            {
                game = creatorService.CreateGame(game);
            }
            else
            {
                creatorService.EditGame(game);
            }
            ViewBag.GameTitle = creatorService.GetAllGames().Where(g => g.GameId == game.GameId).First().GameTitle;
            ViewBag.GameId = creatorService.GetAllGames().Where(g => g.GameId == game.GameId).First().GameId;

            IEnumerable<Scene> allScenesFromGameId = new List<Scene>();
            if (game.GameId > 0)
            {
                allScenesFromGameId = creatorService.GetAllScenes().Where(s => s.GameId == game.GameId);
            }
            //Changed game to scene here. Also gor rid of the "allScenesFromGameId = " part.
            //allScenesFromGameId.ToList().Add(scene);

            ViewBag.gameId = game.GameId;

            return View(allScenesFromGameId);
        }

        public ActionResult CreateOrEditScene(int id)
        {
            //will need to move to service/domain layer eventually
            Scene scene;
            if (id > 0)
            {
                scene = creatorService.GetAllScenes().Where(s=>s.SceneId == id).First();
            }
            else
            {

                scene = new Scene { GameId = id };
            }

            return View(scene);
        }

        [HttpPost]
        public ActionResult CreateOrEditScene(Scene scene)
        {
            scene = creatorService.CreateScene(scene);
            return RedirectToAction("SceneMain",new { id = scene.GameId});
        }

        public ActionResult EditGeneration(int sceneId)
        {
            //will probably need to call a different method to assign values to the VM, possibly
            var model = new EditGenerationVM();
            //model.AllScenes = creatorService.GetAllScenes().Where(s => s.GameId == gameId);
            //model.CurrentEvent = creatorService.GetAllEventChoice().First();
            //model.AllEventByScene = creatorService.GetAllEventChoice().Where(e=>e.SceneId == model.CurrentEvent.SceneId);
            model.AllEventByScene = creatorService.GetAllEventChoice().Where(e => e.SceneId == sceneId);
            model.AllEventChoice = creatorService.GetAllEventChoice();
            model.AllScene = creatorService.GetAllScenes();
            ViewBag.sceneTitle = creatorService.GetAllScenes().Where(s=>s.SceneId == sceneId).First().SceneName;
            return View("EditGeneration", model);
        }

        [HttpPost]
        public ActionResult EditSceneEventChoice(EditCreateEventRequest editCreateEventRequest)
        {
            var model = new EventCreationData();
            model.SceneId = editCreateEventRequest.SceneId;
            model.EventChoice = creatorService.FindEventById(editCreateEventRequest.EventId);
            if(model.EventChoice == null)
            {
                model.EventChoice = new EventChoice()
                {
                    EventChoiceId = 0,
                    SceneId = editCreateEventRequest.SceneId
                };

                model.PositiveOutcome = new Outcome()
                {
                    Positive = true
                };
                model.NegativeOutcome = new Outcome();
            }
            else
            {
                Tuple<Outcome, Outcome> posNegOutcomes = creatorService.FindOutcomesByEventId(model.EventChoice.EventChoiceId);
                model.PositiveOutcome = posNegOutcomes.Item1;
                model.NegativeOutcome = posNegOutcomes.Item2;
            }
            
            model.AvailableChoices = creatorService.FindEventsWithHigherGenNumber(model.EventChoice.EventChoiceId, model.SceneId);
           
            model.GameScenes = creatorService.FindScenesInGameBySceneId(model.SceneId);
            model.GameEndings = creatorService.FindGameEndingBySceneId(model.SceneId);

            return View("CreateEditEvent",model);
        }

        private ActionResult FailedSaveEvent(SaveEventRequest saveEventRequest)
        {
            EventCreationData eventCreationData = new EventCreationData();
            eventCreationData.EventChoice = new EventChoice
            {
                EventChoiceId = saveEventRequest.EventId,
                SceneId = saveEventRequest.SceneId,
                GenerationNumber = saveEventRequest.GenerationNumber,
                EventName = saveEventRequest.EventName,
                StartText = saveEventRequest.StartText,
                PositiveText = saveEventRequest.PositiveText,
                NegativeText = saveEventRequest.NegativeText,
                PositiveButton = saveEventRequest.PositiveButton,
                NegativeButton = saveEventRequest.NegativeButton,
                PositiveRoute = saveEventRequest.PositiveRoute,
                NegativeRoute = saveEventRequest.NegativeRoute,
                PositiveSceneRoute = saveEventRequest.PositiveSceneRoute,
                NegativeSceneRoute = saveEventRequest.NegativeSceneRoute,
                PositiveEndingId = saveEventRequest.PositiveEndingId,
                NegativeEndingId = saveEventRequest.NegativeEndingId
            };
            eventCreationData.AvailableChoices = creatorService.FindEventsWithHigherGenNumber(saveEventRequest.EventId, saveEventRequest.SceneId);
            List<Scene> scenes = new List<Scene>();
            foreach(var s in creatorService.FindScenesInGameBySceneId(saveEventRequest.SceneId))
            {
                if(s.SceneId != saveEventRequest.SceneId)
                {
                    scenes.Add(s);
                }
            }
            
            eventCreationData.GameScenes = scenes;
            eventCreationData.GameEndings = creatorService.FindGameEndingBySceneId(saveEventRequest.SceneId);
            eventCreationData.PositiveOutcome = new Outcome()
            {
                EventChoiceId = saveEventRequest.EventId,
                OutcomeId = saveEventRequest.PositiveOutcomeId,
                Positive = true,
                Health = saveEventRequest.PositiveHealth,
                Gold = saveEventRequest.PositiveGold
            };
            eventCreationData.NegativeOutcome = new Outcome()
            {
                EventChoiceId = saveEventRequest.EventId,
                OutcomeId = saveEventRequest.NegativeOutcomeId,
                Positive = false,
                Health = saveEventRequest.NegativeHealth,
                Gold = saveEventRequest.NegativeGold
            };
            eventCreationData.SceneId = saveEventRequest.SceneId;

            return View("CreateEditEvent", eventCreationData);
        }

        [HttpPost]
        public ActionResult SaveEvent(SaveEventRequest saveEventRequest)
        {
            bool isValid = false;

            EventChoice originalChoice = new EventChoice();

            if (saveEventRequest.EventId > 0)
            {
                originalChoice = creatorService.FindEventById(saveEventRequest.EventId);
            }

            EventChoice eventChoice = new EventChoice
            {
                EventChoiceId = saveEventRequest.EventId,
                SceneId = saveEventRequest.SceneId,
                GenerationNumber = saveEventRequest.GenerationNumber,
                EventName = saveEventRequest.EventName,
                StartText = saveEventRequest.StartText,
                PositiveText = saveEventRequest.PositiveText,
                NegativeText = saveEventRequest.NegativeText,
                PositiveButton = saveEventRequest.PositiveButton,
                NegativeButton = saveEventRequest.NegativeButton,
                PositiveRoute = saveEventRequest.PositiveRoute,
                NegativeRoute = saveEventRequest.NegativeRoute,
                PositiveSceneRoute = saveEventRequest.PositiveSceneRoute,
                NegativeSceneRoute = saveEventRequest.NegativeSceneRoute,
                PositiveEndingId = saveEventRequest.PositiveEndingId,
                NegativeEndingId = saveEventRequest.NegativeEndingId
            };

            eventChoice = creatorService.SaveEventChoice(eventChoice);
            
            if (saveEventRequest.EventId > 0)
            {
                creatorService.RecalculateOldGenNumbers(originalChoice);
            }

            if (eventChoice.EventChoiceId > 0)
            {
                isValid = true;
            }
            else
            {
                isValid = false;
            }

            if (isValid)
            {
                Outcome positiveOutcome = new Outcome()
                {
                    EventChoiceId = eventChoice.EventChoiceId,
                    OutcomeId = saveEventRequest.PositiveOutcomeId,
                    Positive = true,
                    Health = saveEventRequest.PositiveHealth,
                    Gold = saveEventRequest.PositiveGold
                };
                Outcome negativeOutcome = new Outcome()
                {
                    EventChoiceId = eventChoice.EventChoiceId,
                    OutcomeId = saveEventRequest.NegativeOutcomeId,
                    Positive = false,
                    Health = saveEventRequest.NegativeHealth,
                    Gold = saveEventRequest.NegativeGold
                };

                positiveOutcome = creatorService.SaveOutcome(positiveOutcome);
                negativeOutcome = creatorService.SaveOutcome(negativeOutcome);

                if(positiveOutcome == null || negativeOutcome == null)
                {
                    isValid = false;
                }
            }

            if(isValid)
            {
                return EditGeneration(saveEventRequest.SceneId);
            }
            else
            {
                return FailedSaveEvent(saveEventRequest);
            }
        }

        //Testing only. Remove when done.
        public ActionResult CreateEditEvent()
        {
            EventCreationData eventCreationData = new EventCreationData();
            eventCreationData.EventChoice = new EventChoice();
            eventCreationData.AvailableChoices = new List<EventChoice>();
            eventCreationData.GameScenes = new List<Scene>();
            eventCreationData.GameEndings = new List<Ending>();
            eventCreationData.PositiveOutcome = new Outcome();
            eventCreationData.NegativeOutcome = new Outcome();
            eventCreationData.SceneId = -12;

            return View(eventCreationData);
        }

        public ActionResult DeleteEvent(EditCreateEventRequest editCreateEventRequest)
        {
            creatorService.DeleteEventChoice(editCreateEventRequest.EventId);

            return EditGeneration(editCreateEventRequest.SceneId); 
        }

        public ActionResult DeleteGame(int id)
        {
            var model = creatorService.GetAllGames().Where(g => g.GameId == id).First();
            return View(model);
        }

        [HttpPost]
        public ActionResult DeleteGame(Game game)
        {
            creatorService.DeleteGame(game.GameId);
            return View("Index");
        }

        public ActionResult DeleteScene(int id)
        {
            var scene = creatorService.GetAllScenes().Where(s=>s.SceneId == id).First();
            return View(scene);
        }

        [HttpPost]
        public ActionResult DeleteScene(Scene scene)
        {
            creatorService.DeleteScene(scene.SceneId);
            return View("Index");
        }

        public ActionResult NewEnding(int gameId) //grab game id
        {
            //find game by game id, then associate ending..
            var thisGame = creatorService.GetAllGames().FirstOrDefault(g => g.GameId == gameId);
            Ending ending = new Ending();
            ending.GameId = gameId;
            return View(ending);
        }

        [HttpPost]
        public ActionResult NewEnding(Ending ending)
        {
            creatorService.SaveEnding(ending);
            return RedirectToAction("Index"); //MAYBE RETURN TO SCENEMAIN
        }

        public ActionResult EditEnding(int gameId) //grab ending id
        {
            var thisEnding = creatorService.GetAllEndings().FirstOrDefault(g => g.GameId == gameId);
            ViewBag.GameId = creatorService.GetAllGames().Where(g => g.GameId == gameId).First().GameId;
            return View(thisEnding);
        }

        [HttpPost]
        public ActionResult EditEnding(Ending ending)
        {
            creatorService.EditEnding(ending);
            return RedirectToAction("Index"); //MAYBE RETURN TO SCENEMAIN
        }

        public ActionResult DeleteEnding(int gameId)
        {
            var thisEnding = creatorService.GetAllEndings().FirstOrDefault(g => g.GameId == gameId);
            creatorService.DeleteEndingById(thisEnding.EndingId);
            
            //delete from service
            return RedirectToAction("Index");
        }
    }
}