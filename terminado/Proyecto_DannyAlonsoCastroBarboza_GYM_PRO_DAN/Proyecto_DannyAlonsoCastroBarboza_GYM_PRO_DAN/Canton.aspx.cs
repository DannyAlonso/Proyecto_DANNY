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
    public partial class Canton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Canton1.nombre = Tnombre.Text;



            if (Canton1.Insertar() > 0)
            {
                Lmensaje.Text = "Canton ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso del Canton!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

      

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Canton1.codigo = int.Parse(Tcodigo.Text);
            Canton1.nombre = Tnombre.Text;


            if (Canton1.Modificar() > 0)
            {
                Lmensaje.Text = "El Canton a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion del Canton!!.";

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
                using (SqlCommand cmd = new SqlCommand("select cl.Nombre_Clientes, p.Nombre_Provincia, c.Codigo_Canton, c.Nombre_Canton from Provincia p inner join Canton c on p.Codigo_Provincia = c.Codigo_Canton inner join Clientes cl on cl.Codigo_Clientes = c.Codigo_Canton"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();// refrescar el grid 
                        }

                    }

                }
            }

        }
    }
}