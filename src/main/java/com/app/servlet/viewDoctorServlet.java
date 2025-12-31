package com.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.app.dao.DoctorsDAO;
import com.app.model.Docters;

@WebServlet("/viewDoctor")
public class viewDoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("patientId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        DoctorsDAO dao = new DoctorsDAO();
        List<Docters> list = dao.getAllDoctors();

        req.setAttribute("doctors", list);
        req.getRequestDispatcher("viewDoctor.jsp").forward(req, res);
    }
}
