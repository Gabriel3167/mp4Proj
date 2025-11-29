<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <section id="professorSection" class="fade-in">
        <div class="flex justify-between items-end mb-6 border-b border-gray-200 pb-4">
            <div>
                <h2 class="font-header text-3xl text-ustBlack">FACULTY GRADE ENTRY</h2>
                <p class="text-sm text-gray-500">Encode student grades for the current semester.</p>
            </div>
            <button onclick="logout()" class="text-red-600 hover:text-red-800 text-sm font-medium flex items-center gap-2 transition">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-ustGold">

            <div class="flex flex-wrap gap-4 justify-between items-center mb-6 bg-gray-50 p-4 rounded border border-gray-100">
                <div class="flex gap-3 items-center">
                    <span class="text-sm font-bold text-gray-600 uppercase tracking-wider"><i class="fas fa-filter mr-1"></i> Load Section:</span>
                    <select id="yearLevelSelect" onchange="loadPresetSubjects()" class="border border-gray-300 bg-white rounded px-3 py-1.5 text-sm focus:border-ustGold focus:ring-1 focus:ring-ustGold outline-none shadow-sm">
                        <option value="">-- Select Section --</option>
                        <option value="2CSA">2CSA (2nd Year)</option>
                        <option value="3CSA">3CSA (3rd Year)</option>
                        <option value="4CSA">4CSA (4th Year)</option>
                    </select>
                </div>
                <button onclick="addEmptySubjectRow()" class="text-ustBlack hover:text-ustGold text-sm font-bold transition flex items-center gap-1">
                    <i class="fas fa-plus-circle"></i> Add Custom Subject
                </button>
            </div>

            <form id="professorForm" onsubmit="handleProfessorSubmit(event)" method="POST" action="GradeServlet">
                <div class="overflow-x-auto rounded-t-lg border border-gray-200">
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-ustBlack text-ustGold text-sm uppercase font-header tracking-wide">
                            <tr>
                                <th class="py-3 px-4 w-1/2">Course Code / Description</th>
                                <th class="py-3 px-4 w-24 text-center">Units</th>
                                <th class="py-3 px-4 w-32 text-center">Final Grade</th>
                                <th class="py-3 px-4 w-10"></th>
                            </tr>
                        </thead>
                        <tbody id="profSubjectList" class="text-sm">
                            </tbody>
                    </table>
                </div>

                <div class="mt-6 flex justify-between items-center bg-gray-50 p-4 rounded-b-lg border-t border-gray-200">
                    <p class="text-xs text-gray-500 italic flex items-center gap-1">
                        <i class="fas fa-info-circle"></i> Grades posted here will immediately reflect on the student portal.
                    </p>
                    <button type="submit" class="bg-green-600 text-white font-bold py-2.5 px-6 rounded hover:bg-green-700 shadow-md transition flex items-center gap-2">
                        <i class="fas fa-upload"></i> PUBLISH GRADES
                    </button>
                </div>
            </form>
        </div>
    </section>

    <section id="studentSection" class="hidden fade-in">
        <div class="flex justify-between items-end mb-6 border-b border-gray-200 pb-4">
            <div>
                <h2 class="font-header text-3xl text-ustBlack">STUDENT ACCESS MODULE</h2>
                <p class="text-sm text-gray-500">View your academic performance.</p>
            </div>
            <button onclick="logout()" class="text-red-600 hover:text-red-800 text-sm font-medium flex items-center gap-2 transition">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2">
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                    <div class="bg-ustBlack px-6 py-3 border-b border-ustGold flex justify-between items-center">
                        <h3 class="text-white font-header tracking-wide text-lg">ENROLLED COURSES</h3>
                        <span class="text-[10px] text-ustGold border border-ustGold px-2 py-0.5 rounded font-bold">OFFICIAL RECORD</span>
                    </div>
                    <div class="p-0">
                        <table class="w-full text-left">
                            <thead class="bg-gray-50 text-gray-500 text-xs uppercase border-b border-gray-200">
                                <tr>
                                    <th class="py-3 px-6 font-medium">Subject</th>
                                    <th class="py-3 px-6 text-center font-medium">Units</th>
                                    <th class="py-3 px-6 text-center font-medium">Grade</th>
                                    <th class="py-3 px-6 text-center font-medium">Status</th>
                                </tr>
                            </thead>
                            <tbody id="studentGradeTable" class="text-sm text-gray-700 divide-y divide-gray-100">
                                <tr>
                                    <td colspan="4" class="text-center py-8 text-gray-400 italic">
                                        No grades have been posted yet.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="bg-gray-50 px-6 py-4 border-t border-gray-200 flex justify-between items-center">
                        <span class="font-bold text-gray-600 text-sm">Total Units: <span id="totalUnitsDisplay" class="text-ustBlack">0</span></span>
                        <div class="text-right">
                            <span class="block text-xs text-gray-500 uppercase font-bold tracking-wider">General Weighted Average</span>
                            <span id="studentGWA" class="text-3xl font-header font-bold text-ustBlack leading-none">0.00</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="lg:col-span-1 space-y-6">
                <div id="interventionCard" class="hidden bg-white rounded-lg shadow-lg border-t-4 border-red-500 p-6 relative overflow-hidden">
                    <div class="absolute top-0 right-0 -mt-2 -mr-2 text-red-50 opacity-20">
                         <i class="fas fa-exclamation-triangle fa-5x"></i>
                    </div>
                    <h4 class="text-red-600 font-bold text-lg mb-1"><i class="fas fa-bell"></i> Academic Alert</h4>
                    <p class="text-sm text-gray-500 mb-4">We noticed a dip in your performance for:</p>

                    <div class="bg-red-50 p-4 rounded-md border border-red-100 mb-4">
                        <h5 id="lowestSubjectTitle" class="font-bold text-gray-800">Subject Name</h5>
                        <div class="flex justify-between items-center mt-1">
                            <span class="text-xs text-gray-500">Your Grade</span>
                            <span id="lowestSubjectValue" class="font-mono font-bold text-red-600 text-xl">0.00</span>
                        </div>
                    </div>

                    <div class="space-y-3">
                        <p class="text-xs font-bold text-gray-400 uppercase">Recommended Action</p>
                        <p id="recommendationText" class="text-sm text-gray-700 leading-relaxed">
                            Focus on core concepts.
                        </p>
                        <a id="externalLink" href="#" target="_blank" class="block w-full bg-blue-600 hover:bg-blue-700 text-white text-center py-2 rounded text-sm font-medium transition flex items-center justify-center gap-2">
                            <i class="fas fa-external-link-alt"></i> Access Learning Material
                        </a>
                    </div>
                </div>

                <div id="goodStandingCard" class="hidden bg-white rounded-lg shadow border-t-4 border-green-500 p-6 text-center">
                    <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                        <i class="fas fa-check text-green-600 text-2xl"></i>
                    </div>
                    <h4 class="text-green-700 font-bold text-lg">Good Standing</h4>
                    <p class="text-sm text-gray-500 mt-2">You have no failing marks or critical low grades. Keep up the great work, Thomasian!</p>
                </div>
            </div>
        </div>
    </section>

    <script>
        // --- 1. DATA MANAGEMENT ---

        // Presets based on User Uploaded Images
        const PRESETS = {
            '2CSA': [
                { name: 'ELE SMD (Social Media Dynamics)', units: 3 },
                { name: 'ICS2607 (Information Management)', units: 4 },
                { name: 'ICS2608 (App Dev 1 - Web/Front)', units: 3 },
                { name: 'CS 2614 (College Calculus)', units: 3 },
                { name: 'CS 2615 (Design & Analysis of Algo)', units: 3 },
                { name: 'CS 2616 (Theory of Automata)', units: 3 },
                { name: 'THY 3 (Christian Vision)', units: 3 }
            ],
            '3CSA': [
                { name: 'ICS26010 (Software Engineering I)', units: 3 },
                { name: 'ICS26011 (App Dev 3 - Mobile)', units: 3 },
                { name: 'CS 26110 (Numerical Methods)', units: 3 },
                { name: 'CS 26111 (Prog. Languages)', units: 3 },
                { name: 'CS ELEC 1A (Intel. Systems)', units: 3 },
                { name: 'F-ELECK (Personality Dev)', units: 3 },
                { name: 'ETHICS', units: 3 }
            ],
            '4CSA': [
                { name: 'CS 26114 (Thesis II)', units: 2 },
                { name: 'CS 26115 (Graphics Computing)', units: 3 },
                { name: 'CS 26117 (Computer Security)', units: 2 },
                { name: 'CS ELEC 3A (Natural Lang Proc)', units: 3 },
                { name: 'CONTEM_W (Contemporary World)', units: 3 },
                { name: 'LIWORIZ (Life & Works of Rizal)', units: 3 }
            ]
        };

        // Mock Database
        let db = {
            grades: []
        };
        
        // Function to update the header status display
        function updateHeaderDisplay(role) {
            const display = document.getElementById('currentUserDisplay');
            if (role === 'professor') {
                display.innerHTML = '<span class="font-bold text-ustGold"><i class="fas fa-user-tie"></i> Prof. Admin</span>';
            } else if (role === 'student') {
                display.innerHTML = '<span class="font-bold text-ustGold"><i class="fas fa-user"></i> Student View</span>';
            } else {
                display.innerHTML = '<span class="text-gray-500 italic">Not Logged In</span>';
            }
        }

        // --- 2. NAVIGATION/INITIALIZATION LOGIC ---

        // Renamed 'showSection' to 'displaySection' to avoid conflict with potential server-side logic
        function displaySection(id) {
            ['professorSection', 'studentSection'].forEach(sec => {
                const el = document.getElementById(sec);
                if (el) {
                    el.classList.add('hidden');
                }
            });
            const targetEl = document.getElementById(id);
            if (targetEl) {
                targetEl.classList.remove('hidden');
            }
        }

        // Modified loginAs to only handle display, assuming server-side login already occurred
        function loginAs(role) {
            updateHeaderDisplay(role);

            if (role === 'professor') {
                displaySection('professorSection');
                loadPresetSubjects();
            } else if (role === 'student') {
                renderStudentGrades();
                displaySection('studentSection');
            } else {
                logout();
            }
        }

        function logout() {
            // In a real application, this would clear session and redirect to the entry point
            window.location.href = 'login.jsp';
        }

        // --- 3. PROFESSOR MODULE LOGIC (No changes to internal logic) ---

        function loadPresetSubjects() {
            const section = document.getElementById('yearLevelSelect').value;
            const tbody = document.getElementById('profSubjectList');

            if (db.grades.length > 0 && !section) {
                renderProfTableFromDB();
                return;
            }

            tbody.innerHTML = '';
            const subjects = PRESETS[section] || [];

            if (subjects.length === 0 && db.grades.length === 0) {
                addEmptySubjectRow();
                return;
            }

            subjects.forEach(sub => {
                addSubjectRowHTML(sub.name, sub.units, '');
            });
        }

        function renderProfTableFromDB() {
            const tbody = document.getElementById('profSubjectList');
            tbody.innerHTML = '';
            db.grades.forEach(g => {
                addSubjectRowHTML(g.name, g.units, g.grade);
            });
        }

        function addEmptySubjectRow() {
            addSubjectRowHTML('', '', '');
        }

        function addSubjectRowHTML(name, units, grade) {
            const tbody = document.getElementById('profSubjectList');
            const tr = document.createElement('tr');
            tr.className = "border-b border-gray-100 hover:bg-gray-50";
            tr.innerHTML = `
                <td class="p-2">
                    <input type="text" name="subject[]" value="${name}" class="w-full border border-gray-300 rounded p-2 text-sm focus:border-ustGold outline-none" placeholder="Subject Name" required>
                </td>
                <td class="p-2">
                    <input type="number" name="units[]" value="${units}" class="w-full border border-gray-300 rounded p-2 text-center text-sm outline-none" placeholder="3" required>
                </td>
                <td class="p-2">
                    <input type="number" name="grade[]" value="${grade}" step="0.25" min="1.0" max="5.0" class="w-full border border-gray-300 rounded p-2 text-center text-sm font-bold text-ustBlack focus:ring-2 focus:ring-ustGold outline-none" placeholder="1.00">
                </td>
                <td class="p-2 text-center">
                    <button type="button" onclick="this.closest('tr').remove()" class="text-gray-400 hover:text-red-500"><i class="fas fa-times"></i></button>
                </td>
            `;
            tbody.appendChild(tr);
        }

        function handleProfessorSubmit(e) {
            e.preventDefault();

            const subjects = document.getElementsByName('subject[]');
            const units = document.getElementsByName('units[]');
            const grades = document.getElementsByName('grade[]');

            const newData = [];

            for(let i=0; i<subjects.length; i++) {
                const gVal = grades[i].value;

                newData.push({
                    name: subjects[i].value,
                    units: parseFloat(units[i].value) || 0,
                    grade: parseFloat(gVal) || 0
                });
            }

            db.grades = newData;

            const btn = e.target.querySelector('button[type="submit"]');
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-check"></i> POSTED!';
            btn.classList.remove('bg-green-600', 'hover:bg-green-700');
            btn.classList.add('bg-ustBlack');

            setTimeout(() => {
                btn.innerHTML = originalText;
                btn.classList.add('bg-green-600', 'hover:bg-green-700');
                btn.classList.remove('bg-ustBlack');
                alert("Grades have been published to the Student Portal.");
                logout();
            }, 1000);
        }


        // --- 4. STUDENT MODULE LOGIC (No changes to internal logic) ---

        function renderStudentGrades() {
            const tbody = document.getElementById('studentGradeTable');
            tbody.innerHTML = '';

            let totalUnits = 0;
            let weightedSum = 0;
            let lowestGrade = -1;
            let lowestSubject = null;
            let hasGrades = false;

            if (db.grades.length === 0) {
                tbody.innerHTML = '<tr><td colspan="4" class="text-center py-8 text-gray-400">No grades posted. Ask your professor to input data.</td></tr>';
                document.getElementById('studentGWA').textContent = "0.00";
                toggleRecommendation(null);
                return;
            }

            db.grades.forEach(item => {
                const row = document.createElement('tr');
                row.className = "border-b border-gray-100";

                let statusHtml = '<span class="text-gray-400 text-xs">Pending</span>';
                let gradeDisplay = '-';

                if (item.grade > 0) {
                    hasGrades = true;
                    gradeDisplay = item.grade.toFixed(2);
                    totalUnits += item.units;
                    weightedSum += (item.grade * item.units);

                    if (item.grade <= 3.0) statusHtml = '<span class="text-green-600 font-bold text-xs">PASSED</span>';
                    else statusHtml = '<span class="text-red-600 font-bold text-xs">FAILED</span>';

                    // Find lowest grade (Max number since lower grade number is better)
                    if (item.grade > lowestGrade) {
                        lowestGrade = item.grade;
                        lowestSubject = item.name;
                    }
                }

                row.innerHTML = `
                    <td class="py-3 px-6 font-medium text-gray-800">${item.name}</td>
                    <td class="py-3 px-6 text-center text-gray-500">${item.units}</td>
                    <td class="py-3 px-6 text-center font-bold ${item.grade > 3.0 ? 'text-red-600' : 'text-ustBlack'}">${gradeDisplay}</td>
                    <td class="py-3 px-6 text-center">${statusHtml}</td>
                `;
                tbody.appendChild(row);
            });

            document.getElementById('totalUnitsDisplay').textContent = totalUnits;
            if (totalUnits > 0) {
                const gwa = weightedSum / totalUnits;
                document.getElementById('studentGWA').textContent = gwa.toFixed(4);
            } else {
                document.getElementById('studentGWA').textContent = "0.00";
            }

            if (hasGrades && lowestGrade > 0) {
                toggleRecommendation(lowestSubject, lowestGrade);
            } else {
                toggleRecommendation(null);
            }
        }

        function toggleRecommendation(subjectName, gradeVal) {
            const intCard = document.getElementById('interventionCard');
            const goodCard = document.getElementById('goodStandingCard');

            if (!subjectName) {
                intCard.classList.add('hidden');
                goodCard.classList.add('hidden');
                return;
            }

            // Preserving the user's original logic: flag grades > 2.5 for intervention
            if (gradeVal <= 2.5) {
                intCard.classList.add('hidden');
                goodCard.classList.remove('hidden');
                return;
            }

            goodCard.classList.add('hidden');
            intCard.classList.remove('hidden');

            document.getElementById('lowestSubjectTitle').textContent = subjectName;
            document.getElementById('lowestSubjectValue').textContent = gradeVal.toFixed(2);

            const lowerName = subjectName.toLowerCase();
            const recText = document.getElementById('recommendationText');
            const link = document.getElementById('externalLink');

            if (lowerName.includes('calculus') || lowerName.includes('math')) {
                recText.textContent = "Mathematical foundations are tricky. Review limits and derivatives.";
                link.href = "https://www.coursera.org/learn/calculus1";
            } else if (lowerName.includes('web') || lowerName.includes('front')) {
                recText.textContent = "Web standards change fast. Refresh your HTML/CSS/JS knowledge.";
                link.href = "https://www.freecodecamp.org/learn/2022/responsive-web-design/";
            } else if (lowerName.includes('data') || lowerName.includes('algo')) {
                recText.textContent = "Algorithms require practice. Visualize sorting and trees.";
                link.href = "https://visualgo.net/en";
            } else if (lowerName.includes('security')) {
                recText.textContent = "Security concepts are vast. Review the CIA triad and protocols.";
                link.href = "https://www.cybrary.it/";
            } else {
                recText.textContent = "General Computer Science review recommended.";
                link.href = "https://www.coursera.org/browse/computer-science";
            }
        }
        
        // Default to showing the Professor's panel on load for demonstration as a post-login page
        window.onload = function() {
            // This is a placeholder. A real servlet/JSP would determine the role dynamically.
            if (document.getElementById('professorSection')) {
                loginAs('professor');
            } else if (document.getElementById('studentSection')) {
                loginAs('student');
            }
        }
    </script>
    
<%@include file="footer.jsp" %>