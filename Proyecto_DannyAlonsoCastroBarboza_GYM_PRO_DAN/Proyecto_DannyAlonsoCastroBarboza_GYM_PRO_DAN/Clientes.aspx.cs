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
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Clientes1.nombre = Tnombre.Text;
            Clientes1.apellidos = Tapellidos.Text;
            Clientes1.telefono = Ttelefono.Text;
           

            if (Clientes1.Insertar() > 0)
            {
                Lmensaje.Text = "Cliente ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso del cliente!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        protected void Bborrar_Click(object sender, EventArgs e)
        {
            Clientes1.nombre = Tnombre.Text;


            if (Clientes1.Eliminar() > 0)
            {
                Lmensaje.Text = "   Cliente eliminado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error al borrar cliente!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Clientes1.codigo = int.Parse(Tcodigo.Text);
            Clientes1.nombre = Tnombre.Text;
            Clientes1.apellidos = Tapellidos.Text;           
            Clientes1.telefono= Ttelefono.Text;
           

            if (Clientes1.Modificar() > 0)
            {
                Lmensaje.Text = "El cliente a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion del cliente!!.";

            }
            limpiarCampos();
            llenarGrid();
        }



        public void limpiarCampos()
        {
            Tcodigo.Text = "";
            Tnombre.Text = "";
            Tapellidos.Text = "";
            Ttelefono.Text = "";
    
        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Clientes"))
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
    }
}