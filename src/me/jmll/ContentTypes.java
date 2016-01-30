package me.jmll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContentTypes
 */
@WebServlet("/ContentTypes")
public class ContentTypes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContentTypes() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Especifica la codificación del contenido
		response.setCharacterEncoding("UTF-8");
		// 2. Obtiene el Writer del objeto response
		PrintWriter out = response.getWriter();
		// 3. Obtiene le parámetro type
		String type = request.getParameter("type");
		// 4. Valida si se encuentra en la solicitud
		if (type != null) {
			// 5. Especifica el contenido como XML
			if (type.equals("xml")) {
				response.setContentType("application/xml");
				out.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?><web-app><app1>CS13304</app1></web-app>");
			// 6. Especifica el contenido como HTML
			} else if (type.equals("html")) {
				response.setContentType("text/html");
				out.append("<html><body><h3>Contenido HTML</h3><p>Text en HTML</p></body></html>");
			// 7. Especifica el contenido como XML
			} else if (type.equals("json")) {
				response.setContentType("application/json");
				out.append("{\"json\": {\"x\": 11}}");
			// 8. Por defecto el contenido es texto
			} else {
				response.setContentType("text");
				out.append("Texto");
			}
		} else {
			out.println("Parámetro param es requerido en la solicitud ?type=");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
