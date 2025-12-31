<%@ page import="java.util.*, com.app.model.Docters" %>
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

/* Glass card centered container */
.container {
    position: relative;
    z-index: 1;
    background: rgba(255,255,255,0.14);
    backdrop-filter: blur(18px);
    -webkit-backdrop-filter: blur(18px);
    padding: 30px;
    width: 750px;
    max-width: 95%;
    border-radius: 24px;
    box-shadow: 0 8px 40px rgba(10,120,255,0.4);
    animation: cardReveal 0.7s ease-out;
    text-align: center;
}

@keyframes cardReveal {
    from { opacity: 0; transform: scale(0.9) translateY(15px); }
    to   { opacity: 1; transform: scale(1) translateY(0); }
}

/* Middle glassy animated title */
.container h2 {
    display: inline-block;
    font-size: 32px;
    font-weight: 900;
    padding: 12px 28px;
    border-radius: 16px;
    margin-bottom: 24px;
    color: black;
    background: rgba(255,255,255,0.22); /* 👈 glassy color, no blue */
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    border: 1px solid rgba(255,255,255,0.3);
    box-shadow: 0 4px 20px rgba(255,255,255,0.25);
    animation: titleGlass 2.5s infinite alternate ease-in-out;
}

@keyframes titleGlass {
    from { transform: translateY(0px); opacity: 0.85; }
    to   { transform: translateY(-6px); opacity: 1; }
}

.scroll-box {
    width: 100%;
    display: flex;
    justify-content: center;
}

.inner-scroll {
    height: 420px;
    overflow-y: auto;
    width: 100%;
    max-width: 100%;
    border-radius: 14px;
    padding-right: 5px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255,255,255,0.92);
    border-radius: 16px;
    overflow: hidden;
}

th, td {
    text-align: center;
    padding: 14px;
}

.container {
    width: 90%;
    max-width: 900px;
    min-width: unset;  /* 👈 removes forcing width */
}


/* Table new style */
table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255,255,255,0.9);
    border-radius: 16px;
    overflow: hidden;
    min-width: 600px;
}

th {
    background: #a7d7ff; /* 👈 light shaded blue */
    color: #04122a;
    font-size: 16px;
    font-weight: 900;
    padding: 16px;
    white-space: nowrap;
}

td {
    padding: 15px;
    font-size: 16px;
    font-weight: 700; /* bold table text */
    text-align: center;
    border-bottom: 1px solid rgba(30,108,255,0.25);
}

tr:hover td {
    background: #cce8ff;
    transform: translateY(-2px);
    transition: 0.2s;
}

td a {
    display: inline-block;
    padding: 9px 16px;
    background: #6eb6ff; /* 👈 same light blue for buttons */
    color: #04122a;
    border-radius: 10px;
    font-weight: 900;
    text-decoration: none;
    box-shadow: 0 4px 16px rgba(110,182,255,0.45);
    transition: 0.3s;
}

td a:hover {
    transform: scale(1.12);
    box-shadow: 0 0 16px rgba(160,210,255,0.85);
}

</style>

</head>
<body >

	<div class="container">
	<h2>Book. Track. Heal.</h2>
	<div class="scroll-box">
	<div class="inner-scroll">
	<table border="1">
	<tr>
	    <th>Name</th>
	    <th>Specialization</th>
	    <th>Experience</th>
	    <th>Action</th>
	</tr>
	
	<%
	List<Docters> list = (List<Docters>) request.getAttribute("doctors");
	
	if(list != null){
	    for(Docters d : list){
	%>
	<tr>
	    <td><%= d.getName() %></td>
	    <td><%= d.getSpecialization() %></td>
	    <td><%= d.getExperience() %> years</td>
	    <td><a href="book.jsp?doctorId=<%= d.getId() %>">Book Appointment</a></td>
	</tr>
	<%
	    }
	}
	%>
	
	</table>
	</div>
	</div>
	</div>
</body>
</html>
