//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace API_PickUp
{
    using System;
    using System.Collections.Generic;
    
    public partial class PickUp
    {
        public int ID_PickUp { get; set; }
        public Nullable<int> Correlativo_PickUp { get; set; }
        public string Nombre_Cliente { get; set; }
        public string Direccion { get; set; }
        public string Contacto { get; set; }
        public Nullable<int> Hora_Pu_Ini { get; set; }
        public Nullable<int> Hora_Peu_Fin { get; set; }
        public string Status { get; set; }
        public string Conductor_Asignado { get; set; }
        public string Comentario_PickUp { get; set; }
        public Nullable<System.DateTime> Fecha_Registro { get; set; }
        public Nullable<System.DateTime> Fecha_Finalizacion { get; set; }
        public Nullable<int> Estado_Correlativo { get; set; }
        public string User_Correlativo { get; set; }
    }
}