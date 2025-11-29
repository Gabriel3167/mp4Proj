<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<section class="fade-in flex flex-col items-center justify-center min-h-[60vh] text-center px-4">
    <div class="bg-white rounded-lg shadow-xl p-10 max-w-lg border-t-8 border-ustGold ring-1 ring-gray-100">
        <h1 class="font-header text-4xl text-ustBlack mb-4">401 - Authorization Required</h1>
        <p class="text-gray-600 mb-8 text-lg">
            Access to this resource is denied. Please log in to continue.
        </p>
        <div class="flex flex-col gap-3">
            <a href="login.jsp" class="bg-ustGold text-ustBlack font-bold py-3 px-6 rounded hover:bg-ustBlack hover:text-ustGold transition duration-300 shadow-md">
                Go to Login
            </a>
        </div>
    </div>
</section>

<%@include file="footer.jsp" %>