using BTAdventure.Models;
using BTAdventure.Services;
using BTAdventure.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace BTAdventure.UI.Controllers
{
    public class GameplayController : Controller
    {
        // GET: Gameplay
        private GameService gameSerivce;

        public GameplayController(GameService gameService)
        {
            this.gameSerivce = gameService;
        }

        public ActionResult NewGame()
        {
            var claimsIdentity = (ClaimsIdentity)this.User.Identity;
            var claim = claimsIdentity.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier);
            var userId = claim.Value;

            var games = gameSerivce.FindAllGames();

            PlayerGame playerGame = new PlayerGame();
            playerGame.Games = gameSerivce.FindAllGames();
            playerGame.Player = gameSerivce.FindPlayerById(userId);

            //find player id all games
            //generate new player character
            //find scene id
            //gameSerivce.NewGame
            return View();
        }

        [HttpPost]
        public ActionResult NewGame(Game game)
        {
            //insert into character, name and 3hp, 0 gold
            return View("Intro");
        }

        public ActionResult Intro()
        {
            return View();
        }


        [HttpGet]
        public ActionResult Game(PlayerCharacter player)//we're taking in a character id ... last i heard
        {
            GameSceneVM vm = new GameSceneVM();
            vm.PlayerCharacter = gameSerivce.FindPlayerCharacterById(player.CharacterId);
            
            vm.Scene = gameSerivce.FindSceneById(vm.PlayerCharacter.SceneId);
            vm.EventChoice = gameSerivce.FindEventChoiceById(vm.PlayerCharacter.EventChoiceId);
            return View(vm);
        }

        [HttpGet]
        public ActionResult Ending(int id)
        {
            GameSceneVM vm = new GameSceneVM();
            vm.Ending = gameSerivce.FindEndingById(id);

            return View(vm);
        }
    }
}