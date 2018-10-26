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
    public class GameplayController : Controller
    {
        // GET: Gameplay
        private GameService gameSerivce;

        public GameplayController(GameService gameService)
        {
            this.gameSerivce = gameService;
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