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

	String tagString; // 공백으로 구분되는 태그 이름들의 모임
	List<Tag> tags; // tagString을 Tag객체로 리스트

}
