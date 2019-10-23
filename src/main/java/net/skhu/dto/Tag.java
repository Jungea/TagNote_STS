package net.skhu.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@Data
public class Tag {
	int tagNum;
	int userNum;
	String tagName;

	public Tag(int userNum, String tagName) {
		this.userNum = userNum;
		this.tagName = tagName;
	}
}
