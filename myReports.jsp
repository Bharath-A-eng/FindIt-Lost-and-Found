<%@ page import="java.sql.*" %>
<%@ page import="com.findit.dao.LostItemDAO" %>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    System.out.println("Logged In User ID = " + userId);

    if(userId == null){
        response.sendRedirect("login.jsp");
        return;
    }

    LostItemDAO dao = new LostItemDAO();

    ResultSet rs = dao.getUserLostItems(userId);
%>

<!DOCTYPE html>
<html>

<head>

    <title>My Reports | FindIt</title>

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
            color:white;
            text-decoration:none;
        }

        h1{
            text-align:center;
            margin:40px 0;
            color:#1e293b;
        }

        .container{
            width:95%;
            margin:auto;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
            gap:30px;
            padding-bottom:40px;
        }

        .card{

            background:white;

            border-radius:15px;

            overflow:hidden;

            box-shadow:0 10px 25px rgba(0,0,0,.1);

            transition:.3s;

        }

        .card:hover{

            transform:translateY(-8px);

        }

        .card img{

            width:100%;

            height:220px;

            object-fit:cover;

        }

        .content{

            padding:20px;

        }

        .content h2{

            color:#2563eb;

            margin-bottom:15px;

        }

        .info{

            margin:10px 0;

            font-size:15px;

        }

        .badge{

            display:inline-block;

            padding:6px 16px;

            border-radius:20px;

            color:white;

            font-size:13px;

            font-weight:bold;

        }

        .back{

            text-align:center;

            margin:40px;

        }

        .back a{

            background:#2563eb;

            color:white;

            padding:12px 25px;

            border-radius:8px;

            text-decoration:none;

        }

        .back a:hover{

            background:#1d4ed8;

        }

        .empty{

            text-align:center;

            font-size:22px;

            color:#666;

            padding:80px;

        }

        footer{

            margin-top:20px;

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

    <a href="dashboard.jsp">

        <i class="fa-solid fa-arrow-left"></i>

        Dashboard

    </a>

</nav>

<h1>

    <i class="fa-solid fa-file-lines"></i>

    My Lost Reports

</h1>

<div class="container">

    <%

        boolean found=false;

        while(rs!=null && rs.next()){

            found=true;

    %>

    <div class="card">

        <img src="<%=rs.getString("image_path")%>">

        <div class="content">

            <h2>

                <%=rs.getString("item_name")%>

            </h2>

            <div class="info">

                <b>Category :</b>

                <%=rs.getString("category")%>

            </div>

            <div class="info">

                <b>Description :</b>

                <%=rs.getString("description")%>

            </div>

            <div class="info">

                <b>Location :</b>

                <%=rs.getString("location")%>

            </div>

            <div class="info">
                <b>Date Lost :</b>
                <%=rs.getString("lost_date")%>
            </div>

            <%
                if("Found".equalsIgnoreCase(rs.getString("status"))){
            %>

            <div class="info">
                <b>Date Found :</b>
                <%=rs.getString("found_date")%>
            </div>

            <%
                }
            %>



            <div class="info">

                <b>Status :</b>

                <%
                    String status = rs.getString("status");
                %>

                <span class="badge"
                      style="
                              background:<%= status.equalsIgnoreCase("Found")
                         ? "#16a34a"
                         : status.equalsIgnoreCase("Claimed")
                         ? "#2563eb"
                         : "#dc2626" %>;
                              ">

        <%=status%>

    </span>

            </div>

        </div>

    </div>

    <%

        }

        if(!found){

    %>

    <div class="empty">

        <i class="fa-solid fa-folder-open"></i>

        <br><br>

        You haven't reported any lost items yet.

    </div>

    <%

        }

    %>

</div>

<div class="back">

    <a href="dashboard.jsp">

        <i class="fa-solid fa-house"></i>

        Back to Dashboard

    </a>

</div>

<footer>

    © 2026 FindIt | Lost & Found Management System

    <br>

    Developed by <b>Bharath</b>

</footer>

</body>

</html>