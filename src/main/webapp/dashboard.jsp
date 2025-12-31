<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: 'Outfit', sans-serif;
    margin: 0;
    height: 100vh;
    background: url('image/doctor-app2.jpeg') no-repeat center center/cover;
    background-attachment: fixed;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    position: relative;
}

body::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(180deg, rgba(2,10,30,0.75), rgba(10,80,200,0.55), rgba(120,200,255,0.25));
    z-index: 0;
}


@keyframes bgShift {
    from { filter: brightness(0.95); }
    to   { filter: brightness(1.15); }
}

.dashboard {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    padding: 40px 35px;
    width: 380px;
    border-radius: 28px;
    border: 1px solid rgba(255,255,255,0.25);
    box-shadow: 0 10px 40px rgba(0,98,255,0.35);
    animation: cardFloat 3.5s infinite alternate cubic-bezier(0.4, 0, 0.2, 1);
}

@keyframes cardFloat {
    from { transform: translateY(0px) scale(1); }
    to   { transform: translateY(-14px) scale(1.02); }
}

.dashboard h2 {
    font-size: 27px;
    font-weight: 900;
    text-align: center;
    margin-bottom: 30px;
    color: black;
    text-shadow: 0 0 18px rgba(74,150,255,0.7);
    letter-spacing: 0.8px;
    animation: textSlide 1s ease-out;
}

@keyframes textSlide {
    from {opacity: 0; transform: translateY(-25px);}
    to   {opacity: 1; transform: translateY(0);}
}

.nav-buttons {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

.nav-buttons a {
    background: linear-gradient(90deg, #0062ff, #4ca1ff);
    padding: 14px;
    border-radius: 16px;
    color: black;
    font-weight: 800;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    box-shadow: 0 4px 20px rgba(0,98,255,0.4);
    transition: 0.3s;
    animation: btnEnter 0.7s ease-out;
}

@keyframes btnEnter {
    from {opacity: 0; transform: scale(0.8);}
    to   {opacity: 1; transform: scale(1);}
}

.nav-buttons a:hover {
    transform: scale(1.08);
    box-shadow: 0 0 24px rgba(110,182,255,0.85);
}

.nav-buttons a:active {
    transform: scale(0.97);
}

.full-btn {
    grid-column: span 2;
}

</style>
</head>
<body>

<%
if (session.getAttribute("patientId") == null) {
    response.sendRedirect("login.jsp");
}
%>

<div class="dashboard">
    <h2>Your Health, Your Schedule, Your Rules 💼</h2>

    <div class="nav-buttons">
        <a class="full-btn" href="viewDoctor">View Doctors</a>
        <a href="myAppointments">My Bookings</a>
        <a href="logout">Logout</a>
    </div>
</div>

</body>
</html>
