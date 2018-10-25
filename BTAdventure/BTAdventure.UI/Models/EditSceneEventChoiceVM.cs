using BTAdventure.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTAdventure.UI.Models
{
    public class EditSceneEventChoiceVM
    {
        public EventChoice CurrentEvent { get; set; }
        public IEnumerable<EventChoice> AllEventByScene { get; set; }
    }
}