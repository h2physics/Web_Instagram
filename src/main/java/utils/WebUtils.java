/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.http.Part;

/**
 *
 * @author H2PhySicS
 */
public class WebUtils {
    public static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
    
    public static Date formatDate(){
        java.util.Date date = new java.util.Date();
        System.out.println("Date Util: " + date.toString());
        Date dateSQL = new Date(date.getTime());
//        dateSQL.setHours(date.getHours());
//        dateSQL.setMinutes(date.getMinutes());
//        dateSQL.setSeconds(date.getSeconds());
        return dateSQL;
    }
}
