package com.parsec.novel.entity;

import com.parsec.universal.dao.BaseModel;
import com.parsec.universal.dao.annot.ParsecTable;

/**
 * description
 *
 * @author xujiahong
 * @date 2018/7/19
 */
@lombok.Data
@ParsecTable("data")
public class Data extends BaseModel {
    private Integer id;
    private String dataName;
    private String tableName;
    private String columnNames;
    private String columnSeq;
}
