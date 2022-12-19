<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/TablaGRID.css" rel="stylesheet" />
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/util.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo"><p class="titulo">Usuarios </p>
    </div> 
    <p class="table" ><asp:GridView class="table"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo_Usuario" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." Height="358px">
        <Columns>
            <asp:BoundField DataField="Codigo_Usuario" HeaderText="Codigo_Usuario" ReadOnly="True" SortExpression="Codigo_Usuario" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
            <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1 %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Codigo_Usuario] = @Codigo_Usuario" InsertCommand="INSERT INTO [Usuarios] ([Nombre], [Correo], [Tipo], [Clave]) VALUES (@Nombre, @Correo, @Tipo, @Clave)" ProviderName="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1.ProviderName %>" SelectCommand="SELECT [Codigo_Usuario], [Nombre], [Correo], [Tipo], [Clave] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [Correo] = @Correo, [Tipo] = @Tipo, [Clave] = @Clave WHERE [Codigo_Usuario] = @Codigo_Usuario">
            <DeleteParameters>
                <asp:Parameter Name="Codigo_Usuario" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Correo" Type="String" />
                <asp:Parameter Name="Tipo" Type="String" />
                <asp:Parameter Name="Clave" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Correo" Type="String" />
                <asp:Parameter Name="Tipo" Type="String" />
                <asp:Parameter Name="Clave" Type="String" />
                <asp:Parameter Name="Codigo_Usuario" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

        <div class="wrap-agregar" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre completo" runat="server"> </asp:TextBox></p></h2></div>
        
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">Correo: <asp:TextBox ID="Tcorreo" class="input100" placeholder="ejemplo@gmail.com" runat="server"></asp:TextBox></p></h2></div>

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">Tipo: <asp:TextBox ID="Ttipo" class="input100" placeholder="Regular o Administrador" runat="server"></asp:TextBox></p></h2></div>

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">Clave: <asp:TextBox ID="Tclave" class="input100" placeholder="Maximo 4 digitos" type="password" runat="server"></asp:TextBox></p></h2></div>


    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Usuario" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click" />
     <asp:Button ID="Bborrar" runat="server" class="login100-form-btn" Text="Borrar Usuario" BackColor="#660066" BorderColor="White" OnClick="Bborrar_Click" />
        <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Usuario" OnClick="Bmodificar_Click" />
                    </div>
   

    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
</asp:Content>
