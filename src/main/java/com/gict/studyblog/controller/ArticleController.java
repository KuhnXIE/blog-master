package com.gict.studyblog.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gict.studyblog.dto.ArticleDto;
import com.gict.studyblog.entity.Article;
import com.gict.studyblog.entity.Category;
import com.gict.studyblog.entity.User;
import com.gict.studyblog.handler.ResultView;
import com.gict.studyblog.service.ArticleService;
import com.gict.studyblog.service.CategoryService;
import com.gict.studyblog.vo.ArticleQueryDto;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author XIE
 */
@RequestMapping("/api/article")
@RestController
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    @PostMapping("/save")
    public ResultView save(@RequestBody Article article){
        articleService.save(article);
        return ResultView.ok();
    }

    @RequestMapping("/list")
    public ResultView list(String name){
        List<ArticleDto> list = articleService.listDto(name);
        return ResultView.ok(list);
    }

    @GetMapping("/listPage")
    public ResultView listPage(ArticleQueryDto dto){

        IPage<ArticleDto> page = new Page<>(dto.getPageCurrent(), dto.getPageSize());

        return ResultView.ok(articleService.listDto(page, dto));
    }

    @GetMapping("/listPagePost")
    public ResultView listPagePost(Integer currentPage, Integer pageSize, String name){
        IPage<Article> page = new Page(currentPage, pageSize);

        if (StringUtil.isEmpty(name)){
            page = articleService.page(page);
        }else {
            LambdaQueryWrapper<Category> wrapper1 = Wrappers.lambdaQuery();
            wrapper1.eq(Category::getCategoryName, name);
            Category one = categoryService.getOne(wrapper1);

            if (one != null){
                LambdaQueryWrapper<Article> wrapper = Wrappers.lambdaQuery();
                wrapper.eq(!StringUtils.isEmpty(name), Article::getCategoryId, one.getId());
                page = articleService.page(page, wrapper);
                List<Article> records = page.getRecords();
                if (!records.isEmpty()) {
                    for (Article record : records) {
                        record.setCategoryName(one.getCategoryName());
                    }
                }
            }else {
                return ResultView.ok(page);
            }
        }

        List<Article> list = page.getRecords();

        List<Category> categories = categoryService.list();

        if (!categories.isEmpty()){
            Map<Integer, Category> map = categories.stream().collect(Collectors.toMap(Category::getId, a -> a));

            if (!list.isEmpty()){
                for (Article article : list) {
                    Category category = map.get(article.getCategoryId());
                    if (category != null){
                        article.setCategoryName(category.getCategoryName());
                    }
                }
            }
        }
        return ResultView.ok(list);
    }

    @PostMapping("/update")
    public ResultView update(@RequestBody Article article){
        articleService.save(article);
        return ResultView.ok();
    }

    @GetMapping("/delete")
    public ResultView delete(Integer id){
        articleService.removeById(id);
        return ResultView.ok();
    }


    @GetMapping("/detail")
    public ResultView detail(Integer id){
        Article article = articleService.getById(id);
        article.setCategoryName("spring");
        return ResultView.ok(article);
    }

}
