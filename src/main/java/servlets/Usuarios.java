package servlets;

import beanDTO.UsuarioDTO;
import beanDTO.PermisoDTO;
import datos.PermisosJDBC;
import datos.UsuarioJDBC;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.Integer.parseInt;

/**
 *
 * @author admin
 */
@WebServlet("/Usuarios")
public class Usuarios extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomUsuario = null;
        UsuarioJDBC usuarioMetodos = new UsuarioJDBC();
        
        //GUARDAR USUARIO
        if (request.getParameter("gaurdarUsuario") != null) {
            if (request.getParameter("nomUsuario") != null) {
                nomUsuario = request.getParameter("nomUsuario");
                int existe = usuarioMetodos.validaUsuario(nomUsuario);
                if (existe == 0) {
                    guardarUsuario(request);
                }
            }
            
        }
        
        //EDITAR USUARIO
        if (request.getParameter("editarUsuario") != null) {
            editarUsuario(request);
            
        }

        //AGREGAR EDITAR PERMISOS
        if (request.getParameter("permisos") != null) {
            administrarPermisos(request); 
            
        }
        
        response.sendRedirect("usuarios.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("idUsuario: " + request.getParameter("idUsuario"));
        int idUsuario = 0;
        UsuarioJDBC usuarioMetodos = new UsuarioJDBC();
        PermisosJDBC permisosMetodos = new PermisosJDBC();
        if (request.getParameter("idUsuario") != null) {
            idUsuario = parseInt(request.getParameter("idUsuario"));
            permisosMetodos.eliminarPermisos(idUsuario);
            usuarioMetodos.bajaUsuario(idUsuario);
        }
        HttpSession sesion = request.getSession();
        response.sendRedirect("usuarios.jsp");
    }
    
    private void administrarPermisos(HttpServletRequest request) {
        
        int idUsuario = 0;
        int eliminados = 0;
        int idPermisoUsuario = 0;
        PermisoDTO permisos = null;
        
        if (request.getParameter("idUsuarioPermisos") != null) {
            idUsuario = parseInt(request.getParameter("idUsuarioPermisos"));
            eliminados = new PermisosJDBC().eliminarPermisos(idUsuario);
            
            if (request.getParameter("administrarUsuario") != null) {
                permisos = new PermisoDTO(idUsuario,1);
                idPermisoUsuario = new PermisosJDBC().insertarPermiso(permisos);
            }            
            if (request.getParameter("inventario") != null) {
                permisos = new PermisoDTO(idUsuario,parseInt(request.getParameter("inventario")));
                idPermisoUsuario = new PermisosJDBC().insertarPermiso(permisos);
            }
            if (request.getParameter("administrarCatalogos") != null) {
                permisos = new PermisoDTO(idUsuario,4);
                idPermisoUsuario = new PermisosJDBC().insertarPermiso(permisos);
            }
            
            HttpSession sesion = request.getSession();
                   
            
        }

    }
    
    private void editarUsuario(HttpServletRequest request){
        
        String apellidoM = null;
        String apellidoP = null;
        String nombre = null;
        String nomUsuario = null;
        String contrasena = null;
        String correo = null;
        int idUsuario = 0;
        UsuarioDTO usuario = null;

        UsuarioJDBC usuarioMetodos = new UsuarioJDBC();
        
        if (request.getParameter("idUsuario") != null) {
                idUsuario = parseInt(request.getParameter("idUsuario"));
            }
            if (request.getParameter("nombreE") != null) {
                nombre = request.getParameter("nombreE");
            }
            if (request.getParameter("apellidoPE") != null) {
                apellidoP = request.getParameter("apellidoPE");
            }
            if (request.getParameter("apellidoME") != null) {
                apellidoM = request.getParameter("apellidoME");
            }
            if (request.getParameter("nomUsuarioE") != null) {
                nomUsuario = request.getParameter("nomUsuarioE");
            }
            if (request.getParameter("contrasenaE") != null) {
                contrasena = request.getParameter("contrasenaE");
            }
            if (request.getParameter("correoE") != null) {
                correo = request.getParameter("correoE");
            }
            usuario = new UsuarioDTO(idUsuario, nombre, apellidoP, apellidoM, nomUsuario, contrasena, correo);
            System.out.println(usuario.toString());
            usuarioMetodos.cambioUsuario(usuario);
            
            HttpSession sesion = request.getSession();
            
    }

    private void guardarUsuario(HttpServletRequest request) {

        String apellidoM = null;
        String apellidoP = null;
        String nombre = null;
        String nomUsuario = null;
        String contrasena = null;
        String correo = null;

        UsuarioDTO usuario = null;

        UsuarioJDBC usuarioMetodos = new UsuarioJDBC();
        //GUARDAR USUARIO

        if (request.getParameter("nombre") != null) {
            nombre = request.getParameter("nombre");
        }
        if (request.getParameter("apellidoP") != null) {
            apellidoP = request.getParameter("apellidoP");
        }
        if (request.getParameter("apellidoM") != null) {
            apellidoM = request.getParameter("apellidoM");
        }
        if (request.getParameter("nomUsuario") != null) {
            nomUsuario = request.getParameter("nomUsuario");
        }
        if (request.getParameter("contrasena") != null) {
            contrasena = request.getParameter("contrasena");
        }
        if (request.getParameter("correo") != null) {
            correo = request.getParameter("correo");
        }
        usuario = new UsuarioDTO(nombre, apellidoP, apellidoM, nomUsuario, contrasena, correo);
        usuarioMetodos.altaUsuario(usuario);
        
        HttpSession sesion = request.getSession();

    }
    
    

}
