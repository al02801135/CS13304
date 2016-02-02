package me.jmll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Saludo
 */
@WebServlet({ "/Saludo", "/saludo" })
public class Saludo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saludo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String nombre = request.getParameter("nombre");
		out.append("<!DOCTYPE html>\n");
		out.append("<html>\n");
		out.append("\t <head>");
		out.append("\t\t <title> Saludo </title>");
		out.append("\t</head>");
		out.append("\t<body>");
		out.append("\t<h3> Hola " + nombre + ", </h3>");
		out.append("\t\t <p> Este es un servlet que imprime contenido en HTML </p>");
		out.append("\t</body>");
		out.append("</html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
