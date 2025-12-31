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


.glass-form {
    background: rgba(255,255,255,0.13);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    padding: 28px 38px;
    border-radius: 18px;
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: 0 0 24px rgba(30,108,255,0.3);
    width: 340px;
    animation: formFloat 2.5s infinite alternate ease-in-out;
}

@keyframes formFloat {
    from { transform: translateY(0); opacity: 0.9; }
    to   { transform: translateY(-5px); opacity: 1; }
}

.glass-form h3 {
    text-align: center;
    font-size: 28px;
    font-weight: 800;
    color: black;
    margin-bottom: 20px;
    text-shadow: 0 0 12px rgba(110,182,255,0.8);
}

.glass-form input {
    width: 100%;
    padding: 12px;
    margin: 8px 0 14px 0;
    border: none;
    border-radius: 10px;
    font-size: 15px;
    text-align: center;
    outline: none;
    background: rgba(255,255,255,0.85);
    box-shadow: 0 2px 8px rgba(30,108,255,0.2);
    font-weight: 700; /* 🔥 makes typed text bold */
}
.glass-form input::placeholder {
    font-weight: 600;
}


.glass-form button {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 12px;
    background: #1e6cff;
    color: white;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
}

.glass-form button:hover {
    background: #4a90ff;
    box-shadow: 0 0 12px rgba(110,182,255,0.6);
}

.error-text {
    color: red;
    font-size: 14px;
    font-weight: 600;
    text-align: center;
}
.glass-form input:hover {
    transform: scale(1.03);
    box-shadow: 0 0 14px rgba(110,182,255,0.6);
    transition: 0.25s ease-in-out;
}

.glass-form input:focus {
    transform: scale(1.04);
    box-shadow: 0 0 18px rgba(30,108,255,0.8);
    transition: 0.2s;
}
</style>
</head>

<body>

<div class="glass-form">
    <h3>Smarter healthcare starts here</h3>

    <form action="login" method="post">
        Email:
        <input type="email" name="email" required placeholder="Enter email">

        Password:
        <input type="password" name="password" required placeholder="Enter password">

        <button type="submit">Login</button>

        <p class="error-text">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </p>
    </form>
</div>

</body>
</html>
