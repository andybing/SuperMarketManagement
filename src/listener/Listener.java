package listener;

import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class CommonListener
 *
 */
@WebListener
public class Listener implements ServletContextListener, HttpSessionListener {

    /**
     * Default constructor. 
     */
    public Listener() {
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	ServletContext application = arg0.getServletContext();
    	String ctx = application.getContextPath();
    	application.setAttribute("ctx", ctx);
    	application.setAttribute("res", ctx+"/resources");
    	application.setAttribute("css", ctx+"/resources/css");
    	application.setAttribute("js", ctx+"/resources/js");
    	application.setAttribute("img", ctx+"/resources/picture");
    	application.setAttribute("counter", new AtomicInteger(0));
    }

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
        HttpSession session = arg0.getSession();
        ServletContext application = session.getServletContext();
        if(session.getAttribute("name") != null){ //是登陆状态，则计数减1
            AtomicInteger counter = (AtomicInteger)application.getAttribute("counter");
            counter.decrementAndGet();
        }
    }
	
}
