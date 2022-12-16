<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo"><p class="titulo">Productos </p>
    </div> 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo_Producto" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar.">
        <Columns>
            <asp:BoundField DataField="Codigo_Producto" HeaderText="Codigo_Producto" ReadOnly="True" SortExpression="Codigo_Producto" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1 %>" DeleteCommand="DELETE FROM [Producto] WHERE [Codigo_Producto] = @Codigo_Producto" InsertCommand="INSERT INTO [Producto] ([Nombre], [Precio]) VALUES (@Nombre, @Precio)" ProviderName="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1.ProviderName %>" SelectCommand="SELECT [Codigo_Producto], [Nombre], [Precio] FROM [Producto]" UpdateCommand="UPDATE [Producto] SET [Nombre] = @Nombre, [Precio] = @Precio WHERE [Codigo_Producto] = @Codigo_Producto">
        <DeleteParameters>
            <asp:Parameter Name="Codigo_Producto" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Precio" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Precio" Type="Decimal" />
            <asp:Parameter Name="Codigo_Producto" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <div class="wrap-agregar" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar o borrar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre del producto" runat="server"> </asp:TextBox></p></h2></div>

   <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Precio: <asp:TextBox  ID="Tprecio" class="input100" placeholder="Digitar precio" runat="server"> </asp:TextBox></p></h2></div>


    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Producto" OnClick="Bingresar_Click"/>
    <asp:Button ID="Bborrar" runat="server" class="login100-form-btn" Text="Borrar Preoducto" OnClick="Bborrar_Click" />
    <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Producto" OnClick="Bmodificar_Click"  />
                    </div>
   

    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
</asp:Content>
