package com.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.PatientDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
                          throws IOException, ServletException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        PatientDAO dao = new PatientDAO();
        int patientId = dao.login(email, password);

        if (patientId > 0) {
            HttpSession session = req.getSession();
            session.setAttribute("patientId", patientId);

            res.sendRedirect("dashboard.jsp");

        } else {
            req.setAttribute("error", "Invalid Email or Password");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}

