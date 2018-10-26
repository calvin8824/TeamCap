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
            ViewBag.GameTitle = creatorService.GetAllGames().Where(g => g.GameId == game.GameId).First().GameTitle;
            ViewBag.GameId = creatorService.GetAllGames().Where(g => g.GameId == game.GameId).First().GameId;

            IEnumerable<Scene> allScenesFromGameId = new List<Scene>();
            if (game.GameId > 0)
            {
                allScenesFromGameId = creatorService.GetAllScenes().Where(s => s.GameId == game.GameId);
            }
            //Changed game to scene here. Also gor rid of the "allScenesFromGameId = " part.
            //allScenesFromGameId.ToList().Add(scene);

            return View(allScenesFromGameId);
        }

        public ActionResult CreateOrEditScene(int id)
        {
            var scene = new Scene { GameId = id };

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
            var model = new EditGenerationVM();
            //model.AllScenes = creatorService.GetAllScenes().Where(s => s.GameId == gameId);
            //model.CurrentEvent = creatorService.GetAllEventChoice().First();
            //model.AllEventByScene = creatorService.GetAllEventChoice().Where(e=>e.SceneId == model.CurrentEvent.SceneId);
            model.AllEventByScene = creatorService.GetAllEventChoice().Where(e => e.SceneId == sceneId);
            model.AllEventChoice = creatorService.GetAllEventChoice();
            model.AllScene = creatorService.GetAllScenes();
            return View(model);
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
    }
}