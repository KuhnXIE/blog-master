package com.gict.studyblog.controller;

import com.alibaba.fastjson.JSON;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.handler.ResultView;
import com.gict.studyblog.service.UserService;
import com.gict.studyblog.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 后台
     *
     * @return
     */
    @PostMapping("/login")
    public ResultView backLogin(@RequestBody UserVo userVo) {
        if (StringUtils.isEmpty(userVo.getUsername()) || StringUtils.isEmpty(userVo.getPassword())) {
            return ResultView.error(123455, "账号或者密码为空");
        }
        User user = userService.login(userVo.getUsername(), userVo.getPassword());
        if (user == null){
            return ResultView.error(12345, "账号或密码错误！");
        }

        String token = super.jwtToken(user.getId(), user);

        Map<String, Object> map = new HashMap<>(2);
        map.put("token", token);
        map.put("id", user.getId());
        map.put("username", user.getNickname());
        map.put("avatar", user.getAvatar());
        return ResultView.ok(map);
    }

    /**
     * 后台
     *
     * @return
     */
    @PostMapping("/logout")
    public ResultView logout(HttpServletRequest request) {
        Integer userId = (Integer) request.getAttribute("userId");
        redisService.del("login"+ userId);
        return ResultView.ok();
    }

}
