<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PickUp.Home1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  
<script type="text/javascript">
function openModal() {
    $('#myModal').modal('show');
}
</script>
     <style type="text/css">

    
        .scrolling-table-container {
    height: 300px;
    overflow-y: scroll;
    overflow-x: hidden;
}

        div.scrollmenu {
    background-color: #333;
    overflow: auto;
    white-space: nowrap;
}

div.scrollmenu a {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px;
    text-decoration: none;
}

div.scrollmenu a:hover {
    background-color: #777;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">
    
<form runat="server">
<div class="container text-center">
<h2> <p class="bg-light text-dark">Zonas Asignadas a los Conductores</p></h2>
     <hr align="center" noshade="noshade" size="2" width="100%" />
</div>


<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">

     




<asp:Repeater ID="Reapeater_Conductores"  runat="server" OnItemCommand="Reapeater_Conductores_ItemCommand"  DataSourceID="Listado_Conductores">
<ItemTemplate>



<div class="row">
<div class="col-sm-12">
<div class="card">
<span class="badge badge-pill badge-primary"><h4> <i class="fas fa-globe-africa"></i> Zona Asignada : <small><%#Eval("Zona_Asignada") %> </small></h4> </span>
<div class="card-body">
<div class="row">
<div class="col-sm-4">
<div class="row">
<p class="card-text"><strong>Nombre :</strong>  <%#Eval("Nombre_Conductor") %></p>
</div>
<div class="row">
<p class="card-text"><strong>Rut :</strong>  <%#Eval("Rut_Conductor") %></p>
</div>
<div class="row">
<p class="card-text"><strong>Patente :</strong>  <%#Eval("Patente_Conductor") %></p>
</div>
</div>
<div class="col-sm-4">
<div class="row">
<p class="card-text"><strong>Email :</strong>  <%#Eval("Email_Conductor") %></p>
</div>
<div class="row">
<p class="card-text"><strong>Telefono :</strong>  <%#Eval("Telefono_Conductor") %></p>
</div>
</div>
<div class="col-sm-4">
<div class="row">
<strong> Pick Up Pendientes  :</strong> <%#Eval("Cantidad_Pendientes") %></p>
</div>
<div class="row">
<asp:Button ID="btn_Pendientes" class="btn btn-info btn-sm" CommandName="Pendientes" CommandArgument='<%#Eval("Nombre_Conductor") %>' runat="server" Text="Pendientes" />
</div>
<div class="row">
<strong>  Pick up Finalizados :</strong> <%#Eval("Cantidad_finalizadas") %></p>
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
<asp:SqlDataSource runat="server" ID="Listado_Conductores" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT  Conductor.Rut_Conductor,Conductor.Nombre_Conductor,(SELECT count(Correlativo_PickUp)  FROM PickUp where  Status ='PENDIENTE' and PickUp.Conductor_Asignado = Conductor.Nombre_Conductor)as Cantidad_Pendientes ,(SELECT count(Correlativo_PickUp)  FROM PickUp where  Status ='FINALIZADO' and PickUp.Conductor_Asignado = Conductor.Nombre_Conductor)as Cantidad_finalizadas,Conductor.Email_Conductor,Conductor.Telefono_Conductor,Conductor.Patente_Conductor,Conductor.Zona_Asignada FROM Conductor  ORDER BY Nombre_Conductor"></asp:SqlDataSource>
</div>
</div>
</div>
</div>




<div class="container">
 

  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      

        <div class="modal-header">
          <h4 class="modal-title text-center">Listado Pendientes  <button type="button" runat="server" id="Btn_Descargar" onserverclick="Btn_Descargar_ServerClick"   class="btn btn-success"><i class="fas fa-file-download"></i></button></h4> 
    
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
<div class="scrolling-table-container">
    <div class="scrollmenu">
            <asp:GridView ID="GV_Pendientes_Asignadas" runat="server" AutoGenerateColumns="False" Width="100%" Height="100%" DataKeyNames="ID_PickUp" DataSourceID="Listados" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>

                    <asp:BoundField DataField="Correlativo_PickUp" HeaderText="N°" SortExpression="Correlativo_PickUp"></asp:BoundField>
                    <asp:BoundField DataField="Nombre_Cliente" HeaderText="Cliente" SortExpression="Nombre_Cliente"></asp:BoundField>
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion"></asp:BoundField>
                    <asp:BoundField DataField="Contacto" HeaderText="Contacto" SortExpression="Contacto"></asp:BoundField>
                    <asp:BoundField DataField="Hora_Pu_Ini" HeaderText="Inicio" SortExpression="Hora_Pu_Ini"></asp:BoundField>
                    <asp:BoundField DataField="Hora_Peu_Fin" HeaderText="Fin" SortExpression="Hora_Peu_Fin"></asp:BoundField>
                    <asp:BoundField DataField="Comentario_PickUp" HeaderText="Comentario" SortExpression="Comentario_PickUp"></asp:BoundField>
                    <asp:BoundField DataField="User_Correlativo" HeaderText="Solicitado" SortExpression="User_Correlativo"></asp:BoundField>
                    <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha" SortExpression="Fecha_Registro"></asp:BoundField>


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
            <asp:SqlDataSource runat="server" ID="Listados" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="" ></asp:SqlDataSource>
        </div>
      </div>  

        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>


</form>


</asp:Content>
