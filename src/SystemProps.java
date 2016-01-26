

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SystemProps
 */
@WebServlet({"/SystemProps", "/"})
public class SystemProps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SystemProps() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Web app: ").append(request.getContextPath()).append("\n");
		// Obtener parámetro key
		String keyParam = request.getParameter("key");
		PrintWriter out = response.getWriter();

		// Validar si el parámetro key existe en la solicitud
		if (keyParam != null){
			out.println(keyParam + ": " + System.getProperty(keyParam));	
		} else{
			// de lo contrario imprimir todas las propiedades del sistema
			Properties p = System.getProperties();
			Enumeration keys = p.keys();
			while (keys.hasMoreElements()) {
				  String key = (String) keys.nextElement();
				  String value = (String)p.get(key);
				  out.println(key + ": " + value );
				}
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
