<%@ page import="java.sql.*" %>
<%@ page import="com.findit.dao.SearchDAO" %>

<%
    String keyword = (String) request.getAttribute("keyword");

    SearchDAO dao = new SearchDAO();

    ResultSet rs = dao.searchItems(keyword);
%>

<!DOCTYPE html>
<html>

<head>

    <title>Search Results | FindIt</title>

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

        header{
            background:#0f172a;
            padding:20px;
            color:white;
            text-align:center;
            font-size:28px;
            font-weight:bold;
        }

        .container{

            width:95%;
            margin:40px auto;

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(330px,1fr));

            gap:30px;

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

            padding:6px 15px;

            border-radius:20px;

            color:white;

            font-size:13px;

            font-weight:bold;

        }

        .found{

            background:#16a34a;

        }

        .lost{

            background:#dc2626;

        }

        .btn{

            display:block;

            width:100%;

            padding:12px;

            margin-top:15px;

            background:#2563eb;

            color:white;

            text-decoration:none;

            text-align:center;

            border-radius:8px;

            transition:.3s;

        }

        .btn:hover{

            background:#1d4ed8;

        }

        textarea{

            width:100%;

            margin-top:15px;

            padding:10px;

            border:1px solid #ccc;

            border-radius:8px;

            resize:none;

        }

        .claim{

            width:100%;

            margin-top:12px;

            padding:12px;

            background:#16a34a;

            color:white;

            border:none;

            border-radius:8px;

            cursor:pointer;

            font-size:15px;

        }

        .claim:hover{

            background:#15803d;

        }

        .noData{

            text-align:center;

            font-size:24px;

            padding:80px;

            color:#555;

        }

        .back{

            text-align:center;

            margin:40px;

        }

        .back a{

            text-decoration:none;

            padding:12px 25px;

            background:#2563eb;

            color:white;

            border-radius:8px;

        }

        footer{

            margin-top:30px;

            background:#0f172a;

            color:white;

            padding:18px;

            text-align:center;

        }

    </style>

</head>

<body>

<header>

    <i class="fa-solid fa-magnifying-glass"></i>

    Search Results

</header>

<div class="container">

    <%

        boolean found=false;

        while(rs!=null && rs.next()){

            found=true;

            String status=rs.getString("status");

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

                <b>Location :</b>

                <%=rs.getString("location")%>

            </div>

            <div class="info">

                <b>Date :</b>

                <%=rs.getString("date")%>

            </div>

            <div class="info">

                <b>Status :</b>

                <span class="badge <%=status.equals("Found")?"found":"lost"%>">

<%=status%>

</span>

            </div>

            <a

                    class="btn"

                    href="itemDetails.jsp?id=<%=rs.getInt("id")%>&status=<%=status%>">

                <i class="fa-solid fa-eye"></i>

                View Details

            </a>

            <%

                if(status.equalsIgnoreCase("Found")){

            %>

            <a href="claim.jsp?id=<%=rs.getInt("id")%>" class="btn">

                <i class="fa-solid fa-hand"></i>

                Claim Item

            </a>

            <%

                }

            %>

        </div>

    </div>

    <%

        }

        if(!found){

    %>

    <div class="noData">

        <i class="fa-solid fa-circle-xmark"></i>

        <br><br>

        No matching items found.

    </div>

    <%

        }

    %>

</div>

<div class="back">

    <a href="search.jsp">

        <i class="fa-solid fa-arrow-left"></i>

        Search Again

    </a>

</div>

<footer>

    © 2026 FindIt | Lost & Found Management System

</footer>

</body>

</html>