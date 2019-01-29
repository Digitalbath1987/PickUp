using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;





namespace PickUp.Pick_Up
{
    public partial class Registrar_PickUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);//esto ejecuta el script que abre el modal nuevamente
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
           if (e.CommandName == "select")
            {
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT Id_Cliente,Nombre_Cliente,Direccion_Cliente,Contacto_Cliente FROM Cliente where Id_Cliente= '"+ num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                txt_Cliente.Text  = dr["Nombre_Cliente"].ToString();
                txt_Direccion.Text =  dr["Direccion_Cliente"].ToString();
                txt_Contacto.Text =  dr["Contacto_Cliente"].ToString();
                Conn.Close();
            }
        }

        protected void btn_save_ServerClick(object sender, EventArgs e)
        {

            try
            {
               
                Buscar_Asignado();
                string cont = Session["contador"].ToString();
               
                if (cont != "0")
                {

                    Registrar();

                }
                else{
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT TOP 1 Correlativo_PickUp as contador FROM PickUp order by Correlativo_PickUp desc";
                dr = cmd.ExecuteReader();
                dr.Read();
                int contador = int.Parse(dr["contador"].ToString()) + 1;
                Session["contador"] = contador.ToString();
                asignarnumero();
                Conn.Close();

                    Registrar();

                }


              }
            catch (InvalidCastException){

                Registro_OK.Visible = false;
                registro_NOOK.Visible = true;

            }
            
        }

        protected void rptPickUp_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            switch (e.CommandName){
               case "Finalizar":
                            try
                            {                
                                Conn.Open();
                                cmd.Connection = Conn;
                                cmd.CommandText = "UPDATE PickUp SET Status = 'FINALIZADO',Fecha_Finalizacion = GETDATE() WHERE Correlativo_PickUp='" + num + "'";
                                cmd.ExecuteNonQuery();
                                Conn.Close();
                                rptPickUp.DataBind();
                                RPT_Finalizados.DataBind();
                                RPTCANCELADAS.DataBind();
                                Registro_OK.Visible = true;
                                registro_NOOK.Visible = false;
                            }catch (InvalidCastException){
                                registro_NOOK.Visible = true;
                                Registro_OK.Visible = false;
                            }

                    break;

                case "Cancelar":
                            try
                            {
                                Conn.Open();
                                cmd.Connection = Conn;
                                cmd.CommandText = "UPDATE PickUp SET Status = 'CANCELADA',Fecha_Finalizacion = GETDATE() WHERE Correlativo_PickUp='" + num + "'";
                                cmd.ExecuteNonQuery();
                                Conn.Close();
                                rptPickUp.DataBind();
                                RPT_Finalizados.DataBind();
                                RPTCANCELADAS.DataBind();
                                Registro_OK.Visible = true;
                                registro_NOOK.Visible = false;
                            }
                            catch (InvalidCastException)
                            {
                                registro_NOOK.Visible = true;
                                Registro_OK.Visible = false;
                            }

                break;
                case "MensajeMail":
                              string Val = Enviar_Mail(num);
                              if (Val== "Enviado"){
                              Registro_OK.Visible = true;
                              registro_NOOK.Visible = false;
                              }else{
                              Registro_OK.Visible = false;
                              registro_NOOK.Visible = true;
                              }
                break;
            }
        }
        
        public void asignarnumero()//asigna numero si no tengo ninguno pendiente 
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "INSERT INTO PickUp (Correlativo_PickUp,Nombre_Cliente,Direccion,Contacto,Hora_Pu_Ini,Hora_Peu_Fin,Status,Conductor_Asignado,Comentario_PickUp,Fecha_Registro,Fecha_Finalizacion,Estado_Correlativo,User_Correlativo) VALUES('" + Session["contador"] + "','','','','','','','','','','','1','" + Session["Usuario"] + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
        }

        public void Buscar_Asignado() // busca si hay alguno asignado con mi usuario y me asigna el mismo 
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Correlativo_PickUp FROM PickUp where User_Correlativo ='" + Session["Usuario"] + "' and Estado_Correlativo = '1'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                Session["contador"] = dr["Correlativo_PickUp"].ToString();
            }
            else
            {
                Session["contador"] = "0";
            }
            Conn.Close();
        }

        public void Registrar()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE PickUp SET  Nombre_Cliente = '" + txt_Cliente.Text + "',Direccion = '" + txt_Direccion.Text + "',Contacto = '" + txt_Contacto.Text + "',Hora_Pu_Ini = '" + ddl_Inicio.SelectedValue + "',Hora_Peu_Fin = '" + ddl_Fin.SelectedValue + "',Status = 'PENDIENTE',Conductor_Asignado = '"+  ddl_Conductor.SelectedValue +"',Comentario_PickUp = '"+  txt_Comentarios.Text +"',Fecha_Registro = getdate(),Fecha_Finalizacion = '',Estado_Correlativo = '2' WHERE Correlativo_PickUp = '"+ Session["contador"] + "'";
            cmd.ExecuteNonQuery();
            Conn.Close();
            rptPickUp.DataBind();
            Registro_OK.Visible = true;
            registro_NOOK.Visible = false;
            RPT_Finalizados.DataBind();
            RPTCANCELADAS.DataBind();
        }

        public string Enviar_Mail(string num) {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT PickUp.ID_PickUp,PickUp.Correlativo_PickUp,PickUp.Nombre_Cliente,PickUp.Direccion,PickUp.Status,PickUp.Contacto,PickUp.Hora_Pu_Ini,PickUp.Hora_Peu_Fin,PickUp.Conductor_Asignado,PickUp.Comentario_PickUp,PickUp.Fecha_Registro,PickUp.User_Correlativo,Conductor.Email_Conductor  FROM PickUp , Conductor Where Conductor.Nombre_Conductor = PickUp.Conductor_Asignado and Correlativo_PickUp='" + num + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("admin@worldtransport.cl", "Mario Rosales", Encoding.UTF8);
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            mail.Subject = "Pick Up N°:" + num + " // Fecha de Registro: " + dr["Fecha_Registro"].ToString() + " // Estado : "+ dr["Status"].ToString() + "";
            mail.Body = ("<table style='background-color:lightblue '><tr><th style='border-bottom-style: solid;border-bottom-width: 2px;' colspan='2'> <strong><h2>Detalle Pick Up<h2/>  </strong></th></tr> <tr><td><strong>Numero Pick UP:  </strong> </td><td>" + dr["Correlativo_PickUp"].ToString() + "</td></tr><tr><td><strong>Fecha de Registro:  </strong></td><td>" + dr["Fecha_Registro"].ToString() + "</td></tr><tr><td><strong>Usuario solicitante :  </strong></td><td>" + dr["User_Correlativo"].ToString() + "</td></tr><tr><td><strong>Nombre Cliente :  </strong></td><td>" + dr["Nombre_Cliente"].ToString() + "</td></tr><tr><td><strong>Direccion Cliente :  </strong></td><td>" + dr["Direccion"].ToString() + "</td></tr><tr><td><strong>Contacto Cliente :  </strong></td><td>" + dr["Contacto"].ToString() + "</td></tr><tr><td colspan='2'><strong>Hora de inicio PU Desde:  </strong> " + dr["Hora_Pu_Ini"].ToString() + " <strong>Hasta:</strong>  " + dr["Hora_Peu_Fin"].ToString() + "</td></tr><tr><td><strong> Conductor Asignado : </strong></td><td>" + dr["Conductor_Asignado"].ToString() + "</td></tr><tr><td><strong> Detalle:</strong></td><td>" + dr["Comentario_PickUp"].ToString() + "</td></tr></table><br/><br/><strong>Este Mensaje Fue enviado Automaticamente desde el sistema de PickUp de WTcourier<br/>© Copyright World Transport Courier Ltda. All Rights Reserved 2018.<br/>http://www.wtcourier.cl</strong><br/><img src='http://164.77.113.94/wtcourier/img/Logo%20Head.png' alt='Trulli' width='300' height='120'> ");
            mail.To.Add(""+ dr["Email_Conductor"].ToString() + "");
            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("admin@worldtransport.cl", "nomeacuerdo..");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            Conn.Close();
            string mensaje = "Enviado";
            return mensaje;
            
        }

        protected void RPT_Finalizados_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            switch (e.CommandName)
            {
            case "MensajeMail":
                    string Val = Enviar_Mail(num);
                    if (Val == "Enviado")
                    {
                        Registro_OK.Visible = true;
                        registro_NOOK.Visible = false;
                    }
                    else
                    {
                        Registro_OK.Visible = false;
                        registro_NOOK.Visible = true;
                    }
            break;
            }




        }

        protected void RPTCANCELADAS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            switch (e.CommandName)
            {
                case "MensajeMail":
                    string Val = Enviar_Mail(num);
                    if (Val == "Enviado")
                    {
                        Registro_OK.Visible = true;
                        registro_NOOK.Visible = false;
                    }
                    else
                    {
                        Registro_OK.Visible = false;
                        registro_NOOK.Visible = true;
                    }
                    break;
            }

        }

      
    }
}


