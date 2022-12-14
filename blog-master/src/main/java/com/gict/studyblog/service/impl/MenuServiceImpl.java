package com.gict.studyblog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gict.studyblog.entity.Menu;
import com.gict.studyblog.service.MenuService;
import com.gict.studyblog.mapper.MenuMapper;
import org.springframework.stereotype.Service;

/**
* @author XIE
* @description 针对表【menu(菜单)】的数据库操作Service实现
* @createDate 2022-11-24 11:23:15
*/
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu>
    implements MenuService{

}




