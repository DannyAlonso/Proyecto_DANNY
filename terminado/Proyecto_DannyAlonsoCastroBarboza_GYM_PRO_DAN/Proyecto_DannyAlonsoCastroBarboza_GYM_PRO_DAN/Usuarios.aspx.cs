using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
           
            Usuarios1.nombre = Tnombre.Text;
            Usuarios1.correo = Tcorreo.Text;
            Usuarios1.clave = Tclave.Text;
            Usuarios1.tipo = Ttipo.Text;

            if (Usuarios1.InsertarUsuario() > 0)
            {
                Lmensaje.Text = "Usuario ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso!!.";

            }
            limpiarCampos();
            llenarGrid();
        }


        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Usuarios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                          
                            GridView1.DataBind();// refrescar el grid 
                        }

                    }

                }
            }

        }

        protected void Bborrar_Click(object sender, EventArgs e)
        {
            Usuarios1.nombre = Tnombre.Text;
     

            if (Usuarios1.Eliminar() > 0)
            {
                Lmensaje.Text = "Usuario eliminado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de borrar usuario!!.";

            }
            limpiarCampos();
            llenarGrid();

        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
           
            
            Usuarios1.codigo = int.Parse(Tcodigo.Text);
            Usuarios1.nombre = Tnombre.Text;
            Usuarios1.correo = Tcorreo.Text;
            Usuarios1.clave = Tclave.Text;
            Usuarios1.tipo = Ttipo.Text;

            if (Usuarios1.Modificar() > 0)
            {
                Lmensaje.Text = "Usuario a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion!!.";

            }
            limpiarCampos();
            llenarGrid();
           
        }

        public void limpiarCampos() {
            Tcodigo.Text = "";
            Tnombre.Text = "";
            Tcorreo.Text = "";
            Ttipo.Text = "";
            Tclave.Text = "";
        
        }
    }
}