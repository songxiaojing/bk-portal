package com.mpe.portal.web.utils.http;

import javax.servlet.http.HttpServletRequest;
import java.util.Properties;


/**
 * Created by byw-m on 2016/7/18.
 * HTTP请求工具类
 */
public class HttpRequestUtil {
    //HTTP HEAD USER-AGENT 用来判断访问端的类型
    public static String USER_AGENT = "User-Agent";

    /**
     * 取得USER_AGENT判断浏览器类型
     *
     * @param request HttpServletRequest
     * @return String
     */
    public static String getUserAgent(final HttpServletRequest request) {
        if (request == null) {
            return null;
        }

        return request.getHeader(USER_AGENT);
    }

    /**
     * @param request
     * @return
     * @throws Exception
     */
    public static String getRemoteAddr(final HttpServletRequest request) throws Exception {

        try {
            String remoteAddr = request.getHeader("X-Forwarded-For");
            // 如果通过多级反向代理，X-Forwarded-For的值不止一个，而是一串用逗号分隔的IP值，此时取X-Forwarded-For中第一个非unknown的有效IP字符串
            if (isEffective(remoteAddr) && (remoteAddr.indexOf(",") != -1)) {
                String[] array = remoteAddr.split(",");
                for (String element : array) {
                    if (isEffective(element)) {
                        remoteAddr = element;
                        break;
                    }
                }
            }
            if (!isEffective(remoteAddr)) {
                remoteAddr = request.getHeader("X-Real-IP");
            }
            if (!isEffective(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
            return remoteAddr;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 远程地址是否有效.
     *
     * @param remoteAddr 远程地址
     * @return true代表远程地址有效，false代表远程地址无效
     */
    private static boolean isEffective(final String remoteAddr) {
        boolean isEffective = false;
        if ((null != remoteAddr) && (!"".equals(remoteAddr.trim()))
                && (!"unknown".equalsIgnoreCase(remoteAddr.trim()))) {
            isEffective = true;
        }
        return isEffective;
    }

    public static Properties getHttpHeader(HttpServletRequest request) {
        return new Properties();
    }
}
