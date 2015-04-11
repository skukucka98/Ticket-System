using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.CSharpCode
{
    public class ShoppingCart
    {
        public int CustomerID { get; set; }
        List<int> AllSeatID;
        ShoppingCart(int Cusid)
        {
            CustomerID = Cusid;
            AllSeatID = new List<int>();
        }
        public void AddSeatID(int id)
        {
            AllSeatID.Add(id);
        }

        public int GetSeatID(int pos){
            return AllSeatID[pos];
        }
    }
}