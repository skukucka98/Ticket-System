using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.Order.Model
{
    public class PurchaseOrder
    {
        public int orderid { get; set; }
        public DateTime purchasedate { get; set; }
        public string confirmationCode { get; set; }
        public decimal ordertotal { get; set; }
    }
}