package com.gict.studyblog.dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserDto {

    private Integer id;
    private String nickname;
    private String username;
    private String email;
    private Date lastLoginTime;
    private String avatar;
    private String intro;
    private Integer isDisable;

}
