using Online_Ticket_System.CSharpCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Ticket_System.Display
{
    public partial class E_SubCat : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Request.Params["__EVENTTARGET"];
            if (!IsPostBack)
            {
                D_Binding();
            }
        }

        private void D_Binding()
        {
            //System.Collections.Specialized.NameValueCollection searchValue = Request.Form;
            //if (searchValue["ctl00$SearchBox"] != null)
            //{
            //    //value.Text = searchValue["ctl00$SearchBox"];
            //    value.Text = "Category: ";
            //    E_SubcatList.DataSource = Connection.GetSubCat();
            //    DropdownBinding();
            //    if (Connection.GetEbyServal(searchValue["ctl00$SearchBox"]) > 0)
            //    {
            //        UpcomeE.DataSource = Connection.UpcomeBySerVal(searchValue["ctl00$SearchBox"]);
            //        UpcomeE.DataBind();
            //    }
            //    else
            //    {
            //        ESubCat_Mes.Text = "0 results found for " + searchValue["ctl00$SearchBox"] + ". <br/>Event you may interest in:";
            //        UpcomeE.DataSource = Connection.SuggestEvent();
            //        UpcomeE.DataBind();
            //    }
            if (Request.QueryString["SerVal"] != null)
            {
                //value.Text = searchValue["ctl00$SearchBox"];
                value.Text = "Category: ";
                E_SubcatList.DataSource = Connection.GetSubCat();
                DropdownBinding();
                if (Connection.GetEbyServal(Request.QueryString["SerVal"]) > 0)
                {
                    UpcomeE.DataSource = Connection.UpcomeBySerVal(Request.QueryString["SerVal"]);
                    UpcomeE.DataBind();
                }
                else
                {
                    ESubCat_Mes.Text = "0 results found for " + Request.QueryString["SerVal"] + ". <br/>Event you may interest in:";
                    UpcomeE.DataSource = Connection.SuggestEvent();
                    UpcomeE.DataBind();
                }
            }
            else
            {
                if (Request.QueryString["Cat"] != null)
                {
                    if (Request.QueryString["Cat"] != "" && Request.QueryString["subcat"] == "")
                    {
                        string link = Request.Url.PathAndQuery;
                        value.Text = "Choose Category: ";
                        E_SubcatList.DataSource = Connection.GetSubCategoryBycat(Request.QueryString["Cat"].Replace('+', ' '));
                        DropdownBinding();
                        dt = Connection.UpcomeByCat(Request.QueryString["Cat"].Replace('+', ' '));
                        if (dt.Rows.Count > 0)
                        {
                            UpcomeE.DataSource = dt;
                            UpcomeE.DataBind();
                        }
                        else
                        {
                            ESubCat_Mes.Text = "Sorry, There is currently no event in this category.<br/>There are some events you may interest:";
                            E_SubcatList.DataSource = Connection.GetSubCat();
                            DropdownBinding();
                            UpcomeE.DataSource = Connection.SuggestEvent();
                            UpcomeE.DataBind();
                        }
                    }
                    else if (Request.QueryString["Cat"] != "" && Request.QueryString["subcat"] != "")
                    {
                        //HttpCookie link = Request.Cookies["URL"];

                        value.Text = "Choose Category: ";
                        E_SubcatList.DataSource = Connection.GetSubCategoryBycat(Request.QueryString["Cat"].Replace('+', ' '));
                        DropdownBinding();
                        E_SubcatList.SelectedValue = Request.QueryString["subcat"];
                        dt = Connection.UpcomeBySubCat(Request.QueryString["subcat"].Replace('+', ' '));
                        if (dt.Rows.Count > 0)
                        {
                            UpcomeE.DataSource = dt;
                            UpcomeE.DataBind();
                        }
                        else
                        {
                            ESubCat_Mes.Text = "Sorry, There is currently no event in this category.<br/>There are some events you may interest:";
                            UpcomeE.DataSource = Connection.SuggestEvent();
                            UpcomeE.DataBind();
                        }
                    }
                    else
                    {
                        value.Text = "Choose Category: ";
                        E_SubcatList.DataSource = Connection.GetSubCat();
                        DropdownBinding();
                        UpcomeE.DataSource = Connection.SuggestEvent();
                        UpcomeE.DataBind();
                    }
                }
                else
                {
                    value.Text = "Choose Category: ";
                    E_SubcatList.DataSource = Connection.GetSubCat();
                    DropdownBinding();
                    UpcomeE.DataSource = Connection.SuggestEvent();
                    UpcomeE.DataBind();
                }
            }
        }
        private void DropdownBinding()
        {
            E_SubcatList.DataBind();
            E_SubcatList.DataTextField = "subcat";
            E_SubcatList.DataValueField = "subcat";
            E_SubcatList.DataBind();
        }
        //private void BindingSucCatList()
        //{

        //}

        protected void E_SubcatList_SelectedIndexChanged(object sender, EventArgs e)
        {
            dt = Connection.UpcomeBySubCat(E_SubcatList.SelectedValue);
            if (dt.Rows.Count > 0)
            {
                ESubCat_Mes.Text = "";
                ESubCat_Mes.Visible = false;
                UpcomeE.DataSource = dt;
                UpcomeE.DataBind();
            }
            else
            {
                ESubCat_Mes.Visible = true;
                ESubCat_Mes.Text = "Sorry, There is currently no event in this category.<br/>There are some events you may interest:";
                UpcomeE.DataSource = Connection.Upcome_Event();
                UpcomeE.DataBind();
            }
        }
    }
}