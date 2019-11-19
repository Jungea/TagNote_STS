package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;
import net.skhu.dto.Tag;

@Mapper
public interface TagMapper {
	Tag findOne(int tagNum);

	Tag findOneByTagName(String tagName);

	List<Tag> findByStartTagName(int userNum, String tagName);

	List<Tag> findByUserNum(int userNum); // 메모 insert할 때 이미 만들어져 있는 태그인지 확인

	List<Tag> findByMemoNum(int memoNum); // 메모 저장했을 때 전에 저장한 태그 가져오기

	List<Tag> findWithoutReference();

	List<Tag> findLiving(int userNum); // 메뉴의 태그 목록을 위한 살아있는 태그 리스트

	List<String> findAutocomplete(int userNum, String tagName); // 메뉴의 태그 목록을 위한 살아있는 태그 리스트

	void insert(Tag tag);

	void update(Tag tag);

	void delete(int tagNum);
}
