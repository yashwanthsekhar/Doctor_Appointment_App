package com.app.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.app.util.DBConnection;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/myAppointments")
public class ViewAppointmentServlet extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		
		if(session == null || session.getAttribute("patientId") == null) {
			res.sendRedirect("login.jsp");
			return;
		}
		
		String Query =  "SELECT a.id, d.name, d.Specialization, a.app_date, a.app_time, status " +
                "FROM appointments a " +
                "JOIN Doctors d ON a.doctor_id = d.id " +
                "WHERE a.patient_id = ? " +
                "ORDER BY a.app_date, a.app_time";
		int patientId = (int) session.getAttribute("patientId");
		
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(Query);
			ps.setInt(1, patientId);
			ResultSet rs = ps.executeQuery();
			
			 List<Map<String, String>> apps = new ArrayList<>();
	            while (rs.next()) {
	                Map<String, String> m = new HashMap<>();
	                m.put("id", String.valueOf(rs.getInt("id")));
	                m.put("doctor", rs.getString("name"));
	                m.put("spec", rs.getString("Specialization"));
	                m.put("date", rs.getString("app_date"));
	                m.put("time", rs.getString("app_time"));
	                m.put("status", rs.getString("status"));
	                apps.add(m);
	            }

	            req.setAttribute("apps", apps);
	            req.getRequestDispatcher("myAppointments.jsp").forward(req, res);
			
		}catch(Exception e) {
			System.out.println("Oops there is an error " +e.getMessage());
		}
	}
}
