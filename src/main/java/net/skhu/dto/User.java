package net.skhu.dto;

public class User {
	int userNum;
	String userId;
	String userPass;
	int passFindQust;
	String passFindAnsr;

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public int getPassFindQust() {
		return passFindQust;
	}

	public void setPassFindQust(int passFindQust) {
		this.passFindQust = passFindQust;
	}

	public String getPassFindAnsr() {
		return passFindAnsr;
	}

	public void setPassFindAnsr(String passFindAnsr) {
		this.passFindAnsr = passFindAnsr;
	}

}
