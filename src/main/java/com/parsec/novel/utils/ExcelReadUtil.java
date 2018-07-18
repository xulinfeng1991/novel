package com.parsec.novel.utils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


/**
 * Excel读取工具
 *
 * @author xujiahong
 * @date 2018/5/30
 */
public class ExcelReadUtil {

    /**
     * 将Excel文件的数据读取到Java数组
     *
     * @param file 上传的Excel文件
     * @return
     * @throws IOException
     */
    public static List<ArrayList<String>> readExcel(MultipartFile file) {
        /*
        基础验证
         */
        String postfix = ExcelBaseUtil.getPostfix(file);

        //最终的数据列表
        List<ArrayList<String>> list = new ArrayList<>();
        //工作簿
        Workbook wb = null;
        ArrayList<String> rowList = null;
        InputStream input = null;


        try {
            input = file.getInputStream();
            if (ExcelBaseUtil.OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
                wb = new HSSFWorkbook(input);
            } else if (ExcelBaseUtil.OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
                wb = new XSSFWorkbook(input);
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("读取excel时发生IO异常");
        } finally {
            try {
                input.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //此处简单的写死读取第一个sheet(页)，以后如需扩展可以根据wb.getNumberOfSheets()遍历所有sheet
        Sheet sheet = wb.getSheetAt(0);
        //读取Row,从第二行开始（第一行是标题）
        for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
            Row row = sheet.getRow(rowNum);
            if (row != null) {
                rowList = new ArrayList<>();
                //读取列，从第一列开始
                for (int c = 0; c < row.getLastCellNum(); c++) {
                    Cell cell = row.getCell(c);
                    //遇到空单元格，结束读取
                    if (cell == null) {
                        continue;
                    }
                    if (cell.getCellTypeEnum().equals(CellType.NUMERIC)) {
                        rowList.add(cell.getNumericCellValue() + "");
                    } else {
                        rowList.add(cell.getStringCellValue());
                    }
                }
                list.add(rowList);
            }
        }
        return list;
    }
}
