package net.skhu.dto;

import java.util.Date;

public class Memo {
	int memoNum;
	int userNum;
	String text;
	Date date;
	String imptMemo;
	String life;

	public int getMemoNum() {
		return memoNum;
	}

	public void setMemoNum(int memoNum) {
		this.memoNum = memoNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getImptMemo() {
		return imptMemo;
	}

	public void setImptMemo(String imptMemo) {
		this.imptMemo = imptMemo;
	}

	public String getLife() {
		return life;
	}

	public void setLife(String life) {
		this.life = life;
	}

}
