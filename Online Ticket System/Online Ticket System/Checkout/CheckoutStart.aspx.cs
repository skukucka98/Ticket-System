using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Online_Ticket_System.CSharpCode;

namespace Online_Ticket_System.Checkout
{
    public partial class CheckoutStart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NVPAPICaller payPalCaller = new NVPAPICaller();
            string retMsg = "";
            string token = "";

            List<int> ids = new List<int>();
            Cart cart = (Cart)Session["Cart"];
            ids = cart.getList();
            List<CartItem> ci = new List<CartItem>();
            foreach (int i in ids) 
            {
                ci.Add(Connection.GetCartinfo(i));
            }
            Session["CartItems"] = ci;
            decimal amt = 0;
            foreach (CartItem c in ci)
            {
                amt += c.Price;
            }

            Session["payment_amt"] = amt;

            if (Session["payment_amt"] != null)
            {
                string amount = Session["payment_amt"].ToString();

                bool ret = payPalCaller.ShortcutExpressCheckout(amount, ref token, ref retMsg);
                if (ret)
                {
                    Session["token"] = token;
                    Response.Redirect(retMsg);
                }
                else
                {
                    Response.Redirect("CheckoutError.aspx?" + retMsg);
                }
            }
          //  else
            //{
            //    Response.Redirect("CheckoutError.aspx?ErrorCode=AmtMissing");
           // }
        }
    }
}