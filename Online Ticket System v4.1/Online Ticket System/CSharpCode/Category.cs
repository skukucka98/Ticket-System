using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class Category
    {
        
        public int ID { get; set; }
        public string cat { get; set; }
        public string subcat { get; set; }

        public Category(int id, string cat, string subcat)
        {
            ID = id;
            this.cat = cat;
            this.subcat = subcat;
        }

    }
}