package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;

@Mapper
public interface MemoMapper {
	Memo findOne(int memoNum);

	Memo findOneWithTags(int memoNum); // 메모 수정할떄

	List<Memo> findByUserNum(int userNum); // 아직 안씀

	List<Memo> findByTagNum(int tagNum); // 메뉴의 태그 목록

	List<Memo> findByUserNumWithTags(int userNum); // 메모 리스트

	List<Memo> findTrashByUserNumWithTags(int userNum); // 쓰레기통 메모 리스트

	List<Memo> findImptByUserNumWithTags(int userNum); // 중요 메모 리스트

	List<Memo> findRecentByUserNumWithTags(int userNum); // 중요 메모 리스트

	void insert(Memo memo);

	//////
	void update(Memo memo);

	void trash(int memoNum); // 휴지통으로 보낼때(삭제)

	void restore(int memoNum); // 휴지통에서 복원

	void impt(int memoNum); // 휴지통에서 복원

	void notImpt(int memoNum); // 휴지통에서 복원

	//////
	void delete(int memoNum); // 영구삭제
}