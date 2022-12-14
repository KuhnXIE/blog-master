package com.gict.studyblog.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gict.studyblog.entity.Category;
import com.gict.studyblog.handler.ResultView;
import com.gict.studyblog.service.CategoryService;
import com.github.pagehelper.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author XIE
 */
@RequestMapping("/api/category")
@RestController
@Slf4j
public class CategoryController {
    
    @Autowired
    private CategoryService categoryService;
    
    @PostMapping("/save")
    public ResultView save(@RequestBody Category category){
        categoryService.save(category);
        return ResultView.ok();
    }

    @GetMapping("/list")
    public ResultView list(){
        List<Category> list = categoryService.list();
        return ResultView.ok(list);
    }

    @GetMapping("/listPage")
    public ResultView listPage(Integer pageSize, Integer pageCurrent, String name){

        IPage<Category> page = new Page<>(pageCurrent, pageSize);

        LambdaQueryWrapper<Category> wrapper = Wrappers.lambdaQuery();
        wrapper.like(StringUtil.isNotEmpty(name) ,Category::getCategoryName, name);

        return ResultView.ok(categoryService.page(page, wrapper));
    }


    @PostMapping("/update")
    public ResultView update(@RequestBody Category category){
        log.info("category:{}", category);
        categoryService.updateById(category);
        return ResultView.ok();
    }

    @GetMapping("/delete")
    public ResultView delete(Integer id){
        categoryService.removeById(id);
        return ResultView.ok();
    }


}
















