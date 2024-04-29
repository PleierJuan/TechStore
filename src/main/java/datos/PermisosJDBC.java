package datos;

import beanDTO.PermisoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PermisosJDBC implements PermisosInterfas {
    
    private Connection conexionTransaccional;
    
    private static final String CONSULTA_PERMISOS_USUARIOS = "SELECT id_permiso_usuario, id_usuarios, id_permiso_descripcion FROM permisos_usuario WHERE id_usuarios = ?";
    private static final String INSERTAR_PERMISO = "INSERT INTO permisos_usuario (id_usuarios,id_permiso_descripcion) VALUES(?,?)";
    private static final String ELIMINAR_PERMISOS = "DELETE FROM permisos_usuario WHERE id_usuarios = ?";
    private static final String CONSULTAR_PERMISO_X_IDUSUARIO =  "SELECT id_permiso_usuario, id_usuarios, id_permiso_descripcion FROM permisos_usuario where id_usuarios = ? and id_permiso_descripcion = ?";

    @Override
    public List<PermisoDTO> consultaPermisosUsuario(int idUsuario) {
        List<PermisoDTO> permisos = new ArrayList<>();
        PermisoDTO permiso = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = conexionTransaccional != null ? conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(CONSULTA_PERMISOS_USUARIOS);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            while (rs.next()) {
                permiso = new PermisoDTO(rs.getInt("id_permiso_usuario"), rs.getInt("id_usuarios"), rs.getInt("id_permiso_descripcion"));
                //System.out.println(permiso.toString());
                permisos.add(permiso);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        }finally {
            try {
                ConexionMySql.close(stmt);
                ConexionMySql.close(rs);

                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        return permisos;
    }

    @Override
    public int insertarPermiso(PermisoDTO permisos) {
        int idInsertado = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = conexionTransaccional != null ? conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(INSERTAR_PERMISO, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, permisos.getIdUsuarios());
            stmt.setInt(2, permisos.getIdPermisoDescripcion());
            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idInsertado = rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException ex) {
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

        return idInsertado;
    }

    @Override
    public int eliminarPermisos(int idUsuario) {
        int afectados = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        
        
        try {

            conn = conexionTransaccional != null ? conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(ELIMINAR_PERMISOS);
            stmt.setInt(1, idUsuario);
            afectados = stmt.executeUpdate();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(PermisosJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
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

    @Override
    public boolean consultarPermisoXIdUsuario(int idUsuario, int idPermiso) {
        boolean existe = false;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = conexionTransaccional != null ? conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(CONSULTAR_PERMISO_X_IDUSUARIO);
            stmt.setInt(1, idUsuario);
            stmt.setInt(2, idPermiso);
            rs = stmt.executeQuery();
            while (rs.next()) {
                existe = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        }finally {
            try {
                ConexionMySql.close(stmt);
                ConexionMySql.close(rs);

                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        
        return existe;
    }
    
    
}
