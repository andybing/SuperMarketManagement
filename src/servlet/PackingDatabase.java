package servlet;

import java.sql.*;

public class PackingDatabase {
	private String DBDriver = "com.mysql.jdbc.Driver";  
	private String url = "jdbc:mysql://localhost:3306/smkt?useUnicode=true&characterEncoding=UTF-8";
	private static String username="root";
	private static String password="";
	public Connection conn = null;
	public ResultSet rs = null;

	public ResultSet query(String mySql) throws Exception {
		try {
			Class.forName(DBDriver);
			conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(mySql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return null;
	}

	public void update(String mySql) throws Exception {
		try {
			Class.forName(DBDriver);
			conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(mySql);
			stmt.close();
			conn.close();
		} catch (SQLException ee) {
			// TODO Auto-generated catch block
			System.out.println(ee.getMessage());
		}
	}

	public void setDBDriver(String DBDriver) {
		this.DBDriver = DBDriver;
	}

	public String getDBDriver() {
		return DBDriver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	@SuppressWarnings("static-access")
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	@SuppressWarnings("static-access")
	public void setPassword(String password) {
		this.password = password;
	}
}
