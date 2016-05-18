package com.util;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 詹武槟 on 2016/1/16.
 */
public class DateUtil {
    public static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
    public static SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
    public static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    public static SimpleDateFormat minTimeFormat = new SimpleDateFormat("H:mm:ss");
    public static SimpleDateFormat dayTimeFormat =
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static Timestamp dayToTimestamp(String day) {
        return Timestamp.valueOf(day + " 00:00:00.0");
    }

    public static Timestamp nowTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static String nowDay() {
        return dayFormat.format(new Date());
    }

    public static String nowDayTime() {
        return dayTimeFormat.format(new Date());
    }

    public static Timestamp dayTimeToTimestamp(String daytime) {
        return Timestamp.valueOf(daytime);
    }

    public static String monthSuffix(Timestamp timestamp) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMM");
        return "_" + simpleDateFormat.format(timestamp);
    }

    public static String recentlyThreeDay() {
        Date d=new Date();
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String recentlyThreeDay =  df.format(new Date(d.getTime() - 2 * 24 * 60 * 60 * 1000));
        return recentlyThreeDay;
    }

    public static String todyDate() {
        Date d=new Date();
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String todyDate = df.format(d);
        return todyDate;
    }

    public static String monthSuffix(String listId) {
        return "_" + listId.substring(0, 6);
    }

    public static void main(String[] args) throws ParseException {

        Calendar calendar=Calendar.getInstance();
        String a = "2015-05";
        Date now = new Date();

        calendar.setTime(monthFormat.parse(a));
        //Calendar.MONDAY;
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        System.out.println(calendar.getFirstDayOfWeek());
        System.out.println(calendar.get(Calendar.DAY_OF_WEEK));
        System.out.println(dayFormat.format(calendar.getTime()));
    }

}
