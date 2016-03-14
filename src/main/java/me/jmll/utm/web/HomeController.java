package me.jmll.utm.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import me.jmll.utm.model.Cliente;

/**
 * Maneja requests
 */
@Controller
public class HomeController {
	private HelloService helloService;
	private static final Logger logger = LogManager.getLogger(HomeController.class);
	
	/**
	 * Simplemente selecciona el template home.jsp para
	 * interpretarlo como respuesta
	 */
	@RequestMapping(value = "/",
					method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	/**
	 * Crea un Response Body con un servicio en específico.
	 */
	@ResponseBody
	@RequestMapping(value = "/", 
					method = RequestMethod.GET, 
					params = {"name"})
	public String homeName(Locale locale, Model model,
						   @RequestParam("name") String name) {
		logger.info("Welcome home! {} The client locale is {}.", name, locale);
		return helloService.getHello(name);
	}
	
	/**
	 * Utiliza Http Entities
	 * */
	 @RequestMapping("/helloWorld")
	 public HttpEntity<String> helloWorld() {
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.set("Cache-Control", "no-cache");
	   logger.info("Setting Cache-Control Header to no-cache with HttpEntity");
	   return new HttpEntity<String>("Hello Awesome World", responseHeaders);
	 }

	 /**
	 * Utiliza Response Entities
	 * */
	 @RequestMapping("/helloWorld2")
	 public ResponseEntity<String> helloWorldE() {
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.set("Cache-Control", "no-cache");
	   logger.info("Setting Cache-Control Header to no-cache with ResponseEntity");
	   ResponseEntity<String> responseEntity = new ResponseEntity<String>(
			   "Hello Awesome World", responseHeaders, HttpStatus.OK);
	   return responseEntity;
	 }
	 
	 /**
	  * Múltiples representaciones
	  *  con MesssageConverters
	  * */
	 @RequestMapping(value={"cliente/{id}"})
	 @ResponseBody
	 public Cliente getCliente(@PathVariable("id") long id){
		 Cliente cliente = new Cliente();
		 cliente.setId(id);
		 cliente.setNombre("John Doe");
		 cliente.setDireccion("42 Java Dr");
		 cliente.setTelefono("123-456-7890");
		 logger.info("Requesting Client {}.", id);
		 return cliente;
	 }
	 
	 /**
	  * Resolución de vista a 
	  * /WEB-INF/views/cliente/perfil.jsp
	  * */
	 @RequestMapping(value={"cliente/perfil"})
	 @ModelAttribute("cliente")
	 public Cliente clienteActual(){
		 Cliente cliente = new Cliente();
		 cliente.setId(12345L);
		 cliente.setNombre("John Doe");
		 cliente.setDireccion("42 Java Dr");
		 cliente.setTelefono("123-456-7890");
		 logger.info("Requesting Client {}.", cliente.getId());
		 return cliente;
	 }
	 
	 /**
	  * Usa RedirectView
	  * */
	 @RequestMapping("/index.html")
	 public View home(Map<String, Object> model){
		 model.put("source", "index.html");
		 logger.info("Requesting Request Mapping /index.html and using Redirect View");
		 return new RedirectView("/home?source={source}", true);
	 }
	 
	/**
	 * Inyecta HelloService en HomeController 
	 * */
	@Inject
	public void setHelloService(HelloService helloService)
    {
        this.helloService = helloService;
    }
	
}
