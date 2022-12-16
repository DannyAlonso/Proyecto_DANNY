using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace Proyecto_DannyAlonsoCastroBarboza_GYM_PRO_DAN.ModelosCls
{
    public class Clientes1
    {
        public static int codigo { get; set; }
        public static string nombre { get; set; }
        public static string apellidos { get; set; }
        public static string telefono { get; set; }
        public static int Getcodigo()
        {
            return codigo;
        }
        public static void Setcodigo(int Codigo)
        {
            codigo = Codigo;
        }
        public static string Getapellidos()
        {
            return apellidos;
        }
        public static void Setapellidos(string Apellidos)
        {
            apellidos = Apellidos;
        }
        public static string Getnombre()
        {
            return nombre;
        }
        public static void Setnombre(string Nombre)
        {
            nombre = Nombre;
        }
        public static string Gettelefono()
        {
            return telefono;
        }
        public static void Settelefono(string Telefono)
        {
            telefono = Telefono;
        }




        public static int Insertar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("InsertarClientes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellidos", apellidos));
                    cmd.Parameters.Add(new SqlParameter("@Telefono", telefono));

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
                    SqlCommand cmd = new SqlCommand("BorrarCliente", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("Nombre_Clientes", Clientes1.nombre));

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
                    SqlCommand cmd = new SqlCommand("ActualizarClientes", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Codigo", codigo));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellidos", apellidos));
                    cmd.Parameters.Add(new SqlParameter("@telefono", telefono));
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


        public static int BuscarCliente(string cod)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("SeleccionarCliente", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@codigo", cod));
                    ;

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;
                            nombre = rdr["Nombre_Clientes"].ToString();
                        
                        }

                    }


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;
        }


    }



}