package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.User;

@Mapper
public interface UserMapper {
//	User findOne(int userNum);

	User login(User user); // 아이디와 비밀번호로 유저를 찾기 (session에 저장될 데이터) Q)전체 저장해야하나?

	int idCheck(String userId);

	User findPassword(User user);

	void insert(User user);

	void update(User user);

	void delete(int userNum);
}
