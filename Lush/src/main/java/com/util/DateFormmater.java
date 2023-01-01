package com.util;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateFormmater {

    public static Date utilDateTosqlDate(java.util.Date date){
        Date sqlDate = new Date(date.getTime());
        return sqlDate;

    }

    public static String sliceDatemm(Timestamp timestamp){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
        return sdf.format(timestamp);
    }

    public static String sliceDatedd(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        return sdf.format(date);
    }

    public static java.util.Date stringToDate(String rdate){
        SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = null;
        try {
             date = fm.parse(rdate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return date;
    }
}
