package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Path;

@Mapper
public interface PathMapper {
	
	List<Path> findByUserNum(int userNum);
}
