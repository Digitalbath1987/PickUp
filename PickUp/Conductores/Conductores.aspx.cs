using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp.Conductores
{
    public partial class Conductores : System.Web.UI.Page
    {
                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected void Btn_Crear_Driver_ServerClick(object sender, EventArgs e)
                {
                            try{
                                    SqlConnection Conn = new SqlConnection();
                                    Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                                    SqlCommand cmd = new SqlCommand();
                                    Conn.Open();
                                    cmd.Connection = Conn;
                                    cmd.CommandText = "INSERT INTO Conductor(Rut_Conductor,Nombre_Conductor,Email_Conductor,Telefono_Conductor,Patente_Conductor)  VALUES ('"+ txt_Rut_Conductor.Text +"','"+ txt_Nombre_Conductor.Text +"','"+ txt_Email_Conductor.Text +"','"+ txt_Telefono_Conductor.Text +"','"+ txt_Vehiculo.Text +"')";
                                    cmd.ExecuteNonQuery();
                                    Conn.Close();
                                    ok.Visible = true;
                                    NOok.Visible = false;
                                    gvConductores.DataBind();
                                    txt_Email_Conductor.Text = "";
                                    txt_Nombre_Conductor.Text = "";
                                    txt_Rut_Conductor.Text = "";
                                    txt_Telefono_Conductor.Text = "";
                                    txt_Vehiculo.Text = "";

                            }
                            catch (Exception ex){
                                    NOok.Visible = true;
                                    ok.Visible = false;
                            }


                }

        protected void gvConductores_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            if (e.CommandName == "Eliminar")
            {
                try
                {

                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM Conductor WHERE Rut_Conductor='" + num + "'";
                    cmd.ExecuteNonQuery();
                    Conn.Close();
                    gvConductores.DataBind();
                    Response.Write("Usuario Eliminado Correctamente");
                    Conn.Close();
                }catch (Exception ex){
                    Response.Write("Error al eliminar el registro , Actualice la pagina y vuelva a intentarlo");
                    Conn.Close();
                }
            }else if (e.CommandName == "Editar"){
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT * FROM Conductor WHERE Rut_Conductor='" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();


                txt_Nombre_Conductor.Text = dr["Nombre_Conductor"].ToString();
                txt_Rut_Conductor.Text = dr["Rut_Conductor"].ToString();
                txt_Email_Conductor.Text = dr["Email_Conductor"].ToString();
                txt_Telefono_Conductor.Text = dr["Telefono_Conductor"].ToString();
                txt_Vehiculo.Text = dr["Patente_Conductor"].ToString();

                gvConductores.DataBind();

                Conn.Close();
                Btn_Crear_Driver.Visible = false;
                btn_Update_Driver.Visible = true;
                btn_Cancel_Driver.Visible = true;
                txt_Rut_Conductor.Enabled = false;



            }



        }

        protected void btn_Update_Driver_ServerClick(object sender, EventArgs e)
        {

            try
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "";
                cmd.ExecuteNonQuery();
                Conn.Close();
                ok.Visible = true;
                NOok.Visible = false;

                btn_Cancel_Driver.Visible = false;
                btn_Update_Driver.Visible = false;
                Btn_Crear_Driver.Visible = true;
                txt_Rut_Conductor.Enabled = true;
                txt_Email_Conductor.Text = "";
                txt_Nombre_Conductor.Text = "";
                txt_Rut_Conductor.Text = "";
                txt_Telefono_Conductor.Text = "";
                txt_Vehiculo.Text = "";
            }
            catch (Exception ex)
            {
                NOok.Visible = true;
                ok.Visible = false;
            }
        }

        protected void btn_Cancel_Driver_ServerClick(object sender, EventArgs e) {
            btn_Cancel_Driver.Visible = false;
            btn_Update_Driver.Visible = false;
            Btn_Crear_Driver.Visible = true;
            txt_Rut_Conductor.Enabled = true;
            txt_Email_Conductor.Text = "";
            txt_Nombre_Conductor.Text = "";
            txt_Rut_Conductor.Text = "";
            txt_Telefono_Conductor.Text = "";
            txt_Vehiculo.Text = "";

        }

        protected void btn_Asignar_ServerClick(object sender, EventArgs e) {

            try
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE Conductor  SET Zona_Asignada = '"+ txt_Zona_Asignar.Text + "' WHERE Rut_Conductor='"+ ddl_Conductores.SelectedValue + "'";
                cmd.ExecuteNonQuery();
                Conn.Close();
                //mensaje de que se asigno ok 
                // podria enviarse un mensaje al conductor indicandole la zona que se le asigno 
                gvConductores.DataBind();

            }
            catch (Exception ex)
            {
          //mensaje de no asignacion
            }
        }
    }
}