package net.skhu.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode(exclude = "tag")
@Data
public class Path {
	int pathNum;
	int TagNum;
	String path;

	Tag tag;
}
