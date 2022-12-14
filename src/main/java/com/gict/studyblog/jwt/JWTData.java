package com.gict.studyblog.jwt;


import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @Author: yuri
 * @Description: JWT加密参数类
 * @Date: 2022/7/2516:52
 **/
@Data
@PropertySource(value = "classpath:/application.properties")
@Component
public class JWTData {

    @Value("${audience.clientId}")
    private String clientId;
    @Value("${audience.base64Secret}")
    private String base64Secret;
    @Value("${audience.name}")
    private String name;
    @Value("${audience.expiresSecond}")
    private int expiresSecond;
}
