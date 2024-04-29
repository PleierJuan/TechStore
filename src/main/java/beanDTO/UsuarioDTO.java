package beanDTO;


public class UsuarioDTO {
    private int idUsuario;
    private String nombre;
    private String apellidoP;
    private String apellidoM;
    private String nomUsuario;
    private String contrasena;
    private String correo;
    private String salt;
    private int activo;

    public UsuarioDTO() {
    }

    public UsuarioDTO(int idUsuario, String nombre, String apellidoP, String apellidoM, String nomUsuario, String contrasena, String correo, String salt, int activo) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.nomUsuario = nomUsuario;
        this.contrasena = contrasena;
        this.correo = correo;
        this.salt = salt;
        this.activo = activo;
    }

    public UsuarioDTO(int idUsuario, String nombre, String apellidoP, String apellidoM, String nomUsuario, String contrasena, String correo) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.nomUsuario = nomUsuario;
        this.contrasena = contrasena;
        this.correo = correo;
    }

    public UsuarioDTO(String nombre, String apellidoP, String apellidoM, String nomUsuario, String contrasena, String correo) {
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.nomUsuario = nomUsuario;
        this.contrasena = contrasena;
        this.correo = correo;
    }

    public UsuarioDTO(String nomUsuario, String contrasena) {
        this.nomUsuario = nomUsuario;
        this.contrasena = contrasena;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public String getNomUsuario() {
        return nomUsuario;
    }

    public void setNomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }
    
    
}
