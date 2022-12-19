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
    public partial class Provincia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Provincia1.nombre = Tnombre.Text;



            if (Provincia1.Insertar() > 0)
            {
                Lmensaje.Text = "Provincia ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso de la Provincia!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

       

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Provincia1.codigo = int.Parse(Tcodigo.Text);
           Provincia1.nombre = Tnombre.Text;
       

            if (Provincia1.Modificar() > 0)
            {
                Lmensaje.Text = "La Provincia a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion de la provincia!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        public void limpiarCampos()
        {
            Tcodigo.Text = "";
            Tnombre.Text = "";
          

        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Provincia"))
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