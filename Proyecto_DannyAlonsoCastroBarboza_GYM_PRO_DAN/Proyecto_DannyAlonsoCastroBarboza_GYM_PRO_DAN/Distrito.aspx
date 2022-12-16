<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Distrito.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Distrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
<style type="text/css">
    .auto-style1 {
        margin: 40px 40px 40px 160px;
        width: 100%;
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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="titulo"><p class="titulo">Distrito </p>
     </div>    
    <asp:GridView ID="GridView1" runat="server" CssClass="m-l-160">
    </asp:GridView>

    
       <div class="auto-style1" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar o borrar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre del Distrito" runat="server"> </asp:TextBox></p></h2></div>
        
    
    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Distrito" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click" />
    <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Distrito" OnClick="Bmodificar_Click"/>
     </div>
                    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
    

</asp:Content>
