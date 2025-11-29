package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GradeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve raw arrays from the HTML form
        String[] subjects = request.getParameterValues("subject[]");
        String[] units = request.getParameterValues("units[]");
        String[] grades = request.getParameterValues("grade[]");

        // 2. Process data into a List of objects
        List<Grade> gradeList = new ArrayList<>();
        
        if (subjects != null) {
            for (int i = 0; i < subjects.length; i++) {
                try {
                    String sName = subjects[i];
                    double sUnits = Double.parseDouble(units[i]);
                    double sGrade = Double.parseDouble(grades[i]);
                    
                    // Add to list
                    gradeList.add(new Grade(sName, sUnits, sGrade));
                } catch (NumberFormatException e) {
                    // Skip invalid rows
                    continue;
                }
            }
        }

        // 3. Save to Global Application Scope (This makes it persist!)
        // "gradesDB" will be the key we look for in the JSP
        getServletContext().setAttribute("gradesDB", gradeList);

        // 4. Redirect back to portal (Professor view)
        // Adding a success flag to show an alert
        response.sendRedirect("portal.jsp?role=professor&status=posted");
    }
}