using BTAdventure.Data.DapperRepositories;
using BTAdventure.Models;
using BTAdventure.Services;
using BTAdventure.UI.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
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

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
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

        [HttpGet]
        public ActionResult LoadGame()
        {
            var dapper = new DapperPlayerCharacterRepository();
            var y = HttpContext.User.Identity.Name;
            var used = HttpContext.User;

            var newUser = UserManager.FindById(used.Identity.GetUserId());

            var result = dapper.AllLoggedIn(newUser.Id);
            return View(result);
        }

        [HttpPost]
        public ActionResult LoadGame(PlayerCharacter player)
        {
            return RedirectToAction("Game", "Gameplay", player);
        }

    }
}