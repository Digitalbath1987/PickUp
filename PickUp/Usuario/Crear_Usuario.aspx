<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Crear_Usuario.aspx.cs" Inherits="PickUp.Usuario.Crear_Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


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
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master"  runat="server">

    <form runat="server" >


    <div class="container">

  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">Crear Usuario</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">Listado de Usuarios</a>
    </li>
    

  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      

            <div class="container">


  <div class="card">


    <div class="card-body bg-light">
    

 <div class="container">

    <div class="form-group">
    <label for="Nombre"><strong>Nombre:</strong></label>
    <asp:TextBox ID="txt_Nombre" runat="server" class="form-control" placeholder="Nombre Completo"></asp:TextBox>
    </div>
  
       <div class="form-group">
    <label for="Rut"><strong>Rut:</strong></label>
    <asp:TextBox ID="txt_Rut" runat="server" class="form-control" onblur="javascript:formatoRut(this.value,this.id)"  placeholder="Formato xx.xxx.xxx-x"></asp:TextBox>
    </div>
       <div class="form-group">
    <label for="Email"><strong>Email:</strong></label>
    <asp:TextBox ID="txt_Email" TextMode="Email" runat="server" class="form-control" placeholder="Email de contacto para Avisos"></asp:TextBox>
    </div>
     <div class="form-group">
    <label for="Telefono"><strong>Telefono:</strong></label>
    <asp:TextBox ID="txt_Telefono" runat="server" TextMode="Number" class="form-control" placeholder="Email de contacto para Avisos"></asp:TextBox>
    </div>

       <div class="form-group">
    <label for="Nombre"><strong>Usuario:</strong></label>
    <asp:TextBox ID="txt_User" runat="server" class="form-control" placeholder="Usuario"></asp:TextBox>
    </div>
     <div class="form-group">
    <label for="Contraseña"><strong>Contraseña:</strong></label>
    <asp:TextBox ID="txt_Password" runat="server" class="form-control" placeholder="Contraseña"></asp:TextBox>
    </div>


  


<div class="card-group">
      <div class="card bg-light">
    <div class="card-body">
     <div class="form-group">
    <label for="Modificar"><strong>Modificar:</strong></label>
          <asp:RadioButtonList ID="rbl_Modificar"  runat="server" ToolTip="Perfil asignado para modificar registros ...." RepeatDirection="Horizontal">
              <asp:ListItem Selected="True" Value="False">NO</asp:ListItem>
              <asp:ListItem Value="True">SI</asp:ListItem>
          </asp:RadioButtonList>
    </div>
    </div>
  </div>
      <div class="card bg-light">
    <div class="card-body">
 <div class="form-group">
    <label for="Eliminar"><strong>Eliminar:</strong></label>
      <asp:RadioButtonList ID="rbl_Eliminar" runat="server" ToolTip="Perfil asignado para eliminar registros ...." RepeatDirection="Horizontal">
              <asp:ListItem Selected="True" Value="False">NO</asp:ListItem>
              <asp:ListItem Value="True">SI</asp:ListItem>
          </asp:RadioButtonList>
    </div>
    </div>
</div>
<div class="card bg-light">
<div class="card-body">
<div class="form-group">
<label for="Crear"><strong>Crear:</strong></label>
<asp:RadioButtonList ID="rbl_Crear" runat="server" ToolTip="Perfil asignado para crear Usuarios,Conductores ...." RepeatDirection="Horizontal">
<asp:ListItem Selected="True" Value="False">NO</asp:ListItem>
<asp:ListItem Value="True">SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>
</div>
</div>
<div runat="server" id="ok" visible="false" class="alert alert-success alert-dismissible fade show" >
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong>Registro Correcto!</strong> Usuario Creado Correctamente!!
</div>
<div class="alert alert-danger alert-dismissible fade show" runat="server" id="NOok" visible="false">
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong>Error en Registro!</strong> Comprobar Registro o contactar al administrador.
</div>
<br />
<button type="button" runat="server" id="Btn_Crear_User" class="btn btn-primary"  data-toggle="tooltip" title="Presione aqui para crear el usuario" onserverclick="Btn_Crear_User_ServerClick">Crear Usuario <i class="fas fa-user-plus"></i></button>
<button type="button" runat="server" id="btn_Update_User" class="btn btn-success" onserverclick="btn_Update_User_ServerClick"  visible="false" data-toggle="tooltip" title="Presione aqui para crear el usuario" >Grabar Cambios <i class="fas fa-save"></i></button>
<button type="button" runat="server" id="btn_Cancel_User" class="btn btn-danger" onserverclick="btn_Cancel_User_ServerClick"  visible="false" data-toggle="tooltip" title="Presione aqui para crear el usuario">Cancelar <i class="fas fa-ban"></i></button>
</div>
</div>
</div>
</div>
</div>
<div id="menu1" class="container tab-pane fade"><br>
 <div class="container">
<div class="card">
<div class="card-body  bg-light">
    <asp:GridView ID="gv_Usuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="Rut_Usuario" DataSourceID="Lista_Usuarios" Width="100%" Height="100%" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gv_Usuarios_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre" SortExpression="Nombre_Usuario"></asp:BoundField>
            <asp:BoundField DataField="Rut_Usuario" HeaderText="Rut" ReadOnly="True" SortExpression="Rut_Usuario"></asp:BoundField>
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono"></asp:BoundField>
            <asp:CheckBoxField DataField="Eliminar" HeaderText="Eliminar" SortExpression="Eliminar"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Modificar" HeaderText="Modificar" SortExpression="Modificar"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Crear" HeaderText="Crear" SortExpression="Crear"></asp:CheckBoxField>
             <asp:TemplateField HeaderText="Aciones" >
                        <ItemTemplate>
                        <asp:LinkButton  ID="Eliminar" CommandName="Eliminar" ToolTip="Eliminar Usuario" CommandArgument='<%# Bind("Rut_Usuario") %>' runat="server" >
                        <span aria-hidden="true" class="fas fa-trash-alt"></span>
                        </asp:LinkButton>
                        <asp:LinkButton  ID="Editar" CommandName="Editar" ToolTip="Editar Usuario" CommandArgument='<%# Bind("Rut_Usuario") %>' runat="server" >
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
    <asp:SqlDataSource runat="server" ID="Lista_Usuarios" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [Usuario] ORDER BY [Nombre_Usuario]"></asp:SqlDataSource>
</div>
</div>
</div>
</div>
</div>
</div>
</form>
</asp:Content>
