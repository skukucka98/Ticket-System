using Online_Ticket_System.CSharpCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Display
{
    public partial class E_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("../Display/E_DetailErr.aspx");
            }
            DisplayEventDetail();

            if (!IsPostBack)
            {
                //ImageButton.Visible = false;
                Buybtn.Visible = false;
                avlLabel.Visible = false;
            }

        }

        private void DisplayEventDetail()
        {
            int id = Int32.Parse(Request.QueryString["id"]);
            List<Event> EventDetail = Connection.GetEventDetail(id).Cast<Event>().ToList();
            foreach(Event e in EventDetail)
            {
                E_Name.Text = e.Name;
                E_DateTime.Text = e.Datetime.ToString();
                E_Venue.Text = e.Venue;
                E_Status.Text = e.Status;
                E_Desc.Text = e.Desc;
                E_DetImage.ImageUrl = e.Picture;
                E_DetImage.PostBackUrl = "../Display/E_Detail.aspx?id=" + e.ID;
                ImageButton.ImageUrl = e.SeatingChart;
            }
        }

        protected void TicketSer_Click(object sender, EventArgs e)
        {
            DataList1.DataSource = Connection.GetAvlSeat(Int32.Parse(Request.QueryString["id"]), Int32.Parse(QtyList.SelectedValue), SectionList.SelectedValue, PriceList.SelectedValue);
            DataList1.DataBind();

            ImageButton.Visible = true;
            Buybtn.Visible = true;
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie == null)
            {
                Buybtn.Attributes.Add("onclick", "return confirm('Please login before buying ticket!')");
            }
            else
            {
                Buybtn.Attributes.Add("onclick", "return confirm('You have 5 minute to pay for your ticket. Do you want to process?')");
            }
            avlLabel.Visible = true;
        }

        List<int> id = new List<int>();

        protected void Buybtn_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie == null)
            {
                Response.Redirect("~/SignIn/Login.aspx");
            }
            id = new List<int>();
            foreach (DataListItem li in DataList1.Items)
            {
                CheckBox chked_item = (CheckBox)li.FindControl("chked_item");
                if (chked_item != null)
                {
                    if (chked_item.Checked == true)
                    {
                        int x = Convert.ToInt32(((Label)li.FindControl("SeatID")).Text);
                        id.Add(x);
                    }
                }
            }

            if (cookie != null && id.Count > 0)
            {
                Cart c = new Cart(cookie["id"], id);
                Session.Add("Cart", c);
            }
            Response.Redirect("~/Checkout/CheckoutStart.aspx");
        }
    }
}