using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.SignIn
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ForgotPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn/ForgotPass.aspx");
        }

        protected void RequestRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn/Register.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Connection.GetNumofUserByUsernameAndPassword(UsernameBox.Text, PasswordBox.Text) == 1)
            {
                ArrayList Userlist = Connection.GetUserbyUsernameandPassword(UsernameBox.Text, PasswordBox.Text);
                HttpCookie cookie = Request.Cookies["UserInfo"];
                if (cookie != null)
                {
                    foreach (Users user in Userlist)
                    {
                        cookie["id"] = user.ID.ToString();
                        cookie["FirstName"] = user.FirstName;
                        cookie["LastName"] = user.LastName;
                        cookie["Username"] = user.Username;
                        cookie["Password"] = user.Password;
                        cookie["Email"] = user.Email;
                        cookie["Usertype"] = user.UserType;
                        cookie["Phone"] = user.Phone;
                        cookie["Address1"] = user.Address1;
                        cookie["Address2"] = user.Address2;
                        cookie["City"] = user.City;
                        cookie["State"] = user.State;
                        cookie["Zip"] = user.Zipcode;
                    }
                    Response.SetCookie(cookie);
                }
                else
                {
                    cookie = new HttpCookie("UserInfo");
                    foreach (Users user in Userlist)
                    {
                        cookie["id"] = user.ID.ToString();
                        cookie["FirstName"] = user.FirstName;
                        cookie["LastName"] = user.LastName;
                        cookie["Username"] = user.Username;
                        cookie["Password"] = user.Password;
                        cookie["Email"] = user.Email;
                        cookie["Usertype"] = user.UserType;
                        cookie["Phone"] = user.Phone;
                        cookie["Address1"] = user.Address1;
                        cookie["Address2"] = user.Address2;
                        cookie["City"] = user.City;
                        cookie["State"] = user.State;
                        cookie["Zip"] = user.Zipcode;
                    }
                    Response.Cookies.Add(cookie);
                }
                if (cookie["Usertype"] == "Administrator")
                {
                    Response.Redirect("~/Create/AdministratorPage.aspx");
                }
                else
                {
                    //HttpCookie link = Request.Cookies["URL"];
                    if (Session["currentURL"] != null)
                    {
                        string path = Session["currentURL"].ToString();
                        Response.Redirect(path.Replace("&amp;", "&"));
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }
            else
            {
                LoginMessage.Text = "Incorrect Username and Password";
            }
        }
    }
}