package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;

@Mapper
public interface MemoMapper {
	Memo findOne(int memoNum); // 메모 수정할떄

	List<Memo> findByUserNum(int userNum); // 아직 안씀

	List<Memo> findByTagNum(int tagNum); // 메뉴의 태그 목록

	List<Memo> findByUserNumWithTags(int userNum); // 메모 리스트

	void insert(Memo memo);

	void update(Memo memo);

	void delete(int memoNum);
}