package com.mpe.portal.web.utils;

/**
 * Created by baiyanwei on 10/9/16.
 */
public class NewsUtil {

    public static String getShortText(String text, int len) {
        if (Assert.isEmptyString(text)) {
            return "";
        }
        if (len == 0 || text.length() <= len) {
            return text;
        }
        return text.substring(0, len) + "...";
    }
}
