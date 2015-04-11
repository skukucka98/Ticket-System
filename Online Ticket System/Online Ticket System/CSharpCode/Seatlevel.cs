using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Ticket_System.Create
{
    class Seatlevel
    {
        public int ID { get; set; }
        public int VID { get; set; }
        public int Section { get; set; }
        public int SeatTotal { get; set; }


        public Seatlevel(int vid, int section, int seattotal)
        {
            VID = vid;
            Section = section;
            SeatTotal = seattotal;
        }
    }
}
