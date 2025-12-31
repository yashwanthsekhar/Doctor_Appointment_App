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

/* Blue overlay shade on BG image */
body::before {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(180deg, rgba(2,10,30,0.75), rgba(10,80,200,0.55), rgba(120,200,255,0.25));
    z-index: 0;
}

@keyframes bodyWave {
    0%, 100% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
}

.container {
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(16px);
    width: 360px;
    padding: 26px;
    border-radius: 20px;
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    animation: glassFloat 3s infinite alternate ease-in-out;
}

@keyframes glassFloat {
    from { transform: translateY(0px); }
    to   { transform: translateY(-14px); }
}

h2 {
    font-size: 27px;
    font-weight: 700;
    text-align: center;
    color: black;
    margin-bottom: 20px;
    animation: titleFlip 0.9s ease-out;
}

@keyframes titleFlip {
    0% { opacity: 0; transform: rotateX(90deg); }
    100% { opacity: 1; transform: rotateX(0deg); }
}

input {
    width: 82%;
    padding: 12px;
    border-radius: 10px;
    border: 2px solid transparent;
    font-size: 20px;
    outline: none;
    margin-top: 6px;
    background: rgba(255,255,255,0.15);
    color: black;
    animation: inputBorder 2s infinite alternate;
}

@keyframes inputBorder {
    from { border-color: rgba(0, 200, 255, 0.4); }
    to   { border-color: rgba(0, 200, 255, 0.9); }
}
button {
    width: 160px;
    padding: 12px;
    background: #00c6ff;
    background-image: linear-gradient(90deg, #00c6ff, #0072ff);
    border: none;
    border-radius: 10px;
    color: black;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 18px;
    animation: neonPulse 1.2s infinite alternate;

    display: block;        /* 👈 makes button a block element */
    margin-left: auto;     /* 👈 centers horizontally */
    margin-right: auto;
}


@keyframes neonPulse {
    from { box-shadow: 0 0 6px rgba(0,198,255,0.3); }
    to   { box-shadow: 0 0 22px rgba(0,198,255,1); }
}

button:hover {
    transform: scale(1.1);
    transition: 0.2s;
}
</style>


</head>
<body>
<div class="container">
<h2>Book Appointment</h2>
<form action="bookDoctor" method="post">
    <input type="hidden" name="doctorId" value="<%= request.getParameter("doctorId") %>">

    <h3>Date:</h3> <input type="date" name="appDate" required><br><br>
    <h3>Time: </h3><input type="time" name="appTime" required><br><br>

    <button type="submit">Confirm</button>
</form>
</div>
</body>
</html>