using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls
{
    public class Distrito1
    {
        public static int codigo { get; set; }
        public static string nombre { get; set; }

        public static int Getcodigo()
        {
            return codigo;
        }
        public static void Setcodigo(int Codigo)
        {
            codigo = Codigo;
        }
        public static string Getnombre()
        {
            return nombre;
        }
        public static void Setnombre(string Nombre)
        {
            nombre = Nombre;
        }




        public static int Insertar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("InsertarDistrito", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));

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




        public static int Modificar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarDistrito", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", codigo));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
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