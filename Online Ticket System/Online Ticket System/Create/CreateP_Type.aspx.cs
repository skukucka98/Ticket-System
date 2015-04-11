using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Create
{
    public partial class CreateP_Method : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                C_PTMess.Visible = false;
            }
        }


        protected void C_PTButt_Click(object sender, EventArgs e)
        {
            C_PTMess.Visible = true;
            if (Connection.NumofPtype(C_PtName.Text) > 0)
            {
                C_PTMess.Text = "Payment Type already exists";
            }
            else
            {
                int result = Connection.CreatePtype(C_PtName.Text);
                if (result != 1)
                {
                    C_PTMess.Text = "Failed to Create New Payment Type";
                }
                else
                {
                    C_PTMess.Text = "Successfully Created New Payment Type";
                    C_PtName.Text = "";
                    GridView1.DataBind();
                }
            }
        }
    }
}