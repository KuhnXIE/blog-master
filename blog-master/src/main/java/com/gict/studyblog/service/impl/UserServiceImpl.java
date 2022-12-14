package com.gict.studyblog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gict.studyblog.dto.UserDto;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.mapper.UserMapper;
import com.gict.studyblog.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author XIE
* @description 针对表【user(用户)】的数据库操作Service实现
* @createDate 2022-11-24 11:23:15
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{


    @Override
    public User login(String userAccount, String password) {
        LambdaQueryWrapper<User> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(User::getUsername, userAccount);
        wrapper.eq(User::getPassword, password);
        return getOne(wrapper);
    }


    @Override
    public User getInfo(Integer userId) {

        return getById(userId);
    }

    @Override
    public List<UserDto> listDto() {
        return this.baseMapper.listDto();
    }
}




