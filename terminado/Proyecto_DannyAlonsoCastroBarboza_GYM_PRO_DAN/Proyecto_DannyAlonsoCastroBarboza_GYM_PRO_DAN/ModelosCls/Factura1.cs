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
        
        public static float total { get; set; }
        public static string fecha { get; set; }
        public static float ivaTotal { get; set; }
        public static int codigoCliente { get; set; }
        public static int codigo { get; set; }




        public static int linea { get; set; }
        public static int codigoProducto { get; set; }
        public static int cantidad { get; set; }
        public static float precioUnitario { get; set; }
        public static int iva { get; set; }
        public static float supTotal { get; set; }


        public static int Getacodigo()
        {
            return codigo;
        }
        public static void Setcodigo(int Codigo)
        {
            codigo = Codigo;
        }
        public static string Getafecha()
        {
            return fecha;
        }
        public static void Setfecha(string Fecha)
        {
            fecha = Fecha;
        }
        public static float GetivaTotal()
        {
            return ivaTotal;
        }
        public static void SetivaTotal(float IvaTotal)
        {
            ivaTotal = IvaTotal;
        }
        public static int GetcodigoClientel()
        {
            return codigoCliente;
        }
        public static void SetcodigoCliente(int CodigoCliente)
        {
            codigoCliente = CodigoCliente;
        }
        public static float Gettotal()
        {
            return total;
        }
        public static void Settotal(float Total)
        {
            total = Total;
        }



        public static int AgregarDetalleFactura( int linea, int codigoProducto, int cantidad, float precioUnitario, int iva, float supTotal)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("InsertarDETFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };          
                 
                    cmd.Parameters.Add(new SqlParameter("@Linea", linea));
                    cmd.Parameters.Add(new SqlParameter("@Codigo_Producto", codigoProducto));
                    cmd.Parameters.Add(new SqlParameter("@Cantidad", cantidad));
                    cmd.Parameters.Add(new SqlParameter("@Precio_Unitario", precioUnitario));
                    cmd.Parameters.Add(new SqlParameter("@IVA", iva));
                    cmd.Parameters.Add(new SqlParameter("@Sup_Total", supTotal));



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
                    SqlCommand cmd = new SqlCommand("Insertarfactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                
                    cmd.Parameters.Add(new SqlParameter("@Total", total));
                    cmd.Parameters.Add(new SqlParameter("@IV_Total", ivaTotal));
                    cmd.Parameters.Add(new SqlParameter("@Codigo_Cliente", codigoCliente));
                    cmd.Parameters.Add(new SqlParameter("@Fecha", fecha));





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


        public static int Eliminar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarProducto", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("Codigo", codigo));

                    retorno = cmd.ExecuteNonQuery();
                    string jscript = "<script>alert('YOUR BUTTON HAS BEEN CLICKED')</script>";

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

        public static int Modificar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarFactura", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", codigo));
                    cmd.Parameters.Add(new SqlParameter("@Total", total));
                    cmd.Parameters.Add(new SqlParameter("@IV_Total", ivaTotal));
                    cmd.Parameters.Add(new SqlParameter("@Codigo_Cliente", codigoCliente));
                    cmd.Parameters.Add(new SqlParameter("@Fecha", fecha));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
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
