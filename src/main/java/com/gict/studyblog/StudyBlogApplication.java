package com.gict.studyblog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.Async;

/**
 * @author XIE
 */
@SpringBootApplication
@MapperScan("com.gict.studyblog.mapper")
@Async
public class StudyBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudyBlogApplication.class, args);
    }
}

