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
        public ActionResult Game(int id)//we're taking in a character id ... last i heard
        {
            ////MAKE A FIND EVENT CHOICE AND FIND SCENE BY CHARACTERID!!!!
            
            GameSceneVM vm = new GameSceneVM();
            vm.PlayerCharacter = gameSerivce.FindPlayerCharacterById(id);
            
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