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

        private AdminService adminService;
        public CreatorController(AdminService adminService)
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
        public ActionResult SceneMain(Game game)
        {
            IEnumerable<Scene> allScenesFromGameId = new List<Scene>();
            if (game.GameId > 0)
            {
                allScenesFromGameId = adminService.GetAllScenes().Where(s => s.GameId == game.GameId);
            }

            return View(allScenesFromGameId);
        }

        public ActionResult CreateOrEditScene()
        {
            return View();
        }
    }
}