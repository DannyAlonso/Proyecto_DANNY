<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
    <link href="css/util.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="titulo"><p class="titulo">Clientes </p>
    </div> 
    <p class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo_Clientes" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar.">
            <Columns>
                <asp:BoundField DataField="Codigo_Clientes" HeaderText="Codigo_Clientes" ReadOnly="True" SortExpression="Codigo_Clientes" InsertVisible="False" />
                <asp:BoundField DataField="Nombre_Clientes" HeaderText="Nombre_Clientes" SortExpression="Nombre_Clientes" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1 %>" SelectCommand="SELECT * FROM [Clientes]"></asp:SqlDataSource>
    </p>

       <div class="wrap-agregar" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre" runat="server"> </asp:TextBox></p></h2></div>
        
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">Apellidos: <asp:TextBox ID="Tapellidos" class="input100" placeholder="Apellidos" runat="server"></asp:TextBox></p></h2></div>

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">Telefono: <asp:TextBox ID="Ttelefono" class="input100" placeholder="Numero de telefono" runat="server"></asp:TextBox></p></h2></div>

    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Usuario" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click"  />
     <asp:Button ID="Bborrar" runat="server" class="login100-form-btn" Text="Borrar Usuario" BackColor="#660066" BorderColor="White" OnClick="Bborrar_Click"  />
     <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Usuario" OnClick="Bmodificar_Click" />
     </div>
                    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
</asp:Content>
