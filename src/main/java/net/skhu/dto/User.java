package net.skhu.dto;

public class User {
	int id;
	String userId;
	String password;
	int passwordCheckQ;
	String passwordCheckA;

	@Override
	public String toString() {
		return "User [id=" + id + ", userId=" + userId + ", password=" + password + ", passwordCheckQ=" + passwordCheckQ
				+ ", passwordCheckA=" + passwordCheckA + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPasswordCheckQ() {
		return passwordCheckQ;
	}

	public void setPasswordCheckQ(int passwordCheckQ) {
		this.passwordCheckQ = passwordCheckQ;
	}

	public String getPasswordCheckA() {
		return passwordCheckA;
	}

	public void setPasswordCheckA(String passwordCheckA) {
		this.passwordCheckA = passwordCheckA;
	}

}
