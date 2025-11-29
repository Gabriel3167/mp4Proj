<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <section id="loginContainer" class="fade-in max-w-4xl mx-auto mt-10 min-h-[500px]">
        
        <!-- STATE 1: ROLE SELECTION -->
        <div id="roleSelection" class="transition-all duration-300">
            <div class="text-center mb-12">
                <h2 class="font-header text-4xl text-ustBlack mb-4">WELCOME THOMASIAN</h2>
                <p class="text-gray-600 text-lg">Select your role to access the CICS Grade Management System.</p>
                
                <%-- Display Error Messages from Servlet if login fails --%>
                <% if (request.getAttribute("error") != null) { %>
                    <div class="mt-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-4 max-w-md mx-auto text-left" role="alert">
                        <p class="font-bold">Login Failed</p>
                        <p><%= request.getAttribute("error") %></p>
                    </div>
                <% } %>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 px-4">
                <!-- PROFESSOR CARD -->
                <div onclick="showLoginForm('instructor')" class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition-all transform hover:-translate-y-1 cursor-pointer group border-t-8 border-ustBlack overflow-hidden ring-1 ring-gray-100">
                    <div class="p-10 text-center">
                        <div class="w-24 h-24 bg-ustGray rounded-full flex items-center justify-center mx-auto mb-6 group-hover:bg-ustBlack transition duration-300">
                            <i class="fas fa-chalkboard-teacher text-4xl text-gray-600 group-hover:text-ustGold"></i>
                        </div>
                        <h3 class="font-header text-2xl mb-2 tracking-wide">ACADEMIC STAFF</h3>
                        <p class="text-sm text-gray-500 mb-6">Input grades, manage class records, and publish student performance reports.</p>
                        <button class="w-full bg-ustBlack text-white px-6 py-3 rounded font-medium group-hover:bg-ustGold group-hover:text-ustBlack transition duration-300 shadow-md">
                            Login as Faculty
                        </button>
                    </div>
                </div>

                <!-- STUDENT CARD -->
                <div onclick="showLoginForm('student')" class="bg-white rounded-xl shadow-lg hover:shadow-2xl transition-all transform hover:-translate-y-1 cursor-pointer group border-t-8 border-ustGold overflow-hidden ring-1 ring-gray-100">
                    <div class="p-10 text-center">
                        <div class="w-24 h-24 bg-ustGray rounded-full flex items-center justify-center mx-auto mb-6 group-hover:bg-ustGold transition duration-300">
                            <i class="fas fa-user-graduate text-4xl text-gray-600 group-hover:text-ustBlack"></i>
                        </div>
                        <h3 class="font-header text-2xl mb-2 tracking-wide">STUDENT</h3>
                        <p class="text-sm text-gray-500 mb-6">View grades, check GWA, and access personalized learning recommendations.</p>
                        <button class="w-full bg-ustGold text-ustBlack px-6 py-3 rounded font-medium group-hover:bg-ustBlack group-hover:text-ustGold transition duration-300 shadow-md">
                            Login as Student
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- STATE 2: LOGIN FORM (Hidden by default) -->
        <div id="loginFormSection" class="hidden transition-all duration-300 max-w-md mx-auto bg-white rounded-xl shadow-xl overflow-hidden border border-gray-200">
            <div id="formHeader" class="bg-ustBlack p-6 border-b-4 border-ustGold">
                <!-- Added ID backBtn for targeting -->
                <button id="backBtn" onclick="showRoleSelection()" class="text-gray-400 hover:text-white text-sm mb-4 flex items-center gap-2 transition">
                    <i class="fas fa-arrow-left"></i> Back to Selection
                </button>
                <h3 id="loginTitle" class="text-2xl font-header text-white tracking-wide">LOGIN</h3>
                <!-- Added ID secureText for targeting -->
                <p id="secureText" class="text-gray-400 text-xs uppercase tracking-wider mt-1">Secure Access</p>
            </div>
            
            <form action="LoginServlet" method="POST" class="p-8 space-y-6">
                <!-- Hidden input to tell Servlet which user type is logging in -->
                <input type="hidden" id="userTypeInput" name="userType" value="">

                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                        Username
                    </label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400">
                            <i class="fas fa-user"></i>
                        </span>
                        <input class="w-full border border-gray-300 rounded pl-10 pr-3 py-3 focus:outline-none focus:border-ustGold focus:ring-1 focus:ring-ustGold transition" 
                               id="username" name="username" type="text" placeholder="Enter ID Number" required>
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                        Password
                    </label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input class="w-full border border-gray-300 rounded pl-10 pr-3 py-3 focus:outline-none focus:border-ustGold focus:ring-1 focus:ring-ustGold transition" 
                               id="password" name="password" type="password" placeholder="••••••••" required>
                    </div>
                </div>

                <button type="submit" id="loginBtn" class="w-full bg-ustBlack text-white font-bold py-3 px-4 rounded hover:bg-ustGold hover:text-ustBlack transition duration-300 shadow-md">
                    SIGN IN
                </button>
            </form>
        </div>

    </section>

    <script>
        function showLoginForm(type) {
            // Hide selection, show form
            document.getElementById('roleSelection').classList.add('hidden');
            document.getElementById('loginFormSection').classList.remove('hidden');
            
            // Update form details based on type
            const titleEl = document.getElementById('loginTitle');
            const typeInput = document.getElementById('userTypeInput');
            const headerEl = document.getElementById('formHeader');
            const btnEl = document.getElementById('loginBtn');
            const backBtn = document.getElementById('backBtn');
            const secureText = document.getElementById('secureText');

            if (type === 'instructor') {
                titleEl.textContent = 'FACULTY MODULE';
                typeInput.value = 'instructor';
                
                // Style updates for Faculty (Black Background)
                headerEl.className = "bg-ustBlack p-6 border-b-4 border-ustGold";
                btnEl.className = "w-full bg-ustBlack text-white font-bold py-3 px-4 rounded hover:bg-ustGold hover:text-ustBlack transition duration-300 shadow-md";
                
                // Set text color to light/gray for dark background
                titleEl.classList.remove('text-ustBlack');
                titleEl.classList.add('text-white');
                
                backBtn.className = "text-gray-400 hover:text-white text-sm mb-4 flex items-center gap-2 transition";
                secureText.className = "text-gray-400 text-xs uppercase tracking-wider mt-1";

            } else {
                titleEl.textContent = 'STUDENT PORTAL';
                typeInput.value = 'student';
                
                // Style updates for Student (Gold Background)
                headerEl.className = "bg-ustGold p-6 border-b-4 border-ustBlack";
                btnEl.className = "w-full bg-ustGold text-ustBlack font-bold py-3 px-4 rounded hover:bg-ustBlack hover:text-ustGold transition duration-300 shadow-md";
                
                // Set text color to dark/black for gold background (Fixing readability issue)
                titleEl.classList.remove('text-white');
                titleEl.classList.add('text-ustBlack');
                
                backBtn.className = "text-ustBlack hover:text-gray-700 text-sm mb-4 flex items-center gap-2 transition font-medium";
                secureText.className = "text-ustBlack text-xs uppercase tracking-wider mt-1 font-medium";
            }
        }

        function showRoleSelection() {
            // Reset views
            document.getElementById('roleSelection').classList.remove('hidden');
            document.getElementById('loginFormSection').classList.add('hidden');
            
            // Clear inputs (optional)
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        }
    </script>

<%@include file="footer.jsp" %>