
package datos;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.*;
import javax.sql.DataSource;
/**
 *
 * @author jefatura
 */
public class ConexionMySql {
    
    public static DataSource getDataSource() {

        // Configuración del DataSource
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL(VariablesGlobales.JDBC_URL);
        dataSource.setUser(VariablesGlobales.JDBC_USER);
        dataSource.setPassword(VariablesGlobales.JDBC_PASSWORD);
        
        return dataSource;

    }
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection conectar =null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conectar = getDataSource().getConnection();                    
            //System.out.println("Conexión Nueva " );
        } catch (SQLException ex) {
            System.out.println("Error al abrir Conexión: " + ex.getMessage());
        }
        return conectar;
    }

    
    public static void close(ResultSet rs) throws SQLException{
        rs.close();
    }
    
    public static void close(Statement smtm) throws SQLException{
        smtm.close();
    }
    
    public static void close(PreparedStatement smtm) throws SQLException{
        smtm.close();
    }
    
    public static void close(Connection conn) throws SQLException{
        conn.close();
        //System.err.println("Coneción Cerrada " );
    }
    
}
