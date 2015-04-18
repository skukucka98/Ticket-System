using Online_Ticket_System.CSharpCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Order
{
    public partial class CheckoutReview : System.Web.UI.Page
    {
        private List<int> removelist;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DisplayOrderDetail();
                DisplayTicketDetail();
            }
        }
        private double totalcost = 0;
        private void DisplayTicketDetail()
        {
            if (Session["Cart"] == null)
            {
                Response.Redirect("./CheckoutError.aspx");
            }
            else
            {
                List<CartItem> ci = new List<CartItem>();
                List<int> ids = new List<int>();
                Cart cart = (Cart)Session["Cart"];
                ids = cart.getList();
                if (Session["removelist"] == null)
                {                    
                    foreach (int i in ids)
                    {
                        Connection.ChangeSeatStatus(i, "Pending");
                        ci.Add(Connection.GetCartinfo(i));
                    }
                }
                else
                {
                    List<int> revlist = (List<int>)Session["removelist"];
                    foreach (int i in ids)
                    {
                        if (!revlist.Contains(i))
                        {
                            ci.Add(Connection.GetCartinfo(i));
                        }
                    }
                }
                    //Create DataSource for Gridview
                    DataTable Tickettable = new DataTable();
                    DataColumn Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.Int32");
                    Col.ColumnName = "Ticket#";
                    Tickettable.Columns.Add(Col);

                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.String");
                    Col.ColumnName = ("EventName");
                    Tickettable.Columns.Add(Col);

                    // Create a 3rd column in gridview 
                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.DateTime");
                    Col.ColumnName = ("OrderDate");
                    Tickettable.Columns.Add(Col);

                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.Int32");
                    Col.ColumnName = ("SeatSection");
                    Tickettable.Columns.Add(Col);

                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.Int32");
                    Col.ColumnName = ("SeatNumber");
                    Tickettable.Columns.Add(Col);

                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.Double");
                    Col.ColumnName = ("Price");
                    Tickettable.Columns.Add(Col);

                    Col = new DataColumn();
                    Col.DataType = System.Type.GetType("System.Int32");
                    Col.ColumnName = ("SeatID");
                    Tickettable.Columns.Add(Col);
                    //
                    DataRow row;
                    for (int i = 0; i < ci.Count; i++)
                    {
                        row = Tickettable.NewRow();
                        row["Ticket#"] = i + 1;
                        row["EventName"] = ci[i].EventName;
                        row["OrderDate"] = DateTime.Now.ToShortDateString();
                        row["SeatSection"] = ci[i].catenum;
                        row["SeatNumber"] = ci[i].seatnum;
                        row["Price"] = (double)ci[i].Price;
                        row["SeatID"] = ci[i].seatid;
                        Tickettable.Rows.Add(row);
                    }

                    TicketList.DataSource = Tickettable;
                    TicketList.DataBind();
                    double amt = (double)Tickettable.Compute("Sum(Price)", "");
                    Subtotal.Text = amt.ToString("#,##0.00");
                    Taxtotal.Text = (amt * 10 / 100).ToString("#,##0.00");
                    totalcost = amt + (amt * 10 / 100);
                    Total.Text = "$" + totalcost.ToString("#,##0.00");
                    Session["ticket"] = Tickettable;
                   
                
            }
        }

        //protected void TicketList_DeleteCommand(Object sender, DataListCommandEventArgs e)
        //{
        //    if (e.CommandName == "Delete")
        //    {
        //        Button btn = (Button)sender;
        //        var item = (DataListItem)btn.NamingContainer;
        //        var seatnum = (Label)item.FindControl("seatnum");
        //        DataTable dt = (DataTable)Session["ticket"];
        //        DataRow[] drr = dt.Select("Seat Number=' " + seatnum + " ' ");
        //        for (int i = 0; i < drr.Length; i++)
        //            drr[i].Delete();
        //        dt.AcceptChanges();
        //        Session["ticket"] = dt;
        //        TicketList.DataSource = dt;
        //        TicketList.DataBind();
        //    }
        //}
        protected void TicketList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Button btn = (Button)e.Item.FindControl("Deletebtn");
                var item = (DataListItem)btn.NamingContainer;
                var seatnum = (Label)item.FindControl("seatnum");
                DataTable dt = (DataTable)Session["ticket"];
                DataRow[] drr = dt.Select("SeatNumber= " + seatnum.Text);
                for (int i = 0; i < drr.Length; i++)
                    drr[i].Delete();
                dt.AcceptChanges();
                Session["ticket"] = dt;
                TicketList.DataSource = dt;
                TicketList.DataBind();

                //delete from list
                Cart cart = (Cart)Session["Cart"];
                string userid = cart.Cusname;
                List<int> seatid = cart.getList();
                if (Session["removelist"] == null)
                {
                    removelist = new List<int>();
                }
                else
                {
                    removelist = (List<int>)Session["removelist"];
                }
                foreach (int i in seatid)
                {
                    if (!dt.AsEnumerable()
               .Any(row => i == row.Field<int>("SeatID")))
                    {
                        removelist.Add(i);
                    }
                }

                Session["removelist"] = removelist;
                //end

                if (dt.Rows.Count > 0)
                {
                    double amt = (double)dt.Compute("Sum(Price)", "");
                    Subtotal.Text = amt.ToString("#,##0.00");
                    Taxtotal.Text = (amt * 10 / 100).ToString("#,##0.00");
                    totalcost = amt + (amt * 10 / 100);
                    Total.Text = "$" + totalcost.ToString("#,##0.00");
                }
                else
                {
                    Session["removelist"] = null;
                    Session["ticket"] = null;
                    Session["Cart"] = null;
                    Response.Redirect("~/Order/CheckoutCancel.aspx");
                }
            }
        }


        //private void DisplayOrderDetail()
        //{
        //    //StringBuilder sb = new StringBuilder();
        //    if (Session["Cart"] == null)
        //    {
        //        Response.Redirect("./CheckoutError.aspx");
        //    }
        //    else
        //    {

        //        List<int> ids = new List<int>();
        //        Cart cart = (Cart)Session["Cart"];
        //        ids = cart.getList();
        //        List<CartItem> ci = new List<CartItem>();
        //        foreach (int i in ids)
        //        {
        //            ci.Add(Connection.GetCartinfo(i));
        //        }
        //        //Create DataSource for Gridview
        //        DataTable Tickettable = new DataTable();
        //        DataColumn Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.Int32");
        //        Col.ColumnName = "Ticket #";
        //        Tickettable.Columns.Add(Col);

        //        Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.String");
        //        Col.ColumnName = ("Event Name");
        //        Tickettable.Columns.Add(Col);

        //        // Create a 3rd column in gridview 
        //        Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.DateTime");
        //        Col.ColumnName = ("Order Date");
        //        Tickettable.Columns.Add(Col);

        //        Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.Int32");
        //        Col.ColumnName = ("Seat Section");
        //        Tickettable.Columns.Add(Col);

        //        Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.Int32");
        //        Col.ColumnName = ("Seat Number");
        //        Tickettable.Columns.Add(Col);

        //        Col = new DataColumn();
        //        Col.DataType = System.Type.GetType("System.Double");
        //        Col.ColumnName = ("Price");
        //        Tickettable.Columns.Add(Col);
        //        //
        //        DataRow row;
        //        for (int i = 0; i < ci.Count; i++)
        //        {
        //            row = Tickettable.NewRow();
        //            row["Ticket #"] = i + 1;
        //            row["Event Name"] = ci[i].EventName;
        //            row["Order Date"] = DateTime.Now.ToShortDateString();
        //            row["Seat Section"] = ci[i].catenum;
        //            row["Seat Number"] = ci[i].seatnum;
        //            row["Price"] = (double)ci[i].Price;
        //            Tickettable.Rows.Add(row);
        //        }

        //        orderlist.DataSource = Tickettable;
        //        orderlist.DataBind();

        //        double amt = (double)Tickettable.Compute("Sum(Price)", "");
        //        Subtotal.Text = amt.ToString("#,##0.00");
        //        Taxtotal.Text = (amt * 10 / 100).ToString("#,##0.00");
        //        double total = amt + (amt * 10 / 100);
        //        Total.Text = total.ToString("#,##0.00");
        //        //foreach (CartItem c in ci)
        //        //{
        //        //    amt += c.Price;
        //        //}
        //    }
        //}
    }
}