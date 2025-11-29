<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <section id="loginSection" class="fade-in max-w-4xl mx-auto mt-10 min-h-[500px]">
        <div class="text-center mb-12">
            <h2 class="font-header text-4xl text-ustBlack mb-4">WELCOME THOMASIAN</h2>
            <p class="text-gray-600 text-lg">Select your role to access the CICS Grade Management System.</p>
            
            <%-- Error Message Display --%>
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="mt-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-4 max-w-md mx-auto text-left shadow-md" role="alert">
                    <p class="font-bold">Login Failed</p>
                    <p><%= error %></p>
                </div>
            <% } %>
        </div>

        <div id="roleSelection" class="grid grid-cols-1 md:grid-cols-2 gap-8 transition-opacity duration-300">
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

        <div id="loginFormContainer" class="hidden max-w-md mx-auto">
            <div id="loginCard" class="bg-white rounded-xl shadow-2xl p-8 border-t-8 ring-1 ring-gray-100">
                <div class="flex justify-between items-center mb-6">
                    <h3 id="formTitle" class="font-header text-2xl text-ustBlack tracking-wide">LOGIN</h3>
                    <button onclick="showRoles()" class="text-gray-400 hover:text-ustGold transition">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>

                <form action="LoginServlet" method="POST" class="space-y-6">
                    <input type="hidden" name="userType" id="userTypeInput">
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2 font-sans" for="username">
                            Username
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                                <i class="fas fa-user"></i>
                            </span>
                            <input class="w-full border border-gray-300 rounded pl-10 pr-3 py-2 text-gray-700 focus:outline-none focus:ring-2 focus:ring-ustGold focus:border-transparent transition" 
                                   id="username" name="username" type="text" placeholder="Enter ID" required>
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2 font-sans" for="password">
                            Password
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input class="w-full border border-gray-300 rounded pl-10 pr-3 py-2 text-gray-700 focus:outline-none focus:ring-2 focus:ring-ustGold focus:border-transparent transition" 
                                   id="password" name="password" type="password" placeholder="Enter Password" required>
                        </div>
                    </div>

                    <div class="flex items-center justify-between gap-4 pt-2">
                        <button type="button" onclick="showRoles()" class="w-1/2 bg-gray-200 text-gray-700 font-bold py-2 px-4 rounded hover:bg-gray-300 transition focus:outline-none">
                            Back
                        </button>
                        <button id="submitBtn" type="submit" class="w-1/2 text-white font-bold py-2 px-4 rounded shadow-md transition focus:outline-none transform hover:-translate-y-0.5">
                            Sign In
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <script>
        function showLoginForm(role) {
            // Hide selection, show form
            document.getElementById('roleSelection').classList.add('hidden');
            document.getElementById('loginFormContainer').classList.remove('hidden');
            document.getElementById('loginFormContainer').classList.add('fade-in');
            
            // Set form values based on role
            const typeInput = document.getElementById('userTypeInput');
            const formTitle = document.getElementById('formTitle');
            const loginCard = document.getElementById('loginCard');
            const submitBtn = document.getElementById('submitBtn');

            if (role === 'instructor') {
                typeInput.value = 'instructor';
                formTitle.innerText = 'FACULTY LOGIN';
                loginCard.classList.remove('border-ustGold');
                loginCard.classList.add('border-ustBlack');
                
                submitBtn.classList.remove('bg-ustGold', 'text-ustBlack', 'hover:bg-yellow-400');
                submitBtn.classList.add('bg-ustBlack', 'hover:bg-gray-800');
            } else {
                typeInput.value = 'student';
                formTitle.innerText = 'STUDENT LOGIN';
                loginCard.classList.remove('border-ustBlack');
                loginCard.classList.add('border-ustGold');

                submitBtn.classList.remove('bg-ustBlack', 'hover:bg-gray-800');
                submitBtn.classList.add('bg-ustGold', 'text-ustBlack', 'hover:bg-yellow-400');
            }
        }

        function showRoles() {
            // Hide form, show selection
            document.getElementById('loginFormContainer').classList.add('hidden');
            document.getElementById('roleSelection').classList.remove('hidden');
            document.getElementById('roleSelection').classList.add('fade-in');
            
            // Clear inputs
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        }
    </script>

<%@include file="footer.jsp" %>