/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 *
 * @author kiko
 */
public class DateTimeListener implements ServletContextListener {
    
    // When the Web App starts up
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        // Store the inital application start time in the context
        context.setAttribute("appStartTime", new Date().toString());
        // You can also start a background thread here for current time updates,
        // but for simplicity, the initial time might suffice for this step.
    }
    
    // When the Web App Shuts down
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Optional: Cleanup resources if necessary
    }
}
