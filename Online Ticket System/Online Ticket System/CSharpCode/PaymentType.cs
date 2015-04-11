using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class PaymentType
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public PaymentType() { }

        public PaymentType(int id, string name)
        {
            ID = id;
            Name = name;
        }
    }
}