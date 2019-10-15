package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;
import net.skhu.dto.Tag;

@Mapper
public interface TagMapper {
	Tag findOne(int tagNum);
    List<Tag> findAllByUserNum(int userNum);
    List<Tag> findAllByMemoNum(int memoNum);
    void insert(Memo memo);
    void update(Memo memo);
    void delete(int MemoNum);
}

