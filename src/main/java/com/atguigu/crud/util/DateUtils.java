package com.atguigu.crud.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.sql.Timestamp;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.context.request.WebRequest;

/**
 * 格式化日期时间
 * @author 
 *
 */
public class DateUtils {

	public void initBinder(WebDataBinder binder, WebRequest request) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
		binder.registerCustomEditor(Timestamp.class, new CustomDateEditor(df, true));
	}
	
    private static Calendar calendar = Calendar.getInstance();
    // 格式化星期
    public static int getTodayWeek() {
        calendar.setTime(new Date());
       int week = calendar.get(Calendar.DAY_OF_WEEK);
       if (week > 0) {
           return week-1;
       } else {
           return 7;
       }
    }

    //  计算时间差
    public static int getMunite(Date startDate, Date endDate){
        long start = startDate.getTime();
        long end = endDate.getTime();
        int munite = (int) (end - start) / (1000 * 60);
        return munite;
    }


    // 获取当天的某个时间
    public static Date getDate(int hour, int munite) {
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,munite);
        return calendar.getTime();
    }
}
