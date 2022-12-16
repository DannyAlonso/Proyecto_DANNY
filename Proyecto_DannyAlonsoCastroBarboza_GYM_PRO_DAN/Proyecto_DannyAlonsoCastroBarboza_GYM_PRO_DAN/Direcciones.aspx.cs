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
    public partial class Direcciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Direcciones1.nombre = Tnombre.Text;



            if (Direcciones1.Insertar() > 0)
            {
                Lmensaje.Text = "Direccion ingresado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de ingreso de la Direccion!!.";

            }
            limpiarCampos();
            llenarGrid();
        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            Direcciones1.codigo = int.Parse(Tcodigo.Text);
            Direcciones1.nombre = Tnombre.Text;


            if (Direcciones1.Modificar() > 0)
            {
                Lmensaje.Text = "Direccion a sido modificado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de modificacion de la Direccion!!.";

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
                using (SqlCommand cmd = new SqlCommand("select cl.Nombre_Clientes, p.Nombre_Provincia, c.Nombre_Canton, d.Nombre_Distrito, di.Codigo_Direcciones, di.Comentarios_de_Direccion from Clientes cl inner join Provincia p on p.Codigo_Provincia = cl.Codigo_Clientes inner join Canton c on c.Codigo_Canton = p.Codigo_Provincia inner join Distrito d on d.Codigo_Distrito = c.Codigo_Canton inner join Direcciones di on di.Codigo_Direcciones = d.Codigo_Distrito"))
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