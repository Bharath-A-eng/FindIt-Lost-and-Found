<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>FindIt | Lost & Found Management System</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Poppins',sans-serif;
            scroll-behavior:smooth;
        }

        body{
            background:#020817;
            color:white;
            overflow-x:hidden;
        }

        a{
            text-decoration:none;
            color:white;
        }

        ul{
            list-style:none;
        }

        /* ---------------- NAVBAR ---------------- */

        nav{

            position:fixed;

            top:20px;

            left:50%;

            transform:translateX(-50%);

            width:92%;

            height:72px;

            display:flex;

            justify-content:space-between;

            align-items:center;

            padding:0 45px;

            background:rgba(255,255,255,.06);

            backdrop-filter:blur(18px);

            border:1px solid rgba(255,255,255,.12);

            border-radius:18px;

            z-index:999;

        }

        .logo{

            font-size:30px;

            font-weight:800;

        }

        .logo span{

            color:#38bdf8;

        }

        nav ul{

            display:flex;

            gap:28px;

        }

        nav ul li a{

            font-size:15px;

            transition:.35s;

        }

        nav ul li a:hover{

            color:#38bdf8;

        }

        /* ---------------- HERO ---------------- */

        .hero{

            width:100%;

            min-height:100vh;

            display:flex;

            align-items:center;

            justify-content:center;

            padding:130px 8% 80px;

            background:

                    radial-gradient(circle at top,#17375d 0%,#071321 45%,#020817 100%);

            position:relative;

            overflow:hidden;

        }

        .hero::before{

            content:"";

            position:absolute;

            inset:0;

            background-image:

                    radial-gradient(white 1px,transparent 1px),

                    radial-gradient(#38bdf8 1px,transparent 1px),

                    radial-gradient(white 1px,transparent 1px);

            background-size:

                    140px 140px,

                    220px 220px,

                    300px 300px;

            opacity:.35;

            animation:stars 120s linear infinite;

        }

        @keyframes stars{

            from{

                transform:translateY(0);

            }

            to{

                transform:translateY(-1200px);

            }

        }

        .hero-container{

            width:100%;

            max-width:1400px;

            display:flex;

            justify-content:space-between;

            align-items:center;

            gap:60px;

            position:relative;

            z-index:10;

        }

        .hero-left{

            flex:1;

            animation:slideLeft 1.2s ease;

        }

        .hero-right{

            flex:1;

            display:flex;

            justify-content:center;

            align-items:center;

            height:520px;

            position:relative;

        }

        #earthCanvas{

            width:520px;

            height:520px;

            display:block;

        }

        .tag{

            display:inline-block;

            padding:10px 20px;

            border-radius:30px;

            background:rgba(56,189,248,.15);

            border:1px solid rgba(56,189,248,.35);

            color:#38bdf8;

            font-size:14px;

            margin-bottom:25px;

        }

        .hero h1{

            font-size:68px;

            line-height:1.1;

            margin-bottom:20px;

            font-weight:800;

        }

        .hero h1 span{

            color:#38bdf8;

        }

        .hero p{

            font-size:19px;

            color:#cbd5e1;

            line-height:1.9;

            max-width:650px;

            margin-bottom:40px;

        }

        .hero-buttons{

            display:flex;

            gap:18px;

        }

        .btn{

            padding:15px 34px;

            border-radius:40px;

            font-weight:600;

            transition:.35s;

        }

        .btn-primary{

            background:#38bdf8;

        }

        .btn-primary:hover{

            transform:translateY(-5px);

            box-shadow:0 18px 35px rgba(56,189,248,.45);

        }

        .btn-outline{

            border:2px solid white;

        }

        .btn-outline:hover{

            background:white;

            color:#020817;

        }

        @keyframes slideLeft{

            from{

                opacity:0;

                transform:translateX(-80px);

            }

            to{

                opacity:1;

                transform:translateX(0);

            }

        }


        /*=========================
        STATS
==========================*/

        .stats{

            display:grid;

            grid-template-columns:repeat(4,1fr);

            gap:30px;

            padding:90px 8%;

            background:#061220;

        }

        .stat-card{

            background:rgba(255,255,255,.05);

            backdrop-filter:blur(20px);

            border:1px solid rgba(255,255,255,.08);

            border-radius:22px;

            padding:40px;

            text-align:center;

            transition:.4s;

        }

        .stat-card:hover{

            transform:translateY(-10px);

            box-shadow:0 20px 40px rgba(56,189,248,.25);

        }

        .stat-card i{

            font-size:45px;

            color:#38bdf8;

            margin-bottom:20px;

        }

        .stat-card h2{

            font-size:42px;

            margin-bottom:10px;

        }

        .stat-card p{

            color:#cbd5e1;

        }



        /*=========================
              FEATURES
        ==========================*/

        .features{

            padding:110px 8%;

            background:#020817;

        }

        .section-title{

            text-align:center;

            max-width:750px;

            margin:auto;

            margin-bottom:70px;

        }

        .section-title h2{

            font-size:48px;

            margin-bottom:20px;

        }

        .section-title p{

            color:#94a3b8;

            font-size:18px;

            line-height:1.8;

        }

        .cards{

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(280px,1fr));

            gap:35px;

        }

        .card{

            background:rgba(255,255,255,.05);

            border-radius:25px;

            padding:40px;

            border:1px solid rgba(255,255,255,.08);

            transition:.45s;

            position:relative;

            overflow:hidden;

            backdrop-filter:blur(15px);

        }

        .card::before{

            content:"";

            position:absolute;

            width:250px;

            height:250px;

            background:rgba(56,189,248,.08);

            border-radius:50%;

            top:-120px;

            right:-120px;

            transition:.6s;

        }

        .card:hover::before{

            transform:scale(2);

        }

        .card:hover{

            transform:translateY(-15px);

            box-shadow:0 25px 45px rgba(56,189,248,.18);

        }

        .card i{

            font-size:55px;

            margin-bottom:25px;

            color:#38bdf8;

        }

        .card h3{

            font-size:24px;

            margin-bottom:18px;

        }

        .card p{

            line-height:1.8;

            color:#cbd5e1;

        }

        @media(max-width:1000px){

            .stats{

                grid-template-columns:repeat(2,1fr);

            }

        }

        @media(max-width:700px){

            .stats{

                grid-template-columns:1fr;

            }

            .hero-container{

                flex-direction:column;

                text-align:center;

            }

            .hero-right{

                margin-top:50px;

            }

        }


        /*==========================
      HOW IT WORKS
===========================*/

        .how-it-works{

            padding:110px 8%;

            background:#061220;

        }

        .timeline{

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));

            gap:35px;

            margin-top:60px;

        }

        .step{

            background:rgba(255,255,255,.05);

            padding:40px;

            border-radius:25px;

            text-align:center;

            border:1px solid rgba(255,255,255,.08);

            transition:.4s;

        }

        .step:hover{

            transform:translateY(-10px);

            box-shadow:0 18px 35px rgba(56,189,248,.2);

        }

        .step-icon{

            width:80px;

            height:80px;

            margin:auto;

            border-radius:50%;

            background:#38bdf8;

            display:flex;

            justify-content:center;

            align-items:center;

            font-size:34px;

            margin-bottom:25px;

            color:white;

        }



        /*==========================
                ABOUT
        ===========================*/

        .about{

            padding:120px 8%;

            display:flex;

            justify-content:space-between;

            align-items:center;

            gap:80px;

            background:#020817;

            flex-wrap:wrap;

        }

        .about-left{

            flex:1;

        }

        .about-left h2{

            font-size:48px;

            margin-bottom:25px;

        }

        .about-left p{

            font-size:18px;

            line-height:1.9;

            color:#cbd5e1;

            margin-bottom:20px;

        }

        .about-right{

            flex:1;

            display:flex;

            justify-content:center;

        }

        .about-box{

            background:rgba(255,255,255,.05);

            padding:50px;

            border-radius:25px;

            text-align:center;

            border:1px solid rgba(255,255,255,.08);

            max-width:420px;

        }

        .about-box i{

            font-size:70px;

            margin-bottom:20px;

            color:#38bdf8;

        }



        /*==========================
              TESTIMONIALS
        ===========================*/

        .testimonials{

            padding:110px 8%;

            background:#061220;

        }

        .testimonial-container{

            display:grid;

            grid-template-columns:repeat(auto-fit,minmax(300px,1fr));

            gap:35px;

            margin-top:60px;

        }

        .testimonial{

            background:rgba(255,255,255,.05);

            padding:35px;

            border-radius:22px;

            border:1px solid rgba(255,255,255,.08);

            transition:.4s;

        }

        .testimonial:hover{

            transform:translateY(-10px);

        }

        .testimonial p{

            color:#cbd5e1;

            line-height:1.8;

            margin-bottom:20px;

        }

        .testimonial h4{

            color:#38bdf8;

        }



        /*==========================
              CONTACT
        ===========================*/

        .contact{

            padding:120px 8%;

            background:#020817;

        }

        .contact-box{

            max-width:700px;

            margin:auto;

        }

        .contact input,

        .contact textarea{

            width:100%;

            padding:18px;

            margin-bottom:20px;

            background:rgba(255,255,255,.05);

            border:1px solid rgba(255,255,255,.08);

            border-radius:15px;

            color:white;

            font-size:16px;

        }

        .contact textarea{

            height:170px;

            resize:none;

        }

        .contact button{

            width:100%;

            padding:18px;

            border:none;

            border-radius:15px;

            background:#38bdf8;

            font-size:18px;

            font-weight:600;

            cursor:pointer;

            transition:.35s;

            color:white;

        }

        .contact button:hover{

            background:#0ea5e9;

        }


        /*==========================
        FOOTER
===========================*/

        footer{

            background:#01060f;

            padding:80px 8%;

            text-align:center;

        }

        .footer-content h2{

            font-size:40px;

            margin-bottom:20px;

        }

        .footer-content span{

            color:#38bdf8;

        }

        .footer-content p{

            color:#cbd5e1;

            line-height:1.9;

        }

        .socials{

            margin:35px 0;

        }

        .socials a{

            display:inline-flex;

            justify-content:center;

            align-items:center;

            width:55px;

            height:55px;

            margin:10px;

            border-radius:50%;

            background:rgba(255,255,255,.05);

            font-size:22px;

            transition:.4s;

        }

        .socials a:hover{

            background:#38bdf8;

            transform:translateY(-8px);

        }

        footer hr{

            margin:40px auto;

            width:85%;

            border:0;

            border-top:1px solid rgba(255,255,255,.1);

        }


    </style>

</head>

<body>

<nav>

    <div class="logo">

        Find<span>It</span>

    </div>

    <ul>

        <li><a href="#">Home</a></li>

        <li><a href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>

        <li><a href="register.jsp"><i class="fa-solid fa-user-plus"></i> Register</a></li>

        <li><a href="adminLogin.jsp"><i class="fa-solid fa-user-shield"></i> Admin</a></li>

        <li><a href="#about">About</a></li>

        <li><a href="#contact">Contact</a></li>

    </ul>

</nav>

<section class="hero">

    <div class="hero-container">

        <div class="hero-left">

            <div class="tag">

                🚀 Smart Lost & Found Platform

            </div>

            <h1>

                Reconnect With

                <br>

                <span>Your World</span>

            </h1>

            <p>

                FindIt is a modern Lost & Found Management System that helps people reconnect with their lost belongings securely, intelligently and faster than ever.

            </p>

            <div class="hero-buttons">

                <a href="register.jsp" class="btn btn-primary">

                    Get Started

                </a>

                <a href="login.jsp" class="btn btn-outline">

                    Login

                </a>

            </div>

        </div>

        <div class="hero-right">

            <canvas id="earthCanvas"></canvas>

        </div>

    </div>

</section>

<!-- ===================== STATS ===================== -->

<section class="stats">

    <div class="stat-card">

        <i class="fa-solid fa-users"></i>

        <h2>10K+</h2>

        <p>Community Members</p>

    </div>

    <div class="stat-card">

        <i class="fa-solid fa-box-open"></i>

        <h2>25K+</h2>

        <p>Lost Items Reported</p>

    </div>

    <div class="stat-card">

        <i class="fa-solid fa-check-circle"></i>

        <h2>18K+</h2>

        <p>Successfully Recovered</p>

    </div>

    <div class="stat-card">

        <i class="fa-solid fa-earth-asia"></i>

        <h2>24×7</h2>

        <p>Always Available</p>

    </div>

</section>



<!-- ===================== FEATURES ===================== -->

<section class="features">

    <div class="section-title">

        <h2>Why Choose FindIt?</h2>

        <p>
            Built with modern technology to reconnect people with their belongings
            quickly, securely and efficiently.
        </p>

    </div>

    <div class="cards">

        <div class="card">

            <i class="fa-solid fa-box-open"></i>

            <h3>Report Lost Items</h3>

            <p>

                Easily report lost belongings with complete details
                and photos in just a few clicks.

            </p>

        </div>

        <div class="card">

            <i class="fa-solid fa-magnifying-glass"></i>

            <h3>Search Found Items</h3>

            <p>

                Browse thousands of found items uploaded by administrators
                and quickly find a match.

            </p>

        </div>

        <div class="card">

            <i class="fa-solid fa-shield-halved"></i>

            <h3>Secure Claim Process</h3>

            <p>

                Every claim is verified before approval,
                ensuring rightful ownership.

            </p>

        </div>

        <div class="card">

            <i class="fa-solid fa-bolt"></i>

            <h3>Fast Recovery</h3>

            <p>

                Smart matching helps owners recover their valuables
                much faster.

            </p>

        </div>

    </div>

</section>

<!-- ================= HOW IT WORKS ================= -->

<section class="how-it-works">

    <div class="section-title">

        <h2>How FindIt Works</h2>

        <p>
            Recovering your belongings is simple, secure and transparent.
        </p>

    </div>

    <div class="timeline">

        <div class="step">

            <div class="step-icon">
                <i class="fa-solid fa-circle-exclamation"></i>
            </div>

            <h3>Report Lost Item</h3>

            <p>
                Submit complete information including
                item name, description, image and location.
            </p>

        </div>

        <div class="step">

            <div class="step-icon">
                <i class="fa-solid fa-box-open"></i>
            </div>

            <h3>Admin Reports Found Item</h3>

            <p>
                Administrators upload found items
                after verification.
            </p>

        </div>

        <div class="step">

            <div class="step-icon">
                <i class="fa-solid fa-hand"></i>
            </div>

            <h3>Claim Item</h3>

            <p>
                The owner submits proof of ownership
                and requests the item.
            </p>

        </div>

        <div class="step">

            <div class="step-icon">
                <i class="fa-solid fa-circle-check"></i>
            </div>

            <h3>Verified Recovery</h3>

            <p>
                After admin approval,
                the item is successfully reunited
                with its owner.
            </p>

        </div>

    </div>

</section>



<!-- ================= ABOUT ================= -->

<section class="about" id="about">

    <div class="about-left">

        <h2>About FindIt</h2>

        <p>

            FindIt is a modern Lost & Found Management System
            designed to help individuals recover their lost belongings
            through a secure, transparent and intelligent process.

        </p>

        <p>

            From reporting lost items to verified claiming,
            every step is carefully managed to ensure
            trust and authenticity.

        </p>

    </div>

    <div class="about-right">

        <div class="about-box">

            <i class="fa-solid fa-earth-asia"></i>

            <h3>Global Vision</h3>

            <p>

                Designed to work beyond colleges,
                making lost & found accessible everywhere.

            </p>

        </div>

    </div>

</section>



<!-- ================= TESTIMONIALS ================= -->

<section class="testimonials">

    <div class="section-title">

        <h2>What People Say</h2>

    </div>

    <div class="testimonial-container">

        <div class="testimonial">

            <p>

                "A beautiful and reliable platform that makes
                recovering lost belongings incredibly simple."

            </p>

            <h4>— Student User</h4>

        </div>

        <div class="testimonial">

            <p>

                "The verification process makes FindIt
                trustworthy and secure."

            </p>

            <h4>— Administrator</h4>

        </div>

        <div class="testimonial">

            <p>

                "The interface feels modern and premium.
                It is very easy to use."

            </p>

            <h4>— Community Member</h4>

        </div>

    </div>

</section>



<!-- ================= CONTACT ================= -->

<section class="contact" id="contact">

    <div class="section-title">

        <h2>Developer Contact</h2>

    </div>

    <div class="contact-box">

        <form>

            <input type="text" placeholder="Your Name">

            <input type="email" placeholder="Email Address">

            <textarea placeholder="Write your message..."></textarea>

            <button type="submit">

                <i class="fa-solid fa-paper-plane"></i>

                Send Message

            </button>

        </form>

    </div>

</section>


<footer>

    <div class="footer-content">

        <h2>Find<span>It</span></h2>

        <p>

            Smart Lost & Found Management System

            <br><br>

            Helping people reconnect with their belongings worldwide.

        </p>

        <div class="socials">

            <a href="#"><i class="fab fa-github"></i></a>

            <a href="#"><i class="fab fa-linkedin"></i></a>

            <a href="#"><i class="fab fa-instagram"></i></a>

            <a href="#"><i class="fab fa-twitter"></i></a>

        </div>

        <hr>

        <p>

            © 2026 FindIt

            <br>

            Developed by <b>Bharath</b>

        </p>

    </div>

</footer>


<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

<script>

    const canvas=document.getElementById("earthCanvas");

    const scene=new THREE.Scene();

    const camera=new THREE.PerspectiveCamera(
        45,
        1,
        0.1,
        1000
    );

    const renderer=new THREE.WebGLRenderer({
        canvas:canvas,
        alpha:true,
        antialias:true,

    });
    renderer.setPixelRatio(window.devicePixelRatio);

    renderer.outputEncoding = THREE.sRGBEncoding;

    renderer.physicallyCorrectLights = true;

    renderer.toneMapping = THREE.ACESFilmicToneMapping;

    renderer.toneMappingExposure = 1.25;


    renderer.setSize(520,520);

    camera.position.z=3;



    const geometry=new THREE.SphereGeometry(
        1,
        64,
        64
    );



    const loader = new THREE.TextureLoader();

    const earthDay = loader.load("assets/textures/earth_day.jpg");
    const earthNight = loader.load("assets/textures/earth_night.jpg");
    const earthBump = loader.load("assets/textures/earth_bump.jpg");
    const earthSpec = loader.load("assets/textures/earth_specular.jpg");
    const earthClouds = loader.load("assets/textures/earth_clouds.png");

    const earthGeometry = new THREE.SphereGeometry(
        1,
        128,
        128
    );

    const earthMaterial = new THREE.MeshStandardMaterial({

        map: earthDay,

        bumpMap: earthBump,
        bumpScale: 0.03,

        roughnessMap: earthSpec,

        metalness: 0.02,

        roughness: 0.75

    });

    const earth = new THREE.Mesh(
        earthGeometry,
        earthMaterial
    );

    scene.add(earth);

    const cloudGeometry = new THREE.SphereGeometry(1.008,64,64);

    const cloudMaterial = new THREE.MeshPhongMaterial({

        map: earthClouds,

        transparent: true,

        opacity: 0.6,

        blending: THREE.AdditiveBlending,

        depthWrite: false

    });

    const clouds = new THREE.Mesh(cloudGeometry, cloudMaterial);

    scene.add(clouds);


    const atmosphereGeometry = new THREE.SphereGeometry(1.015, 128, 128);

    const atmosphereMaterial = new THREE.MeshPhongMaterial({

        color: 0x6bbcff,

        transparent: true,

        opacity: 0.08,

        side: THREE.BackSide,

        depthWrite: false,

        blending: THREE.AdditiveBlending

    });

    const atmosphere = new THREE.Mesh(
        atmosphereGeometry,
        atmosphereMaterial
    );

    scene.add(atmosphere);





    const ambient = new THREE.AmbientLight(0xffffff,0.18);
    scene.add(ambient);

    const sun = new THREE.DirectionalLight(0xffffff,3.8);

    sun.position.set(6,3,5);

    sun.castShadow = false;

    scene.add(sun);

    const rimLight = new THREE.DirectionalLight(0x5fa8ff,0.7);

    rimLight.position.set(6,3,5);

    scene.add(rimLight);



    function animate(){

        requestAnimationFrame(animate);
        atmosphere.rotation.y = earth.rotation.y;

        earth.rotation.y += 0.0025;

        clouds.rotation.y += 0.0028;

        renderer.render(
            scene,
            camera
        );

    }

    animate();



    window.addEventListener("resize",()=>{

        let size=Math.min(
            window.innerWidth*0.40,
            520
        );

        renderer.setSize(size,size);

        camera.aspect=1;

        camera.updateProjectionMatrix();

    });

</script>

</body>

</html>
