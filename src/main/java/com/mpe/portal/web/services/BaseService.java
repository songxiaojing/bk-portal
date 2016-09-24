package com.mpe.portal.web.services;

import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;


/**
 * Created by martin on 5/13/16.
 * 基础服务类
 */
@Service("BaseService")
public abstract class BaseService {
    final public static String INPUT_DATE_FORMATTOR = "yyyy-MM-dd HH:mm:ss";

    /**
     * 取得默认的日期格式
     *
     * @return
     */
    protected SimpleDateFormat getDefaultDataFormat() {
        return new SimpleDateFormat(INPUT_DATE_FORMATTOR);
    }


    protected MultiPartRequestWrapper getMultiPartRequestWrapper(HttpServletRequest request) throws Exception {

        MultiPartRequestWrapper mwRequest = (MultiPartRequestWrapper) request;
        if (mwRequest == null) {
            return null;
        }
        if (mwRequest.getErrors().size() > 0) {
            throw new Exception("上传文件过大!");
        }

        return mwRequest;
    }

}
