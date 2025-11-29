package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
    
    // We handle GET requests because a link/window.location is a GET request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Fetch the existing session if it exists
        HttpSession session = request.getSession(false);
        
        // 2. Destroy it
        if (session != null) {
            session.invalidate();
        }
        
        // 3. Set Cache Control Headers (Prevents Back Button Login)
        // This effectively "clears" the browser cache for this page
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // 4. Redirect the user back to the login screen
        response.sendRedirect("login.jsp");
    }
}