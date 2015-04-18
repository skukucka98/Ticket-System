using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class CartItem
    {
        public string VenueName { get; set; }
        public string EventName { get; set; }
        public DateTime EventDate { get; set; }
        public TimeSpan eventtime { get; set; }
        public int catenum { get; set; }
        public int seatnum { get; set; }
        public decimal Price { get; set; }
        public int seatid { get; set; }
    }
}