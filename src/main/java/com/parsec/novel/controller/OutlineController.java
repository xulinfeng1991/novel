package com.parsec.novel.controller;

import com.parsec.novel.entity.Outline;
import com.parsec.universal.dao.CommonDaoWrap;
import com.parsec.universal.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/24
 */
@RestController
public class OutlineController {

    @Autowired
    private CommonDaoWrap daoWrap;

    @GetMapping("/outline/list")
    public Result list(Outline query){
        query.setPageSize(999);
        List<Outline> list = daoWrap.selectList(query,null,true);
        return Result.returnSuccess(list, "操作成功");
    }

    @GetMapping("/outline/detail")
    public Result detail(Integer id){
        Outline outline = daoWrap.select(id,Outline.class);
        return Result.returnSuccess(outline, "操作成功");
    }

    @PostMapping("/outline/save")
    public Result save(Outline outline){
        if(outline.getId()==null){
            daoWrap.insert(outline);
        }else{
            daoWrap.update(outline);
        }
        return Result.returnSuccess(outline, "操作成功");
    }
}
