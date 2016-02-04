package me.jmll;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProcesaSaludo
 */
@WebServlet({ "/Hola", "/Hola.do" })
public class ProcesaSaludo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcesaSaludo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtiene parámetros de la solcitud
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String ciudad = request.getParameter("ciudad");
		// Obtiene el context init parameter saludo
		String saludo = request.getServletContext().getInitParameter("saludo");
		if (nombre != null && apellido != null && ciudad != null ){
			// Define un formateo de fecha
			DateFormat formatoFecha = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			// Obtiene la referencia un objeto de tipo Fecha
			Date fecha = new Date();
	
			// Se asignan atributos a la solicitud 
			request.setAttribute("fecha", formatoFecha.format(fecha).toString());
			request.setAttribute("saludo", String.format("%s %s %s de %s!", saludo, nombre, apellido, ciudad));
			// Obtiene Requestdispatcher a 
			request.getRequestDispatcher("/WEB-INF/views/Saludo.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
