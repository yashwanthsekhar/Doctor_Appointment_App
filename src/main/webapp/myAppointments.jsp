<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Outfit:wght@300..800&display=swap">
<style>
body {
    font-family: 'Outfit', sans-serif;
    margin: 0;
    height: 100vh;
    background: url('image/doctor-app2.jpeg') no-repeat center center/cover;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    overflow: hidden; /* 👈 outer scroll disabled */
    position: relative;
}

/* background overlay */
body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: linear-gradient(180deg, rgba(2,10,30,0.65), rgba(10,80,200,0.35));
    z-index: 0;
}

.container {
    position: relative;
    z-index: 1;
    background: rgba(255,255,255,0.16);
    backdrop-filter: blur(18px);
    -webkit-backdrop-filter: blur(18px);
    padding: 32px;
    width: 90%;
    max-width: 900px;
    border-radius: 24px;
    box-shadow: 0 6px 35px rgba(90,170,255,0.45);
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}


/* glassy heading */
h2 {
    font-size: 32px;
    font-weight: 900;
    margin: 0 0 20px 0;
    padding: 12px 28px;
    border-radius: 16px;
    background: rgba(255,255,255,0.25);
    backdrop-filter: blur(12px);
    border: 1px solid rgba(255,255,255,0.3);
    box-shadow: 0 2px 16px rgba(255,255,255,0.22);
    color: #0a1f44;
}

/* 👇 Inner scroll enabled only here */
.inner-scroll {
    max-height: 70vh;       /* 👈 flexible height based on screen */
    overflow-y: auto;       /* scroll only if content exceeds */
    width: 100%;
    border-radius: 16px;
    background: rgba(255,255,255,0.22);
    padding: 14px;
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    box-shadow: inset 0 0 18px rgba(110,190,255,0.4);
    transition: 0.3s ease-in-out;
}


/* table style */
table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255,255,255,0.9);
    border-radius: 14px;
    overflow: hidden;
}

th {
    background: #a7d7ff;
    color: #0a1f44;
    font-size: 16px;
    font-weight: 900;
    padding: 14px;
    text-align: center;
}

td {
	color:white;
    padding: 12px;
    font-size: 15px;
    font-weight: 800;
    text-align: center;
    border-bottom: 1px solid rgba(30,108,255,0.15);
}
tr{
background: #2a2a2a;
}

tr:hover td {
    background: rgba(167,215,255,0.4);
    transition: 0.2s;
}

/* button style */
td a {
    display: inline-block;
    padding: 8px 14px;
    background: #a7d7ff;
    color: #0a1f44;
    border-radius: 8px;
    font-weight: 900;
    text-decoration: none;
    box-shadow: 0 2px 12px rgba(110,190,255,0.4);
    transition: 0.3s;
}

td a:hover {
    transform: scale(1.1);
    box-shadow: 0 0 18px #b3ad8b;
}
</style>
</head>

<body>

<div class="container">
    <h2>Care Timeline</h2>

    <div class="inner-scroll"> <!-- 👈 ONLY this section scrolls -->
        <table border="1">
        <tr>
            <th>ID</th>
            <th>Doctor</th>
            <th>Specialization</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>

        <%
        List<Map<String, String>> apps = (List<Map<String, String>>) request.getAttribute("apps");

        if (apps != null && !apps.isEmpty()) {
            for (Map<String, String> a : apps) {
        %>
        <tr>
            <td><%= a.get("id") %></td>
            <td><%= a.get("doctor") %></td>
            <td><%= a.get("spec") %></td>
            <td><%= a.get("date") %></td>
            <td><%= a.get("time") %></td>
            <td><%= a.get("status") %></td>
        </tr>
        <%  }} else { %>
        <tr><td colspan="6">No appointments found 😶</td></tr>
        <% } %>

        </table>
    </div>
</div>

</body>
</html>
