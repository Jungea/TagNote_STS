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

}
