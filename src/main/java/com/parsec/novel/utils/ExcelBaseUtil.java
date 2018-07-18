package com.parsec.novel.utils;

import org.springframework.web.multipart.MultipartFile;

/**
 * Excel基础工具类
 *
 * @author xujiahong
 * @date 2018/5/30
 */
public class ExcelBaseUtil {

    public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
    public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";

    public static String checkExcel(MultipartFile file){
        if (file == null) {
            return "未接收到上传的文件";
        }
        String postfix = getPostfix(file);
        if(postfix==null || "".equals(postfix)){
            return "未解析出文件的后缀名";
        }
        if(!OFFICE_EXCEL_2003_POSTFIX.equals(postfix) &&
                !OFFICE_EXCEL_2010_POSTFIX.equals(postfix)){
            return "文件类型不合法，请上传xls，xlsx文件";
        }
        return null;
    }


    /**
     * 获得文件后缀名
     *
     * @param file
     * @return
     */
    public static String getPostfix(MultipartFile file){
        if (file == null || "".equals(file.getOriginalFilename().trim())) {
            return null;
        }
        String path = file.getOriginalFilename();
        return path.substring(path.lastIndexOf(".")+1,path.length());
    }

}
