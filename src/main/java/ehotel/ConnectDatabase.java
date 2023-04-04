package ehotel;

import java.sql.*;

public class ConnectDatabase {
	Connection con;
	public ConnectDatabase() {

		// Connect to MySQL
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/provisio_db";
			String userName = "prov_user";
			String thePasswordString = "provisio";
			con = DriverManager.getConnection(dbUrl, userName, thePasswordString);
			Statement statement = con.createStatement();
			System.out.println("Connection Established.");
			System.out.println();

		}

		catch (Exception e) {
			System.out.println("Enter connection to database. ");
			System.exit(0);
		}

	}
	
	// Closer Method
	public void closer() throws SQLException {
		System.out.println("Connection Closed.");
		con.close();
	}

}
