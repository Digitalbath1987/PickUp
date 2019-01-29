using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PickUp
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Reapeater_Conductores_ItemCommand(object source, RepeaterCommandEventArgs e)
        {



            string num = Convert.ToString(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PickUp.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            switch (e.CommandName)
            {
                case "Pendientes":

                    Listados.SelectCommand = "SELECT * FROM PickUp where Conductor_Asignado = '"+ num +"' and Status='PENDIENTE'";
                    Listados.DataBind();
                    GV_Pendientes_Asignadas.DataBind();


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


                    break;

            }




        }

        protected void Btn_Descargar_ServerClick(object sender, EventArgs e)
        {

            
            ExportToExcel("PickuP_Asignadas.xls", GV_Pendientes_Asignadas);





        }



        private void ExportToExcel(string nameReport, GridView wControl)
        {
            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Controls.Add(wControl);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }
    }
}