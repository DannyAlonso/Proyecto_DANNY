using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN
{
    public partial class Facturacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Linea"), new DataColumn("Codigo"), new DataColumn("Nombre_Producto"), new DataColumn("Cantidad"), new DataColumn("Precio_Uni"), new DataColumn("Iva_Uni"), new DataColumn("Subtotal") });
                ViewState["Factura"] = dt;
                this.BindGrid();
     

            }
        }

        protected void Tcodigo_TextChanged(object sender, EventArgs e)
        {
            
            if (Productos1.BuscarProducto(Tcodigo.Text) > 0)
            {
                Tproducto.Text = Productos1.nombre;
                Tprecio.Text = Productos1.precio.ToString();
                Tcantidad.Focus();

            }
        }

        protected void Tcodigo_Cliente(object sender, EventArgs e)
        {

            if (Clientes1.BuscarCliente(TcodigoCliente.Text) > 0)
            {
                TnombreCliente.Text = Clientes1.nombre;
                Tfecha.Focus();
                Tcodigo.Focus();

            }
        }

        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["Factura"];
            GridView1.DataBind();
        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            int linea = 0;
            try
            {
                DataTable dt = (DataTable)ViewState["Factura"];
                float sb = (float.Parse(Tcantidad.Text) * float.Parse(Tprecio.Text));
                ViewState["Subtotal"] = (float.Parse(Tcantidad.Text) * float.Parse(Tprecio.Text));
                ViewState["IVA"] = (float.Parse(Tprecio.Text) * 0.13);
               // ViewState["Linea"] = ((linea) + 1);
               // linea.Equals (ViewState["Linea"]).ToString();
                dt.Rows.Add(linea+1,Tcodigo.Text.Trim(), Tproducto.Text.Trim(), Tcantidad.Text.Trim(), Tprecio.Text.Trim(), ViewState["IVA"], ViewState["Subtotal"]);
                ViewState["Factura"] = dt;
                this.BindGrid();

                ViewState["subtotal"] =  (float.Parse(LSB.Text) + sb); 
                LSB.Text = (ViewState["subtotal"]).ToString();
                ViewState["IVA"] =(float.Parse(LSB.Text) * 0.13);
                LIVA.Text = (ViewState["IVA"]).ToString();
                ViewState["total"] = (float.Parse(LIVA.Text) + float.Parse(LSB.Text));
                LTOTAL.Text = (ViewState["total"]).ToString();
                
                Tcodigo.Focus();
                Tcodigo.Text = "";
                Tproducto.Text = "";
                Tcantidad.Text = "";
                Tprecio.Text = "";
                linea++;

            }
            catch (Exception)
            {


            }


            finally
            {


            }
        }

        protected void Bfacturar_Click(object sender, EventArgs e)
        {
          
            Factura1.total = float.Parse(LTOTAL.Text);
            Factura1.ivaTotal = float.Parse(LIVA.Text);
            Factura1.fecha = Tfecha.Text;
            Factura1.codigoCliente = int.Parse(TcodigoCliente.Text);

            if (Factura1.AgregarMaestroFactura() > 0)
            {
                int linea = 0;
                foreach (GridViewRow item in GridView1.Rows)
                {

                    int codigoProducto = int.Parse(item.Cells[0].Text);
                    int cantidad = int.Parse(item.Cells[2].Text);
                    float precioUnitario = float.Parse(item.Cells[3].Text);
                    int iva = int.Parse(item.Cells[4].Text);
                    float supTotal = float.Parse(item.Cells[5].Text);
                    linea++;
                    if (Factura1.AgregarDetalleFactura(linea,codigoProducto,cantidad,precioUnitario,iva,supTotal) >0)
                    {                        
                        Lmensaje.Text = "SE A FACTURADO CON EXIDO.";
                    }
                    else
                    {
                        Lmensaje.Text = "ERROR DE FACTURACION!!.";

                    }
                    

                }
                DataTable ds = new DataTable();
                ds = null;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            
           
        }

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
           Factura1.codigo = int.Parse(Tcodigo.Text);
            Factura1.total = float.Parse(LTOTAL.Text);
            Factura1.ivaTotal = float.Parse(LIVA.Text);
             Factura1.codigoCliente = int.Parse(TcodigoCliente.Text);
            Factura1.fecha = Tfecha.Text;





            if (Factura1.Modificar() > 0)
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
            Tcantidad.Text = "";
        

        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["GYM_PRO_DANConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Factura"))
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
           Factura1.codigo = int.Parse(Tcodigo.Text);


            if (Factura1.Eliminar() > 0)
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
    }
}