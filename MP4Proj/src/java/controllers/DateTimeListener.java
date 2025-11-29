package controllers;

import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DateTimeListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        context.setAttribute("appStartTime", new Date().toString());
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}