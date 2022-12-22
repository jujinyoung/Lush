package com.util;

import java.sql.Date;

public class DateFormmater {

    public static Date utilDateTosqlDate(java.util.Date date){
        Date sqlDate = new Date(date.getTime());
        return sqlDate;

    }
}
