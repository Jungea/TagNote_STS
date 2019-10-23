package net.skhu.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@Data
public class TM {
	int tagMemoNum;
	int memoNum;
	int tagNum;

	public TM(int memoNum, int tagNum) {
		this.memoNum = memoNum;
		this.tagNum = tagNum;
	}
}
