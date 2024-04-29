package servlets;

import beanDTO.PermisoDTO;
import beanDTO.UsuarioDTO;
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
import java.util.List;


@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomUsuario = null;
        String contrasena = null;
        UsuarioJDBC usuarioMet = new UsuarioJDBC();
        UsuarioDTO usuario = new UsuarioDTO();
        HttpSession sesion = request.getSession();
        
        if (request.getParameter("usuario") != null) {

            nomUsuario = request.getParameter("usuario");
            contrasena = request.getParameter("contrasena");
            usuario.setNomUsuario(nomUsuario);
            usuario.setContrasena(contrasena);
            //System.out.println("usuario " + nomUsuario + "contrasena " + contrasena);
        }
        usuario = usuarioMet.loginUsuario(usuario);
        if (usuario != null) {
            
            //System.out.println("Login correcto " + usuario.toString());
            sesion.setAttribute("idUsuario", usuario.getIdUsuario());
            sesion.setAttribute("nombre", usuario.getNombre());
            sesion.setAttribute("apellidoP", usuario.getApellidoP());
            sesion.setAttribute("apellidoM", usuario.getApellidoM());
            sesion.setAttribute("nomUsuario", usuario.getNomUsuario());
            sesion.setAttribute("contrasena", usuario.getContrasena());
            sesion.setAttribute("correo", usuario.getCorreo());
            sesion.setAttribute("salt", usuario.getSalt());
            sesion.setAttribute("activo", usuario.getActivo());
            //permisos
            sesion.setAttribute("permisos",new PermisosJDBC().consultaPermisosUsuario(usuario.getIdUsuario()));
            List<PermisoDTO> permisos = new PermisosJDBC().consultaPermisosUsuario(usuario.getIdUsuario());
            
            sesion.setAttribute("permiso1",false);//Administrar usuarios
            sesion.setAttribute("permiso2",false);//Administrar inventario
            sesion.setAttribute("permiso3",false);//Consultar inventario
            sesion.setAttribute("permiso4",false);//Administrar catalogos
            
            for(PermisoDTO permiso: permisos){
                System.out.println("permiso " + permiso.getIdPermisoDescripcion());
                if(permiso.getIdPermisoDescripcion()==1){
                    sesion.setAttribute("permiso1",true);
                }
                if(permiso.getIdPermisoDescripcion()==2){
                    sesion.setAttribute("permiso2",true);
                }
                if(permiso.getIdPermisoDescripcion()==3){
                    sesion.setAttribute("permiso3",true);
                }
                if(permiso.getIdPermisoDescripcion()==4){
                    //System.out.println("permiso4 cargado ");
                    sesion.setAttribute("permiso4",true);
                    //System.out.println("permiso4 dato: " + sesion.getAttribute("permiso4"));
                }
            }
            

            if (sesion.getAttribute("urlSinSesion") != null) {
                
                response.sendRedirect((String) sesion.getAttribute("urlSinSesion"));
            } else {               
                
                response.sendRedirect("inicio.jsp");
            }
        } else {
            //System.out.println("Login incorrecto"); 
            //LogsDTO loogs = new LogsDTO((0),"Login", "Inicio de Sesion Fallido: " + nomUsuario);
            //new LogsJDBC().insertaLogs(loogs);
            response.sendRedirect("index.jsp?error=Login incorrecto");
        }
    }
    
    

}
