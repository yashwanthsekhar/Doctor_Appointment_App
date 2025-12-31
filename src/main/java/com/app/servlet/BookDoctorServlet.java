package com.app.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.app.util.DBConnection;

@WebServlet("/bookDoctor")
public class BookDoctorServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		
		 if (session == null || session.getAttribute("patientId") == null) {
		        res.sendRedirect("login.jsp");
		        return;
		    }

		int patientId =(int) session.getAttribute("patientId");
		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String appDate = req.getParameter("appDate");
		String appTime = req.getParameter("appTime");
		
		try {
			Connection con = DBConnection.getConnection();
			String query =  "INSERT INTO appointments(patient_id, doctor_id, app_date, app_time) VALUES(?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, patientId);
			ps.setInt(2, doctorId);
			ps.setString(3, appDate);
			ps.setString(4, appTime);
			
			ps.executeUpdate();
			res.sendRedirect("success.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		    res.getWriter().println("Booking failed ❌");
		}
	}
}
