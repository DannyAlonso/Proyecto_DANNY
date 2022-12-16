using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN
{
    public partial class Ingreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bentrar_Click(object sender, EventArgs e)
        {
            Usuarios1.correo = Tcorreo.Text;
            Usuarios1.clave = Tclave.Text;
         


            if (Usuarios1.ValidarUsuario() > 0)
            {
                if (Usuarios1.tipo.Equals("Regular"))
                {
                    Response.Redirect("Inicio.aspx");
                }
                else
                {                   
                    Response.Redirect("Distrito.aspx");
                }

            }
            else
            {
                Lmensaje.Text = "correo o clave no existe";
            }
        }
    }
}