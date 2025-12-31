package com.app.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.app.dao.PatientDAO;
import com.app.model.Patient;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req,
            HttpServletResponse res) throws IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Patient p = new Patient();
		p.setName(name);
		p.setEmail(email);
		p.setPassword(password);
		
		PatientDAO dao = new PatientDAO();
		
		try {
			if (dao.register(p)) {
				res.sendRedirect("login.jsp");
			} else {
				res.getWriter().print("Registration Failed");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
