package com.gict.studyblog.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gict.studyblog.dto.ArticleDto;
import com.gict.studyblog.entity.Article;
import com.gict.studyblog.service.ArticleService;
import com.gict.studyblog.mapper.ArticleMapper;
import com.gict.studyblog.vo.ArticleQueryDto;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author XIE
* @description 针对表【article(文章)】的数据库操作Service实现
* @createDate 2022-11-24 11:23:14
*/
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article>
    implements ArticleService{


    @Override
    public List<ArticleDto> listDto(String name) {
        return this.baseMapper.listDto(name);
    }

    @Override
    public IPage<ArticleDto> listDto(IPage<ArticleDto> page, ArticleQueryDto dto) {
        List<ArticleDto> articleDtos = this.baseMapper.listDtoPage(page, dto.getAuthorName(), dto.getCategoryId());
        page.setRecords(articleDtos);
        return page;
    }
}




