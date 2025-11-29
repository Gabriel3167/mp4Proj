<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<section class="fade-in flex flex-col items-center justify-center min-h-[60vh] text-center px-4">
    <div class="bg-white rounded-lg shadow-xl p-10 max-w-lg border-t-8 border-red-500 ring-1 ring-gray-100">
        <h1 class="font-header text-4xl text-ustBlack mb-4">403 - Forbidden</h1>
        <p class="text-gray-600 mb-8 text-lg">
            You do not have permission to access this resource.
        </p>
        <div class="flex flex-col gap-3">
            <button onclick="window.history.back()" class="bg-gray-200 text-gray-700 font-bold py-3 px-6 rounded hover:bg-gray-300 transition duration-300">
                Go Back
            </button>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>