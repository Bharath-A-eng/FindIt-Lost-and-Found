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

    <title>User Dashboard | FindIt</title>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>

        .map-container{

            position:relative;
            width:650px;
            display:flex;
            justify-content:center;
            align-items:center;

        }

        .world-map{

            width:100%;
            filter:
                    drop-shadow(0 0 30px rgba(0,170,255,.4))
                    brightness(1.1)
                    contrast(1.1);

            animation:floatMap 6s ease-in-out infinite;

        }

        .map-glow{

            position:absolute;
            width:520px;
            height:260px;
            background:radial-gradient(circle,
            rgba(0,180,255,.25),
            transparent 70%);
            filter:blur(45px);
            z-index:-1;

        }

        @keyframes floatMap{

            0%,100%{

                transform:translateY(0);

            }

            50%{

                transform:translateY(-12px);

            }

        }

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
        }

        html{
            scroll-behavior:smooth;
        }

        body{
            background:#020617;
            color:white;
            overflow-x:hidden;
        }

        /* Scrollbar */

        ::-webkit-scrollbar{
            width:10px;
        }

        ::-webkit-scrollbar-track{
            background:#020617;
        }

        ::-webkit-scrollbar-thumb{
            background:#38bdf8;
            border-radius:20px;
        }

        /* Animated Stars */

        #stars{

            position:fixed;

            top:0;
            left:0;

            width:100%;
            height:100%;

            z-index:-5;

            background:
                    radial-gradient(circle at 20% 20%,rgba(255,255,255,.9) 1px,transparent 1px),
                    radial-gradient(circle at 70% 35%,rgba(255,255,255,.8) 1px,transparent 1px),
                    radial-gradient(circle at 35% 70%,rgba(255,255,255,.9) 1px,transparent 1px),
                    radial-gradient(circle at 90% 80%,rgba(255,255,255,.7) 1px,transparent 1px),
                    #020617;

            background-size:250px 250px;

            animation:starsMove 80s linear infinite;

        }

        @keyframes starsMove{

            from{
                transform:translateY(0);
            }

            to{
                transform:translateY(-250px);
            }

        }

        /* Navbar */

        nav{

            position:fixed;

            top:25px;
            left:50%;

            transform:translateX(-50%);

            width:92%;

            padding:18px 45px;

            display:flex;

            justify-content:space-between;

            align-items:center;

            background:rgba(255,255,255,.08);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,.15);

            border-radius:18px;

            z-index:1000;

            box-shadow:0 0 35px rgba(0,0,0,.25);

        }

        .logo{

            font-size:32px;

            font-weight:800;

        }

        .logo span{

            color:#38bdf8;

        }

        nav ul{

            display:flex;

            gap:30px;

            list-style:none;

            align-items:center;

        }

        nav ul a{

            color:white;

            text-decoration:none;

            transition:.3s;

            font-weight:500;

        }

        nav ul a:hover{

            color:#38bdf8;

        }

        /* Hero */

        .hero{

            min-height:100vh;

            padding:140px 8% 70px;

            display:flex;

            justify-content:space-between;

            align-items:center;

            gap:60px;

            position:relative;

            background:
                    radial-gradient(circle at top,#12355b 0%,#081321 45%,#050b15 100%);

        }

        .hero-left{

            flex:1;

        }

        .hero-right{

            flex:1;

            display:flex;

            justify-content:center;

            align-items:center;

        }

        .tag{

            display:inline-block;

            padding:10px 18px;

            background:rgba(56,189,248,.15);

            border:1px solid rgba(56,189,248,.35);

            color:#38bdf8;

            border-radius:30px;

            margin-bottom:25px;

        }

        .hero h1{

            font-size:70px;

            line-height:1.1;

            margin-bottom:25px;

        }

        .hero h1 span{

            color:#38bdf8;

        }

        .hero p{

            color:#cbd5e1;

            font-size:19px;

            line-height:1.8;

            max-width:650px;

        }

        /* Earth */

        #earthCanvas{

            width:520px;

            height:520px;

            display:block;

        }

        /* Sections */

        .stats,
        .dashboard-actions,
        .activity{

            padding:90px 8%;

        }

        /* Footer */

        footer{

            padding:30px;

            text-align:center;

            color:#94a3b8;

            border-top:1px solid rgba(255,255,255,.08);

            background:#030712;

        }

        .section-title{

            text-align:center;

            font-size:42px;

            margin-bottom:60px;

            font-weight:700;

        }

        .cards{

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(300px,1fr));

            gap:35px;

        }

        .card{

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:24px;

            padding:40px;

            transition:.4s;

            position:relative;

            overflow:hidden;

        }

        /* ===========================
        Statistics
=========================== */

        .stats-grid{

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(220px,1fr));

            gap:30px;

        }

        .stat-card{

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,.10);

            border-radius:22px;

            padding:35px;

            text-align:center;

            transition:.4s;

        }

        .stat-card:hover{

            transform:translateY(-10px);

            box-shadow:0 20px 40px rgba(56,189,248,.25);

        }

        .stat-card i{

            font-size:50px;

            color:#38bdf8;

            margin-bottom:20px;

        }

        .stat-card h3{

            font-size:48px;

            color:white;

            margin-bottom:12px;

        }

        .stat-card p{

            color:#cbd5e1;

            font-size:17px;

        }

        /* ===========================
        Activity Section
=========================== */

        .activity-container{

            display:grid;

            grid-template-columns:2fr 1fr;

            gap:40px;

            align-items:start;

        }

        .timeline{

            position:relative;

            padding-left:40px;

            border-left:2px solid rgba(56,189,248,.35);

        }

        .timeline-item{

            position:relative;

            margin-bottom:45px;

        }

        .circle{

            position:absolute;

            left:-51px;

            top:10px;

            width:18px;

            height:18px;

            border-radius:50%;

            background:#38bdf8;

            box-shadow:0 0 20px #38bdf8;

        }

        .content{

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:18px;

            padding:25px;

            transition:.4s;

        }

        .content:hover{

            transform:translateX(8px);

            box-shadow:0 18px 35px rgba(56,189,248,.18);

        }

        .content h3{

            margin-bottom:12px;

        }

        .content p{

            color:#cbd5e1;

            line-height:1.7;

        }

        /* Profile Card */

        .profile-card{

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(20px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:25px;

            padding:40px;

            text-align:center;

            transition:.4s;

        }

        .profile-card:hover{

            transform:translateY(-8px);

            box-shadow:0 20px 45px rgba(56,189,248,.20);

        }

        .profile-icon{

            width:100px;

            height:100px;

            border-radius:50%;

            margin:auto;

            margin-bottom:25px;

            display:flex;

            justify-content:center;

            align-items:center;

            background:rgba(56,189,248,.15);

            border:1px solid rgba(56,189,248,.30);

        }

        .profile-icon i{

            font-size:48px;

            color:#38bdf8;

        }

        .profile-card h3{

            font-size:28px;

            margin-bottom:15px;

        }

        .profile-card p{

            color:#cbd5e1;

            line-height:1.8;

            margin-bottom:30px;

        }

        .profile-buttons{

            display:flex;

            gap:15px;

            justify-content:center;

            flex-wrap:wrap;

        }

        .profile-buttons a{

            padding:12px 24px;

            border-radius:40px;

            background:#38bdf8;

            color:white;

            text-decoration:none;

            transition:.3s;

            font-weight:600;

        }

        .profile-buttons a:hover{

            transform:translateY(-3px);

            box-shadow:0 15px 25px rgba(56,189,248,.35);

        }

        /* Responsive */

        @media(max-width:900px){

            .activity-container{

                grid-template-columns:1fr;

            }

        }

        .card::before{

            content:"";

            position:absolute;

            inset:0;

            background:linear-gradient(
                    135deg,
                    transparent,
                    rgba(56,189,248,.18),
                    transparent
            );

            transform:translateX(-100%);

            transition:.8s;

        }

        .card:hover::before{

            transform:translateX(100%);

        }

        .card:hover{

            transform:translateY(-12px);

            box-shadow:0 25px 45px rgba(56,189,248,.22);

        }

        .icon{

            width:90px;

            height:90px;

            border-radius:50%;

            margin:auto;

            margin-bottom:25px;

            display:flex;

            justify-content:center;

            align-items:center;

            background:rgba(56,189,248,.12);

            border:1px solid rgba(56,189,248,.35);

        }

        .icon i{

            font-size:42px;

            color:#38bdf8;

        }

        .card h3{

            text-align:center;

            margin-bottom:18px;

            font-size:24px;

        }

        .card p{

            text-align:center;

            color:#cbd5e1;

            line-height:1.8;

            margin-bottom:30px;

        }

        .card a{

            display:block;

            width:fit-content;

            margin:auto;

            padding:14px 30px;

            border-radius:40px;

            background:#38bdf8;

            color:white;

            text-decoration:none;

            font-weight:600;

            transition:.3s;

        }

        .card a:hover{

            transform:translateY(-4px);

            box-shadow:0 15px 30px rgba(56,189,248,.35);

        }

        /* Responsive */

        @media(max-width:1000px){

            .hero{

                flex-direction:column;

                text-align:center;

            }

            .hero h1{

                font-size:52px;

            }

            #earthCanvas{

                width:340px;

                height:340px;

            }

            nav{

                flex-direction:column;

                gap:20px;

                padding:20px;

            }

            nav ul{

                flex-wrap:wrap;

                justify-content:center;

            }

        }

        /*=========================
      Premium Earth
==========================*/
        .map-container{

            position:relative;

            width:650px;
            height:650px;

            display:flex;
            justify-content:center;
            align-items:center;

        }

        .world-map{

            width:100%;
            max-width:620px;

            opacity:.95;

            filter:
                    brightness(1.05)
                    contrast(1.1)
                    drop-shadow(0 0 20px rgba(56,189,248,.35))
                    drop-shadow(0 0 60px rgba(56,189,248,.25));

            animation:floatMap 6s ease-in-out infinite;

        }

        .map-glow{

            position:absolute;

            width:500px;
            height:250px;

            background:radial-gradient(circle,
            rgba(56,189,248,.25),
            transparent 70%);

            filter:blur(55px);

            z-index:-1;

        }

        @keyframes floatMap{

            0%{

                transform:translateY(0);

            }

            50%{

                transform:translateY(-12px);

            }

            100%{

                transform:translateY(0);

            }

        }
        /* Floating animation */

        .hero-right{

            animation:floatEarth 6s ease-in-out infinite;

        }

        @keyframes floatEarth{

            0%{

                transform:translateY(0px);

            }

            50%{

                transform:translateY(-12px);

            }

            100%{

                transform:translateY(0px);

            }

        }

        /* Hero title */

        .hero h1{

            font-size:72px;

            font-weight:800;

            line-height:1.1;

        }

        .hero p{

            font-size:19px;

            color:#cbd5e1;

            line-height:1.9;

        }

        /* Hero tag */

        .tag{

            box-shadow:0 0 20px rgba(56,189,248,.25);

        }

        /* Better navbar hover */

        nav ul a{

            position:relative;

        }

        nav ul a::after{

            content:"";

            position:absolute;

            left:0;

            bottom:-6px;

            width:0;

            height:2px;

            background:#38bdf8;

            transition:.35s;

        }

        nav ul a:hover::after{

            width:100%;

        }

        /* Footer */

        footer{

            background:#020617;

            color:#94a3b8;

            padding:40px;

            border-top:1px solid rgba(255,255,255,.08);

        }

    </style>

</head>

<body>

<div id="stars"></div>

<!-- ================= NAVBAR ================= -->

<nav>

    <div class="logo">

        Find<span>It</span>

    </div>

    <ul>

        <li>

            <a href="index.jsp">

                Home

            </a>

        </li>

        <li>

            <a href="myReports.jsp">

                My Reports

            </a>

        </li>

        <li>

            <a href="search.jsp">

                Search

            </a>

        </li>

        <li>

            <a href="logout">

                Logout

            </a>

        </li>

    </ul>

</nav>

<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-left">

        <div class="tag">

            🚀 Welcome Back

        </div>

        <h1>

            Hello,

            <span><%=name%></span>

        </h1>

        <p>

            Manage your reports, search found belongings,
            track your claims, and reconnect with your valuables
            from one beautiful dashboard.

        </p>

    </div>

    <div class="hero-right">

        <div class="map-container">

            <img src="assets/textures/world-map.png"
                 class="world-map"
                 alt="World Map">

            <div class="map-glow"></div>

        </div>

    </div>

</section>

<!-- ===== Stats Section ===== -->

<section class="stats">

    <h2 class="section-title">

        Dashboard Statistics

    </h2>

    <div class="stats-grid">

        <div class="stat-card">

            <i class="fa-solid fa-box-open"></i>

            <h3 id="lostCounter">0</h3>

            <p>Lost Reports</p>

        </div>

        <div class="stat-card">

            <i class="fa-solid fa-circle-check"></i>

            <h3 id="claimCounter">0</h3>

            <p>Claims Submitted</p>

        </div>

        <div class="stat-card">

            <i class="fa-solid fa-handshake"></i>

            <h3 id="foundCounter">0</h3>

            <p>Items Recovered</p>

        </div>

        <div class="stat-card">

            <i class="fa-solid fa-bell"></i>

            <h3 id="notificationCounter">0</h3>

            <p>Notifications</p>

        </div>

    </div>

</section>

<!-- ===== Quick Actions ===== -->

<section class="dashboard-actions">

    <h2 class="section-title">

        Quick Actions

    </h2>

    <div class="cards">

        <div class="card">

            <div class="icon">

                <i class="fa-solid fa-box-open"></i>

            </div>

            <h3>Report Lost Item</h3>

            <p>

                Submit details about your lost belongings and let our system help locate them.

            </p>

            <a href="reportLost.jsp">

                Report Now

            </a>

        </div>

        <div class="card">

            <div class="icon">

                <i class="fa-solid fa-magnifying-glass"></i>

            </div>

            <h3>Search Found Items</h3>

            <p>

                Browse all found items reported by administrators and submit a claim.

            </p>

            <a href="search.jsp">

                Search

            </a>

        </div>

        <div class="card">

            <div class="icon">

                <i class="fa-solid fa-file-lines"></i>

            </div>

            <h3>My Reports</h3>

            <p>

                View every lost report you've submitted and track their current status.

            </p>

            <a href="myReports.jsp">

                View Reports

            </a>

        </div>

    </div>

</section>

<!-- ===== Recent Activity ===== -->

<section class="activity">

    <h2 class="section-title">

        Recent Activity

    </h2>

    <div class="activity-container">

        <div class="timeline">

            <div class="timeline-item">

                <div class="circle"></div>

                <div class="content">

                    <h3>

                        Lost Item Report Submitted

                    </h3>

                    <p>

                        You reported your Black Wallet yesterday.

                    </p>

                </div>

            </div>

            <div class="timeline-item">

                <div class="circle"></div>

                <div class="content">

                    <h3>

                        Found Item Matched

                    </h3>

                    <p>

                        A matching item has been reported by the administrator.

                    </p>

                </div>

            </div>

            <div class="timeline-item">

                <div class="circle"></div>

                <div class="content">

                    <h3>

                        Claim Submitted

                    </h3>

                    <p>

                        Your ownership proof has been successfully submitted.

                    </p>

                </div>

            </div>

            <div class="timeline-item">

                <div class="circle"></div>

                <div class="content">

                    <h3>

                        Waiting For Approval

                    </h3>

                    <p>

                        Your claim is currently under admin verification.

                    </p>

                </div>

            </div>

        </div>

        <div class="profile-card">

            <div class="profile-icon">

                <i class="fa-solid fa-user"></i>

            </div>

            <h3>

                <%=name%>

            </h3>

            <p>

                Welcome back to FindIt.

                Your dashboard keeps track of reports, claims,
                and recovered belongings in one place.

            </p>

            <div class="profile-buttons">

                <a href="reportLost.jsp">

                    Report Item

                </a>

                <a href="search.jsp">

                    Search

                </a>

            </div>

        </div>

    </div>

</section>

<!-- ===== Footer ===== -->

<footer>

    © 2026 FindIt • Lost & Found Management System

</footer>



<script>

    function animateCounter(id,target){

        let count=0;

        const speed=25;

        const element=document.getElementById(id);

        const increment=Math.ceil(target/80);

        const timer=setInterval(function(){

            count+=increment;

            if(count>=target){

                count=target;

                clearInterval(timer);

            }

            element.innerText=count;

        },speed);

    }

    animateCounter("lostCounter",12);

    animateCounter("claimCounter",8);

    animateCounter("foundCounter",5);

    animateCounter("notificationCounter",16);

</script>

</body>

</html>