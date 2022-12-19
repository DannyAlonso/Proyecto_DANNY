<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
   <div class="titulo"><p class="titulo">Facturacion del GYM_DAN_PRO </p>
     </div> 
    
    <table class="wrap-agregar">
        <tr>           
          <td class="text-center">CODIGO_CLIENTE</td>
            <td class="text-center">NOMBRE_CLIENTE</td>
            <td class="text-center">FECHA</td>
            <td class="text-center">Numero de linea</td>
        </tr>
        <tr>
            <td class="text-center">
                <asp:TextBox ID="TcodigoCliente" runat="server" OnTextChanged="Tcodigo_Cliente" TextMode="Number"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="TnombreCliente" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="Tfecha" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="Tlinea" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>           
            <td class="text-center">CODIGO</td>
            <td class="text-center">PEDUCTO</td>
            <td class="text-center">CANTIDAD</td>
            <td class="text-center">PRECIO</td>
        </tr>
        <tr>
            <td class="text-center">
                <asp:TextBox ID="Tcodigo" runat="server" OnTextChanged="Tcodigo_TextChanged" TextMode="Number"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="Tproducto" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="Tcantidad" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="text-center">
                <asp:TextBox ID="Tprecio" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="text-center">IVA</td>
            <td class="text-center">SUPTOTAL</td>       
            <td class="text-center">TOTAL</td>

        </tr>
        <tr>
            <td class="text-center">
                <asp:Label ID="LIVA" runat="server" Font-Size="Large" Text="0"></asp:Label>
       
            </td>
            <td class="text-center">
                    <asp:Label ID="LSB" runat="server" Font-Size="Large" Text="0"></asp:Label>
      
            </td>
            <td class="text-center">
                <asp:Label ID="LTOTAL" runat="server" Font-Size="Large" Text="0"></asp:Label>

            </td>        
        </tr>
    </table>

    <br />
   <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 <asp:Label ID="Lmensaje"  Class="lmensaje" runat="server" ></asp:Label>
    
    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Agregar" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click"/>
     <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar" OnClick="Bmodificar_Click"/>
     <asp:Button ID="Bborrar"  class="login100-form-btn"  runat="server" Text="Borrar" OnClick="Bborrar_Click"/>
     <asp:Button ID="Bfacturar"  class="login100-form-btn"  runat="server" Text="Facturar" OnClick="Bfacturar_Click"/>

     </div>
</asp:Content>
