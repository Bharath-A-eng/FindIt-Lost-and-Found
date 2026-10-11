<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");

    if(adminId == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Report Found Item | FindIt Admin</title>

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

        nav a{
            text-decoration:none;
            color:white;
            background:#2563eb;
            padding:10px 20px;
            border-radius:8px;
            transition:.3s;
        }

        nav a:hover{
            background:#1d4ed8;
        }

        /* Container */

        .container{

            width:90%;
            max-width:700px;

            margin:50px auto;

            background:white;

            padding:40px;

            border-radius:18px;

            box-shadow:0 10px 25px rgba(0,0,0,.08);

        }

        .container h1{

            text-align:center;

            color:#1e293b;

            margin-bottom:10px;

        }

        .container p{

            text-align:center;

            color:#64748b;

            margin-bottom:35px;

        }

        .form-group{

            margin-bottom:22px;

        }

        label{

            display:block;

            font-weight:600;

            margin-bottom:8px;

            color:#1e293b;

        }

        input[type=text],
        input[type=date],
        textarea{

            width:100%;

            padding:14px;

            border:1px solid #ccc;

            border-radius:8px;

            font-size:15px;

            outline:none;

            transition:.3s;

        }

        input[type=text]:focus,
        input[type=date]:focus,
        textarea:focus{

            border-color:#2563eb;

            box-shadow:0 0 8px rgba(37,99,235,.2);

        }

        input[type=file]{

            width:100%;

            padding:12px;

            border:1px dashed #2563eb;

            border-radius:8px;

            background:#f8fbff;

        }

        textarea{

            resize:none;

        }

        button{

            width:100%;

            padding:15px;

            background:#2563eb;

            color:white;

            font-size:17px;

            border:none;

            border-radius:8px;

            cursor:pointer;

            transition:.3s;

        }

        button:hover{

            background:#1d4ed8;

        }

        .back{

            display:inline-block;

            margin-top:25px;

            text-decoration:none;

            background:#0f172a;

            color:white;

            padding:12px 22px;

            border-radius:8px;

            transition:.3s;

        }

        .back:hover{

            background:#1e293b;

        }

        footer{

            margin-top:40px;

            background:#0f172a;

            color:white;

            text-align:center;

            padding:18px;

        }

    </style>

</head>

<body>

<nav>

    <div class="logo">

        Find<span>It</span>

    </div>

    <a href="adminDashboard.jsp">

        <i class="fa-solid fa-arrow-left"></i>

        Dashboard

    </a>

</nav>

<div class="container">

    <h1>

        <i class="fa-solid fa-box-open"></i>

        Report Found Item

    </h1>

    <p>

        Add details of a newly found item so users can search and claim it.

    </p>

    <form action="reportFound"
          method="post"
          enctype="multipart/form-data">

        <div class="form-group">

            <label>

                <i class="fa-solid fa-tag"></i>

                Item Name

            </label>

            <input
                    type="text"
                    name="itemName"
                    required>

        </div>

        <div class="form-group">

            <label>

                <i class="fa-solid fa-list"></i>

                Category

            </label>

            <input
                    type="text"
                    name="category"
                    required>

        </div>

        <div class="form-group">

            <label>

                <i class="fa-solid fa-file-lines"></i>

                Description

            </label>

            <textarea
                    name="description"
                    rows="5"
                    required></textarea>

        </div>

        <div class="form-group">

            <label>

                <i class="fa-solid fa-location-dot"></i>

                Location Found

            </label>

            <input
                    type="text"
                    name="location"
                    required>

        </div>

        <div class="form-group">

            <label>

                <i class="fa-solid fa-calendar-days"></i>

                Date Found

            </label>

            <input
                    type="date"
                    name="foundDate"
                    required>

        </div>

        <div class="form-group">

            <label>

                <i class="fa-solid fa-image"></i>

                Upload Item Photo

            </label>

            <input
                    type="file"
                    name="photo"
                    accept="image/*"
                    required>

        </div>

        <button type="submit">

            <i class="fa-solid fa-circle-check"></i>

            Submit Found Item

        </button>

    </form>

    <center>

        <a href="adminDashboard.jsp" class="back">

            <i class="fa-solid fa-arrow-left"></i>

            Back to Dashboard

        </a>

    </center>

</div>

<footer>

    © 2026 FindIt | Lost & Found Management System

    <br>

    Developed by <b>Bharath</b>

</footer>

</body>

</html>