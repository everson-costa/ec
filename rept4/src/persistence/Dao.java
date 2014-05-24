package persistence;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class Dao {

	Connection con;
	PreparedStatement pstmt;
	// Statement stm;
	ResultSet rs;

	private final String URL = "jdbc:mysql://localhost:3306/test";
	private final String USER = "root";
	private final String PASS = "qpzmqpzm";

	protected void open() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASS);
	}

	protected void close() throws Exception {
		con.close();
	}

}
