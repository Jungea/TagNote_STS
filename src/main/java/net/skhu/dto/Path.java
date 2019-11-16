package net.skhu.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode(exclude = "tag")
@Data
public class Path {
	int pathNum;
	int tagNum;
	String path;

	Tag tag;

	public Path(int tagNum, String path) {
		this.tagNum = tagNum;
		this.path = path;
	}
}
