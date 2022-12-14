package com.gict.studyblog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gict.studyblog.entity.Category;
import com.gict.studyblog.service.CategoryService;
import com.gict.studyblog.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author XIE
* @description 针对表【category(分类表)】的数据库操作Service实现
* @createDate 2022-11-24 11:23:15
*/
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
    implements CategoryService{

}




