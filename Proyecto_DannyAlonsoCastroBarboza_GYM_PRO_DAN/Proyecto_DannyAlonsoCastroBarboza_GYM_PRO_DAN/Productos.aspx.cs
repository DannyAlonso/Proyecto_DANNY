using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Productos1.nombre = Tnombre.Text;
            Productos1.precio = float.Parse(Tprecio.Text);
          


            if (Productos1.Insertar() > 0)
            {
                Lmensaje.Text = "Producto ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso del Productos!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        protected void Bborrar_Click(object sender, EventArgs e)
        {
         
                Productos1.codigo = int.Parse(Tcodigo.Text);


                if (Productos1.Eliminar() > 0)
                {
                    Lmensaje.Text = "Canton eliminado con exito.";
                }
                else
                {
                    Lmensaje.Text = "Error al borrar la Canton!!.";

                }
                limpiarCampos();
                llenarGrid();
            
        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Productos1.codigo = int.Parse(Tcodigo.Text);
            Productos1.nombre = Tnombre.Text;
            Productos1.precio = float.Parse(Tprecio.Text);
          

            if (Productos1.Modificar() > 0)
            {
                Lmensaje.Text = "El Productos a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion del Productos!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        public void limpiarCampos()
        {
            Tcodigo.Text = "";
            Tnombre.Text = "";
            Tprecio.Text = "";
       
        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Producto"))
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