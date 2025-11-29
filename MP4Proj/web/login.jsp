<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <section id="loginSection" class="fade-in max-w-4xl mx-auto mt-10">
        <div class="text-center mb-12">
            <h2 class="font-header text-4xl text-ustBlack mb-4">WELCOME THOMASIAN</h2>
            <p class="text-gray-600 text-lg">Select your role to access the CICS Grade Management System.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div onclick="window.location.href='portal.jsp?role=professor'" class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition-all transform hover:-translate-y-1 cursor-pointer group border-t-8 border-ustBlack overflow-hidden ring-1 ring-gray-100">
                <div class="p-10 text-center">
                    <div class="w-24 h-24 bg-ustGray rounded-full flex items-center justify-center mx-auto mb-6 group-hover:bg-ustBlack transition duration-300">
                        <i class="fas fa-chalkboard-teacher text-4xl text-gray-600 group-hover:text-ustGold"></i>
                    </div>
                    <h3 class="font-header text-2xl mb-2 tracking-wide">ACADEMIC STAFF</h3>
                    <p class="text-sm text-gray-500 mb-6">Input grades, manage class records, and publish student performance reports.</p>
                    <button class="w-full bg-ustBlack text-white px-6 py-3 rounded font-medium group-hover:bg-ustGold group-hover:text-ustBlack transition duration-300 shadow-md">
                        Enter Portal
                    </button>
                </div>
            </div>

            <div onclick="window.location.href='portal.jsp?role=student'" class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition-all transform hover:-translate-y-1 cursor-pointer group border-t-8 border-ustGold overflow-hidden ring-1 ring-gray-100">
                <div class="p-10 text-center">
                    <div class="w-24 h-24 bg-ustGray rounded-full flex items-center justify-center mx-auto mb-6 group-hover:bg-ustGold transition duration-300">
                        <i class="fas fa-user-graduate text-4xl text-gray-600 group-hover:text-ustBlack"></i>
                    </div>
                    <h3 class="font-header text-2xl mb-2 tracking-wide">STUDENT</h3>
                    <p class="text-sm text-gray-500 mb-6">View grades, check GWA, and access personalized learning recommendations.</p>
                    <button class="w-full bg-ustGold text-ustBlack px-6 py-3 rounded font-medium group-hover:bg-ustBlack group-hover:text-ustGold transition duration-300 shadow-md">
                        View Grades
                    </button>
                </div>
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>