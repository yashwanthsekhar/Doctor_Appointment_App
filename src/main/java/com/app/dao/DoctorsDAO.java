package com.app.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.app.model.Docters;
import com.app.util.DBConnection;

public class DoctorsDAO {
	
	public List<Docters> getAllDoctors(){
		List<Docters> ls = new ArrayList<>();
		try {
			String query = "Select * from doctors";
			
			Connection con = DBConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				Docters d = new Docters();
				d.setId(rs.getInt("id"));
				d.setName(rs.getString("name"));
				d.setSpecialization(rs.getString("Specialization"));
				d.setExperience(rs.getInt("experience"));
				ls.add(d);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ls;
	}
}
