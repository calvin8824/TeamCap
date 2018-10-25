using BTAdventure.Models;
using BTAdventure.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTAdventure.UI.Controllers
{
    public class CreatorController : Controller
    {

        private CreatorService adminService;
        public CreatorController(CreatorService adminService)
        {
            this.adminService = adminService;
        }

        // GET: Creator
        public ActionResult Index()
        {
            return View();
        }

        // this will probably be removed. will look into it later
        public ActionResult ListGames()
        {
            var allScene = adminService.GetAllScenes();
            return View(allScene);
        }

        public ActionResult NewOrEditGame(int id = 0)
        {
            Game game = new Game();
            if (id > 0)
            {
                game = adminService.GetAllGames().Where(g => g.GameId == id).FirstOrDefault();
            }

            return View(game);
        }


        public ActionResult EditGame()
        {
            var allGames = adminService.GetAllGames();

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
                allScenesFromGameId = adminService.GetAllScenes().Where(s => s.GameId == id);
            }

            return View(allScenesFromGameId);
        }

        [HttpPost]
        public ActionResult SceneMain(Scene scene)
        {
            //Note: Added game just to see if this would compile. Also replaced Add(game) with Add(scene). Sorry to step on any toes. Don't hate me. - Rich
            Game game = new Game();

            IEnumerable<Scene> allScenesFromGameId = new List<Scene>();
            if (game.GameId > 0)
            {
                allScenesFromGameId = adminService.GetAllScenes().Where(s => s.GameId == game.GameId);
            }
            //Changed game to scene here. Also gor rid of the "allScenesFromGameId = " part.
            allScenesFromGameId.ToList().Add(scene);

            return View(allScenesFromGameId);
        }

        public ActionResult CreateOrEditScene()
        {
            return View(new Scene());
        }
    }
}