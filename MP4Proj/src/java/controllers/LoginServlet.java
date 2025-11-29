package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    // Hardcoded users for demonstration (In a real app, use a database)
    private static final String INS_USER = "prof123";
    private static final String STU_USER = "student456";
    private static final String PASSWORD = "password"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        // 1. Validate Credentials
        if (password.equals(PASSWORD)) {

            // 2. Create/Get Session Object
            HttpSession session = request.getSession(true);

            // 3. Set Session Attributes and Redirect based on User Type
            if ("instructor".equals(userType) && username.equals(INS_USER)) {
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("userType", "instructor");
                session.setAttribute("username", username);
                // Absolute Path Example (5 pts)
                response.sendRedirect(request.getContextPath() + "/instructor/dashboard.jsp"); 

            } else if ("student".equals(userType) && username.equals(STU_USER)) {
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("userType", "student");
                session.setAttribute("username", username);
                // Absolute Path Example (5 pts)
                response.sendRedirect(request.getContextPath() + "/student/gradeview.jsp");

            } else {
                // Invalid user/type combination
                request.setAttribute("error", "Invalid username for selected user type.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Invalid Password
            request.setAttribute("error", "Invalid password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}