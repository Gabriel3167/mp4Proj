<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UST CICS Portal</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="styles.css">

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        ustGold: '#F1B82D',
                        ustBlack: '#111111',
                        ustGray: '#F4F4F4',
                        ustAccent: '#DDA11E' // Used for the new header banner
                    },
                    fontFamily: {
                        sans: ['Roboto', 'sans-serif'],
                        header: ['Oswald', 'sans-serif'],
                    }
                }
            }
        }
    </script>
</head>
<body class="tiger-bg text-gray-800 flex flex-col min-h-screen font-sans">

    <nav class="bg-ustBlack border-b-4 border-ustGold shadow-lg z-50 sticky top-0">
        <div class="container mx-auto px-6 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-3 cursor-pointer hover:opacity-90 transition" onclick="window.location.href='login.jsp'">
                <div class="bg-ustGold text-ustBlack p-1.5 rounded font-bold font-header text-lg shadow-sm">UST</div>
                <div>
                    <h1 class="text-white font-header text-xl tracking-wide leading-none">MYUSTE PORTAL</h1>
                    <p class="text-gray-400 text-[10px] uppercase tracking-wider mt-0.5">College of Information and Computing Sciences</p>
                </div>
            </div>
            <div class="text-white text-sm" id="currentUserDisplay">
                <span class="text-gray-500 italic">Not Logged In</span>
            </div>
        </div>
    </nav>
    
    <header class="bg-ustAccent text-ustBlack py-2 shadow-md z-40">
        <div class="container mx-auto px-6 text-center font-sans">
            <p class="text-sm font-bold tracking-wide leading-tight">
                ICS2608 | APPLICATIONS DEVELOPMENT AND EMERGING TECHNOLOGIES 1 (WEB-FRONT-END) | 2CSA
            </p>
            <p class="text-xs mt-1">
                <span class="font-semibold">Constantino, Gabriel</span> | 
                <span class="font-semibold">Marquez, Carl</span> | 
                <span class="font-semibold">Peralta, Francis</span>
            </p>
        </div>
    </header>

    <main class="flex-grow container mx-auto px-4 py-8 max-w-6xl relative z-0">