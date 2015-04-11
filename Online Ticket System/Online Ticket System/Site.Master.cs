using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPage();
            FillPage();
        }
        public void LoadPage()
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie != null)
            {
                if (cookie["id"] != null)
                {
                    if (cookie["FirstName"] == null)
                        lbSignIn.Text = "Welcome, <a href='../Account/ManageAccount.aspx'>" + cookie["Username"] + "<a>";
                    else
                        lbSignIn.Text = "Welcome, <a href='../Account/ManageAccount.aspx'>" + (cookie["FirstName"] + " " + cookie["LastName"]) + "<a>";
                    lbSignIn.Visible = true;
                    lbSignOut.Text = "(LogOut)";
                    //lbRegister.Visible = false;
                }
                else
                {
                    lbSignIn.Visible = false;
                    lbSignOut.Text = "(Log In/Register)";
                    //lbRegister.Visible = true;
                }
            }
            else
            {
                lbSignIn.Visible = false;
                lbSignOut.Text = "(Log In/Register)";
                //lbRegister.Visible = true;
            }

            //HttpCookie link = Request.Cookies["URL"];

            //System.Collections.Specialized.NameValueCollection searchValue = Request.Form;
            if (!(Request.Url.AbsoluteUri.Contains("/Login.aspx") || Request.Url.AbsoluteUri.Contains("/Register.aspx")))
            {
                //if (!IsPostBack)
                //{
                //if (Session["link"] != null)
                //{

                //string path = Server.HtmlEncode(Request.Url.AbsoluteUri);
                //link["Cat"] = Request.QueryString["Cat"];
                //link["subcat"] = Request.QueryString["subcat"];
                //link["currentURL"] = path;
                //link["SearchVal"] = searchValue["ctl00$SearchBox"];
                //Response.SetCookie(link);
                //}
                //else
                //{
                //link = new HttpCookie("URL");
                //link["currentURL"] = Server.HtmlEncode(Request.Url.PathAndQuery);
                //link["Cat"] = Request.QueryString["Cat"];
                //link["subcat"] = Request.QueryString["subcat"];
                //link["SearchVal"] = searchValue["ctl00$SearchBox"];
                //Response.Cookies.Add(link);

                //}
                //}
                Session["currentURL"] = Server.HtmlEncode(Request.Url.AbsoluteUri);
                //string name = Request.Params["__EVENTTARGET"];
                //if (name == "")
                //{
                //    System.Collections.Specialized.NameValueCollection searchValue = Request.Form;
                //    Session["SearchVal"] = searchValue["ctl00$SearchBox"];
                //}
                //else if (name == null)
                //{
                //    Session["SearchVal"] = null;
                //}
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
                    cookie.Value = null;
                    Response.SetCookie(cookie);
                    lbSignIn.Text = "";
                    lbSignIn.Visible = false;
                    //lbRegister.Visible = true;
                    lbSignOut.Text = "(Log In/Register)";
                    //HttpCookie link = Request.Cookies["URL"];
                    string path = Session["currentURL"].ToString();
                    if (path.Contains("/ManageAccount.aspx"))
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }
            else
            {
                lbSignIn.Text = "";
                lbSignIn.Visible = false;
                Response.Redirect("~/SignIn/Login.aspx");
            }
        }

        public void Search_Click(object sender, EventArgs e)
        {
            System.Collections.Specialized.NameValueCollection searchValue = Request.Form;
            Response.Redirect("~/Display/E_SubCat.aspx?SerVal="+ searchValue["ctl00$SearchBox"].ToString());
        }
        public void FillPage()
        {
            ArrayList Listcat = Connection.GetCategory();
            StringBuilder sb = new StringBuilder();
            List<string> cat = new List<string>();
            foreach (Category c in Listcat)
            {
                if (!cat.Contains(c.cat))
                    cat.Add(c.cat);
            }
            for (int i = 0; i < cat.Count; i++)
            {
                sb.Append(string.Format(@"<li><a href='../Display/E_SubCat.aspx?Cat={0}&subcat='>{0}</a>", cat[i]));
                sb.Append(string.Format(@"<ul>"));
                foreach (Category c in Listcat)
                {
                    if (cat[i] == c.cat)
                    {
                        sb.Append(string.Format(@" <li><a href='../Display/E_SubCat.aspx?Cat={0}&subcat={1}'>{1}</a></li>", cat[i], c.subcat));
                    }
                }
                sb.Append(string.Format(@"</ul>"));
                sb.Append(string.Format(@"</li>"));
            }
            nad.Text = sb.ToString();
        }

        protected void lbRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn/Register.aspx");
        }
    }
}