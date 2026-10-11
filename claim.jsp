<%@ page import="java.sql.*" %>
<%@ page import="com.findit.dao.SearchDAO" %>

<%
    String itemId = request.getParameter("id");

    Integer userId = (Integer) session.getAttribute("userId");
    System.out.println("Logged In User ID = " + userId);


    if(userId == null){
        response.sendRedirect("login.jsp");
        return;
    }

    SearchDAO dao = new SearchDAO();
    ResultSet lostItems = dao.getUserLostReports(userId);
%>

<!DOCTYPE html>
<html>

<head>

    <title>Claim Item</title>

    <style>

        body{
            font-family:Arial;
            background:#f4f6f9;
        }

        .container{

            width:500px;
            margin:50px auto;
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0 0 10px rgba(0,0,0,.2);

        }

        h2{
            text-align:center;
            color:#2563eb;
        }

        select,
        textarea{

            width:100%;
            padding:10px;
            margin-top:10px;
            margin-bottom:20px;

        }

        button{

            width:100%;
            padding:12px;
            background:#16a34a;
            color:white;
            border:none;
            cursor:pointer;
            font-size:16px;

        }

        button:hover{

            background:#15803d;

        }

    </style>

</head>

<body>

<h3>Logged In User ID = <%= userId %></h3>


<div class="container">

    <h2>Claim Found Item</h2>

    <form action="claimItem" method="post">

        <input type="hidden"
               name="itemId"
               value="<%=itemId%>">

        <label>

            Select Your Lost Report

        </label>

        <select name="lostItemId" required>

            <option value="">

                -- Select Lost Report --

            </option>

            <%

                while(lostItems!=null && lostItems.next()){

            %>

            <option value="<%=lostItems.getInt("id")%>">

                <%=lostItems.getString("item_name")%>

                (ID : <%=lostItems.getInt("id")%>)

            </option>

            <%

                }

            %>

        </select>

        <label>

            Proof that this item belongs to you

        </label>

        <textarea
                name="proof"
                rows="5"
                required></textarea>

        <button type="submit">

            Submit Claim

        </button>

    </form>

</div>

</body>


</html>