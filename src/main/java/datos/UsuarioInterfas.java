package datos;

import beanDTO.UsuarioDTO;
import java.util.List;


public interface UsuarioInterfas {
    
    public List<UsuarioDTO> consultaUsuarios();
    public UsuarioDTO loginUsuario (UsuarioDTO usuario);
    public int altaUsuario(UsuarioDTO usuario);
    public int bajaUsuario(int idUsuario);
    public int cambioUsuario(UsuarioDTO usuario); 
    public int validaUsuario(String nombreUsuario);
}
