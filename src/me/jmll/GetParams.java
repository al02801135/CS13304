package me.jmll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetParams
 */
@WebServlet(description = "HTTP Get Params Servlet", urlPatterns = {"/GetParams"})
public class GetParams extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetParams() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtener parámetros
		String param1 = request.getParameter("param1");
		String param2 = request.getParameter("param2");
		
		// Validar parámetros y agregarlos al output stream
		if (param1 != null)
			response.getWriter().append("\nparam1: ").append(request.getParameter("param1"));
		
		if (param2 != null)
			response.getWriter().append("\nparam2: ").append(request.getParameter("param2"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
