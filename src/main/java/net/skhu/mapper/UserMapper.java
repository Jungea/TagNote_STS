package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.User;

@Mapper
public interface UserMapper {
	User findOne(int userNum);
	
    User login(User user);
    int idCheck(String userId);
    void insert(User user);
    void update(User user);
    void delete(int userNum);
}

