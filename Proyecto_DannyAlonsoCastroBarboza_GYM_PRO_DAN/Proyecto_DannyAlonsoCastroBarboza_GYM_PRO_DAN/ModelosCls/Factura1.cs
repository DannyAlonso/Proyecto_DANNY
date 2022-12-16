using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls
{
    public class Factura1
    {

        public static int codigo_Factura { get; set; }
        public static int codigo_DET_Factura { get; set; }
        public static int codigo_Producto { get; set; }
        public static float Precio_unitario{ get; set; }
        public static int iva { get; set; }
        public static float total_Factura { get; set; }
        public static int linea { get; set; }
        public static int cantidad { get; set; }
        public static float precio { get; set; }
        public static int codigo { get; set; }
        public static string fecha_Factura { get; set; }
        public static float ivaTotal_Factura { get; set; }
        public static int cliente { get; set; }




        public static int AgregarDetalleFactura(int codigo_DET_Factura, int linea, int codigo_Producto, int cantidad, float Precio_unitario, int suptotal)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("DetFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
           
                    cmd.Parameters.Add(new SqlParameter("@Codigo_DET_Factura", codigo_DET_Factura));
                    cmd.Parameters.Add(new SqlParameter("@linea", linea));
                    cmd.Parameters.Add(new SqlParameter("@codigo_Producto", codigo_Producto));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", cantidad));
                    cmd.Parameters.Add(new SqlParameter("@Precio_unitario", Precio_unitario));
                    cmd.Parameters.Add(new SqlParameter("@suptotal", suptotal));


                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }

        public static int AgregarMaestroFactura()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Factura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@cliente", cliente));
                    cmd.Parameters.Add(new SqlParameter("@codigo", codigo_Factura));
                    cmd.Parameters.Add(new SqlParameter("@total", total_Factura));
                    cmd.Parameters.Add(new SqlParameter("@fecha", fecha_Factura));
                    cmd.Parameters.Add(new SqlParameter("@IVA_Total", ivaTotal_Factura ));



                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}