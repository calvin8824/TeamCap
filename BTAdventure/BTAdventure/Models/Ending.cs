using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BTAdventure.Models
{
    public class Ending
    {
        public int EndingId { get; set; }
        public int GameId { get; set; }
        public string EndingName { get; set; }
        public string EndingText { get; set; }
    }
}
