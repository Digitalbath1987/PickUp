using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp.Clientes
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Crear_Cliente_Click(object sender, EventArgs e)
        {

            try
            {


                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "INSERT INTO Cliente(Nombre_Cliente,Direccion_Cliente,Contacto_Cliente,Rut)VALUES('" + txt_Nombre.Text + "','" + txt_Direccion.Text +"','"+ txt_Telefono.Text +"','"+ txt_Rut_Conductor.Text  +"')";
                cmd.ExecuteNonQuery();
                Conn.Close();
                Response.Write("Registro Realizado Correctamente");
                gv_Cliente.DataBind();
            } catch {


                Response.Write("Error en la conecccion con la BD");


            }




            
        }
    }
}