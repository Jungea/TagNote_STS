package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Path;
import net.skhu.dto.TM;

@Mapper
public interface PathMapper {
	
	int pathCheck(int userNum, String path);

	List<Path> findByUserNum(int userNum);

	void insert(Path path);

	void deleteByPath(String path);
}
