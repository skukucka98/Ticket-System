using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class Cart
    {
        public string Cusname { get; set; }
        List<int> Seatid = new List<int>();

        public Cart()
        {
            Cusname = "";
            List<int> Seatid = new List<int>();
        }

        public Cart(string name, List<int> id)
        {
            Cusname = name;
            Seatid = id;
        }
    }
}