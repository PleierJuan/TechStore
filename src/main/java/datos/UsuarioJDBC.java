package datos;

import beanDTO.UsuarioDTO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.AlgorithmParameters;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;


public class UsuarioJDBC implements UsuarioInterfas{
    private Connection conexionTransaccional;
    
    private static final String LOGIN_USUARIO = "SELECT id_usuarios,nombre,apellido_paterno,apellido_materno,usuario,contrasena,correo,salt,activo FROM usuarios WHERE usuario=? AND activo=1";
    private static final String SELECT_USUARIO = "SELECT id_usuarios, nombre, apellido_paterno, apellido_materno,usuario,contrasena,correo FROM usuarios WHERE activo=1";
    private static final String INSERT_USUARIO = "INSERT INTO usuarios (nombre,apellido_paterno,apellido_materno,usuario,contrasena,correo,salt) values(?, ?, ?, ?, ?, ?,?)";
    private static final String DELETE_USUARIO = "UPDATE usuarios SET activo=0 WHERE id_usuarios=?";
    private static final String UPDATE_USUARIO = "UPDATE usuarios SET nombre= ?, apellido_paterno = ?, apellido_materno = ?, usuario = ?, contrasena = ?, correo = ?, salt = ? WHERE id_usuarios = ?";
    private static final String VALIDA_USUARIO = "SELECT id_usuarios FROM usuarios WHERE usuario= BINARY ? and activo = 1";

    @Override
    public List<UsuarioDTO> consultaUsuarios() {
        List<UsuarioDTO> usuarios = new ArrayList<>();
        UsuarioDTO usuario = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(SELECT_USUARIO);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int idUsuario = rs.getInt("id_usuarios");
                String nombre = rs.getString("nombre");
                String apellidoP = rs.getString("apellido_paterno");
                String apellidoM = rs.getString("apellido_materno");
                String nomUsuario = rs.getString("usuario");
                String contrasena = rs.getString("contrasena");
                String correo = rs.getString("correo");
                usuario = new UsuarioDTO(idUsuario, nombre, apellidoP, apellidoM, nomUsuario, contrasena, correo);

                usuarios.add(usuario);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return usuarios;
    }
    
    private String[] encriptaContrasena(UsuarioDTO usuario) throws NoSuchAlgorithmException, InvalidKeySpecException, GeneralSecurityException, UnsupportedEncodingException {
        //encriptacion
        String password = usuario.getContrasena();
        //System.out.println("contrasena sin: " + password);

        // The salt (probably) can be stored along with the encrypted data
        SecureRandom number = SecureRandom.getInstance("SHA1PRNG");
        String salt = number.toString();

        // Decreasing this speeds down startup time and can be useful during testing, but it also makes it easier for brute force attackers
        int iterationCount = 40000;
        // Other values give me java.security.InvalidKeyException: Illegal key size or default parameters
        int keyLength = 128;
        SecretKeySpec key = createSecretKey(usuario.getContrasena().toCharArray(), salt.getBytes(), iterationCount, keyLength);

        String[] encryptedPassword = {encrypt(password, key), salt};

        return encryptedPassword;
    }

    private static SecretKeySpec createSecretKey(char[] password, byte[] salt, int iterationCount, int keyLength) throws NoSuchAlgorithmException, InvalidKeySpecException {
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA512");
        PBEKeySpec keySpec = new PBEKeySpec(password, salt, iterationCount, keyLength);
        SecretKey keyTmp = keyFactory.generateSecret(keySpec);
        return new SecretKeySpec(keyTmp.getEncoded(), "AES");
    }

    private static String encrypt(String property, SecretKeySpec key) throws GeneralSecurityException, UnsupportedEncodingException {
        Cipher pbeCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        pbeCipher.init(Cipher.ENCRYPT_MODE, key);
        AlgorithmParameters parameters = pbeCipher.getParameters();
        IvParameterSpec ivParameterSpec = parameters.getParameterSpec(IvParameterSpec.class);
        byte[] cryptoText = pbeCipher.doFinal(property.getBytes("UTF-8"));
        byte[] iv = ivParameterSpec.getIV();
        return base64Encode(iv) + ":" + base64Encode(cryptoText);
    }

    private static String base64Encode(byte[] bytes) {
        return Base64.getEncoder().encodeToString(bytes);
    }

    private static String decrypt(String string, SecretKeySpec key) throws GeneralSecurityException, IOException {
        String iv = string.split(":")[0];
        String property = string.split(":")[1];
        Cipher pbeCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        pbeCipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(base64Decode(iv)));
        return new String(pbeCipher.doFinal(base64Decode(property)), "UTF-8");
    }

    private static byte[] base64Decode(String property) throws IOException {
        return Base64.getDecoder().decode(property);
    }

    @Override
    public UsuarioDTO loginUsuario(UsuarioDTO usuario) {
        UsuarioDTO user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        //obteniendo salt
        String saltt = null;
        String encryptedPassword = null;
        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(LOGIN_USUARIO);

            stmt.setString(1, usuario.getNomUsuario());
            rs = stmt.executeQuery();
            while (rs.next()) {
                //System.out.println("Tiene un usuario" + rs.getString("salt"));
                saltt = rs.getString("salt");
                //System.out.println("Tiene un usuario" + rs.getString("salt"));

                String password = usuario.getContrasena();
                // Decreasing this speeds down startup time and can be useful during testing, but it also makes it easier for brute force attackers
                int iterationCount = 40000;
                // Other values give me java.security.InvalidKeyException: Illegal key size or default parameters
                int keyLength = 128;
                SecretKeySpec key = createSecretKey(usuario.getContrasena().toCharArray(), saltt.getBytes(), iterationCount, keyLength);
 

                encryptedPassword = encrypt(password, key); //se compara con la contrasena encriptada de la BD
                
                String decryptedPassword = decrypt(rs.getString("contrasena"), key);//si no puede desncriptar termina lu fuincion y envia un mensaje de error
                
                
                if (usuario.getContrasena().equals(decryptedPassword)) {
                    int idUsuario = rs.getInt("id_usuarios");
                    String nombre = rs.getString("nombre");
                    String apellidoP = rs.getString("apellido_paterno");
                    String apellidoM = rs.getString("apellido_materno");
                    String nomUsuario = rs.getString("usuario");
                    String contrasena = rs.getString("contrasena");
                    String correo = rs.getString("correo");
                    String salt = rs.getString("salt");
                    int activo = rs.getInt("activo");

                    user = new UsuarioDTO(idUsuario, nombre, apellidoP, apellidoM, nomUsuario, contrasena, correo, salt, activo);
                }
            }

           

        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException | InvalidKeySpecException | IOException ex) {
            ex.printStackTrace(System.out);
        } catch (GeneralSecurityException ex) {
            //System.out.println("Truena por llave invalida, nunca se desencripta ni trae los datos del usuario");

        }  finally {
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
        return user;
    }

    @Override
    public int altaUsuario(UsuarioDTO usuario) {
        int idInsertado = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            ///encriptacion            
            String[] encriptacion = encriptaContrasena(usuario);

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(INSERT_USUARIO, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getApellidoP());
            stmt.setString(3, usuario.getApellidoM());
            stmt.setString(4, usuario.getNomUsuario());
            stmt.setString(5, encriptacion[0]);
            stmt.setString(6, usuario.getCorreo());
            stmt.setString(7, encriptacion[1]);
            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idInsertado = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException | NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } catch (GeneralSecurityException | UnsupportedEncodingException ex) {
            Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }
                ConexionMySql.close(rs);
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return idInsertado;
    }

    @Override
    public int bajaUsuario(int idUsuario) {
        int noAfectados = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {

            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(DELETE_USUARIO);
            stmt.setInt(1, idUsuario);
            noAfectados = stmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ConexionMySql.close(stmt);
                if (this.conexionTransaccional == null) {
                    ConexionMySql.close(conn);
                }

            } catch (SQLException ex) {
                Logger.getLogger(UsuarioJDBC.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return noAfectados;
    }

    @Override
    public int cambioUsuario(UsuarioDTO usuario) {
        int noAfectados = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            //encriptacion
            String[] encriptacion = encriptaContrasena(usuario);
            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();
            stmt = conn.prepareStatement(UPDATE_USUARIO);

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getApellidoP());
            stmt.setString(3, usuario.getApellidoM());
            stmt.setString(4, usuario.getNomUsuario());
            stmt.setString(5, encriptacion[0]);
            stmt.setString(6, usuario.getCorreo());
            stmt.setString(7, encriptacion[1]);
            stmt.setInt(8, usuario.getIdUsuario());
            noAfectados = stmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException | GeneralSecurityException | UnsupportedEncodingException ex) {
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
        return noAfectados;
    }

    @Override
    public int validaUsuario(String nombreUsuario) {
        int existe = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = this.conexionTransaccional != null ? this.conexionTransaccional : ConexionMySql.getConnection();            
            stmt = conn.prepareStatement(VALIDA_USUARIO);
            stmt.setString(1, nombreUsuario);
            rs = stmt.executeQuery();
            while (rs.next()) {
                existe = rs.getInt("id_usuarios");
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
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return existe;
    }
    
    
}
