using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System.Drawing.Drawing2D;
using System.Reflection;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        protected void Bbuscar_Click(object sender, EventArgs e)
        {
            BuscarGrid();
        }
        protected void BuscarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("  select m.Codigo_Factura,m.Cliente, m.Fecha,d.linea,d.Codigo_Producto, d.Cantidad, d.Precio_Unitario,d.IV,m.IV_Total, m.Total from Factura m inner join DET_Factura d on m.Codigo_Factura = d.Codigo_DET_Factura where Cliente = ' " + Tcodigo.Text + " '  order by Codigo_DET_Factura, linea"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("  select m.Codigo_Factura,m.Cliente, m.Fecha,d.linea,d.Codigo_Producto, d.Cantidad, d.Precio_Unitario,d.IV,m.IV_Total, m.Total from Factura m inner join DET_Factura d on m.Codigo_Factura = d.Codigo_DET_Factura"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bver_Click(object sender, EventArgs e)
        {
            llenarGrid();
        }
    }
    
}