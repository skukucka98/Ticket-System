using Online_Ticket_System.CSharpCode;
using Online_Ticket_System.Order.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Order
{
    public partial class CheckoutConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmationOrder();
        }

        private void ConfirmationOrder()
        {
            if (Session["orderid"] == null)
            {
                Response.Redirect("./CheckoutError.aspx");
            }
            else
            {
                int id = (int)Session["orderid"];
                PurchaseOrder po = Connection.GetOrderConfirmation(id);
                ConfirmationCodelb.Text = po.confirmationCode;
                PurchaseDate.Text = po.purchasedate.ToString("MMM d yyyy HH:mm ");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["orderid"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}