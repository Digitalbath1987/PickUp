using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e){
           
        }

        protected void Btn_Salir_ServerClick(object sender, EventArgs e)
        {
       
            Response.Redirect("/PickUp/Default.aspx");
        }
    }
}