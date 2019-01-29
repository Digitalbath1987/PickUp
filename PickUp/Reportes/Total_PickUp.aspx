<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Total_PickUp.aspx.cs" Inherits="PickUp.Reportes.Total_PickUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <style type="text/css">

    
        .scrolling-table-container {
    height: 550px;
    overflow-y: scroll;
    overflow-x: hidden;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Master" runat="server">

<div class="container text-center">
<h2> <p class="bg-light text-dark">Total Registros</p></h2>
<hr align="center" noshade="noshade" size="2" width="100%" />
</div>

<form id="report" runat="server">

<div class="container">
<button type="button" runat="server" id="Btn_DescargarXLS" onserverclick="Btn_DescargarXLS_ServerClick" class="btn btn-warning">Descargar .XLS</button>
    <button type="button" runat="server" id="Btn_DescargarPDF" onserverclick="Btn_DescargarPDF_ServerClick"   class="btn btn-success">Descargar .PDF</button>
    
</div>
<div class="container">
<div class="card">
<div class="card-body bg-light">
<div class="container">
    <div class="scrolling-table-container">
        <asp:GridView ID="GV_Total_Registros" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_PickUp"  Width="100%" Height="100%" CellPadding="4" ForeColor="#333333" OnPageIndexChanging="OnPageIndexChanging" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="ID_PickUp" HeaderText="ID_PickUp" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="ID_PickUp"></asp:BoundField>
                <asp:BoundField DataField="Correlativo_PickUp" HeaderText="N°" SortExpression="Correlativo_PickUp"></asp:BoundField>
                <asp:BoundField DataField="Nombre_Cliente" HeaderText="Cliente" SortExpression="Nombre_Cliente"></asp:BoundField>
                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion"></asp:BoundField>
                <asp:BoundField DataField="Contacto" HeaderText="Contacto" SortExpression="Contacto"></asp:BoundField>
                <asp:BoundField DataField="Hora_Pu_Ini" HeaderText="inicio PU" SortExpression="Hora_Pu_Ini"></asp:BoundField>
                <asp:BoundField DataField="Hora_Peu_Fin" HeaderText="Fin PU" SortExpression="Hora_Peu_Fin"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Estado" SortExpression="Status"></asp:BoundField>
                <asp:BoundField DataField="Conductor_Asignado" HeaderText="Conductor" SortExpression="Conductor_Asignado"></asp:BoundField>
                <asp:BoundField DataField="Comentario_PickUp" HeaderText="Comentario" SortExpression="Comentario_PickUp"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha Registro" SortExpression="Fecha_Registro"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Finalizacion" HeaderText="Fecha Finalizacion" SortExpression="Fecha_Finalizacion"></asp:BoundField>
                <asp:BoundField DataField="User_Correlativo" HeaderText="User Registro" SortExpression="User_Correlativo"></asp:BoundField>
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
</div>
</div>
</div>
</div>
</form>
</asp:Content>
