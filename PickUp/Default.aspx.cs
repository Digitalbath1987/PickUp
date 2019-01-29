using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();

        
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Usuario,Contraseña,Email,Telefono  FROM Usuario where Usuario ='"+ txt_Usuario.Text + "' and Contraseña='"+ txt_Password.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
              Session["Usuario"] = dr["Usuario"].ToString();
              Response.Redirect("/PickUp/Home.aspx");
            }
            else
            {
              Response.Write("Contraseña Erronea");
            }
            Conn.Close();

        }
    }
}