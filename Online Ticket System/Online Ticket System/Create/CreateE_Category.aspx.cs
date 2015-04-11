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
    public partial class CreateE_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SubCatMess.Visible = false;
            }
        }


        protected void SubCatBut_Click(object sender, EventArgs e)
        {
            SubCatMess.Visible = true;
            int num = Connection.NumofCat(CatType.SelectedValue, SubCat.Text);
            int result = 0;
            if (num > 0)
            {
                SubCatMess.Text = "Category already exists";
                SubCatMess.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                result = Connection.AddSubCat(CatType.SelectedValue, SubCat.Text);
                if (result > 0)
                {
                    SubCatMess.Text = "Category was created successfully";
                    SubCatMess.ForeColor = System.Drawing.Color.Blue;
                    SubCat.Text = "";
                    CateGrid.DataBind();
                }
                else
                {
                    SubCatMess.Text = "Failed to create new category";
                    SubCatMess.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void CateGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CateGridDataSource.Update();
        }

        protected void CateGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Update"))
            {
                int state = 0;
                int index = int.Parse(e.CommandArgument.ToString());
                GridViewRow row = CateGrid.Rows[index];
                DropDownList lstState = (DropDownList)row.FindControl("CatlogID");
                state = int.Parse(lstState.SelectedValue.ToString());
                CateGridDataSource.UpdateParameters.Add("Catid", state.ToString());
            }
        }
    }
}