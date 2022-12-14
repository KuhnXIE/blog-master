package com.gict.studyblog.mapper;

import com.gict.studyblog.dto.UserDto;
import com.gict.studyblog.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author XIE
* @description 针对表【user(用户)】的数据库操作Mapper
* @createDate 2022-11-24 11:23:15
* @Entity com.gict.studyblog.entity.User
*/
public interface UserMapper extends BaseMapper<User> {

    List<UserDto> listDto();
}




