<%@page import="datos.PermisosJDBC"%>
<%@page import="beanDTO.PermisoDTO"%>
<%@page import="java.util.List"%>
<%
    String resultado = "";
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    List<PermisoDTO> permisos = new PermisosJDBC().consultaPermisosUsuario(idUsuario);
    for (PermisoDTO permiso: permisos){
        resultado += "|" +permiso.getIdPermisoDescripcion() ;
        
    }
   
%>
<%= resultado%>