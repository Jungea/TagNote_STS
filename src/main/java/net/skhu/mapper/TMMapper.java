package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.TM;
import net.skhu.dto.Tag;

@Mapper
public interface TMMapper {
	List<TM> findByMemoNum(int memoNum);

	void insert(TM tm);

	void delete(int tagMemoNum);
}
