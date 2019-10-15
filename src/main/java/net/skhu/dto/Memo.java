package net.skhu.dto;

import lombok.Data;

@Data
public class Memo {
	int memoNum;
	int userNum;
	String memoText;
	String memoDate;
	int imptMemo;
	int delMemo;

	String userId;

}
