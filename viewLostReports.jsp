<%@ page import="java.sql.*" %>
<%@ page import="com.findit.dao.LostItemDAO" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");

    if(adminId == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    LostItemDAO dao = new LostItemDAO();

    ResultSet rs = dao.getAllLostItems();
%>

<!DOCTYPE html>
<html>

<head>

    <title>Lost Reports | FindIt Admin</title>

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

        /* Heading */

        .header{

            text-align:center;

            padding:40px 20px;

        }

        .header h1{

            font-size:40px;

            color:#1e293b;

            margin-bottom:10px;

        }

        .header p{

            color:#64748b;

            font-size:18px;

        }

        /* Table */

        .table-box{

            width:95%;

            margin:auto;

            background:white;

            padding:25px;

            border-radius:15px;

            box-shadow:0 10px 25px rgba(0,0,0,.08);

            overflow-x:auto;

        }

        table{

            width:100%;

            border-collapse:collapse;

        }

        th{

            background:#2563eb;

            color:white;

            padding:15px;

            font-size:15px;

        }

        td{

            padding:15px;

            text-align:center;

            border-bottom:1px solid #eee;

        }

        tr:hover{

            background:#f8fbff;

        }

        img{

            width:110px;

            height:110px;

            object-fit:cover;

            border-radius:10px;

            border:2px solid #ddd;

        }

        .badge{

            background:#ef4444;

            color:white;

            padding:6px 15px;

            border-radius:20px;

            font-size:13px;

            font-weight:600;

        }

        .footer{

            margin-top:40px;

            text-align:center;

            padding:20px;

            background:#0f172a;

            color:white;

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

<div class="header">

    <h1>

        <i class="fa-solid fa-triangle-exclamation"></i>

        Lost Item Reports

    </h1>

    <p>

        View and monitor all lost item reports submitted by users.

    </p>

</div>

<div class="table-box">

    <table>

        <tr>

            <th>ID</th>

            <th>Item</th>

            <th>Category</th>

            <th>Description</th>

            <th>Location</th>

            <th>Date Lost</th>

            <th>Status</th>

            <th>Photo</th>

        </tr>

        <%

            while(rs!=null && rs.next()){

        %>

        <tr>

            <td>

                <%=rs.getInt("id")%>

            </td>

            <td>

                <b><%=rs.getString("item_name")%></b>

            </td>

            <td>

                <%=rs.getString("category")%>

            </td>

            <td>

                <%=rs.getString("description")%>

            </td>

            <td>

                <%=rs.getString("location")%>

            </td>

            <td>

                <%=rs.getString("lost_date")%>

            </td>

            <td>

<span class="badge">

Lost

</span>

            </td>

            <td>

                <img src="<%=rs.getString("image_path")%>">

            </td>

        </tr>

        <%

            }

        %>

    </table>

</div>

<div style="text-align:center;margin:40px;">

    <a href="adminDashboard.jsp"
       style="background:#2563eb;color:white;padding:12px 30px;border-radius:8px;text-decoration:none;">

        <i class="fa-solid fa-arrow-left"></i>

        Back to Dashboard

    </a>

</div>

<div class="footer">

    © 2026 FindIt | Lost & Found Management System

    <br>

    Developed by <b>Bharath</b>

</div>

</body>

</html>