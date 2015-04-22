using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Online_Ticket_System.CSharpCode;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.Security;

namespace Online_Ticket_System.SignIn
{
    public partial class FogotPass : System.Web.UI.Page
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

        protected void FGPaSubmit_Click(object sender, EventArgs e)
        {

            if (IsValidEmail(FGPaEmail.Text) == false)
            {
                FGPaMessage.Text = "Invalid Password!";
            }
            else
            {
                if (Connection.GetNumofUserByUsernameAndEmail(FGPaUsername.Text, FGPaEmail.Text) != 1)
                {
                    FGPaMessage.Text = "User does not exists!";
                }
                else
                {
                    string encryptunm = Connection.Encrypt(FGPaUsername.Text);
                    string pass = Connection.pass(FGPaUsername.Text, FGPaEmail.Text);
                    string encryptpas = Connection.Encrypt(pass);
                   // string password = Membership.GeneratePassword(15, 0);
                    string link = string.Format("http://localhost:51341/SignIn/ResetPassword.aspx?id1={0}&id2={1}", encryptunm, encryptpas);
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("multiticket.some.com@gmail.com");
                    mail.To.Add(FGPaEmail.Text);
                    mail.Subject = "Reset Password link";
                    mail.Body = "Hello,\n\n"
                        + "We're sending this message because you requested to reset your goevent password.\n"
                        + "Please click to the follow link to reset your password\n"
                        + link + "\n\n"
                        + "GoEvent.info";

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                    smtp.Timeout = 10000;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential("multiticket.some.com@gmail.com", "Capstone_USER");
                    smtp.Send(mail);
                    FGPaMessage.Text = "Check your email to reset password.";// +password;

                }
            }
        }
    }
}