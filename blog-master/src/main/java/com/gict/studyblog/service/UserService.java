package com.gict.studyblog.service;

import com.gict.studyblog.dto.UserDto;
import com.gict.studyblog.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author XIE
* @description 针对表【user(用户)】的数据库操作Service
* @createDate 2022-11-24 11:23:15
*/
public interface UserService extends IService<User> {

    User login(String userAccount, String password);

    User getInfo(Integer userId);

    List<UserDto> listDto();
}
