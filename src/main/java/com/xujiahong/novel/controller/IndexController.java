package com.xujiahong.novel.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/16
 */
@RestController
public class IndexController {
    @GetMapping("/")
    public String index(){
        return "springboot is running";
    }
}
