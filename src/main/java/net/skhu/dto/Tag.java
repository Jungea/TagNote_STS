package net.skhu.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@Data
public class Tag implements Cloneable {
	int tagNum;
	int userNum;
	String tagName;

	public Tag(int userNum, String tagName) {
		this.userNum = userNum;
		this.tagName = tagName;
	}

	@Override
	public Tag clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return (Tag) super.clone();
	}
}
