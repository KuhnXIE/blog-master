package com.gict.studyblog.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gict.studyblog.dto.ArticleDto;
import com.gict.studyblog.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author XIE
* @description 针对表【article(文章)】的数据库操作Mapper
* @createDate 2022-11-24 11:23:14
* @Entity com.gict.studyblog.entity.Article
*/
public interface ArticleMapper extends BaseMapper<Article> {

    List<ArticleDto> listDto(@Param("name") String name);

    List<ArticleDto> listDtoPage(IPage<ArticleDto> page, @Param("authorName") String authorName,@Param("categoryId") Integer categoryId);
}




