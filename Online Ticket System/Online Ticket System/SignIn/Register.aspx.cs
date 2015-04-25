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

namespace Online_Ticket_System.SignIn
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if(PasswordReg.Text.Length <8 || PasswordReg.Text.Length >15)
            {
                PassVal.Text = "Required 8 to 15 charaters";
            }
            else if (!PasswordReg.Text.Any(c => char.IsUpper(c)))
            {
                PassVal.Text = "Required at least 1 uppercase.";
            }
            else if (!PasswordReg.Text.Any(c => char.IsDigit(c)))
            {
                PassVal.Text = "Required at least 1 number";
            }
            else if (!Regex.IsMatch(CityBox.Text, @"^[a-zA-Z ]+$"))
            {
                PassVal.Text = "";
                RegMes.Text = "Invalid City.";
            }
            else if (!(ZipcodeBox.Text.Length == 5) || !ZipcodeBox.Text.All(char.IsDigit))
            {
                PassVal.Text = "";
                RegMes.Text = "Invalid Zipcode";
            }
            else if (!Regex.IsMatch(PhoneBox.Text, @"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$"))
            {
                PassVal.Text = "";
                RegMes.Text = "Invalid Phone Number.";
            }

            else if (!Regex.IsMatch(EmailBox.Text, @"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"))
            {
                PassVal.Text = "";
                RegMes.Text = "Invalid Email Address";
            }
            else
            {
                if (Connection.CheckUserExist(UsernameReg.Text) != 0)
                {
                    PassVal.Text = "";
                    RegMes.Text = "Username already exists!";
                }
                else
                {
                    Connection.UserRegister(UsernameReg.Text, PasswordReg.Text);
                    int Userid = Connection.GetUserID(UsernameReg.Text);
                    if (Userid == 0)
                    {
                        RegMes.Text = "Register Unsuccessfully";
                    }
                    else
                    {
                        int result = Connection.CusRegister(Userid, FirstnameBox.Text, LastnameBox.Text, EmailBox.Text, PhoneBox.Text, Address1Box.Text, Address2Box.Text, CityBox.Text, StateBox.SelectedValue, ZipcodeBox.Text, 0);
                        if (result == 0)
                        {
                            RegMes.Text = "Register Unsuccessfully";
                        }
                        else
                        {
                            HttpCookie cookie = new HttpCookie("UserInfo");
                            ArrayList Userlist = Connection.GetUserbyUsernameandPassword(UsernameReg.Text, PasswordReg.Text);
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
                }
            }
        
        }
    }
}