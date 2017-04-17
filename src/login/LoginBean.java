package login;

import java.io.Serializable;

public class LoginBean implements Serializable{
	private String username;
	private String password;

	public String getUserName() {
		return username;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
