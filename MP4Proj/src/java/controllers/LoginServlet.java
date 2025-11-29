package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    private static final String INS_USER = "prof123";
    private static final String INS_PASSWORD = "profpassword";
    private static final String STU_USER = "student456";
    private static final String STU_PASSWORD = "stupassword";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
                
        HttpSession session = request.getSession(true);

        if ("instructor".equals(userType) && username.equals(INS_USER) && INS_PASSWORD.equals(password)) {
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userType", "instructor");
            session.setAttribute("username", username);
            
            response.sendRedirect("portal.jsp?role=professor"); 

        } else if ("student".equals(userType) && username.equals(STU_USER) && STU_PASSWORD.equals(password)) {
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userType", "student");
            session.setAttribute("username", username);
            
            response.sendRedirect("portal.jsp?role=student");

        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
