package me.jmll.utm.config;

import java.util.Properties;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Controller;
import org.springframework.util.ErrorHandler;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

/**
 * Establece el escaneo de componentes del paquete me.jmll.utm.web con filtro de
 * exclusión org.springframework.stereotype.Controller, es
 * decir @Repository, @Service, @Component, etc. Centra la lógica de negocio en
 * el contexto de la aplicación.
 */
@Configuration
/**
 * 1 (a) configurar RootContextConfig para que soporte
 * ejecución de métodos asíncronos y programados.
 * */
// Escribe tu código aquí {

// }
@ComponentScan(
		basePackageClasses = {
			   		me.jmll.utm.web.ComponentPackageMaker.class,
			   		me.jmll.utm.repository.ComponentPackageMaker.class,
			   		me.jmll.utm.service.ComponentPackageMaker.class,
			   		me.jmll.utm.component.ComponentPackageMaker.class}, 
		excludeFilters = @ComponentScan.Filter(Controller.class) )
public class RootContextConfig implements AsyncConfigurer, SchedulingConfigurer {
	private static final Logger logger = LogManager.getLogger(); 
	private static final Logger schedulingLogger = LogManager.getLogger(String.format("%s-schedue", logger.getName()));
	/**
	 * Busca y registra los módulos para serialización y deserialización
	 */
	@Bean
	public ObjectMapper objectMapper() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.findAndRegisterModules();
		mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
		mapper.configure(DeserializationFeature.ADJUST_DATES_TO_CONTEXT_TIME_ZONE, false);
		return mapper;
	}

	/**
	 * Busca paquetes con entidades anotadas con XML
	 */
	@Bean
	public Jaxb2Marshaller jaxb2Marshaller() {
		Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
		marshaller.setPackagesToScan(new String[] { "me.jmll.utm.model" });
		return marshaller;
	}

	/**
	 * Configura Executor para ejecución de métodos programados
	 * */
	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		TaskScheduler taskScheduler = this.taskScheduler();
		taskRegistrar.setTaskScheduler(taskScheduler);
	}
	
	/**
	 * Configura Executor para ejecución de métodos asíncronos
	 * */
	@Override
	public Executor getAsyncExecutor() {
		Executor executor = this.taskScheduler();
		return executor;
	}
	
	/**
	 * Configura taskScheduler con un pool de 10 elementos,
	 * prefijo "worker-", tiempo de espera de apagado de 60 seg
	 * y espera de terminación de tarea antes de completar. 
	 * Configura handlers para errores.
	 * */
	@Bean
	public ThreadPoolTaskScheduler taskScheduler() {
		/**
		 * 1 (b) Configurar ThreadPoolTaskScheduler con un tamaño de pool
		 * de 20, con prefijo en los threads "job-", errorHandler y
		 * ExecutionHandler para que registren eventos en shcedulingLogger 
		 * */
		ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
		// Escribe tu código aquí {
		
		// }
		return taskScheduler;
	}

	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Bean
	public JavaMailSender javaMailSender() {
		/**
		 *  5 (a) Utiliza Gmail como servidor de correo para enviar
		 *  email en el servicio NotificationServiceImpl que consume 
		 *  el bean mailSender. Agregar usuario y password de una cuenta
		 *  genérica
		 * */
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	    // Escribe tu código aquí {
	    
	    // }
	    Properties mailProperties = mailSender.getJavaMailProperties();
	    mailProperties.put("mail.transport.protocol", "smtp");
	    mailProperties.put("mail.smtp.auth", "true");
	    mailProperties.put("mail.smtp.starttls.enable", "true");
	    mailProperties.put("mail.debug", "false");
	    return mailSender;
	}
}
