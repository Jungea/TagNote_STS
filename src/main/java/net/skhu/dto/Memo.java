package net.skhu.dto;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString(exclude = "tags")
@EqualsAndHashCode(exclude = "tags")
@Data
public class Memo {
	int memoNum;
	int userNum;
	String memoText;
	String memoDate;
	int imptMemo;
	int delMemo;


	List<Tag> tags;

}
