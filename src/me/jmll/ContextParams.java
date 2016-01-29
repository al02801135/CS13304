package me.jmll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContextParams
 */
@WebServlet(name="ContextParams", urlPatterns={"/contextParams"})
public class ContextParams extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContextParams() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Se obtiene referencia al contexto del servlet
		ServletContext context = this.getServletContext();
		// 2. Se obtiene la referencia al objeto output stream de
		// request
		PrintWriter out = response.getWriter();
		out.append("Context params: \n");
		// 3. Con el método getInitParameter parte del context
		// se obtienen los parámetros de contexto 
		out.append("dbHost: ").append(context.getInitParameter("dbHost"));
		out.append("; dbPort: ").append(context.getInitParameter("dbPort"));
		out.append("; dbUser: ").append(context.getInitParameter("dbUser"));
		out.append("\nInit params: \n");
		// 4. Con el objeto como referencia this = este objeto
		// se obtiene el parámetro de inicio
		out.append("dbHostServlet: ").append(this.getInitParameter("dbHostServlet"));
		out.append("; dbPortServlet: ").append(this.getInitParameter("dbPortServlet"));
	}

}
