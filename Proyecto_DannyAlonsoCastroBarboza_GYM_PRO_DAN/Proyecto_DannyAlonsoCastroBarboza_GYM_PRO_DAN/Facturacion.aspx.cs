using Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls;
using System;
using System.Collections.Generic;
using System.Data;
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
                dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Codigo"), new DataColumn("Nombre_Producto"), new DataColumn("Cantidad"), new DataColumn("Precio"), new DataColumn("Subtotal") });
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
                TnumeroFactura.Text = Factura1.codigo_Factura++.ToString();
                Tfecha.Text = Factura1.fecha_Factura;
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
            try
            {
                DataTable dt = (DataTable)ViewState["Factura"];
                float sb = (float.Parse(Tcantidad.Text) * float.Parse(Tprecio.Text));
                ViewState["Subtotal"] = (float.Parse(Tcantidad.Text) * float.Parse(Tprecio.Text));
                dt.Rows.Add(Tcodigo.Text.Trim(), Tproducto.Text.Trim(), Tcantidad.Text.Trim(), Tprecio.Text.Trim(), ViewState["Subtotal"]);
                ViewState["Factura"] = dt;
                this.BindGrid();

                ViewState["subtotal"] = (float.Parse(LSB.Text) + sb);
                LSB.Text = (ViewState["subtotal"]).ToString();
                ViewState["IVA"] = (float.Parse(LSB.Text) * 0.13);
                LIVA.Text = (ViewState["IVA"]).ToString();
                ViewState["total"] = (float.Parse(LSB.Text) + float.Parse(LIVA.Text));
                LTOTAL.Text = (ViewState["total"]).ToString();


                Tcodigo.Focus();
                Tcodigo.Text = "";
                Tproducto.Text = "";
                Tcantidad.Text = "";
                Tprecio.Text = "";


            }
            catch (Exception)
            {


            }


            finally
            {


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Factura1.total_Factura = float.Parse(LTOTAL.Text);
            Factura1.cliente = int.Parse(TcodigoCliente.Text);
            if (Factura1.AgregarMaestroFactura() > 0)
            {
                int linea = 0;
                foreach (GridViewRow item in GridView1.Rows)
                {


                    int codigo = int.Parse(item.Cells[0].Text);
                    int cantidad = int.Parse(item.Cells[2].Text);
                    float precio = float.Parse(item.Cells[3].Text);
                    linea++;
               
                    if (Factura1.AgregarDetalleFactura(codigo_DET_Factura,linea,codigo_Producto,cantidad,Precio_unitario,suptotal) >0)
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

        }
    }
}