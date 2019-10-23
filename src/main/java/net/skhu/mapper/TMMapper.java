package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.TM;

@Mapper
public interface TMMapper {

	void insert(TM tm);

	void delete(int tagMemoNum);
}
