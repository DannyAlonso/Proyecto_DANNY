<%@ Page Title="" Language="C#" MasterPageFile="~/Menu_Inicio.Master" AutoEventWireup="true" CodeBehind="Canton.aspx.cs" Inherits="Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.Canton" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Inicio.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/TablaGRID.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="titulo"><p class="titulo">Conton </p>
     </div>
    
        <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>

       <div class="wrap-agregar" >   
                <div class="titulo">
    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Codigo: <asp:TextBox  ID="Tcodigo" class="input100" placeholder="Solo para modificar o borrar, digitar el codigo!!" runat="server"> </asp:TextBox></p></h2></div>
     

    <div class="wrap-input100 validate-input" data-validate = "Enter username">
    <h2><p class="ingresar">  Nombre: <asp:TextBox  ID="Tnombre" class="input100" placeholder="Nombre del Canton" runat="server"> </asp:TextBox></p></h2></div>
        
    
    <div class="container-login100-form-btn">
    <asp:Button ID="Bingresar" runat="server" class="login100-form-btn" Text="Ingresar Canton" BackColor="#660066" BorderColor="White" OnClick="Bingresar_Click"/>
     <asp:Button ID="Bmodificar"  class="login100-form-btn"  runat="server" Text="Modificar Canton" OnClick="Bmodificar_Click"/>
     </div>
                    
    <asp:Label ID="Lmensaje" Class="lmensaje" runat="server" ></asp:Label>        
                </div>
      </div>
    
</asp:Content>
