using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN
{
    public partial class Inicio1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Lingreso.Text = "<p><h1>Bienvenido al gimnasio</h1></p>" +
                " <p><h1>GYM_PRO_DAN</h1></p>" +
                " <p><h2>Usuario :" + Usuarios1.nombre+"</p></h2>" +
                "<p><h2>Correo: "+ Usuarios1.correo+"</p></h1>" +
                "<p><h2>Tipo:"+Usuarios1.tipo+"</p></h2>" +
                "<p><h2>Clave:"+Usuarios1.clave+"</p></h1>";
        }
    }
}