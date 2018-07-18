package com.parsec.novel.controller;

import com.parsec.novel.entity.Hero;
import com.parsec.novel.utils.ExcelBaseUtil;
import com.parsec.novel.utils.ExcelReadUtil;
import com.parsec.universal.dao.CommonDaoWrap;
import com.parsec.universal.utils.Result;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/16
 */
@RestController
public class HeroController {

    @Autowired
    private CommonDaoWrap daoWrap;

    @GetMapping("/hero/list")
    public Result list(){
        Hero query = new Hero();
        query.setPageSize(999);
        List<Hero> list = daoWrap.selectList(query,null,true);
        return Result.returnSuccess(list, "操作成功");
    }

    @PostMapping("/hero/excel")
    public Result insertByExcel(MultipartFile file){
        String check = ExcelBaseUtil.checkExcel(file);
        if(check!=null){
            return Result.returnFail(check);
        }
        /*
        读取excel数据
         */
        List<ArrayList<String>> list = ExcelReadUtil.readExcel(file);
        if(list==null || list.size()==0){
            return Result.returnFail("读取到的Excel数据为空");
        }
        /*
        处理数据
         */
        for(ArrayList<String> columns : list){
            //excel:0序号，1名字，2称号，3国家，4分卷，5派系，6属性，7武器，8等级，9技能，10性格，11，12设定
            Hero hero = new Hero();
            try{
                hero.setName(columns.get(1));
                hero.setNickName(columns.get(2));
                hero.setHome(columns.get(3));
                hero.setAppearScene(columns.get(4));
                hero.setOrg(columns.get(5));
                hero.setMagicAttribute(columns.get(6));
                hero.setWeapon(columns.get(7));
                hero.setLevelDesc(columns.get(8));
                hero.setStory(columns.get(12));
            }catch (IndexOutOfBoundsException e){
                //不管越界异常
            }
            if(!StringUtils.isEmpty(hero.getNickName())){
                daoWrap.insert(hero);
            }
        }
        return Result.returnSuccess(null,"操作成功");
    }

}
