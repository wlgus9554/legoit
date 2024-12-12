<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 박지현 -->
<!-- 작성일 : 2024-12-13 -->
<!-- 최종수정일 : 2024-09-10 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegoEat: <decorator:title/></title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background-color: #343a40;
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1050;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 600;
            color: #ffc107;
        }

        .navbar-brand:hover {
            color: #ffcd39;
        }

        .menu-button {
            background: none;
            border: none;
            color: #ffffff;
            font-size: 1.5rem;
            cursor: pointer;
            position: absolute;
            right: 1.5rem;
            top: 1rem;
        }

        .menu-button:hover {
            color: #ffc107;
        }

        .sidebar {
            background-color: #ffffff;
            height: 100vh;
            padding-top: 2rem;
            border-left: 1px solid #dee2e6;
            position: fixed;
            top: 0;
            right: -300px;
            width: 250px;
            transition: right 0.3s ease;
            z-index: 1051;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar.active {
            right: 0;
        }

        .sidebar .nav-link {
            color: #495057;
            font-size: 1rem;
            padding: 0.75rem 1.25rem;
            border-radius: 0.375rem;
            margin-bottom: 0.5rem;
            background-color: transparent;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .nav-link.active {
            background-color: #ffc107;
            color: #ffffff;
        }

        .sidebar .nav-link:hover {
            background-color: #ffe8a1;
            color: #212529;
        }

        .sidebar .close-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #495057;
            cursor: pointer;
        }

        .sidebar .close-button i {
            font-size: 1.25rem;
        }

        .sidebar .close-button:hover {
            color: #ff0000;
        }

        .main-content {
            padding: 2rem;
            flex: 1;
        }

        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 2rem 0;
            text-align: center;
            margin-top: auto;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }

        footer a:hover {
            color: #ffcd39;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
        }

        button {
            transition: all 0.3s ease;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1050;
            display: none;
        }

        .overlay.active {
            display: block;
        }

        .sidebar ul {
            margin-top: 3rem;
        }
    </style>

    <decorator:head />
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">LegoEat</a>
            <button class="menu-button" onclick="toggleSidebar()">
                <i class="fas fa-ellipsis-v"></i>
            </button>
        </div>
    </nav>
    <!-- End Navbar -->

    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
        <button class="close-button" onclick="toggleSidebar()">
            <i class="fas fa-arrow-left"></i>
        </button>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="/dashboard">
                    <i class="fas fa-tachometer-alt me-2"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/restaurants">
                    <i class="fas fa-utensils me-2"></i> Restaurants
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/reservations">
                    <i class="fas fa-calendar-check me-2"></i> Reservations
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profile">
                    <i class="fas fa-user me-2"></i> Profile
                </a>
            </li>
        </ul>
    </aside>
    <!-- End Sidebar -->

    <!-- Overlay -->
    <div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

    <!-- Main Content -->
    <main class="main-content">
        <decorator:body />
    </main>
    <!-- End Main Content -->

    <!-- Footer -->
    <footer>
        <div>
            <p>&copy; 2024 ReserveEasy. All rights reserved.</p>
            <a href="/privacy">Privacy Policy</a> | <a href="/terms">Terms of Service</a>
        </div>
    </footer>
    <!-- End Footer -->

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const overlay = document.getElementById('overlay');
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        }
    </script>
</body>
</html>