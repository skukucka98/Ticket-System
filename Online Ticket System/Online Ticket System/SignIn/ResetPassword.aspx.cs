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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void RePaSubmit_Click(object sender, EventArgs e)
        {
            if (RePass.Text.Length < 8 || RePass.Text.Length > 15)
            {
                RePaMessage.Text = "Required 8 to 15 character";
            }
            else if (!RePass.Text.Any(c => char.IsUpper(c)))
            {
                RePaMessage.Text = "Required at least 1 uppercase.";
            }
            else if (!RePass.Text.Any(c => char.IsDigit(c)))
            {
                RePaMessage.Text = "Required at least 1 number";
            }
            else
            {
                Connection.UpdatePassbyUnameEmail(Connection.Decrypt(Request.QueryString["id1"]), Connection.Decrypt(Request.QueryString["id2"]), RePass.Text);
                RePaMessage.Text = "Successfully reset your password";
                HttpCookie cookie = new HttpCookie("UserInfo");
                ArrayList Userlist = Connection.GetUserbyUsernameandPassword(Connection.Decrypt(Request.QueryString["id1"]), RePass.Text);
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
                Response.Redirect("~/Default.aspx");                
            }
        }

        protected void RePaCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}