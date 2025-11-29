<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@include file="header.jsp" %>

<section class="fade-in flex flex-col items-center justify-center min-h-[60vh] text-center px-4">
    <div class="bg-white rounded-lg shadow-xl p-10 max-w-2xl border-t-8 border-red-600 ring-1 ring-gray-100">
        <h1 class="font-header text-4xl text-ustBlack mb-2">500 - System Error</h1>
        <p class="font-bold text-red-600 mb-4">Java Exception Detected</p>
        <p class="text-gray-600 mb-6 text-lg">
            Our system encountered an unexpected condition. Please try again later.
        </p>

        <div class="mb-8 text-left">
            <button onclick="toggleErrorDetails()" class="text-sm text-gray-400 hover:text-ustBlack underline focus:outline-none mb-2">
                Show Technical Details
            </button>
            <div id="errorDetails" class="hidden bg-gray-100 p-4 rounded text-xs font-mono overflow-x-auto border border-gray-300 text-red-800 max-h-64 overflow-y-auto">
                <strong>Exception:</strong> <%= exception != null ? exception.getClass().getName() : "Unknown" %><br/>
                <strong>Message:</strong> <%= exception != null ? exception.getMessage() : "No message available" %><br/>
                <br/>
                <strong>Stack Trace:</strong><br/>
                <% 
                    if (exception != null) {
                        java.io.StringWriter sw = new java.io.StringWriter();
                        java.io.PrintWriter pw = new java.io.PrintWriter(sw);
                        exception.printStackTrace(pw);
                        out.print(sw.toString().replace(System.lineSeparator(), "<br/>"));
                    }
                %>
            </div>
        </div>

        <div class="flex justify-center gap-4">
            <a href="index.html" class="bg-ustBlack text-white font-bold py-3 px-8 rounded hover:bg-ustGold hover:text-ustBlack transition duration-300 shadow-md">
                Restart Application
            </a>
        </div>
    </div>
</section>

<script>
    function toggleErrorDetails() {
        const details = document.getElementById('errorDetails');
        if (details.classList.contains('hidden')) {
            details.classList.remove('hidden');
        } else {
            details.classList.add('hidden');
        }
    }
</script>

<%@include file="footer.jsp" %>