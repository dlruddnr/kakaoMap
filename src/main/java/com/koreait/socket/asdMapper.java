package com.koreait.socket;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface asdMapper {
    List<LocationEntity> selLocation(LocationEntity param);
}
