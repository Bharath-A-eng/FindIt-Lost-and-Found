<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String name = (String) session.getAttribute("userName");

    if(name == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Report Lost Item | FindIt</title>

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
            background:linear-gradient(135deg,#2563eb,#38bdf8);
            min-height:100vh;
        }

        /* Navbar */

        nav{
            background:#0f172a;
            padding:18px 60px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .logo{
            font-size:30px;
            font-weight:bold;
            color:white;
        }

        .logo span{
            color:#38bdf8;
        }

        nav ul{
            display:flex;
            list-style:none;
            gap:30px;
        }

        nav ul li a{
            text-decoration:none;
            color:white;
            font-weight:500;
            transition:.3s;
        }

        nav ul li a:hover{
            color:#38bdf8;
        }

        /* Form Card */

        .container{

            width:650px;
            background:white;
            margin:50px auto;
            padding:40px;
            border-radius:18px;
            box-shadow:0 15px 35px rgba(0,0,0,.25);

        }

        .container h2{

            text-align:center;
            margin-bottom:30px;
            color:#1e293b;

        }

        .input-box{

            margin-bottom:20px;

        }

        .input-box label{

            display:block;
            margin-bottom:8px;
            font-weight:600;
            color:#374151;

        }

        .input-box input,
        .input-box textarea{

            width:100%;
            padding:14px;
            border:1px solid #d1d5db;
            border-radius:8px;
            font-size:15px;
            outline:none;
            transition:.3s;

        }

        .input-box input:focus,
        .input-box textarea:focus{

            border-color:#2563eb;
            box-shadow:0 0 8px rgba(37,99,235,.3);

        }

        textarea{

            resize:none;

        }

        button{

            width:100%;
            padding:15px;
            background:#2563eb;
            color:white;
            border:none;
            border-radius:8px;
            font-size:17px;
            cursor:pointer;
            transition:.3s;

        }

        button:hover{

            background:#1d4ed8;

        }

        .back{

            text-align:center;
            margin-top:25px;

        }

        .back a{

            text-decoration:none;
            color:#2563eb;
            font-weight:600;

        }

        .back a:hover{

            text-decoration:underline;

        }

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

    <ul>

        <li style="color:white;">
            Welcome, <%=name%>
        </li>

        <li>

            <a href="dashboard.jsp">

                <i class="fa-solid fa-gauge"></i>

                Dashboard

            </a>

        </li>

        <li>

            <a href="logout">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>

        </li>

    </ul>

</nav>

<div class="container">

    <h2>

        <i class="fa-solid fa-box-open"></i>

        Report Lost Item

    </h2>

    <form action="reportLost"
          method="post"
          enctype="multipart/form-data">

        <div class="input-box">

            <label>

                <i class="fa-solid fa-tag"></i>

                Item Name

            </label>

            <input
                    type="text"
                    name="itemName"
                    placeholder="Enter Item Name"
                    required>

        </div>

        <div class="input-box">

            <label>

                <i class="fa-solid fa-layer-group"></i>

                Category

            </label>

            <input
                    type="text"
                    name="category"
                    placeholder="Example: Mobile, Wallet, Laptop"
                    required>

        </div>

        <div class="input-box">

            <label>

                <i class="fa-solid fa-file-lines"></i>

                Description

            </label>

            <textarea
                    name="description"
                    rows="5"
                    placeholder="Describe the lost item..."></textarea>

        </div>

        <div class="input-box">

            <label>

                <i class="fa-solid fa-location-dot"></i>

                Location Lost

            </label>

            <input
                    type="text"
                    name="location"
                    placeholder="Where did you lose it?"
                    required>

        </div>

        <div class="input-box">

            <label>

                <i class="fa-solid fa-calendar-days"></i>

                Date Lost

            </label>

            <input
                    type="date"
                    name="lostDate"
                    required>

        </div>

        <div class="input-box">

            <label>

                <i class="fa-solid fa-image"></i>

                Upload Photo

            </label>

            <input
                    type="file"
                    name="photo"
                    accept="image/*"
                    required>

        </div>

        <button type="submit">

            <i class="fa-solid fa-paper-plane"></i>

            Submit Lost Report

        </button>

    </form>

    <div class="back">

        <a href="dashboard.jsp">

            <i class="fa-solid fa-arrow-left"></i>

            Back to Dashboard

        </a>

    </div>

</div>

<footer>

    © 2026 FindIt | Lost & Found Management System <br>

    Developed by <b>Bharath</b>

</footer>

</body>

</html>