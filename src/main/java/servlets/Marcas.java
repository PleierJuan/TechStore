package servlets;

import beanDTO.MarcasDTO;
import datos.MarcasJDBC;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.Integer.parseInt;

@WebServlet(name = "Marcas", urlPatterns = {"/Marcas"})
public class Marcas extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        if (!request.getParameter("idMarcas").equals("")){
            MarcasDTO marca= new MarcasDTO(parseInt(request.getParameter("idMarcas")), request.getParameter("nomMar"), request.getParameter("desc"), Float.parseFloat(request.getParameter("precio")), request.getParameter("img")); 
            MarcasJDBC marcaMetodos = new MarcasJDBC();
            marcaMetodos.updatearMarcas(marca);
            
            HttpSession sesion = request.getSession();
            
            response.sendRedirect("marcas.jsp");
        }
        else {
            String nomMar = request.getParameter("nomMar");
            MarcasDTO marca = new MarcasDTO(nomMar, request.getParameter("desc"), Float.parseFloat(request.getParameter("precio")), request.getParameter("img"));
            MarcasJDBC marcaMetodos = new MarcasJDBC();
            marcaMetodos.insertaMarcas(marca);
            
            HttpSession sesion = request.getSession();
            
            response.sendRedirect("marcas.jsp");
        }
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

            int idMarca = parseInt(request.getParameter("idMarca"));
            MarcasDTO marca = new MarcasDTO(); 
            marca.setIdMarca(idMarca); 
            MarcasJDBC marcaMetodos = new MarcasJDBC();
            marcaMetodos.deletearMarcas(marca);
            
            HttpSession sesion = request.getSession();
            
            response.sendRedirect("marcas.jsp");

    }
}
