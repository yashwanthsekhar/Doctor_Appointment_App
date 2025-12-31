package com.app.util;

import java.sql.*;

public class DBConnection {
	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/doctor_app",
				"root",
				"34sSS07$");
		return con;
	}
}