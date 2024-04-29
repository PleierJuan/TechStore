package beanDTO;


public class PermisoDTO {
    private int idPermisoUsuario;
    private int idUsuarios;
    private int idPermisoDescripcion;

    public PermisoDTO() {
    }

    public PermisoDTO(int idUsuarios, int idPermisoDescripcion) {
        this.idUsuarios = idUsuarios;
        this.idPermisoDescripcion = idPermisoDescripcion;
    }

    public PermisoDTO(int idPermisoUsuario, int idUsuarios, int idPermisoDescripcion) {
        this.idPermisoUsuario = idPermisoUsuario;
        this.idUsuarios = idUsuarios;
        this.idPermisoDescripcion = idPermisoDescripcion;
    }

    public int getIdPermisoUsuario() {
        return idPermisoUsuario;
    }

    public void setIdPermisoUsuario(int idPermisoUsuario) {
        this.idPermisoUsuario = idPermisoUsuario;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public int getIdPermisoDescripcion() {
        return idPermisoDescripcion;
    }

    public void setIdPermisoDescripcion(int idPermisoDescripcion) {
        this.idPermisoDescripcion = idPermisoDescripcion;
    }
    
    
}
