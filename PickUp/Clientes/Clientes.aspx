<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="PickUp.Clientes.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  

<style type="text/css">
       .scrolling-table-container {
        height: 550px;
        overflow-y: scroll;
        overflow-x: hidden;
        }
</style>



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

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">


<form runat="server" >
<div class="container">

    <div class="container text-center">
<h2> <p class="bg-light text-dark">Clientes</p></h2>
     <hr align="center" noshade="noshade" size="2" width="100%" />
</div>





<br>
  <!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#home">Crear Clientes</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#menu1">Listado de Clientes</a>
    </li>
</ul>

  <!-- Tab panes -->
<div class="tab-content">

                <div id="home" class="container tab-pane active"><br>
                    <div class="container">
                        <div class="card">
                            <div class="card-body bg-light">

                     
<div class="form-group">
<label for="Nombre"><strong>Nombre:</strong></label>
<asp:TextBox ID="txt_Nombre" runat="server" class="form-control" placeholder="Nombre Completo"></asp:TextBox>
</div>

  
<div class="form-group">
<label for="Rut_Conductor"><strong>Rut:</strong></label>
<asp:TextBox ID="txt_Rut_Conductor" runat="server" class="form-control" onblur="javascript:formatoRut(this.value,this.id)"  placeholder="00.000.000-0"></asp:TextBox>
</div>


<div class="form-group">
<label for="Email"><strong>Direccion:</strong></label>
<asp:TextBox ID="txt_Direccion"  runat="server" class="form-control" placeholder="Direccion Completa"></asp:TextBox>
</div>

<div class="form-group">
<label for="Telefono"><strong>Telefono:</strong></label>
<asp:TextBox ID="txt_Telefono" runat="server" TextMode="Number" class="form-control" placeholder="Telefono de contacto"></asp:TextBox>
</div>


<div class="container">
  
<asp:Button ID="btn_Crear_Cliente" class="btn btn-warning" OnClick="btn_Crear_Cliente_Click" runat="server"  Text="Crear Usuario" ToolTip="Presionar Aqui , Para Registrar Cliente"/>

    
</div>



                            </div>
                        </div>
                    </div>
                </div>


                <div id="menu1" class="container tab-pane fade"><br>
                    <div class="container">
                        <div class="card">
                            <div class="card-body  bg-light">
 
                     
<div class="scrolling-table-container">
                                <asp:GridView ID="gv_Cliente" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Cliente" Width="100%" Height="100%" DataSourceID="List_Cliente" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                    <Columns>
                                    <asp:BoundField DataField="Id_Cliente" HeaderText="ID" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="Id_Cliente"></asp:BoundField>
                                    <asp:BoundField DataField="Nombre_Cliente" HeaderText="Nombre" SortExpression="Nombre_Cliente"></asp:BoundField>
                                    <asp:BoundField DataField="Direccion_Cliente" HeaderText="Direccion" SortExpression="Direccion_Cliente"></asp:BoundField>
                                    <asp:BoundField DataField="Contacto_Cliente" HeaderText="Contacto" SortExpression="Contacto_Cliente"></asp:BoundField>
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




                                <asp:SqlDataSource runat="server" ID="List_Cliente" ConnectionString='<%$ ConnectionStrings:PickUp.Properties.Settings.Cadena %>' SelectCommand="SELECT * FROM [Cliente] ORDER BY [Nombre_Cliente]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
  
</div>
</div>
</form>

</asp:Content>
