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

        String[] subjects = request.getParameterValues("subject[]");
        String[] units = request.getParameterValues("units[]");
        String[] grades = request.getParameterValues("grade[]");

        List<Grade> gradeList = new ArrayList<>();
        
        if (subjects != null) {
            for (int i = 0; i < subjects.length; i++) {
                try {
                    String sName = subjects[i];
                    double sUnits = Double.parseDouble(units[i]);
                    double sGrade = Double.parseDouble(grades[i]);
                    
                    gradeList.add(new Grade(sName, sUnits, sGrade));
                } catch (NumberFormatException e) {
                    continue;
                }
            }
        }

        // Save to Global Application Scope
        getServletContext().setAttribute("gradesDB", gradeList);

        response.sendRedirect("portal.jsp?role=professor&status=posted");
    }
}