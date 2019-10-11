package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Memo;
import net.skhu.dto.User;

@Mapper
public interface MemoMapper {
	
    Memo findByUserNum(int userNum);
    Memo findByMemoNum(int memoNum);
    void insert(Memo memo);
    void update(Memo memo);
    void delete(int MemoNum);
}

