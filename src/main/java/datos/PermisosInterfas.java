package datos;

import beanDTO.PermisoDTO;
import java.util.List;

public interface PermisosInterfas {
    public List<PermisoDTO> consultaPermisosUsuario(int idUsuario);
    public int insertarPermiso(PermisoDTO permisos);
    public int eliminarPermisos(int idUsuario);
    public boolean consultarPermisoXIdUsuario(int idUsuario, int idPermiso);
}
