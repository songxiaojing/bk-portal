package com.mpe.portal.web.utils;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;


/**
 * 平台工具类.
 * 提供平台公共方法.
 *
 * @author baiyanwei
 * @title Utils
 * @package com.byw.platform.core.utils
 * @date 2014-8-8
 */
public class Utils {
    /**
     * 取得系统参数.
     *
     * @param parameterName String
     * @return String
     */
    public static String getSystemParameter(String parameterName) {

        return System.getProperty(parameterName);
    }

    /**
     * 设置系统参数.
     *
     * @param parameterName String
     * @param value         String
     */
    public static void setSystemParameter(String parameterName, String value) {

        System.setProperty(parameterName, value);
    }


    /**
     * 取得当前使用的样式.
     *
     * @param userName String
     * @return String
     */
    public static String getCurrentStyleName(String userName) {

        return "default";
    }


    /**
     * 将下载文件名进行编码处理，支持中文.
     *
     * @param targetFileName     String
     * @param fileNameEncodeName String
     * @return String
     * @throws UnsupportedEncodingException
     */
    public static String enCodingDownloadFileNameForHttpResponseHeader(String targetFileName, String fileNameEncodeName) throws UnsupportedEncodingException {

        if (Assert.isEmptyString(targetFileName)) {
            return "";
        }

        if (Assert.isEmptyString(fileNameEncodeName)) {
            return new String(targetFileName.getBytes(Constants.UTF_8), "ISO8859-1");
        } else {
            //
            return new String(targetFileName.getBytes(fileNameEncodeName), "ISO8859-1");
        }
    }

    /**
     * 将二进制转换成16进制.
     *
     * @param buf
     * @return
     */
    public static String parseByte2HexStr(byte buf[]) {
        if (buf == null || buf.length == 0) {
            return null;
        }
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < buf.length; i++) {
            String hex = Integer.toHexString(buf[i] & 0xFF);
            if (hex.length() == 1) {
                hex = '0' + hex;
            }
            sBuffer.append(hex.toUpperCase());
        }
        return sBuffer.toString();
    }

    /**
     * 将16进制转换为二进制.
     *
     * @param hexStr
     * @return
     */
    public static byte[] parseHexStr2Byte(String hexStr) {
        if (hexStr == null || hexStr.length() == 0) {
            return null;
        }
        byte[] result = new byte[hexStr.length() / 2];
        for (int i = 0; i < hexStr.length() / 2; i++) {
            int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
            int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2), 16);
            result[i] = (byte) (high * 16 + low);
        }
        return result;
    }

    /**
     * get MD5 for content.
     *
     * @param content
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public static String md5String(String content) throws NoSuchAlgorithmException, UnsupportedEncodingException {

        if (Assert.isEmptyString(content) == true) {
            return null;
        }
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(content.getBytes(Constants.ISO_8859_1), 0, content.length());
        byte[] md5hash = md.digest();
        return parseByte2HexStr(md5hash);
    }


    /**
     * subtract the pat from the source
     *
     * @param source
     * @param pat
     * @return
     */
    public static String subtract(String source, String pat) {

        if (Assert.isEmptyString(source)) {
            return null;
        }

        if (Assert.isEmptyString(pat)) {
            return null;
        }

        int index = source.indexOf(pat);
        if (index == -1) {
            // not found
            return source;
        }

        StringBuffer sb = new StringBuffer();
        if (index != 0) {
            sb.append(source.substring(0, index));
        }

        if (index + pat.length() != source.length()) {
            sb.append(source.substring(index + pat.length()));
        }

        return sb.toString();
    }

    /**
     * @param clazz
     * @return
     */
    public static String getShortClassName(Class<?> clazz) {

        if (clazz == null) {
            return null;
        }

        return getShortClassName(clazz.getName());
    }

    /**
     * Get the Short class name.
     *
     * @param className
     * @return
     */
    public static String getShortClassName(String className) {

        if (Assert.isEmptyString(className) == true) {
            return null;
        }
        int lastDotIndex = className.lastIndexOf(".");
        int nameEndIndex = className.length();
        String shortName = className.substring(lastDotIndex + 1, nameEndIndex);
        //
        return shortName;
    }

    /**
     * get 32 bit UUID String
     *
     * @return
     */
    public static String getUUID32() {

        String sn = UUID.randomUUID().toString();
        // UUID(32);
        return sn.substring(0, 8) + sn.substring(9, 13) + sn.substring(14, 18) + sn.substring(19, 23) + sn.substring(24);
    }

    /**
     * 将字符串的第一个节字大写.
     *
     * @param context String
     * @return String
     */
    public static String firstLitterUp(String context) {

        if (Assert.isEmptyString(context)) {
            return context;
        }
        if (context.length() == 1) {
            return context.toUpperCase();
        } else {
            return context.substring(0, 1).toUpperCase() + context.substring(1);
        }

    }

    /**
     * 根据属性名取得对应的字段名.
     *
     * @param attributeName
     * @return
     */
    public static String getDBColumnNameByBeanAttributeName(String attributeName) {

        if (Assert.isEmptyString(attributeName)) {
            return "";
        }
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < attributeName.length(); i++) {
            if (Character.isUpperCase(attributeName.charAt(i))) {
                result.append('_').append(attributeName.charAt(i));
            } else {
                result.append(attributeName.charAt(i));
            }

        }
        return result.toString().toUpperCase();
    }
}
