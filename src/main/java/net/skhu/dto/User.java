package net.skhu.dto;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString//(exclude = { "memos", "tags" })
@EqualsAndHashCode//(exclude = { "memos", "tags" })
@Data
public class User {
	int userNum;
	String userId;
	String userPass;
	int passFindQust;
	String passFindAnsr;

//	List<Memo> memos;
//	List<Tag> tags;
}
