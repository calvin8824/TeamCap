using BTAdventure.Models;
using BTAdventure.Services;
using BTAdventure.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace BTAdventure.UI.Controllers
{
    public class GameWebApiController : ApiController
    {
        private GameService gameService;
        public GameWebApiController(GameService gameService)
        {
            this.gameService = gameService;
        }


        [Route("api/game/")]
        [HttpPost]
        public ReturnJSONObject Post(ChoiceJSONObject choice)
        {
            var eventChoice = gameService.FindEventChoiceById(choice.EventChoiceId);
            var nextRound = gameService.DetermineNextRound(eventChoice, choice.PositiveOrNegative);
            ReturnJSONObject response = new ReturnJSONObject();
            if (nextRound.Item1 == ChoiceResult.Ending)
            {
                var ending = gameService.FindEndingById(nextRound.Item2);
                if (ending != null)
                {
                    //return response.Ending;
                }
                //redirect
            }
            else if (nextRound.Item1 == ChoiceResult.Scene)
            {
                Scene scene = gameService.FindSceneById(nextRound.Item2);
                if (scene != null)
                {
                    List<EventChoice> choiceOfEvents = gameService.FindChoiceBySceneId(scene.SceneId).ToList();
                    foreach (var c in choiceOfEvents)
                    {
                        if (c.GenerationNumber == 0)
                        {
                            //return this event 
                        }
                    }
                    //redirect
                }
            }
            else if (nextRound.Item1 == ChoiceResult.EventChoice)
            {
                var eventChoiceok = gameService.FindEventChoiceById(nextRound.Item2);
                if (eventChoiceok != null)
                {
                    //return this choice
                }
            }
            else
            {
                //redirect to error page
            }

            return null;
            //var success = gameService.CombineObject(choice);

            //if (success.Ending.EndingId > 0)
            //{
            //    //return redirect somehow??
            //}
            //return success;
        }


    }



}