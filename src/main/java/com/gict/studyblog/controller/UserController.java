package com.gict.studyblog.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gict.studyblog.dto.UserDto;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.handler.ResultView;
import com.gict.studyblog.service.UserService;
import com.github.pagehelper.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author XIE
 */
@RequestMapping("/api/user")
@RestController
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;


    @GetMapping("/info")
    public ResultView getInfo(HttpServletRequest request) {
        Integer userId = (Integer) request.getAttribute("userId");

        User user = userService.getInfo(userId);

        return ResultView.ok(user);
    }

    @GetMapping("/userInfo")
    public ResultView userInfo(Integer id) {
        User user = userService.getInfo(id);
        return ResultView.ok(user);
    }

    @PostMapping("/save")
    public ResultView save(@RequestBody User user){
        userService.save(user);
        return ResultView.ok();
    }

    @PostMapping("/clientSave")
    public ResultView clientSave(User user){
        userService.save(user);
        return ResultView.ok();
    }

    @GetMapping("/list")
    public ResultView list(){
        List<UserDto> list = userService.listDto();
        return ResultView.ok(list);
    }

    @GetMapping("/listPage")
    public ResultView listPage(Integer pageSize, Integer pageCurrent, String nickname){

        IPage<User> page = new Page<>(pageCurrent, pageSize);

        LambdaQueryWrapper<User> wrapper = Wrappers.lambdaQuery();
        wrapper.like(StringUtil.isNotEmpty(nickname) ,User::getNickname, nickname);

        return ResultView.ok(userService.page(page, wrapper));
    }

    @PostMapping("/update")
    public ResultView update(@RequestBody User user){
        log.info("user:{}", user);
        userService.updateById(user);
        return ResultView.ok();
    }

    @GetMapping("/delete")
    public ResultView delete(Integer id){
        userService.removeById(id);
        return ResultView.ok();
    }

}
