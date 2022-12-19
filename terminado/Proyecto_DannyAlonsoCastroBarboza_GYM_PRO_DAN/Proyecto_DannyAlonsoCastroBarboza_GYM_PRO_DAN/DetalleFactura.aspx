<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="DetalleFactura.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/TablaGRID.css" rel="stylesheet" />
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-left: 483px;
        }
        .auto-style2 {
            margin: 40px 40px 40px 487px;
            width: 70%;
            border-radius: 5px;
            overflow: hidden;
            padding: 40px 40px 25px 40px;
            opacity: .9;
            background: #9152f8;
            background: -webkit-linear-gradient(top, #7579ff, #b224ef);
            background: -o-linear-gradient(top, #7579ff, #b224ef);
            background: -moz-linear-gradient(top, #7579ff, #b224ef);
            background: #9152f8;
        }
        .auto-style3 {
            text-transform: capitalize;
            font-weight: bold;
            color: #041776;
            font-size: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="titulo"><p class="auto-style3">Detalles de las facturas </p>
    </div> 
    <asp:GridView ID="GridView1" runat="server" CssClass="auto-style1" Width="1242px">
    </asp:GridView>
     <div class="auto-style2" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Digitar codigo  del cliente para buscar factura!!" runat="server"> </asp:TextBox></p></h2></div>
     


    <div class="container-login100-form-btn">
    <asp:Button ID="Bbuscar" runat="server" class="login100-form-btn" Text="Buscar por Cliente" OnClick="Bbuscar_Click"/>
          <asp:Button ID="Bver" runat="server" class="login100-form-btn" Text="Ver todas las Facturas" OnClick="Bver_Click" />
     
                </div>
   

    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>

</asp:Content>
