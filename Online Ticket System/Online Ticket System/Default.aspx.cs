using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections;
using Online_Ticket_System.CSharpCode;
using System.Text;
using System.Globalization;

namespace Online_Ticket_System.Display
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {  
                GetImages();
            }
        }
        public void GetImages()
        {
            List<Event> events = Connection.GetUpcomingEvent().Cast<Event>().ToList();
            StringBuilder sb = new StringBuilder();
            for(int i=0; i<events.Count; i++)
            {
                if (i == 0)
                {
                    sb.Append(string.Format(@"<div class='active'><a href='../Display/E_detail.aspx?ID={1}'><img src='{0}'  Height='300' Width='600'/></a></div>", events[i].Picture,events[i].ID));
                    sb.Append(Environment.NewLine);
                }
                else
                {
                    sb.Append(string.Format(@"<div><a href='../Display/E_detail.aspx?ID={1}'><img src='{0}'Height='300' Width='600'/></a></div>", events[i].Picture, events[i].ID));
                    sb.Append(Environment.NewLine);
                }
            }
            pict.Text = sb.ToString();
        }

        
    }
}