using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class Event
    {
        public int ID { get; set; }
        public string Category { get; set; }
        public string Subcategory { get; set; }
        public string Name { get; set; }
        public DateTime Datetime { get; set; }
        public string Venue { get; set; }
        public string Status { get; set; }
        public string Desc { get; set; }
        public string Picture { get; set; }
        public int Totalavailable { get; set; }
        public int Totalsold { get; set; }
        public double Minprice { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public string SeatingChart { get; set; }

        public Event() { }
        public Event(string name, string date, string time, string venue, string status, string category, string description, string img)
        {

            Name = name;
            Date = date;
            Time = time;
            Venue = venue;
            Status = status;
            Category = category;
            Desc = description;
            Picture = img;

        }

        public IQueryable<Event> E_SubCat { get; set; }
    }
}