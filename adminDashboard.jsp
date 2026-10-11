<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");

    if(adminId == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String adminName = (String) session.getAttribute("adminUsername");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Admin Dashboard | FindIt</title>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        body{
            background:#eef3f9;
        }

        /* Navbar */

        nav{

            background:#0f172a;
            padding:18px 70px;
            display:flex;
            justify-content:space-between;
            align-items:center;

        }

        .logo{

            font-size:32px;
            font-weight:bold;
            color:white;

        }

        .logo span{

            color:#38bdf8;

        }

        .menu a{

            text-decoration:none;
            color:white;
            margin-left:25px;
            font-size:16px;
            transition:.3s;

        }

        .menu a:hover{

            color:#38bdf8;

        }

        /* Hero */

        .hero{

            padding:70px 20px;
            text-align:center;
            background:linear-gradient(135deg,#2563eb,#38bdf8);
            color:white;

        }

        .hero h1{

            font-size:46px;
            margin-bottom:15px;

        }

        .hero p{

            font-size:19px;

        }

        /* Dashboard Cards */

        .cards{

            width:90%;
            max-width:1300px;
            margin:60px auto;

            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
            gap:35px;

        }

        .card{

            background:white;
            padding:35px;
            border-radius:18px;
            text-align:center;

            box-shadow:0 10px 25px rgba(0,0,0,.08);

            transition:.35s;

        }

        .card:hover{

            transform:translateY(-10px);

        }

        .card i{

            font-size:60px;
            margin-bottom:20px;
            color:#2563eb;

        }

        .card h2{

            margin-bottom:15px;
            color:#1e293b;

        }

        .card p{

            color:#666;
            line-height:26px;
            margin-bottom:25px;

        }

        .card a{

            display:inline-block;

            padding:12px 28px;

            background:#2563eb;

            color:white;

            text-decoration:none;

            border-radius:8px;

            transition:.3s;

        }

        .card a:hover{

            background:#1d4ed8;

        }

        /* Footer */

        footer{

            margin-top:40px;
            background:#0f172a;
            color:white;
            text-align:center;
            padding:20px;

        }

    </style>

</head>

<body>

<nav>

    <div class="logo">

        Find<span>It</span>

    </div>

    <div class="menu">

        <a href="viewLostReports.jsp">
            <i class="fa-solid fa-triangle-exclamation"></i>
            Lost Reports
        </a>

        <a href="reportFound.jsp">
            <i class="fa-solid fa-box-open"></i>
            Found Item
        </a>

        <a href="viewClaims.jsp">
            <i class="fa-solid fa-hand"></i>
            Claims
        </a>

        <a href="adminLogout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>

</nav>

<section class="hero">

    <h1>

        <i class="fa-solid fa-user-shield"></i>

        Admin Dashboard

    </h1>

    <p>

        Welcome,

        <b><%=adminName%></b>

        Manage Lost & Found activities efficiently.

    </p>

</section>

<div class="cards">

    <div class="card">

        <i class="fa-solid fa-triangle-exclamation"></i>

        <h2>View Lost Reports</h2>

        <p>

            View every lost item reported by users. Verify reports and monitor newly submitted complaints.

        </p>

        <a href="viewLostReports.jsp">

            Open Module

        </a>

    </div>

    <div class="card">

        <i class="fa-solid fa-box-open"></i>

        <h2>Report Found Item</h2>

        <p>

            Add newly found items into the system so users can search and submit ownership claims.

        </p>

        <a href="reportFound.jsp">

            Open Module

        </a>

    </div>

    <div class="card">

        <i class="fa-solid fa-handshake-angle"></i>

        <h2>Manage Claims</h2>

        <p>

            Review all ownership claims submitted by users and approve or reject requests.

        </p>

        <a href="viewClaims.jsp">

            Open Module

        </a>

    </div>

</div>

<footer>

    © 2026 FindIt | Lost & Found Management System

    <br>

    Developed by <b>Bharath</b>

</footer>

</body>

</html>