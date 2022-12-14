package com.gict.studyblog.controller;

import com.alibaba.fastjson.JSON;
import com.gict.studyblog.jwt.JWTData;
import com.gict.studyblog.jwt.JwtUtil;
import com.gict.studyblog.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;


public class BaseController {

    @Autowired
    protected JWTData jwtData;

    @Autowired
    protected RedisService redisService;


    /**
     * 生成token
     *
     * @param unique   id标识
     * @param uniqueId 用户编号-或管理员编号
     * @param obj      用户对象或管理员对象
     * @return
     */
    protected String jwtToken(Integer uniqueId, Object obj) {
        String jwtToken = JwtUtil.createJWT("user",
                uniqueId,
                jwtData.getClientId(),
                jwtData.getName(),
                jwtData.getExpiresSecond(),
                jwtData.getBase64Secret());
        redisService.set("login"+ uniqueId, JSON.toJSONString(obj), 24 * 3600);
        return jwtToken;
    }
}
