package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;
import net.skhu.dto.Tag;

@Mapper
public interface MemoMapper {
	Memo findOne(int memoNum);
    List<Memo> findAllByUserNum(int userNum);
    List<Memo> findAllByTagNum(int tagNum);
    void insert(Memo memo);
    void update(Memo memo);
    void delete(int MemoNum);
}