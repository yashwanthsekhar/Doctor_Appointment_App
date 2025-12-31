package com.app.dao;

import java.sql.*;
import com.app.model.Patient;
import com.app.util.DBConnection;

public class PatientDAO {

    public boolean register(Patient p) throws Exception {

        Connection con = DBConnection.getConnection();

        String query =
            "INSERT INTO patients(name, email, password) VALUES (?,?,?)";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, p.getName());
        ps.setString(2, p.getEmail());
        ps.setString(3, p.getPassword());

        return ps.executeUpdate() > 0;
    }

    public int login(String email, String password) {

        int patientId = 0;

        try {
            Connection con = DBConnection.getConnection();
            String query =
                "SELECT id FROM patients WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                patientId = rs.getInt("id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return patientId;
    }
}
