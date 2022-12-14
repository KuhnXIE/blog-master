package com.gict.studyblog.vo;

import lombok.Data;

@Data
public class ArticleQueryDto {

    private Integer pageCurrent;
    private Integer pageSize;
    private Integer categoryId;
    private String authorName;
}
