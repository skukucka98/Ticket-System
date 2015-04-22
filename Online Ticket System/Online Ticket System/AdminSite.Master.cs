using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Create
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPage();
        }

        public void LoadPage()
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie != null)
            {
                if (cookie["id"] != null)
                {
                    if (cookie["FirstName"] != null)
                        lbSignIn.Text = "Welcome, " + cookie["Username"];
                    else
                        lbSignIn.Text = "Welcome, " + (cookie["FirstName"] + " " + cookie["LastName"]);
                    lbSignIn.Visible = true;
                    lbSignOut.Text = "(Log Out)";
                }
                else
                {
                    lbSignIn.Visible = false;
                    lbSignOut.Text = "(Log In)";
                }
            }
            else
            {
                lbSignIn.Visible = false;
                lbSignOut.Text = "(Log In)";
            }

        }


        public void lbSignOut_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie != null)
            {
                if (cookie["id"] == null)
                {
                    lbSignIn.Text = "";
                    lbSignIn.Visible = false;
                    Response.Redirect("~/SignIn/Login.aspx");
                }
                else
                {
                    cookie = Request.Cookies["UserInfo"];
                    Response.Cookies.Remove("UserInfo");
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cookie);
                    //cookie.Value = null;
                    //Response.SetCookie(cookie);
                    lbSignIn.Text = "";
                    lbSignIn.Visible = false;
                    lbSignOut.Text = "(LogIn)";
                    Response.Redirect("~/SignIn/Login.aspx");
                }
            }
            else
            {
                lbSignIn.Text = "";
                lbSignIn.Visible = false;
                Response.Redirect("~/SignIn/Login.aspx");
            }
        }


        protected void Admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/AdministratorPage.aspx");
        }

        protected void Cr_Cat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/CreateE_Category.aspx");
        }

        protected void Cr_Event_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/CreateEvent.aspx");
        }

        protected void Cr_Venue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/CreateVenue.aspx");
        }

        protected void Cr_PType_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/CreateP_Type.aspx");
        }

        protected void Cr_User_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Create/CreateUser.aspx");
        }
    }
}