<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Outfit:wght@300..800&display=swap">
<style>
body {
    font-family: 'Outfit', sans-serif;
    margin: 0;
    height: 100vh;
    background: url('image/doctor-app2.jpeg') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}

/* Dark + light blue overlay */
body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: linear-gradient(180deg, rgba(1,8,28,0.72), rgba(40,120,255,0.32));
    z-index: 0;
}

.container {
    position: relative;
    z-index: 1;
    background: rgba(255,255,255,0.18);
    backdrop-filter: blur(18px);
    -webkit-backdrop-filter: blur(18px);
    padding: 36px 32px;
    width: 420px;
    max-width: 92%;
    border-radius: 22px;
    box-shadow: 0 8px 34px rgba(90,170,255,0.45);
    text-align: center;
    animation: cardEnter 0.6s ease-out;
}

@keyframes cardEnter {
    from {opacity: 0; transform: scale(0.9) translateY(18px);}
    to   {opacity: 1; transform: scale(1) translateY(0);}
}

h2 {
    font-size: 28px;
    font-weight: 900;
    padding: 14px 26px;
    border-radius: 14px;
    background: rgba(255,255,255,0.26);
    backdrop-filter: blur(14px);
    border: 1px solid rgba(255,255,255,0.3);
    color: #0a1f44;
    margin-bottom: 20px;
    position: relative;
}

/* Jumping medical decorations */
h2::after {
    content: "🩺 💊 🏥 🧑‍⚕️ 🧪";
    position: absolute;
    left: 50%;
    top: -36px;
    transform: translateX(-50%);
    font-size: 24px;
    animation: jumpIcons 1.2s infinite alternate ease-in-out;
}

@keyframes jumpIcons {
    from { transform: translateX(-50%) translateY(0px); }
    to   { transform: translateX(-50%) translateY(-12px); }
}

/* Link styled like button */
a {
    display: block;
    width: 160px;
    margin: 0 auto;
    padding: 12px;
    background: #5ab0ff;
    border-radius: 12px;
    color: black;
    font-weight: 800;
    text-decoration: none;
    box-shadow: 0 4px 14px rgba(110,180,255,0.5);
    transition: 0.3s;
}

a:hover {
    transform: scale(1.07);
    box-shadow: 0 0 18px rgba(180,230,255,0.8);
}
</style>
</head>

<body>
<div class="container">
    <h2>Booking Confirmed! You're All Set 🎉</h2>
	<a href="myAppointments">My Bookings</a>
	<br>
    <a href="dashboard.jsp">Go Back</a>
</div>
</body>
</html>
