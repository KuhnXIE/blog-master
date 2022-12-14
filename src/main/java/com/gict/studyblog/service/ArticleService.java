package com.gict.studyblog.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gict.studyblog.dto.ArticleDto;
import com.gict.studyblog.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.vo.ArticleQueryDto;

import java.util.List;

/**
* @author XIE
* @description 针对表【article(文章)】的数据库操作Service
* @createDate 2022-11-24 11:23:14
*/
public interface ArticleService extends IService<Article> {

    List<ArticleDto> listDto(String name);

    IPage<ArticleDto> listDto(IPage<ArticleDto> page, ArticleQueryDto dto);
}
