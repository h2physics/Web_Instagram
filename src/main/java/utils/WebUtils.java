/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import data.model.Post;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Part;

/**
 *
 * @author H2PhySicS
 */
public class WebUtils {
    public WebUtils(){
        
    }
    
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
    
    public static List<Post> orderPostByTime(List<Post> posts){
        Collections.sort(posts);
        return posts;
    }
    
    public String getTimePosted(Date postedDate){
        Date currentDate = new Date();
        System.out.println(currentDate.toString());
        long milisCurrentDate = currentDate.getTime();
        long milisPostedDate = postedDate.getTime();
        int gap = (int)(milisCurrentDate - milisPostedDate) / 1000;
        System.out.println("Gap: " + gap);
        int day = 0;
        int hour = 0;
        int minute = 0;
        int DAY_TO_SECOND = 24*60*60;
        int HOUR_TO_SECOND = 60*60;
        int MINUTE_TO_SECOND = 60;
        if(gap > DAY_TO_SECOND){
            day = gap / DAY_TO_SECOND;
            gap = gap % DAY_TO_SECOND;
        } else {
            day = 0;
        }
        if(gap > HOUR_TO_SECOND){
            hour = gap / HOUR_TO_SECOND;
            gap = gap % HOUR_TO_SECOND;
        } else {
            hour = 0;
        }
        if(gap > MINUTE_TO_SECOND){
            minute = gap / MINUTE_TO_SECOND;
        } else {
            minute = 1;
        }
//        if(gap > DAY_TO_SECOND){
//            day = gap / DAY_TO_SECOND;
//            gap = gap % DAY_TO_SECOND;
//            if(gap > HOUR_TO_SECOND){
//                hour = gap / HOUR_TO_SECOND;
//                gap = gap % HOUR_TO_SECOND;
//                if(gap > MINUTE_TO_SECOND){
//                    minute = gap / MINUTE_TO_SECOND;
//                } else {
//                    minute = 1;
//                }
//            } else {
//                if(gap > MINUTE_TO_SECOND){
//                    minute = gap / MINUTE_TO_SECOND;
//                } else {
//                    minute = 1;
//                }
//            }
//        } else {
//            day = 0;
//            if(gap > HOUR_TO_SECOND){
//                hour = gap / HOUR_TO_SECOND;
//                gap = gap % HOUR_TO_SECOND;
//                if(gap > MINUTE_TO_SECOND){
//                    minute = gap / MINUTE_TO_SECOND;
//                } else {
//                    minute = 1;
//                }
//            } else {
//                if(gap > MINUTE_TO_SECOND){
//                    minute = gap / MINUTE_TO_SECOND;
//                } else {
//                    minute = 1;
//                }
//            }
//        }
        if(day > 0){
            if(day == 1){
                return day + " day ago";
            } else {
                return day + " days ago";
            }
        } else {
            if(hour > 0){
                if(hour == 1){
                    return hour + " hour ago";
                } else {
                    return hour + " hours ago";
                }
            } else {
                if(minute > 0){
                    if(minute == 1){
                        return minute + " minute ago";
                    } else {
                        return minute + " minutes ago";
                    }
                } else {
                    return "just now";
                }
            }
        }
    }
}
