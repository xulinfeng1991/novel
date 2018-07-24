package com.parsec.novel.controller;

import com.parsec.novel.entity.Data;
import com.parsec.universal.dao.CommonDaoWrap;
import com.parsec.universal.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/19
 */
@RestController
public class DataController {

    @Autowired
    private CommonDaoWrap daoWrap;

    @GetMapping("/data/list")
    public Result list(){
        Data query = new Data();
        query.setPageSize(999);
        List<Data> list = daoWrap.selectList(query,null,true);
        return Result.returnSuccess(list, "操作成功");
    }

    @GetMapping("/data/detail")
    public Result detail(Integer id){
        Data data = daoWrap.select(id,Data.class);
        HashMap<String,Object> map = new HashMap<>();
        HashMap<String,String> nameMap = new LinkedHashMap<>();
        map.put("obj",data);
        String[] namesArray = data.getColumnNames().split(",");
        String[] seqArray = data.getColumnSeq().split(",");
        String[] seqNameArray = new String[seqArray.length];

        map.put("namesArray",namesArray);
        map.put("seqArray",seqArray);
        for(int i=0;i<namesArray.length;i++){
            nameMap.put(namesArray[i],"value"+(i+1));
        }
        for(int i=0;i<seqArray.length;i++){
            seqNameArray[i] = nameMap.get(seqArray[i]);
        }
        map.put("seqNameArray",seqNameArray);
        return Result.returnSuccess(map, "操作成功");
    }

    @PostMapping("/data/save")
    public Result save(Data data){
        if(data.getId()==null){
            daoWrap.insert(data);
        }else{
            daoWrap.update(data);
        }
        return Result.returnSuccess(data, "操作成功");
    }

}
