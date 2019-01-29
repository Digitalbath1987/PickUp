<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registrar_PickUp.aspx.cs" Inherits="PickUp.Pick_Up.Registrar_PickUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    



    <script type="text/javascript">
        function ShowPopup() {
            $("#btnPickUp").click();
        }
    </script>  

        <style type="text/css">

    
        .scrolling-table-container {
    height: 450px;
    overflow-y: scroll;
    overflow-x: hidden;
}




    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">
    <div runat="server"  id="Registro_OK" visible="false" class="alert alert-success alert-dismissible fade show">
 <button type="button" class="close" data-dismiss="alert">&times;</button>
 <strong>Solicitud Realizada Correctamente!</strong> Se ha enviado un mensaje Informando al conductor designado!.
 </div>

<div runat="server" id="registro_NOOK" visible="false" class="alert alert-info alert-dismissible fade show">
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong>Info!</strong> This alert box could indicate a neutral informative change or action.
</div>

<form runat="server">
<div class="container">
<div class="card">
<div class="card-body bg-primary text-white">
<button type="button" id="btnPickUp" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
 Nuevo PickUp  <i class="fas fa-plus-circle"></i>
</button>



</div>
</div>
</div>
<div class="container">
<!-- The Modal -->
<div class="modal fade" id="myModal">
<div class="modal-dialog modal-lg">
<div class="modal-content">
<!-- Modal Header -->
<div class="modal-header bg-light">
<h4 class="modal-title">Registrar Pick Up  <i class="fas fa-truck"></i></h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
       
<div class="modal-body">
<div class="form-group">
<label for="usr"> <strong>Nombre del cliente: <asp:RequiredFieldValidator ID="RFV_Cliente"  ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txt_Cliente" ValidationGroup="Pick_Up">*</asp:RequiredFieldValidator></strong></label>
<div class="input-group mb-3">
<asp:TextBox ID="txt_Cliente" CssClass="form-control" runat="server"></asp:TextBox>

<div class="input-group-append">
<button type="button" class="btn" data-toggle="modal" data-target="#ModalAgregarNombre" ><i class="fas fa-search-plus"></i></button>
</div>
</div>
</div>
             
<div class="form-group">
<label for="usr"><strong>Direccion : <asp:RequiredFieldValidator ID="RFV_Direccion" runat="server"  ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Direccion" ValidationGroup="Pick_Up">*</asp:RequiredFieldValidator></strong></label>
<div class="input-group mb-3">
<asp:TextBox ID="txt_Direccion"  CssClass="form-control" runat="server" ></asp:TextBox>
    
</div>
</div>

<div class="form-group">
<label for="usr"><strong>Contacto :   <asp:RequiredFieldValidator ID="RFV_Contacto" runat="server" ErrorMessage="*" ControlToValidate="txt_Contacto" ValidationGroup="Pick_Up" ForeColor="Red">*</asp:RequiredFieldValidator> </strong></label>
<div class="input-group mb-3">
<asp:TextBox ID="txt_Contacto" CssClass="form-control" runat="server" ></asp:TextBox>

</div>
</div>

<div class="form-group">
<label for="usr"><strong>Conductor : </strong></label>
<div class="input-group mb-3">
    <asp:DropDownList ID="ddl_Conductor" runat="server" CssClass="form-control" DataSourceID="Conductores" DataTextField="Nombre_Conductor" DataValueField="Nombre_Conductor"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="Conductores" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT [Nombre_Conductor] FROM [Conductor] ORDER BY [Nombre_Conductor]"></asp:SqlDataSource>
</div>
</div>
    
<div class="form-group">
<label for="usr"><strong>Hora de Inicio PU : </strong></label>
<div class="input-group mb-3">
<strong>Desde </strong> <asp:DropDownList CssClass="form-control" ID="ddl_Inicio" runat="server">
<asp:ListItem Value="00:00">00:00</asp:ListItem>
<asp:ListItem Value="01:00">01:00</asp:ListItem>
<asp:ListItem Value="02:00">02:00</asp:ListItem>
<asp:ListItem Value="03:00">03:00</asp:ListItem>
<asp:ListItem Value="04:00">04:00</asp:ListItem>
<asp:ListItem Value="05:00">05:00</asp:ListItem>
<asp:ListItem Value="06:00">06:00</asp:ListItem>
<asp:ListItem Value="07:00">07:00</asp:ListItem>
<asp:ListItem Value="08:00">08:00</asp:ListItem>
<asp:ListItem Value="09:00">09:00</asp:ListItem>
<asp:ListItem Value="10:00">10:00</asp:ListItem>
<asp:ListItem Value="11:00">11:00</asp:ListItem>
<asp:ListItem Value="12:00">12:00</asp:ListItem>
<asp:ListItem Value="13:00">13:00</asp:ListItem>
<asp:ListItem Value="14:00">14:00</asp:ListItem>
<asp:ListItem Value="15:00">15:00</asp:ListItem>
<asp:ListItem Value="16:00">16:00</asp:ListItem>
<asp:ListItem Value="17:00">17:00</asp:ListItem>
<asp:ListItem Value="18:00">18:00</asp:ListItem>
<asp:ListItem Value="19:00">19:00</asp:ListItem>
<asp:ListItem Value="20:00">20:00</asp:ListItem>
<asp:ListItem Value="21:00">21:00</asp:ListItem>
<asp:ListItem Value="22:00">22:00</asp:ListItem>
<asp:ListItem Value="23:00">23:00</asp:ListItem>
</asp:DropDownList> <strong>   Hasta :  </strong> <asp:DropDownList CssClass="form-control small"  ID="ddl_Fin" runat="server">
<asp:ListItem Value="00:00">00:00</asp:ListItem>
<asp:ListItem Value="01:00">01:00</asp:ListItem>
<asp:ListItem Value="02:00">02:00</asp:ListItem>
<asp:ListItem Value="03:00">03:00</asp:ListItem>
<asp:ListItem Value="04:00">04:00</asp:ListItem>
<asp:ListItem Value="05:00">05:00</asp:ListItem>
<asp:ListItem Value="06:00">06:00</asp:ListItem>
<asp:ListItem Value="07:00">07:00</asp:ListItem>
<asp:ListItem Value="08:00">08:00</asp:ListItem>
<asp:ListItem Value="09:00">09:00</asp:ListItem>
<asp:ListItem Value="10:00">10:00</asp:ListItem>
<asp:ListItem Value="11:00">11:00</asp:ListItem>
<asp:ListItem Value="12:00">12:00</asp:ListItem>
<asp:ListItem Value="13:00">13:00</asp:ListItem>
<asp:ListItem Value="14:00">14:00</asp:ListItem>
<asp:ListItem Value="15:00">15:00</asp:ListItem>
<asp:ListItem Value="16:00">16:00</asp:ListItem>
<asp:ListItem Value="17:00">17:00</asp:ListItem>
<asp:ListItem Value="18:00">18:00</asp:ListItem>
<asp:ListItem Value="19:00">19:00</asp:ListItem>
<asp:ListItem Value="21:00">21:00</asp:ListItem>
<asp:ListItem Value="22:00">22:00</asp:ListItem>
<asp:ListItem Value="23:00">23:00</asp:ListItem></asp:DropDownList>
</div>
</div>                  
<div class="form-group">
<label for="usr"><strong>Comentarios :</strong></label>
<div class="input-group mb-3"><asp:TextBox  CssClass="form-control"  TextMode="MultiLine" Rows="5"  ID="txt_Comentarios" runat="server"></asp:TextBox>
</div>
</div>
</div>
<div class="modal-footer bg-light">
<button type="button" class="btn btn-success" validationgroup="Pick_Up" data-toggle="tooltip" title="Se Enviara SMS al Conductor Asignado" id="btn_save" runat="server" onserverclick="btn_save_ServerClick">Registrar PickUp <i class="fas fa-save"></i></button>
</div>
</div>
</div>
</div>
 </div>
<div id="ModalAgregarNombre" class="modal fade" role="dialog"> 
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header bg-secondary"> 
<h4 class="modal-tittle"><p class="text-white">Seleccionar Cliente <i class="fas fa-user"></i> </p></h4>
</div> 
<div class="modal-body" >


<div class="scrolling-table-container">

<asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Cliente" DataSourceID="Clientes" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvClientes_RowCommand">
<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
<Columns>
<asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton Height="12px" ID="select" CommandName="select" ToolTip="Seleccionar cliente"  CommandArgument='<%# Bind("Id_Cliente") %>' runat="server" >
<span aria-hidden="true" class="fas fa-check-circle"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:BoundField DataField="Id_Cliente" HeaderText="Id_Cliente" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="Id_Cliente"></asp:BoundField>
<asp:BoundField DataField="Nombre_Cliente" HeaderText="Nombre" SortExpression="Nombre_Cliente"></asp:BoundField>
<asp:BoundField DataField="Direccion_Cliente" HeaderText="Direccion" SortExpression="Direccion_Cliente"></asp:BoundField>
<asp:BoundField DataField="Contacto_Cliente" HeaderText="Contacto" Visible="false" SortExpression="Contacto_Cliente"></asp:BoundField>

</Columns>
<EditRowStyle BackColor="#999999"></EditRowStyle>
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
<PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
<RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
</asp:GridView>

</div>



<asp:SqlDataSource runat="server" ID="Clientes" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [Cliente] ORDER BY [Nombre_Cliente]"></asp:SqlDataSource>
</div>
<div class="modal-footer bg-secondary">
<button type="button" class="btn btn-default" data-dismiss="modal">
<span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Cerrar <i class="fas fa-sign-out-alt"></i></span>
</button>
</div>
</div>
</div>
</div>

<div class="container">
<div class="card">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home">Pendientes <i class="fas fa-info-circle"></i></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#menu1">Finalizadas <i class="fas fa-check-double"></i></a>
  </li>
    <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#Cancel">Canceladas <i class="fas fa-ban"></i></a>
  </li>
  </ul>
<!-- Tab panes -->
<div class="tab-content">
<div class="tab-pane container active" id="home">

<div class="scrolling-table-container">
    
<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">
<asp:Repeater ID="rptPickUp" runat="server" OnItemCommand="rptPickUp_ItemCommand" DataSourceID="Listado_PickUp">
<ItemTemplate>
<div class="row">
<div class="col-sm-12">
<div class="card">
<span class="badge badge-pill badge-primary">
<div class="row">
<div class="col-sm-6">
<h5><i class="fas fa-truck"></i> Numero :  <%#Eval("Correlativo_PickUp") %></h5>
</div>
<div class="col-sm-6">
<h5> <i class="fas fa-info-circle"></i> Estado :   <%#Eval("Status") %></h5>
</div>
</div>
</span>
<div class="card-body">
<div class="row">
<div class="row">
<div class="col-sm-8">
<h6><strong>Nombre del Cliente :</strong>  <%#Eval("Nombre_Cliente") %> </h6>
<h6><strong>Direccion :</strong>    <%#Eval("Direccion") %>  </h6>
<h6><strong>Contacto :</strong>   <%#Eval("Contacto") %>  </h6>
</div>
<div class="col-sm-4">
<h6><strong>Hora de inicio PU: </strong>    <%#Eval("Hora_Pu_Ini") %> Hasta <%#Eval("Hora_Peu_Fin") %>  </h6>
<h6><strong>Conductor Asignado :</strong>   <%#Eval("Conductor_Asignado") %>  </h6>
 <h6><strong>Registrado:</strong>   <%#Eval("Fecha_Registro") %>  </h6>
</div>
</div>
</div>

</div>
<div class="card-footer">
<div class="row">
<div class="col-sm-4">
<div class="container">
<a href="#demo" class="btn btn-primary" data-toggle="collapse">Ver Detalle <i class="fas fa-info-circle"></i></a>
<div id="demo" class="collapse">
<%#Eval("Comentario_PickUp") %>
</div>
</div>
</div>
<div class="col-sm-4">
<asp:Button ID="btn_EnviarMail" CommandName="MensajeMail"  ToolTip="Se enviara un Correo con la Informacion al Conductor" CommandArgument='<%# Eval("Correlativo_PickUp") %>' class="btn btn-success" runat="server" Text="Enviar Mail" />
</div>
<div class="col-sm-4">
<div class="container">
  
<asp:Button ID="Btn_Finalizar" class="btn btn-warning" CommandName="Finalizar" runat="server" CommandArgument='<%# Eval("Correlativo_PickUp") %>' Text="Finalizar" ToolTip="Se Finalizara el PickUp y se enviara mensaje informando al conductor"/>
<asp:Button ID="Btn_Cancelar" runat="server" CommandName="Cancelar" class="btn btn-danger"  CommandArgument='<%# Eval("Correlativo_PickUp") %>'  ToolTip="Se Cancelara el Pick Up y se enviara un mensaje informando al conductor" Text="Cancelar" />
    
</div>
</div>
</div>

    
</div>
</div>
<br />
</div>
</div>
</ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource runat="server" ID="Listado_PickUp" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [PickUp] where Status= 'PENDIENTE'  ORDER BY [Correlativo_PickUp] DESC"></asp:SqlDataSource>
</div>
</div>
</div>
</div>

</div>


</div>
<div class="tab-pane container fade" id="menu1">

<div class="scrolling-table-container">

<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">
<asp:Repeater ID="RPT_Finalizados" OnItemCommand="RPT_Finalizados_ItemCommand" runat="server" DataSourceID="Finalizados">
<ItemTemplate>
<div class="row">
<div class="col-sm-12">
<div class="card">
<span class="badge badge-pill bg-success text-white">
<div class="row">
<div class="col-sm-6">
<h5><i class="fas fa-truck"></i> Numero :  <%#Eval("Correlativo_PickUp") %></h5>
</div>
<div class="col-sm-6">
<h5> <i class="fas fa-info-circle"></i> Estado  :   <%#Eval("Status") %></h5>
</div>
</div>
</span>
<div class="card-body">
<div class="row">
<div class="row">
<div class="col-sm-8">
<h6><strong>Nombre del Cliente :</strong>  <%#Eval("Nombre_Cliente") %> </h6>
<h6><strong>Direccion :</strong>    <%#Eval("Direccion") %>  </h6>
<h6><strong>Contacto :</strong>   <%#Eval("Contacto") %>  </h6>
<h6><strong>Registrado:</strong>   <%#Eval("Fecha_Registro") %>  </h6>
</div>
<div class="col-sm-4">
<h6><strong>Hora de inicio PU: </strong>    <%#Eval("Hora_Pu_Ini") %> Hasta <%#Eval("Hora_Peu_Fin") %>  </h6>
<h6><strong>Conductor Asignado :</strong>   <%#Eval("Conductor_Asignado") %>  </h6>
<h6><strong>Finalizado :</strong>   <%#Eval("Fecha_Finalizacion") %>  </h6>
</div>
</div>
</div>

</div>
<div class="card-footer">
<div class="row">
<div class="col-sm-4">
<div class="container">
<a href="#demo" class="btn btn-primary" data-toggle="collapse">Ver Detalle <i class="fas fa-info-circle"></i></a>   
<div id="demo" class="collapse">
<%#Eval("Comentario_PickUp") %>
</div>
</div>
</div>
<div class="col-sm-4">
<asp:Button ID="btn_EnviarSMS" CommandName="MensajeMail"  ToolTip="Se enviara un SMS y Correo con la Informacion al Conductor" CommandArgument='<%# Eval("Correlativo_PickUp") %>' class="btn btn-success" runat="server" Text="Enviar Mail" />
</div>
<div class="col-sm-4">
<div class="container">
</div>
</div>
</div>


</div>
</div>
<br />
</div>
</div>
</ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource runat="server" ID="Finalizados" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [PickUp] where Status= 'FINALIZADO'  ORDER BY [Correlativo_PickUp] DESC"></asp:SqlDataSource>
</div>
</div>
</div>
</div>

</div>
</div>
<div class="tab-pane container fade" id="Cancel">
<div class="scrolling-table-container">

<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">
<asp:Repeater ID="RPTCANCELADAS" OnItemCommand="RPTCANCELADAS_ItemCommand" runat="server" DataSourceID="CANCELADAS">
<ItemTemplate>
<div class="row">
<div class="col-sm-12">
<div class="card">
<span class="badge badge-pill bg-danger text-white">
<div class="row">
<div class="col-sm-6">
<h5><i class="fas fa-truck"></i> Numero :  <%#Eval("Correlativo_PickUp") %></h5>
</div>
<div class="col-sm-6">
<h5> <i class="fas fa-info-circle"></i> Estado  :   <%#Eval("Status") %></h5>
</div>
</div>
</span>
<div class="card-body">
<div class="row">
<div class="row">
<div class="col-sm-8">
<h6><strong>Nombre del Cliente :</strong>  <%#Eval("Nombre_Cliente") %> </h6>
<h6><strong>Direccion :</strong>    <%#Eval("Direccion") %>  </h6>
<h6><strong>Contacto :</strong>   <%#Eval("Contacto") %>  </h6>
    <h6><strong>Registrado:</strong>   <%#Eval("Fecha_Registro") %>  </h6>
</div>
<div class="col-sm-4">
<h6><strong>Hora de inicio PU: </strong>    <%#Eval("Hora_Pu_Ini") %> Hasta <%#Eval("Hora_Peu_Fin") %>  </h6>
<h6><strong>Conductor Asignado :</strong>   <%#Eval("Conductor_Asignado") %>  </h6>
<h6><strong>Finalizado :</strong>   <%#Eval("Fecha_Finalizacion") %>  </h6>
</div>
</div>
</div>

</div>
<div class="card-footer">
<div class="row">
<div class="col-sm-4">
<div class="container">
<a href="#demo" class="btn btn-primary" data-toggle="collapse">Ver Detalle <i class="fas fa-info-circle"></i></a>
<div id="demo" class="collapse">
<%#Eval("Comentario_PickUp") %>
</div>
</div>
</div>
<div class="col-sm-4">
<asp:Button ID="btn_EnviarSMS" CommandName="MensajeMail"  ToolTip="Se enviara un Correo con la Informacion al Conductor" CommandArgument='<%# Eval("Correlativo_PickUp") %>' class="btn btn-success" runat="server" Text="Enviar Mail" />
</div>
<div class="col-sm-4">
<div class="container">
</div>
</div>
</div>


</div>
</div>
<br />
</div>
</div>
</ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource runat="server" ID="CANCELADAS" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [PickUp] where Status= 'CANCELADA'  ORDER BY [Correlativo_PickUp] DESC"></asp:SqlDataSource>
</div>
</div>
</div>
</div>

</div>
</div>

</div>
</div>
</div>
        
</form>    
</asp:Content>
