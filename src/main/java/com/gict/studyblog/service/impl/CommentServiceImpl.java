package com.gict.studyblog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gict.studyblog.entity.Comment;
import com.gict.studyblog.service.CommentService;
import com.gict.studyblog.mapper.CommentMapper;
import org.springframework.stereotype.Service;

/**
* @author XIE
* @description 针对表【comment(评论)】的数据库操作Service实现
* @createDate 2022-11-24 11:23:15
*/
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment>
    implements CommentService{

}




