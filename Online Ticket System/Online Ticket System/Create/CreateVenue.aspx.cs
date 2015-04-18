using Online_Ticket_System.CSharpCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Create
{
    public partial class CreateVenue : System.Web.UI.Page
    {
        DataTable mytable;
        protected void Page_Load(object sender, EventArgs e)
        {
            vengrid.Visible = false;
            venueOutput.Visible = false;
            if (!IsPostBack)
            {
                Session["Mytable"] = null;
            }
        }

        private Boolean isImage(string image)
        {
            if (Path.GetExtension(image).ToLower() != ".jpg"
           && Path.GetExtension(image).ToLower() != ".png"
           && Path.GetExtension(image).ToLower() != ".gif"
           && Path.GetExtension(image).ToLower() != ".jpeg")
            {
                return false;
            }
            else
                return true;
        }

        protected void AddSeat_Click(object sender, EventArgs e)
        {
            int n;
            if (!int.TryParse(txtSeatSection.Text, out n) || Int32.Parse(txtSeatSection.Text) <=0)
            {
                lbSeatOutput.Text = "Invalid Section Number.";
                lbSeatOutput.ForeColor = Color.Red;
            }
            else if (!int.TryParse(txtTotalSeat.Text, out n) || Int32.Parse(txtTotalSeat.Text) <=0)
            {
                lbSeatOutput.Text = "Invalid total seat.";
                lbSeatOutput.ForeColor = Color.Red;
            }
            else
            {
                try
                {
                    DataColumn column;
                    DataRow tblrow;
                    int section = Int32.Parse(txtSeatSection.Text);
                    int seattotal = Int32.Parse(txtTotalSeat.Text);
                    if (Session["Mytable"] != null)
                    {
                        mytable = (DataTable)Session["Mytable"];
                    }
                    else
                    {
                        mytable = new DataTable();
                        // Create a new DataColum, set dataType, columnName and add to the datatable
                        column = new DataColumn();
                        column.DataType = System.Type.GetType("System.Int32");
                        column.ColumnName = "SeatSection";
                        mytable.Columns.Add(column);

                        // Create a new DataColum, set dataType, columnName and add to the datatable
                        column = new DataColumn();
                        column.DataType = System.Type.GetType("System.Int32");
                        column.ColumnName = "TotalSeat";
                        mytable.Columns.Add(column);
                    }
                    if (mytable.AsEnumerable().Any(row => section == row.Field<int>("SeatSection")))
                    {
                        //lbSeatOutput.Text = "This Section already exits.";
                        //lbSeatOutput.ForeColor = Color.Red;
                        vengrid.Visible = true;
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('This Section already exits.')", true);
                        vengrid.Visible = true;
                        lbSeatOutput.Text = "";
                    }
                    else
                    {
                        //Create new DataRow objects and add to DataTable

                        tblrow = mytable.NewRow();
                        tblrow["SeatSection"] = section;
                        tblrow["TotalSeat"] = seattotal;
                        mytable.Rows.Add(tblrow);

                        VenueGrid.DataSource = mytable;
                        VenueGrid.DataBind();

                        Session["Mytable"] = mytable;

                        lbSeatOutput.Text = "Upload successful!";
                        lbSeatOutput.ForeColor = Color.Blue;
                        vengrid.Visible = true;
                    }


                }
                catch (Exception)
                {
                    lbSeatOutput.Text = "Upload failed!";
                    lbSeatOutput.ForeColor = Color.Red;
                }
            }
        }


        private void ClearVenueFields()
        {
            txtvenueName.Text = "";
            txtaddress1.Text = "";
            txtaddress2.Text = "";
            txtCity.Text = "";
            txtState.SelectedIndex = 0;
            txtZip.Text = "";
            txtvenueDescription.Text = "";
            Session["Mytable"] = null;
            txtSeatSection.Text = "";
            txtTotalSeat.Text = "";
        }

        protected void venueSave_Click(object sender, EventArgs e)
        {
            lbSeatOutput.Text = "";

            if (Session["Mytable"] == null)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The Venue do not contain any section. Please add section and try it again.')", true);
            }
            else
            {
                mytable = (DataTable)Session["Mytable"];
                int n;
                string filename;
                try
                {
                    filename = Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/Images/Seating Map/") + filename);
                }
                catch (Exception)
                {
                    venueOutput.Text = "Upload Failed!";
                    venueOutput.ForeColor = Color.Red;
                    venueOutput.Visible = true;
                    return;
                }

                if (!Regex.IsMatch(txtCity.Text, @"^[a-zA-Z ]+$"))
                {
                    venueOutput.Text = "Invalid City.";
                    venueOutput.Visible = true;
                    venueOutput.ForeColor = Color.Red;
                    vengrid.Visible = true;
                }
                else if (txtZip.Text.Replace(" ", string.Empty).Length != 5 || !int.TryParse(txtZip.Text, out n) || Int32.Parse(txtZip.Text)<=0)
                {
                    venueOutput.Text = "Invalid zipcode.";
                    venueOutput.Visible = true;
                    venueOutput.ForeColor = Color.Red;
                    vengrid.Visible = true;
                }
                else if (mytable.Rows.Count == 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The Venue do not contain any section. Please Add more section and try it again.')", true);
                }
                else if (!isImage(filename))
                {
                    venueOutput.Text = "Invalid Image";
                    venueOutput.ForeColor = Color.Red;
                    venueOutput.Visible = true;
                }
                else
                {
                    try
                    {
                        string name = txtvenueName.Text;
                        string address1 = txtaddress1.Text;
                        string address2 = txtaddress2.Text;
                        string city = txtCity.Text;
                        string state = txtState.SelectedValue;
                        string zipcode = txtZip.Text.Replace(" ", string.Empty);
                        string description = txtvenueDescription.Text;
                        

                        Venue venue = new Venue(name, address1, address2, city, state, zipcode, description, "../Images/Seating Map/" + filename);
                        int id = Connection.AddVenue(venue);

                        DataColumn nc;
                        //DataRow row;
                        //DataRow nr = mytable.NewRow();
                        if (!mytable.Columns.Contains("VenueID"))
                        {
                            //Add the a new column and add it into the existing gridview 
                            nc = new DataColumn();
                            nc.DataType = System.Type.GetType("System.Int32");
                            nc.ColumnName = "VenueID";
                            nc.DefaultValue = id;
                            mytable.Columns.Add(nc);
                        }
                        for (int i = 0; i < mytable.Rows.Count; i++)
                        {
                            mytable.Rows[i][2] = id;

                        }
                        //Add data to gridview
                        VenueGrid.DataSource = mytable;
                        VenueGrid.DataBind();


                        foreach (DataRow g1 in mytable.Rows)
                        {
                            int section = g1.Field<int>(0);
                            int seattotal = g1.Field<int>(1);
                            int venueid = g1.Field<int>(2);


                            Seatlevel slv = new Seatlevel(venueid, section, seattotal);
                            Connection.AddSeatSection(slv);
                        }

                        venueOutput.Visible = true;
                        lbSeatOutput.Text = "";
                        venueOutput.Text = "The Venue was upload successfully.";
                        venueOutput.ForeColor = Color.Blue;
                        ClearVenueFields();
                        GridView1.DataBind();

                    }
                    catch (Exception exe)
                    {
                        venueOutput.Text = "the Venue was failed to upload.";
                        venueOutput.ForeColor = Color.Red;
                        venueOutput.Visible = true;
                        vengrid.Visible = true;

                    }
                }
            }
        }
        protected void VenDetail_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            venueOutput.Visible = false;
        }

        protected void VenDetail_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            GridView1.SelectRow(-1);
            Button1_ModalPopupExtender.Hide();
        }

        protected void VenueGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["Mytable"] != null)
            {
                mytable = (DataTable)Session["Mytable"];
            }
            int index = Convert.ToInt32(e.RowIndex);
            mytable.Rows.RemoveAt(e.RowIndex);
            this.VenueGrid.DataSource = mytable;
            this.VenueGrid.DataBind();
            Session["Mytable"] = mytable;
            vengrid.Visible = true;
            lbSeatOutput.Text = "Section was deleted successfully.";
            lbSeatOutput.ForeColor = Color.Blue;
        }

        protected void TextValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = Regex.IsMatch(args.Value, @"^[a-zA-Z ]+$");            
        }

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int n;
            args.IsValid = args.Value.Replace(" ", string.Empty).Length == 5 && int.TryParse(args.Value, out n) && Int32.Parse(args.Value) > 0;
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (e.NewSelectedIndex != -1)
            {
                int Venueid = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);
                SqlDataSource2.SelectParameters["VenueID"].DefaultValue = Venueid.ToString();
                VenDetail.DataBind();
                Button1_ModalPopupExtender.Show();
            }
        }

    }
}