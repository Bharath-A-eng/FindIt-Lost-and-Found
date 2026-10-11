<%@ page import="java.sql.*" %>
<%@ page import="com.findit.dao.ClaimDAO" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");

    if(adminId == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    ClaimDAO dao = new ClaimDAO();
    ResultSet rs = dao.getAllClaims();
%>

<!DOCTYPE html>
<html>

<head>

    <title>Manage Claims | FindIt Admin</title>

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
            padding:10px 18px;
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

        .table-container{

            width:96%;
            margin:auto;
            background:white;
            padding:25px;
            border-radius:18px;
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

        /* Status */

        .pending{

            background:#f59e0b;
            color:white;
            padding:6px 15px;
            border-radius:20px;
            font-size:13px;
            font-weight:600;

        }

        .approved{

            background:#10b981;
            color:white;
            padding:6px 15px;
            border-radius:20px;
            font-size:13px;
            font-weight:600;

        }

        .rejected{

            background:#ef4444;
            color:white;
            padding:6px 15px;
            border-radius:20px;
            font-size:13px;
            font-weight:600;

        }

        /* Buttons */

        .approve{

            display:inline-block;
            background:#10b981;
            color:white;
            padding:8px 16px;
            border-radius:8px;
            text-decoration:none;
            margin:2px;
            transition:.3s;

        }

        .approve:hover{

            background:#059669;

        }

        .reject{

            display:inline-block;
            background:#ef4444;
            color:white;
            padding:8px 16px;
            border-radius:8px;
            text-decoration:none;
            margin:2px;
            transition:.3s;

        }

        .reject:hover{

            background:#dc2626;

        }

        .back{

            display:inline-block;
            margin-top:30px;
            background:#0f172a;
            color:white;
            padding:12px 25px;
            border-radius:8px;
            text-decoration:none;
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
            padding:20px;

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

        <i class="fa-solid fa-handshake-angle"></i>

        Manage Item Claims

    </h1>

    <p>

        Review user ownership claims and approve or reject them.

    </p>

</div>

<div class="table-container">

    <table>

        <tr>

            <th>Claim ID</th>
            <th>Item Name</th>
            <th>Claimed By</th>
            <th>Email</th>
            <th>Proof</th>
            <th>Submitted On</th>
            <th>Status</th>
            <th>Action</th>

        </tr>

        <%

            while(rs!=null && rs.next()){

                String status = rs.getString("status");

        %>

        <tr>

            <td>

                <%=rs.getInt("id")%>

            </td>

            <td>

                <b><%=rs.getString("item_name")%></b>

            </td>

            <td>

                <%=rs.getString("name")%>

            </td>

            <td>

                <%=rs.getString("email")%>

            </td>

            <td style="text-align:left;max-width:250px;">

                <%=rs.getString("proof")%>

            </td>

            <td>

                <%=rs.getTimestamp("created_at")%>

            </td>

            <td>

                <%

                    if(status.equalsIgnoreCase("Pending")){

                %>

                <span class="pending">Pending</span>

                <%

                }else if(status.equalsIgnoreCase("Approved")){

                %>

                <span class="approved">Approved</span>

                <%

                }else{

                %>

                <span class="rejected">Rejected</span>

                <%

                    }

                %>

            </td>

            <td>

                <%

                    if(status.equalsIgnoreCase("Pending")){

                %>

                <a class="approve"
                   href="approveClaim?id=<%=rs.getInt("id")%>">

                    <i class="fa-solid fa-check"></i>

                    Approve

                </a>

                <a class="reject"
                   href="rejectClaim?id=<%=rs.getInt("id")%>">

                    <i class="fa-solid fa-xmark"></i>

                    Reject

                </a>

                <%

                }else{

                %>

                —

                <%

                    }

                %>

            </td>

        </tr>

        <%

            }

        %>

    </table>

</div>

<center>

    <a href="adminDashboard.jsp" class="back">

        <i class="fa-solid fa-arrow-left"></i>

        Back to Dashboard

    </a>

</center>

<footer>

    © 2026 FindIt | Lost & Found Management System

    <br>

    Developed by <b>Bharath</b>

</footer>

</body>

</html>