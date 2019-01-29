<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Conductores.aspx.cs" Inherits="PickUp.Conductores.Conductores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Librerias/jquery-1.7.2.min.js"></script>
    <script src="../Librerias/jquery.maskedinput.js"></script>
       
<script type="text/javascript">
$(document).ready(function () {
$("#txt_Telefono_Conductor").mask("999999999");
});
</script>
    <script type="text/javascript">
     function formatoRut(texto, inputText) {
     objRut = document.getElementById(inputText);
     var rut_aux = "";
     for (i = 0; i < texto.length; i++)
     if (texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-')
     rut_aux = rut_aux + texto.charAt(i);
     largo = rut_aux.length;
     if (largo == 0) return false;
     if (largo < 2) return false;
     for (i = 0; i < largo; i++) {
     var letra = rut_aux.charAt(i);
     if (!letra.match(/^([0-9]|[kK])$/)) return false;
     }
     var rut_inv = "";
     for (i = (largo - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + rut_aux.charAt(i);
     var dtexto = "";
     dtexto = dtexto + rut_inv.charAt(0);
     dtexto = dtexto + '-';
     cnt = 0;
     for (i = 1, j = 2; i < largo; i++ , j++) {
     if (cnt == 3) {
     dtexto = dtexto + '.';
     j++;
     dtexto = dtexto + rut_inv.charAt(i);
     cnt = 1;
     } else {
     dtexto = dtexto + rut_inv.charAt(i);
     cnt++;
     }
     }
     rut_inv = "";
     for (i = (dtexto.length - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + dtexto.charAt(i);
     objRut.value = rut_inv.toUpperCase()
     }
   
     function MostrarModalJS() {
                window.location.href = '#modalHtml';
     }

    </script>
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">


<form runat="server" >
 <div class="container">
<br>
 <!-- Nav tabs -->
 <ul class="nav nav-tabs" role="tablist">
     <li class="nav-item">
<a class="nav-link active" data-toggle="tab" href="#home">Asignar Ruta</a>
</li>
<li class="nav-item">
<a class="nav-link" data-toggle="tab" href="#menu1">Crear Conductor</a>
</li>
</ul>
 <!-- Tab panes -->
<div class="tab-content">
   
<div id="home" class="container tab-pane active"><br>
            <div class="container">
            <div class="card">
            <div class="card-body  bg-light">
            <div class="card-group">
            <div class="card bg-primary">
            <div class="card-body text-center">
            <label for="Conductores"><strong>Seleccionar Conductor :</strong></label>
            <asp:DropDownList ID="ddl_Conductores" runat="server" class="form-control" DataSourceID="List_Driver" DataTextField="Nombre_Conductor" DataValueField="Rut_Conductor"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="List_Driver" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT [Rut_Conductor], [Nombre_Conductor] FROM [Conductor] ORDER BY [Nombre_Conductor]"></asp:SqlDataSource>
            </div>
            </div>
            <div class="card bg-primary">
            <div class="card-body text-center">
            <label for="Zona"><strong>Asignar Zona :</strong></label>
            <asp:TextBox ID="txt_Zona_Asignar" class="form-control" runat="server"></asp:TextBox>
            </div>
            </div>
            <div class="card bg-primary">
            <div class="card-body text-center">
            <br />
            <button type="button" runat="server" id="btn_Asignar" class="btn btn-success" onserverclick="btn_Asignar_ServerClick">Asignar Ruta <i class="fas fa-thumbs-up"></i></button>
            </div>
            </div>
            </div>
            </div>
            </div>
            <div class="card">
            <div class="card-body  bg-light">
            <asp:GridView ID="gvConductores" runat="server" AutoGenerateColumns="False" Width="100%" Height="100%" DataKeyNames="Rut_Conductor" DataSourceID="Listados" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvConductores_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
            <asp:BoundField DataField="Nombre_Conductor" HeaderText="Conductor" SortExpression="Nombre_Conductor"></asp:BoundField>
            <asp:BoundField DataField="Rut_Conductor" HeaderText="Rut" ReadOnly="True" SortExpression="Rut_Conductor"></asp:BoundField>
            <asp:BoundField DataField="Email_Conductor" HeaderText="Email" SortExpression="Email_Conductor"></asp:BoundField>
            <asp:BoundField DataField="Telefono_Conductor" HeaderText="Telefono" SortExpression="Telefono_Conductor"></asp:BoundField>
            <asp:BoundField DataField="Patente_Conductor" HeaderText="Patente" SortExpression="Patente_Conductor"></asp:BoundField>
            <asp:BoundField DataField="Zona_Asignada" HeaderText="Zona Asignada" SortExpression="Zona_Asignada"></asp:BoundField>
            <asp:TemplateField HeaderText="Aciones" >
            <ItemTemplate>
            <asp:LinkButton  ID="Eliminar" CommandName="Eliminar" ToolTip="Eliminar Usuario" CommandArgument='<%# Bind("Rut_Conductor") %>' runat="server" >
            <span aria-hidden="true" class="fas fa-trash-alt"></span>
            </asp:LinkButton>
            <asp:LinkButton  ID="Editar" CommandName="Editar" ToolTip="Editar Usuario" CommandArgument='<%# Bind("Rut_Conductor") %>' runat="server" >
            <span aria-hidden="true" class="fas fa-edit"></span>
            </asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
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
            <asp:SqlDataSource runat="server" ID="Listados" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [Conductor] ORDER BY [Nombre_Conductor]"></asp:SqlDataSource>
            </div>
            </div>
            </div>
</div>

<div id="menu1" class="container tab-pane  fade"><br>
            <div class="container">
            <div class="card">
            <div class="card-body bg-light">
            <div class="container">
            <div class="form-group">
            <label for="Nombre_Conductor"><strong>Nombre del Conductor:</strong></label>
            <asp:TextBox ID="txt_Nombre_Conductor" runat="server" class="form-control" placeholder="Nombre Completo"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="Rut_Conductor"><strong>Rut:</strong></label>
            <asp:TextBox ID="txt_Rut_Conductor" runat="server" class="form-control" onblur="javascript:formatoRut(this.value,this.id)"  placeholder="Formato xx.xxx.xxx-x"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="Email_Conductor"><strong>Email Conductor:</strong></label>
            <asp:TextBox ID="txt_Email_Conductor" runat="server" class="form-control" placeholder="email que recibira las notificaciones"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="Telefono_Conductor"><strong>Telefono Conductor:</strong></label>
            <asp:TextBox ID="txt_Telefono_Conductor"  ClientIDMode="Static" runat="server" class="form-control" placeholder="Telefono para notificaciones"></asp:TextBox>
            </div>
            <div class="form-group">
            <label for="Vehiculo"><strong>Patente Vehiculo:</strong></label>
            <asp:TextBox ID="txt_Vehiculo" runat="server" class="form-control" placeholder="Vehiculo Asociado"></asp:TextBox> 
            </div>
            <div runat="server" id="ok" visible="false" class="alert alert-success alert-dismissible fade show" >
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Registro Correcto!</strong> Conductor Creado Correctamente!!
            </div>
            <div class="alert alert-danger alert-dismissible fade show" runat="server" id="NOok" visible="false">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Error en Registro!</strong> Comprobar Registro o contactar al administrador.
            </div>
            <br />
            <button type="button" runat="server" id="Btn_Crear_Driver" class="btn btn-primary"  onserverclick="Btn_Crear_Driver_ServerClick" data-toggle="tooltip" title="Presione aqui para crear el Conductor" >Crear Conductor<i class="fas fa-user-plus"></i></button>
            <button type="button" runat="server" id="btn_Update_Driver" class="btn btn-success"  onserverclick="btn_Update_Driver_ServerClick"  visible="false" data-toggle="tooltip" title="Presione aqui para crear el Conductor" >Grabar Cambios <i class="fas fa-save"></i></button>
            <button type="button" runat="server" id="btn_Cancel_Driver" class="btn btn-danger"  onserverclick="btn_Cancel_Driver_ServerClick"  visible="false" data-toggle="tooltip" title="Presione aqui para Cancelar">Cancelar <i class="fas fa-ban"></i></button>
            </div>
            </div>
            </div>
            </div>
</div>

</div>
</div>
</form>

</asp:Content>
