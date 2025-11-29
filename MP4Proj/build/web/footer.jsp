<%--
    File: footer.jsp
    Purpose: Displays the required project identifier and current date/time along with standard copyright information.
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    SimpleDateFormat formatter = new SimpleDateFormat("EEEE, MMMM dd, yyyy, hh:mm:ss a z");
    String currentDateTime = formatter.format(new Date());
%>

</main>

<footer class="bg-ustBlack text-gray-600 py-6 mt-auto text-center text-xs border-t border-gray-800">
    
    <div class="mb-3 border-b border-gray-700 pb-2 mx-auto max-w-sm">
        <p class="text-ustGold font-bold text-sm uppercase tracking-wider">
            MP4 | <%= currentDateTime %>
        </p>
    </div>

    <p>UNIVERSITY OF SANTO TOMAS &copy; 2025</p>
    <p class="mt-1">College of Information and Computing Sciences</p>
</footer>
    
</body>
</html>