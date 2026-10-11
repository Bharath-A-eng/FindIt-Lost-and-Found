<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>User Login | FindIt</title>

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

        html{
            scroll-behavior:smooth;
        }

        body{

            min-height:100vh;
            overflow:hidden;

            background:
                    radial-gradient(circle at top,#173454 0%,#08111f 60%,#040814 100%);

            color:white;
        }


        /* =======================
              STAR BACKGROUND
        ========================== */

        #stars{

            position:fixed;
            inset:0;

            background-image:

                    radial-gradient(2px 2px at 15% 20%,#ffffffaa,transparent),
                    radial-gradient(2px 2px at 80% 40%,#ffffff99,transparent),
                    radial-gradient(1px 1px at 70% 15%,#ffffff99,transparent),
                    radial-gradient(2px 2px at 30% 70%,#ffffff99,transparent),
                    radial-gradient(2px 2px at 90% 80%,#ffffffaa,transparent),
                    radial-gradient(1px 1px at 45% 50%,#ffffff99,transparent);

            animation:starsMove 70s linear infinite;

            z-index:-1;

        }

        @keyframes starsMove{

            from{

                transform:translateY(0);

            }

            to{

                transform:translateY(-500px);

            }

        }


        /* =======================
                LAYOUT
        ========================== */

        .page{

            width:90%;
            max-width:1400px;

            margin:auto;

            min-height:100vh;

            display:flex;

            align-items:center;

            justify-content:space-between;

            gap:70px;

        }


        /* =======================
                LEFT
        ========================== */

        .left{

            flex:1;

        }

        .tag{

            display:inline-block;

            padding:12px 24px;

            border-radius:40px;

            border:1px solid rgba(56,189,248,.35);

            background:rgba(56,189,248,.08);

            color:#38bdf8;

            margin-bottom:30px;

        }

        .left h1{

            font-size:72px;

            line-height:1.05;

            margin-bottom:25px;

            font-weight:700;

        }

        .left h1 span{

            color:#38bdf8;

        }

        .left p{

            max-width:520px;

            color:#cbd5e1;

            line-height:1.9;

            font-size:18px;

        }


        /* =======================
                CARD
        ========================== */

        .right{

            flex:1;

            display:flex;

            justify-content:center;

        }

        .login-card{

            width:440px;

            padding:45px;

            border-radius:30px;

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(22px);

            border:1px solid rgba(255,255,255,.10);

            box-shadow:

                    0 0 35px rgba(56,189,248,.15),

                    inset 0 0 25px rgba(255,255,255,.03);

            transition:.45s;

        }

        .login-card:hover{

            transform:translateY(-8px);

            box-shadow:

                    0 20px 45px rgba(56,189,248,.25);

        }


        /* =======================
                LOGO
        ========================== */

        .logo{

            text-align:center;

            font-size:40px;

            font-weight:700;

            margin-bottom:10px;

        }

        .logo span{

            color:#38bdf8;

        }

        .login-card h2{

            text-align:center;

            margin-bottom:35px;

            font-size:28px;

        }


        /* =======================
              INPUTS
        ========================== */

        .input-box{

            position:relative;

            margin-bottom:22px;

        }

        .input-box i{

            position:absolute;

            left:18px;

            top:18px;

            color:#38bdf8;

            font-size:18px;

        }

        .input-box input{

            width:100%;

            padding:16px 18px 16px 52px;

            border-radius:14px;

            border:1px solid rgba(255,255,255,.10);

            background:rgba(255,255,255,.05);

            color:white;

            font-size:15px;

            outline:none;

            transition:.35s;

        }

        .input-box input::placeholder{

            color:#94a3b8;

        }

        .input-box input:focus{

            border-color:#38bdf8;

            box-shadow:0 0 18px rgba(56,189,248,.35);

        }


        /* =======================
              BUTTON
        ========================== */

        button{

            width:100%;

            padding:16px;

            border:none;

            border-radius:50px;

            cursor:pointer;

            font-size:17px;

            font-weight:600;

            color:white;

            background:linear-gradient(90deg,#38bdf8,#2563eb);

            transition:.35s;

        }

        button:hover{

            transform:translateY(-3px);

            box-shadow:0 12px 28px rgba(56,189,248,.35);

        }


        /* =======================
              LINKS
        ========================== */

        .links{

            text-align:center;

            margin-top:28px;

            color:#cbd5e1;

            font-size:15px;

        }

        .links a{

            color:#38bdf8;

            text-decoration:none;

            font-weight:600;

        }

        .links a:hover{

            color:white;

        }


        /* =======================
              RESPONSIVE
        ========================== */

        @media(max-width:1000px){

            body{

                overflow:auto;

            }

            .page{

                flex-direction:column;

                justify-content:center;

                padding:50px 0;

                text-align:center;

            }

            .left h1{

                font-size:56px;

            }

            .left p{

                margin:auto;

            }

        }

    </style>

</head>

<body>

<div id="stars"></div>

<div class="page">

    <div class="left">

        <div class="tag">
            🔐 Secure Access
        </div>

        <h1>

            Welcome<br>

            <span>Back</span>

        </h1>

        <p>

            Login to report lost items, search found belongings,
            track your claims, and reconnect with your valuables
            through the FindIt platform.

        </p>

    </div>

    <div class="right">

        <div class="login-card">

            <div class="logo">

                Find<span>It</span>

            </div>

            <h2>User Login</h2>

            <form action="<%= request.getContextPath() %>/login" method="post">

                <div class="input-box">

                    <i class="fa-solid fa-envelope"></i>

                    <input
                            type="email"
                            name="email"
                            placeholder="Email Address"
                            required>

                </div>

                <div class="input-box">

                    <i class="fa-solid fa-lock"></i>

                    <input
                            type="password"
                            name="password"
                            placeholder="Password"
                            required>

                </div>

                <button type="submit">

                    <i class="fa-solid fa-right-to-bracket"></i>

                    Login

                </button>

            </form>

            <div class="links">

                Don't have an account?

                <a href="register.jsp">

                    Register

                </a>

                <br><br>

                <a href="index.jsp">

                    <i class="fa-solid fa-house"></i>

                    Home

                </a>

            </div>

        </div>

    </div>

</div>

</body>

</html>