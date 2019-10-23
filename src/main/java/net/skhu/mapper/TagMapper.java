package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;
import net.skhu.dto.Tag;

@Mapper
public interface TagMapper {
	Tag findOne(int tagNum);

	List<Tag> findByUserNum(int userNum); // 메모 insert할 때 이미 만들어져 있는 태그인지 확인

	List<Tag> findByMemoNum(int memoNum);

	void insert(Tag tag);

	void update(Tag tag);

	void delete(int tagNum);
}
