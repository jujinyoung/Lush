package com.util;

import java.sql.Date;
import java.sql.Timestamp;
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
}
