package datos;

import beanDTO.MarcasDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MarcasJDBC implements MarcasInterface {

    private Connection conexionTransaccional;

    private static final String INSERTAR_MARCA = "INSERT INTO techstore.marcas (nombre, descripcion, precio, imagen) VALUES (?, ?, ?, ?)";
    private static final String SELECT_MARCA = "SELECT id_marca, nombre, descripcion, precio, imagen FROM techstore.marcas";
    private static final String DELETEAR_MARCA = "DELETE FROM techstore.marcas WHERE id_marca = ?;";
    private static final String UPDATEAR_MARCA = "UPDATE techstore.marcas SET nombre = ?, descripcion = ?, precio = ?, imagen = ? WHERE id_marca = ?";
    private static final String SELECT_NOMBRE_MARCA = "SELECT id_marca, nombre, descripcion, precio, cantidad, imagen FROM marcas WHERE id_marca = ?";

    @Override
    public int insertaMarcas(MarcasDTO marca) {
        int idMarcas = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(INSERTAR_MARCA, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, marca.getNomMar());
            stmt.setString(2, marca.getDesc());
            stmt.setFloat(3, marca.getPrecio());
            stmt.setString(4, marca.getImagen());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                idMarcas = rs.getInt(1);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        return idMarcas;

    }

    @Override
    public List<MarcasDTO> consultarMarcas() {

        List<MarcasDTO> marcas = new ArrayList<>();
        MarcasDTO marca = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(SELECT_MARCA);
            //System.out.println(conn.prepareStatement(SELECT_MARCA));
            rs = stmt.executeQuery();

            while (rs.next()) {
                int idMarcas = rs.getInt("id_marca");
                String nomMar = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                float precio = rs.getFloat("precio");
                String imagen = rs.getString("imagen");
                marca = new MarcasDTO(idMarcas, nomMar, descripcion, precio, imagen);
                marcas.add(marca);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return marcas;

    }

    @Override
    public int deletearMarcas(MarcasDTO marca) {
        int idMarca = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(DELETEAR_MARCA, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, marca.getIdMarca());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        return idMarca;
    }

    @Override
    public int updatearMarcas(MarcasDTO marca) {
        int afectados = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(UPDATEAR_MARCA);
            stmt.setString(1, marca.getNomMar());
            stmt.setString(2, marca.getDesc());
            stmt.setFloat(3, marca.getPrecio());
            stmt.setString(4, marca.getImagen());
            stmt.setInt(5, marca.getIdMarca());
            afectados = stmt.executeUpdate();
            

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        return afectados;
    }

    public static void main(String[] args) {
        //MarcasDTO idmarca = new MarcasDTO("13");
        MarcasJDBC marcaMetodos = new MarcasJDBC ();
        List<MarcasDTO> marcas = marcaMetodos.consultarMarcas();
        for (MarcasDTO marca: marcas){
            System.out.println(marca.toString());
        }
       /* MarcasDTO marca= new MarcasDTO(5, "sisea ctualizo");
        MarcasJDBC marcaMetodos = new MarcasJDBC ();
        marcaMetodos.updatearMarcas(marca);
        List<MarcasDTO> marcas = marcaMetodos.consultarMarcass();
        for (MarcasDTO erea: marcas){
            System.out.println(erea.toString());
        }*/
      // MarcasDTO idmarca = new MarcasDTO("16");
       //MarcasJDBC marcaMetodos = new MarcasJDBC ();
       //marcaMetodos.deletearMarcas(idmarca);
    }

    @Override
    public MarcasDTO consultaNombreMarca(int idMarca) {
        MarcasDTO marca = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(SELECT_NOMBRE_MARCA);
            stmt.setInt(1, idMarca);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int idMarcas = rs.getInt("id_marca");
                String nomMar = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                float precio = rs.getFloat("precio");
                String imagen = rs.getString("imagen");
                

                marca = new MarcasDTO(idMarcas, nomMar, descripcion, precio, imagen);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MarcasJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                Logger.getLogger(MarcasJDBC.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return marca;
    }
}
