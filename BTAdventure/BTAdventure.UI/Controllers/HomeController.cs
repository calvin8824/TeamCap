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
    [AllowAnonymous]

    public class HomeController : Controller
    {
        private GameService gameSerivce;

        public HomeController(GameService gameService)
        {
            this.gameSerivce = gameService;
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Start()
        {
            Player player = new Player();
            return View(player);
        }


        [HttpGet]
        public ActionResult MainMenu(PlayerGame vm)
        {
            //get all games by player, add to vm
            return View(vm);
        }

    }
}