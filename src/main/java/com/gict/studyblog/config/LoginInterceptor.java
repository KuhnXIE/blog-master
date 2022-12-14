package com.gict.studyblog.config;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.jwt.JWTData;
import com.gict.studyblog.jwt.JwtUtil;
import com.gict.studyblog.redis.RedisService;
import com.gict.studyblog.service.UserService;
import jdk.nashorn.internal.runtime.GlobalConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.stream.Stream;

public class LoginInterceptor implements HandlerInterceptor {

    @Value("${interceptor.mode}")
    private final InterceptorMode interceptorMode = InterceptorMode.NONE;
    @Value("${interceptor.pass}")
    private String[] interceptorPass;

    @Autowired
    private UserService userService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private JWTData jwtData;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        System.out.println(request.getRequestURI() + " [" + request.getMethod() + "]");
        if ("OPTIONS".equals(request.getMethod()) ||
                Stream.of(interceptorPass).anyMatch(p -> p.equals(request.getRequestURI()))) {
            return true;
        }
        switch (interceptorMode) {
            case JWT:
                String token = request.getHeader("Authorization");
                if (token == null) {
                    token = request.getParameter("token");
                    if (token == null) {
                        return true;
//                        throw new RuntimeException("未携带 token"); todo
                    }
                }
                Integer userId= null;
                try {
                    userId = JwtUtil.getUniqueId(jwtData, token, "user");
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                String json = redisService.get("login" + userId);
//                if (json == null || "".equals(json)) {
//                    throw new RuntimeException("12345");
//                }
//                User user = JSON.parseObject(json, User.class);
                //fixme 登录未处理

                request.setAttribute("userId", userId);
                break;
            case SESSION:
                Object o = request.getSession().getAttribute("user");
                if (o == null) {
                    throw new RuntimeException("校验 session 失败");
                }
                break;
            case NONE:
                break;
            default:
                break;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    enum InterceptorMode {
        NONE, JWT, SESSION;
    }
}
