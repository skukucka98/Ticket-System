using Online_Ticket_System.CSharpCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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

        protected void Page_Prerender(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                Vdetail.Visible = false;
            }
            else
            {
                Vdetail.Visible = true;
            }


        }

        protected void AddSeat_Click(object sender, EventArgs e)
        {
            int n;
            if (!int.TryParse(txtSeatSection.Text, out n))
            {
                lbSeatOutput.Text = "Invalid Section Number.";
            }
            else if (!int.TryParse(txtTotalSeat.Text, out n))
            {
                lbSeatOutput.Text = "Invalid total seat.";
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
            if (Session["Mytable"] == null)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The Venue do not contain any section. Please add section and try it again.')", true);
            }
            else
            {
                mytable = (DataTable)Session["Mytable"];
                int n;

                if (!Regex.IsMatch(txtCity.Text, @"^[a-zA-Z]+$"))
                {
                    venueOutput.Text = "Invalid City.";
                    venueOutput.Visible = true;
                    venueOutput.ForeColor = Color.Red;
                    vengrid.Visible = true;
                }
                else if (txtZip.Text.Replace(" ", string.Empty).Length != 5 || !int.TryParse(txtZip.Text, out n))
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


                        Venue venue = new Venue(name, address1, address2, city, state, zipcode, description);
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
            venueOutput.Visible = false;
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

    }
}