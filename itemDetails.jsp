<%@ page import="java.sql.*" %>
<%@ page import="com.findit.util.DBConnection" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String type = request.getParameter("status");

    Connection con = DBConnection.getConnection();

    PreparedStatement ps;

    if(type.equalsIgnoreCase("Lost")){
        ps = con.prepareStatement("SELECT * FROM lost_items WHERE id=?");
    }else{
        ps = con.prepareStatement("SELECT * FROM found_items WHERE id=?");
    }

    ps.setInt(1,id);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){

        String currentStatus = rs.getString("status");

%>

<!DOCTYPE html>

<html>

<head>

    <title>Item Details | FindIt</title>

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

        .container{

            width:90%;
            max-width:1100px;
            margin:50px auto;

            background:white;

            border-radius:15px;

            box-shadow:0 10px 30px rgba(0,0,0,.1);

            display:flex;

            flex-wrap:wrap;

            overflow:hidden;

        }

        .image{

            flex:1;

            min-width:350px;

            padding:30px;

            text-align:center;

        }

        .image img{

            width:100%;

            max-width:420px;

            height:350px;

            object-fit:cover;

            border-radius:10px;

        }

        .details{

            flex:1;

            padding:35px;

        }

        .details h1{

            color:#2563eb;

            margin-bottom:20px;

        }

        .info{

            margin:15px 0;

            font-size:17px;

            line-height:1.6;

        }

        .badge{

            display:inline-block;

            padding:7px 18px;

            border-radius:20px;

            color:white;

            font-weight:bold;

        }

        .found{

            background:#16a34a;

        }

        .lost{

            background:#dc2626;

        }

        textarea{

            width:100%;

            padding:12px;

            margin-top:20px;

            border-radius:8px;

            border:1px solid #ccc;

            resize:none;

        }

        button{

            width:100%;

            margin-top:20px;

            padding:14px;

            background:#16a34a;

            color:white;

            border:none;

            border-radius:8px;

            font-size:16px;

            cursor:pointer;

            transition:.3s;

        }

        button:hover{

            background:#15803d;

        }

        .back{

            display:inline-block;

            margin-top:25px;

            padding:12px 25px;

            background:#2563eb;

            color:white;

            text-decoration:none;

            border-radius:8px;

        }

        .back:hover{

            background:#1d4ed8;

        }

    </style>

</head>

<body>

<nav>

    <div class="logo">

        Find<span>It</span>

    </div>

    <a href="search.jsp">

        <i class="fa-solid fa-arrow-left"></i>

        Back to Search

    </a>

</nav>

<div class="container">

    <div class="image">

        <img src="<%=rs.getString("image_path")%>">

    </div>

    <div class="details">

        <h1>

            <%=rs.getString("item_name")%>

        </h1>

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
            <b>Date :</b>

            <% if(type.equalsIgnoreCase("Lost")) { %>
            <%= rs.getString("lost_date") %>
            <% } else { %>
            <%= rs.getString("found_date") %>
            <% } %>
        </div>

        <div class="info">

            <b>Status :</b>

            <span class="badge <%= (currentStatus.equalsIgnoreCase("Found") ||
                         currentStatus.equalsIgnoreCase("Claimed"))
                         ? "found" : "lost" %>">

<%=currentStatus%>

</span>

        </div>

        <%
            if(currentStatus.equalsIgnoreCase("Found") &&
                    type.equalsIgnoreCase("Lost")){
        %>

        <div style="
margin-top:20px;
padding:15px;
background:#dcfce7;
border-left:5px solid #16a34a;
border-radius:8px;
color:#166534;
font-weight:bold;
">

            ✅ This lost item has been found successfully.

        </div>

        <%
            }
        %>


        <%
            if(type.equalsIgnoreCase("Found") &&
                    currentStatus.equalsIgnoreCase("Found")){
        %>

        <div style="
margin-top:20px;
padding:15px;
background:#dcfce7;
border-left:5px solid #16a34a;
border-radius:8px;
color:#166534;
font-weight:bold;
">

            ✅ This item has been found and is available for claim.

        </div>

        <hr style="margin:30px 0;">

        <h2>
            <i class="fa-solid fa-hand"></i>
            Claim This Item
        </h2>

        <a href="claim.jsp?id=<%=id%>"
           style="
        display:block;
        width:100%;
        text-align:center;
        margin-top:20px;
        padding:14px;
        background:#16a34a;
        color:white;
        text-decoration:none;
        border-radius:8px;
        font-size:16px;">

            <i class="fa-solid fa-hand"></i>
            Claim This Item

        </a>

        <%
            }
        %>

        <%
            if(currentStatus.equalsIgnoreCase("Claimed")){
        %>

        <div style="
margin-top:20px;
padding:15px;
background:#dbeafe;
border-left:5px solid #2563eb;
border-radius:8px;
color:#1d4ed8;
font-weight:bold;
">

            🎉 This found item has already been claimed by its owner.

        </div>

        <%
            }
        %>

        <a class="back" href="search.jsp">

            <i class="fa-solid fa-arrow-left"></i>

            Back to Search

        </a>

    </div>

</div>

</body>

</html>

<%
    }
    con.close();
%>