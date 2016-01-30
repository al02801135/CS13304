package me.jmll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostParams
 */
@WebServlet(description = "HTTP Post Params Servlet", urlPatterns = { "/PostParams" })
public class PostParams extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostParams() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Obtener parámetros
		String param1 = request.getParameter("param1");
		String param2 = request.getParameter("param2");
		
		// Validar parámetros y agregarlos al output stream
		if (param1 != null)
			response.getWriter().append("\nparam1: ").append(request.getParameter("param1"));
		
		if (param2 != null)
			response.getWriter().append("\nparam2: ").append(request.getParameter("param2"));
	}

}
