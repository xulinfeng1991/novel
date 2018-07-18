package com.parsec.novel.entity;

import com.parsec.universal.dao.BaseModel;
import com.parsec.universal.dao.annot.ParsecTable;
import lombok.Data;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/16
 */
@Data
@ParsecTable("hero")
public class Hero extends BaseModel {
    private Integer id;
    private String name;
    private String nickName;
    private String magicAttribute;
    private String home;
    private String org;
    private String weapon;
    private String appearScene;
    private String levelDesc;
    private String story;
}
