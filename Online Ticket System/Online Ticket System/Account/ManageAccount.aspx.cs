using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Account
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshAccInfo();
                DisLogInfo.Visible = true;
                EditLogInfo.Visible = false;
                DisAccInfor.Visible = true;
                EditAccInfo.Visible = false;
            }
        }

        private bool IsValidEmail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        protected void LoginEdit_Click(object sender, EventArgs e)
        {
            RefreshAccInfo();
            DisLogInfo.Visible = false;
            EditLogInfo.Visible = true;
        }

        protected void AccEdit_Click(object sender, EventArgs e)
        {
            RefreshAccInfo();
            DisAccInfor.Visible = false;
            EditAccInfo.Visible = true;
        }

        protected void EditLogCancel_Click(object sender, EventArgs e)
        {
            RefreshAccInfo();
            DisLogInfo.Visible = true;
            EditLogInfo.Visible = false;
            DisAccInfor.Visible = true;
            EditAccInfo.Visible = false;
        }

        protected void EditAccCancel_Click(object sender, EventArgs e)
        {
            RefreshAccInfo();
            DisLogInfo.Visible = true;
            EditLogInfo.Visible = false;
            DisAccInfor.Visible = true;
            EditAccInfo.Visible = false;
        }

        protected void EditLogSave_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie == null)
            {
                Response.Redirect("~/SignIn/Login.aspx");
            }
            else
            {
                //Update the Database
                if (EditLogOldPass.Text != cookie["Password"])
                {
                    EditLogMess.Text = "Incorrect Password";
                }
                else if (EditLogPass.Text.Length < 8 || EditLogPass.Text.Length > 15)
                {
                    EditLogMess.Text = "Password Required 8 to 15 charaters";
                }
                else if (!EditLogPass.Text.Any(c => char.IsUpper(c)))
                {
                    EditLogMess.Text = "Password Required at least 1 uppercase.";
                }
                else if (!EditLogPass.Text.Any(c => char.IsDigit(c)))
                {
                    EditLogMess.Text = "Password Required at least 1 number";
                }
                else
                {
                    //update user

                    string id = cookie["id"];
                    Connection.UpdatePassByID(EditLogPass.Text, id);

                    RefreshAccInfo();
                    DisLogInfo.Visible = true;
                    EditLogInfo.Visible = false;
                    DisAccInfor.Visible = true;
                    EditAccInfo.Visible = false;
                }
            }

        }

        protected void EditAccSave_Click(object sender, EventArgs e)
        {
            if (!(EditAccZip.Text.Length == 5) || !EditAccZip.Text.All(char.IsDigit))
            {
                EditAccMess.Text = "Invalid Zipcode";
            }
            else if (!Regex.IsMatch(EditAccPhone.Text, @"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$"))
            {
                EditAccMess.Text = "Invalid Phone Number.";
            }

            else if (IsValidEmail(EditAccEmail.Text) == false)
            {
                EditAccMess.Text = "Invalid Email Address";
            }
            else
            {
                HttpCookie cookie = Request.Cookies["UserInfo"];
                if (cookie == null)
                {
                    Response.Redirect("~/SignIn/Login.aspx");
                }
                else
                {
                    string id = cookie["id"];
                    Connection.UpdateCustomerInfo(id, EditAccFname.Text, EditAccLname.Text, EditAccPhone.Text, EditAccEmail.Text, EditAccAdd1.Text, EditAccAdd2.Text, EditAccCity.Text, EditAccState.Text, EditAccZip.Text);
                }
                RefreshAccInfo();
                DisLogInfo.Visible = true;
                EditLogInfo.Visible = false;
                DisAccInfor.Visible = true;
                EditAccInfo.Visible = false;
                //Update the Database
            }
        }
        private void RefreshAccInfo()
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie == null)
            {
                Response.Redirect("~/SignIn/Login.aspx");
            }
            else
            {
                ArrayList Userlist = Connection.GetUserbyUserID(cookie["id"]);
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

                LogUname.Text = cookie["Username"];
                string pass = "";
                for (int i = 0; i < cookie["Password"].Length; i++)
                {
                    pass += "*";
                }
                LogPass.Text = pass;
                EditLogOldPass.Text = cookie["Password"];
                EditLogPass.Text = cookie["Password"];
                LogFname.Text = cookie["FirstName"];
                EditAccFname.Text = cookie["FirstName"];
                LogLname.Text = cookie["LastName"];
                EditAccLname.Text = cookie["LastName"];
                LogAdd1.Text = cookie["Address1"];
                EditAccAdd1.Text = cookie["Address1"];
                LogAdd2.Text = cookie["Address2"];
                EditAccAdd2.Text = cookie["Address2"];
                LogCity.Text = cookie["City"];
                EditAccCity.Text = cookie["City"];
                LogState.Text = cookie["State"];
                EditAccState.Text = cookie["State"];
                LogZip.Text = cookie["Zip"];
                EditAccZip.Text = cookie["Zip"];
                LogPhone.Text = cookie["Phone"];
                EditAccPhone.Text = cookie["Phone"];
                LogEmail.Text = cookie["Email"];
                EditAccEmail.Text = cookie["Email"];
            }
        }

    }
}