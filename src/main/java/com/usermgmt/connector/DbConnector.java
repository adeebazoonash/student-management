package com.usermgmt.connector;

import java.sql.*;

public class DbConnector {

	public static void main(String[] args) {
		try {
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usermanagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", null);
			Statement stmt = myConn.createStatement();

			ResultSet result = stmt.executeQuery("select * from user");
			while (result.next()) {
				System.out.println(result.getString("first_name"));
			}

		} catch (Exception e) {
			System.out.println("exception");
		}
	}

}


