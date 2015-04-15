using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class Venue
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Desc { get; set; }
        public string SeatingChart { get; set; }

        public Venue(int id, string name, string add1, string add2, string city, string state, string zip, string desc, string chart)
        {
            Id = id;
            Name = name;
            Address1 = add1;
            Address2 = add2;
            City = city;
            State = state;
            Zip = zip;
            Desc = desc;
            SeatingChart = chart;
        }

        public Venue(string name, string add1, string add2, string city, string state, string zip, string description, string Chart)
        {

            Name = name;
            Address1 = add1;
            Address2 = add2;
            City = city;
            State = state;
            Zip = zip;
            Desc = description;
            SeatingChart = Chart;
        }
    }
}