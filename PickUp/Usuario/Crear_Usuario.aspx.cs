using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PickUp.Usuario
{
    public partial class Crear_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Crear_User_ServerClick(object sender, EventArgs e)
        {


                        try
                        {

                            SqlConnection Conn = new SqlConnection();
                            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                            SqlCommand cmd = new SqlCommand();
                            Conn.Open();
                            cmd.Connection = Conn;
                            cmd.CommandText = "INSERT INTO Usuario  (Rut_Usuario,Nombre_Usuario,Usuario,Contraseña,Email,Telefono,Eliminar,Modificar,Crear) VALUES ('"+ txt_Rut.Text +"','"+ txt_Nombre.Text +"','"+ txt_User.Text +"','"+ txt_Password.Text +"','"+ txt_Email.Text +"','"+ txt_Telefono.Text +"','"+ rbl_Eliminar.SelectedValue +"','"+ rbl_Modificar.SelectedValue +"','"+ rbl_Crear.SelectedValue +"')";
                            cmd.ExecuteNonQuery();
                            Conn.Close();
                            gv_Usuarios.DataBind();
                            ok.Visible = true;
                            NOok.Visible = false;

                txt_Email.Text = "";
                txt_Nombre.Text = "";
                txt_Password.Text = "";
                txt_Rut.Text = "";
                txt_Telefono.Text = "";
                txt_User.Text = "";



                      }catch (Exception ex) {

                NOok.Visible = true;
                ok.Visible = false;



                            

                        }



        }

        protected void gv_Usuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            if (e.CommandName == "Eliminar")
            {
               try{
                 
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM Usuario  WHERE Rut_Usuario='"+ num + "'";
                    cmd.ExecuteNonQuery();
                    Conn.Close();
                    gv_Usuarios.DataBind();
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
                cmd.CommandText = "SELECT * FROM Usuario  WHERE Rut_Usuario='" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();

                txt_Nombre.Text = dr["Nombre_Usuario"].ToString();
                txt_Email.Text = dr["Email"].ToString();
                txt_Password.Text = dr["Contraseña"].ToString();
                txt_Rut.Text = dr["Rut_Usuario"].ToString();
                txt_User.Text = dr["Usuario"].ToString();
                txt_Telefono.Text = dr["Telefono"].ToString();
                rbl_Crear.SelectedValue = dr["Crear"].ToString();
                rbl_Eliminar.SelectedValue = dr["Eliminar"].ToString();
                rbl_Modificar.SelectedValue = dr["Modificar"].ToString();
                Conn.Close();
                Btn_Crear_User.Visible = false;
                btn_Update_User.Visible = true;
                btn_Cancel_User.Visible = true;
                txt_Rut.Enabled = false;

            }


        }

        protected void btn_Update_User_ServerClick(object sender, EventArgs e)
        {


            try
            {

              SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE Usuario  SET Nombre_Usuario = '" + txt_Nombre.Text +"',Usuario = '"+ txt_User.Text +"',Contraseña = '"+ txt_Password.Text +"',Email = '"+ txt_Email.Text +"',Telefono = '"+ txt_Telefono.Text +"',Eliminar = '"+ rbl_Eliminar.SelectedValue +"',Modificar = '"+ rbl_Modificar.SelectedValue +"',Crear = '"+ rbl_Crear.SelectedValue +"' WHERE Rut_Usuario='"+ txt_Rut.Text +"' ";
            cmd.ExecuteNonQuery();
            Conn.Close();
            ok.Visible = true;
            NOok.Visible = false;

             btn_Cancel_User.Visible = false;
             btn_Update_User.Visible = false;
             Btn_Crear_User.Visible = true;
             txt_Rut.Enabled = true;
            }
            catch (Exception ex){
            NOok.Visible = true;
            ok.Visible = false;
            }
           

        }

        protected void btn_Cancel_User_ServerClick(object sender, EventArgs e)
        {
            btn_Cancel_User.Visible = false;
            btn_Update_User.Visible = false;
            Btn_Crear_User.Visible = true;
            txt_Rut.Enabled = true;
            txt_Email.Text = "";
            txt_Nombre.Text = "";
            txt_Password.Text = "";
            txt_Rut.Text = "";
            txt_Telefono.Text = "";
            txt_User.Text = "";

        }
    }
}