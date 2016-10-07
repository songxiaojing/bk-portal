package com.mpe.portal.web.utils.datatable;

import com.mpe.portal.web.utils.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by baiyanwei on 10/6/16.
 */
public class DataTablePagationUtil {
    final private static String INPUT_DATE_FORMATTOR = "yyyy-MM-dd";
    final private static Logger theLogger = LoggerFactory.getLogger(DataTablePagationUtil.class);

    public static Map<String, Object> buildSelectConditionMap(HashMap<String, String> conditionMap) throws ParseException {
        try {
            //


            // theLogger.debug("get Bean:" + beanContext.getBean(targetMapperClass).hashCode());
            //计算分页长度
            int pageNumber = Integer.parseInt(conditionMap.get("start"));
            int pageSize = Integer.parseInt(conditionMap.get("length"));
            pageNumber = pageNumber - 1;
            if (pageNumber < 0) {
                pageNumber = 0;
            }
            pageNumber = pageNumber * pageSize;
            theLogger.debug("#query conditon condionMap:" + conditionMap.toString());
            // 将Map<String,String>转变 Map<String,Object> 并设置pageNo和pageSize
            Map<String, Object> changeMap = new HashMap<String, Object>();
            for (String name : conditionMap.keySet()) {
                String value = conditionMap.get(name);
                Object newValues = null;
                if (name.contains("_startAt") || name.contains("_endAt")) {
                    if (Assert.isEmptyString(value) == false) {
                        SimpleDateFormat yyyyMMdd = new SimpleDateFormat(INPUT_DATE_FORMATTOR);
                        newValues = yyyyMMdd.parse(value);
                    }
                } else {
                    newValues = value;
                }
                changeMap.put(name, newValues);
            }
            changeMap.put("pageNo", pageNumber);
            changeMap.put("pageSize", pageSize);

            theLogger.debug("#query conditon changeMap:" + changeMap.toString());

            return changeMap;

        } catch (Exception e) {
            throw e;
        }
    }
}
