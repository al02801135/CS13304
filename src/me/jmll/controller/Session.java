package me.jmll.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class Session
 */
@WebServlet("/Sessions")
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LogManager.getLogger();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// this.getServletContext().setSessionTrackingModes(EnumSet.of(SessionTrackingMode.COOKIE));
		// Asigna atributos a la session
		doSession(request, response);
		
		// Incrementa o inicializa el contador de visitas
		doVisit(request, response);

		// doCookie
		doCookie(request, response);
		
		fakeException();
		// Forward
		request.getRequestDispatcher("/WEB-INF/views/session.jsp").forward(request, response);
		
	}
	
	private void fakeException(){
		try {
			throw new Exception("Excepción creada manualmente");
		}
		catch(Exception ex){
			log.error("fakeException: {}", ex.getMessage());
		}
	}
	private void doSession(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		// Obtiene la session actual
		HttpSession session = request.getSession();
		log.debug("Inicia doSession para {}", session.getId());
		// Crea un objeto Date a partir de un Long que es cuando se creo el cookie
		Date createTime = new Date(session.getCreationTime());
		// Obtiene la session ID (JSESSIONID)
		String sessionId = session.getId();
		// Obtiene el last Accessed time en objeto Date
		Date lastAccessedTime = new Date(session.getLastAccessedTime());
		// Obtiene max inactive interval (timeout) en segundos
		int maxInactiveInterval = session.getMaxInactiveInterval();

		// Guarda atributos en la session
		session.setAttribute("lastAccessedTime", lastAccessedTime);
		session.setAttribute("creationTime", createTime);
		session.setAttribute("sessionId", sessionId);
		session.setAttribute("maxInactiveInterval", maxInactiveInterval);
		log.debug("Termina doSession para {}", session.getId());
	}	
	
	private void doVisit(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// Incrementa o inicializa el contador de visitas
		if (session.getAttribute("visits") != null){
			// Reinicia contador si se encuentra el parámetro reset
			if (request.getParameter("reset") != null){
				session.setAttribute("visits", 0);
			} else {
				int visits = (int) session.getAttribute("visits");
				session.setAttribute("visits", visits+=1);
				}
		    }
		else{
		    session.setAttribute("visits", 1);
		}		
	}
	private void doCookie(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Crea nuevo Cookie
		Cookie cs13304 = new Cookie("CS13304", this.getServletContext().getInitParameter("tema"));
		cs13304.setComment(this.getServletContext().getInitParameter("tema"));
		// Asigna el path del cookie
		cs13304.setPath(request.getRequestURI());
		// Si es HTTP only
		cs13304.setHttpOnly(true);
		// Asigna máximo de 30 seg de vida
		cs13304.setMaxAge(30);
		//agrega cookie a la respuesta
		response.addCookie(cs13304);
		log.warn("Agregando cookie {} ({}) a {}", cs13304.getName(), cs13304.getComment(), request.getRemoteAddr());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
