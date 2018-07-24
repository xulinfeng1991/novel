package com.parsec.novel.entity;

import com.parsec.universal.dao.BaseModel;
import com.parsec.universal.dao.annot.ParsecTable;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/24
 */
@lombok.Data
@ParsecTable("outline")
public class Outline extends BaseModel {

    private Integer id;
    private Integer parentId;
    private String title;
    private String plot;
    private String bossLevel;
    private String mainPeople;
    private String story;
    private String material;
    private Double sequence;

}
