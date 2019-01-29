<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="PickUp.Mantenedor.Mantenedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">


<div class="container text-center">
<h2> <p class="bg-light text-dark">Mantenedor de Registros</p></h2>
<hr align="center" noshade="noshade" size="2" width="100%" />
</div>

<form id="report" runat="server">

<div class="container">
<div class="row">
<div class="col-sm-2">
<div class="row">
<div class="col-sm-12">
<div class="input-group mb-3">
<asp:TextBox ID="txt_Buscar" CssClass="form-control" ToolTip="Numero de PickUp a Buscar" AutoCompleteType="Search" runat="server"></asp:TextBox>
<div class="input-group-append">
<button type="button" runat="server" id="btn_Buscar" class="btn btn-warning" onserverclick="btn_Buscar_ServerClick">Buscar</button>
</div>
</div>
</div>
</div>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-2">
        <div class="row">
                <div class="col-sm-6">
                        <button type="button" runat="server" id="btn_Modificar" onserverclick="btn_Modificar_ServerClick" visible="false" class="btn btn-success">Modificar</button>
                </div>
                <div class="col-sm-6">
                        <button type="button" runat="server" id="btn_Eliminar" onserverclick="btn_Eliminar_ServerClick" visible="false" class="btn btn-danger">Eliminar</button>
                </div>
        </div>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-2"></div>
<div class="col-sm-2"></div>
</div>
 </div>

<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">


<div class="row"><div class="col-sm-12">
<div class="input-group mb-3 input-group-sm">
<div class="input-group-prepend">
<span class="input-group-text bg-primary text-white">Cliente   </span>
</div>
<asp:TextBox ID="txt_Cliente" class="form-control" Enabled="false" runat="server"></asp:TextBox>
</div>
</div></div>

   
<div class="row"> <div class="col-sm-12">
<div class="input-group mb-3 input-group-sm">
        <div class="input-group-prepend">
        <span class="input-group-text bg-primary text-white">Direccion</span>
        </div>
        <asp:TextBox ID="txt_Direccion" Enabled="false" class="form-control" runat="server"></asp:TextBox>
        </div>
</div></div>


<div class="row">  
<div class="col-sm-6">
<div class="input-group mb-3 input-group-sm">
        <div class="input-group-prepend">
        <span class="input-group-text bg-primary text-white">Contacto</span>
        </div>
        <asp:TextBox ID="txt_Contacto"  Enabled="false" class="form-control" runat="server"></asp:TextBox>
        </div>
</div>
<div class="col-sm-6">
<div class="input-group mb-3 input-group-sm">
        <div class="input-group-prepend">
        <span class="input-group-text bg-primary text-white">Estado</span>
        </div>
           <asp:DropDownList ID="DDL_Estado" Enabled="false"  class="form-control" runat="server">
               <asp:ListItem>FINALIZADO</asp:ListItem>
               <asp:ListItem>CANCELADA</asp:ListItem>
               <asp:ListItem>PENDIENTE</asp:ListItem>
           </asp:DropDownList>
        </div>
</div>

</div>


<div class="row">    
<div class="col-sm-6">
<div class="input-group mb-3 input-group-sm ">
<div class="input-group-prepend ">
<span class="input-group-text bg-primary text-white">Hora de PU</span>
</div>
<asp:TextBox ID="txt_Inicio" Enabled="false"  class="form-control" runat="server"></asp:TextBox>
<asp:TextBox ID="txt_Fin" Enabled="false"  class="form-control" runat="server"></asp:TextBox>
</div>
</div>
<div class="col-sm-6">
<div class="input-group mb-3 input-group-sm">
<div class="input-group-prepend">
<span class="input-group-text bg-primary text-white">Conductor</span>
</div>
<asp:TextBox ID="txt_Conductor" Enabled="false"  class="form-control" runat="server"></asp:TextBox>
</div>
</div>
</div>

<div class="row">
<div class="col-sm-12">
<span class="input-group-text bg-primary text-white">Detalle</span>
<asp:TextBox ID="txt_Detalle"   TextMode="MultiLine" Rows="5" class="form-control" runat="server"></asp:TextBox>
</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="container text-center" > 
<button type="button" runat="server" onserverclick="btn_Update_ServerClick" visible="false" id="btn_Update" class="btn btn-danger">Grabar</button>
</div>
</div>
</div>        


</div>

</div>
</div>
</div>

</form>
</asp:Content>
