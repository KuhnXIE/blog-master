package com.gict.studyblog.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class ArticleDto {

   private Integer id;
   private String nickname;
   private String categoryName;
   private String articleTitle;
   private String articleContent;
   private String type;
   private String originalUrl;
   private Integer isTop;
   private String status;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date createTime;
}
