using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class Seat
    {
        public int Id { get; set; }
        public int Snum { get; set; }
        public string SCat { get; set; }
        public string Status { get; set; }
        public float Price { get; set; }
        public string Event { get; set; }
        public int Eventid { get; set; }

        public Seat(int id, int num, string cat, string status, float price, string eventname, int eventid)
        {
            Id = id;
            Snum = num;
            SCat = cat;
            Status = status;
            Price = price;
            Event = eventname;
            Eventid = eventid;
        }
    }
}