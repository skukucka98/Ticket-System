using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace $safeprojectname$.Checkout
{
    public partial class ConfirmationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string password = Guid.NewGuid().ToString("N").Substring(0, 8);
            Label1.Text = password;
            Label3.Text=DateTime.Now.ToString("MM-dd-yyyy"); 
            
        }
    }
}