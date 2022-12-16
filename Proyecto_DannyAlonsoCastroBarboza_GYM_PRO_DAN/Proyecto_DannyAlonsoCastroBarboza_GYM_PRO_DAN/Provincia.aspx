<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Provincia.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Provincia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo"><p class="titulo">Provincia </p>
    </div> 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Codigo_Provincia" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar.">
        <Columns>
            <asp:BoundField DataField="Codigo_Provincia" HeaderText="Codigo_Provincia" ReadOnly="True" SortExpression="Codigo_Provincia" InsertVisible="False" />
            <asp:BoundField DataField="Nombre_Provincia" HeaderText="Nombre_Provincia" SortExpression="Nombre_Provincia" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GYM_PRO_DANConnectionString1 %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>

      <div class="wrap-agregar" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar o borrar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre de la provincia" runat="server"> </asp:TextBox></p></h2></div>
        
    
    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Provincia" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click"   />
    <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Provincia" OnClick="Bmodificar_Click" />
     </div>
                    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
</asp:Content>
