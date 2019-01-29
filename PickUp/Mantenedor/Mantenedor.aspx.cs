using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp.Mantenedor
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Buscar_ServerClick(object sender, EventArgs e){
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            try {

                                    Conn.Open();
                                    cmd.Connection = Conn;
                                    cmd.CommandText = "SELECT * FROM PickUp where  Correlativo_PickUp = '"+ txt_Buscar.Text +"'";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    if (dr.HasRows){
                                                   txt_Cliente.Text = dr["Nombre_Cliente"].ToString();
                                                   txt_Direccion.Text = dr["Direccion"].ToString();
                                                   txt_Contacto.Text = dr["Contacto"].ToString();
                                                   txt_Detalle.Text = dr["Comentario_PickUp"].ToString();
                                                   txt_Conductor.Text = dr["Conductor_Asignado"].ToString();
                                                   txt_Inicio.Text = dr["Hora_Pu_Ini"].ToString();
                                                   txt_Fin.Text = dr["Hora_Peu_Fin"].ToString();
                                                   DDL_Estado.SelectedValue = dr["Status"].ToString();
                                                btn_Modificar.Visible = true;
                                                btn_Eliminar.Visible = true;
                                                btn_Update.Visible = false;
                                    } else{
                                    Response.Write("No Registra Datos");
                                                    txt_Cliente.Text = "";
                                                    txt_Direccion.Text = "";
                                                    txt_Contacto.Text = "";
                                                    txt_Detalle.Text = "";
                                                    txt_Conductor.Text = "";
                                                    txt_Inicio.Text = "";
                                                    txt_Fin.Text = "";
                 
                                    }
                                    Conn.Close();
            } catch {
                Response.Write("Error al conectar Con la BD ");
            }


        }

        protected void btn_Modificar_ServerClick(object sender, EventArgs e)
        {
             btn_Modificar.Visible = false;
            btn_Eliminar.Visible = false;
            btn_Update.Visible = true;
            txt_Cliente.Enabled = true;
            txt_Direccion.Enabled = true;
            txt_Contacto.Enabled = true;
            txt_Detalle.Enabled = true;
            txt_Conductor.Enabled = true;
            txt_Inicio.Enabled = true;
            txt_Fin.Enabled = true;
            DDL_Estado.Enabled = true;

        }

        protected void btn_Eliminar_ServerClick(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();


            try
            {
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM PickUp   WHERE Correlativo_PickUp = '"+ txt_Buscar.Text  +"'";
                cmd.ExecuteNonQuery();
                Conn.Close();


                Response.Write("Registro Eliminado Correctamete ");
                txt_Cliente.Text = "";
                txt_Direccion.Text = "";
                txt_Contacto.Text = "";
                txt_Detalle.Text = "";
                txt_Conductor.Text = "";
                txt_Inicio.Text = "";
                txt_Fin.Text = "";
                btn_Modificar.Visible = false;
                btn_Eliminar.Visible = false;

            }
            catch
            {

                Response.Write("Error En la Consulta a la BD");
                txt_Cliente.Text = "";
                txt_Direccion.Text = "";
                txt_Contacto.Text = "";
                txt_Detalle.Text = "";
                txt_Conductor.Text = "";
                txt_Inicio.Text = "";
                txt_Fin.Text = "";

                btn_Modificar.Visible = false;
                btn_Eliminar.Visible = false;

            }







        }

        protected void btn_Update_ServerClick(object sender, EventArgs e)
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();


            try
            {
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE PickUp SET Nombre_Cliente = '" + txt_Cliente.Text + "',Direccion = '" + txt_Direccion.Text + "',Contacto = '" + txt_Contacto.Text + "',Hora_Pu_Ini = '" + txt_Inicio.Text + "',Hora_Peu_Fin = '" + txt_Fin.Text + "',Status = '" + DDL_Estado.SelectedValue + "',Conductor_Asignado = '" + txt_Conductor.Text + "',Comentario_PickUp = '" + txt_Detalle.Text + "'  WHERE Correlativo_PickUp = '" + txt_Buscar.Text + "'";
                cmd.ExecuteNonQuery();
                Conn.Close();
                Response.Write("Registro Actualizado Correctamete ");
                txt_Cliente.Text = "";
                txt_Direccion.Text = "";
                txt_Contacto.Text = "";
                txt_Detalle.Text = "";
                txt_Conductor.Text = "";
                txt_Inicio.Text = "";
                txt_Fin.Text = "";
                btn_Modificar.Visible = false;
                btn_Eliminar.Visible = false;
                btn_Update.Visible = false;
                txt_Cliente.Enabled = false;
                txt_Direccion.Enabled = false;
                txt_Contacto.Enabled = false;

                txt_Conductor.Enabled = false;
                txt_Inicio.Enabled = false;
                txt_Fin.Enabled = false;
                DDL_Estado.Enabled = false;

            }
            catch
            {

                Response.Write("Error En la Consulta a la BD");
                txt_Cliente.Text = "";
                txt_Direccion.Text = "";
                txt_Contacto.Text = "";
                txt_Detalle.Text = "";
                txt_Conductor.Text = "";
                txt_Inicio.Text = "";
                txt_Fin.Text = "";
                btn_Modificar.Visible = false;
                btn_Eliminar.Visible = false;

            }



        }
    }
}