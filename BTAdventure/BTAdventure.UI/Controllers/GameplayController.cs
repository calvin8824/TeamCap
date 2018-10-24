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
        public ActionResult Game(int id)//sceneId
        {
            //we'll have something like if not new game...

            GameSceneVM vm = new GameSceneVM();
            vm.Scene = gameSerivce.FindSceneById(id);
            vm.EventChoice = gameSerivce.FindEventChoiceById(id);
            //vm.Character = gameSerivce.FindListOfPlayerCharactersByPlayerId();
            vm.PlayerCharacter = gameSerivce.FindPlayerCharacterById(2);
            return View(vm);
        }
    }
}