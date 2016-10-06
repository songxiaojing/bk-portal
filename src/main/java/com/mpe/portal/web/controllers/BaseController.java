package com.mpe.portal.web.controllers;


import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.HttpContentType;
import com.mpe.portal.web.utils.UploadFile;
import com.mpe.portal.web.utils.app.AppReferent;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;


public abstract class BaseController {
    //
    final private static Logger theLogger = LoggerFactory.getLogger(BaseController.class);
    //
    public static String FORWARD_MESSAGE = "forward_message";


    protected String getLogOperateTime() {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return "操作时间：" + dateFormatter.format(new Date());
    }


    public HttpSession getHttpSession() {

        return ServletActionContext.getRequest().getSession();
    }


    public HttpServletRequest getRequest() {

        return ServletActionContext.getRequest();
    }


    public HttpServletResponse getResponse() {

        return ServletActionContext.getResponse();
    }

    /**
     * 在FOWARD时增加消息信息
     *
     * @param message
     */
    protected void setForwardMessage(String message) {
        this.getRequest().setAttribute(FORWARD_MESSAGE, message);
    }

    /**
     * 取得当前SESSION中的用户
     *
     * @return SysUser
     */
    public String getCurrentSysUser() {
        return (String) (this.getHttpSession().getAttribute(AppReferent.session_current_user.getValue()));
    }

    /**
     * 设置当前用户在SESSION
     *
     * @param sysUser SysUser
     * @return
     */
    public void setCurrentSysUser(String sysUser) {
        this.getHttpSession().setAttribute(AppReferent.session_current_user.getValue(), sysUser);
    }


    /**
     * 向客户端写错误信息.
     *
     * @param errorMessage
     * @throws Exception
     */
    public void pushBackToClientWithError(String errorMessage) throws Exception {

        pushBackToClient(HttpStatus.INTERNAL_SERVER_ERROR, HttpContentType.TXT, errorMessage);
    }

    /**
     * 向客户端写信息.
     *
     * @param message
     * @throws Exception
     */
    public void pushBackToClient(HttpStatus code, HttpContentType contentType, String message) throws Exception {

        PrintWriter pw = null;
        try {
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setStatus(code.value());
            response.setContentType(contentType.value());
            pw = response.getWriter();
            //如果推送的消息为空则以HTTP消息码替换
            if (Assert.isEmptyString(message)) {
                pw.print(code.getReasonPhrase());
            } else {
                pw.print(message);
            }
            pw.flush();
            theLogger.debug("Push [" + code + "] Context:" + message);
        } catch (IOException e) {
            throw e;
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }

    /**
     * 向客户端写信息 HTTP CODE 200.
     *
     * @param message
     * @throws Exception
     */
    public void pushBackToClient(String message) throws Exception {

        this.pushBackToClient(HttpStatus.OK, HttpContentType.HTML, message);
    }


    protected MultiPartRequestWrapper getMultiPartRequestWrapper(HttpServletRequest request) throws Exception {

        MultiPartRequestWrapper mwRequest = (MultiPartRequestWrapper) request;
        if (mwRequest == null) {
            return null;
        }
        validateUploadFileSize(mwRequest);

        return mwRequest;
    }

    private void validateUploadFileSize(MultiPartRequestWrapper mwRequest) throws Exception {

        if (mwRequest != null && mwRequest.getErrors().size() > 0) {
            throw new Exception("上传文件过大!");
        }
    }

    /**
     * 取得上传文件的对象 enctype="multipart/form-module".
     *
     * @param request
     * @return
     */
    public <T extends MultiPartRequestWrapper> HashMap<String, List<UploadFile>> getUploadFileMap(T request) {

        if (request == null) {
            return new HashMap<String, List<UploadFile>>();
        }
        //取得FORM中所有的FILE INPUT
        Enumeration<String> fileParameters = request.getFileParameterNames();
        if (fileParameters == null) {
            return new HashMap<String, List<UploadFile>>();
        }

        HashMap<String, List<UploadFile>> uploadFileMap = new HashMap<String, List<UploadFile>>();
        while (fileParameters.hasMoreElements()) {
            //取得FILE INPUT对应的文件名与上传到服务器后目录中的FILE
            String fileParameterName = fileParameters.nextElement();
            String[] fileNames = request.getFileNames(fileParameterName);
            File[] localfiles = request.getFiles(fileParameterName);
            int size = fileNames.length;
            if (size > localfiles.length) {
                size = localfiles.length;
            }
            ArrayList<UploadFile> uploadFileList = new ArrayList<UploadFile>();
            for (int i = 0; i < size; i++) {
                uploadFileList.add(new UploadFile(fileNames[i], localfiles[i], fileParameterName));
            }
            uploadFileMap.put(fileParameterName, uploadFileList);

        }
        //
        return uploadFileMap;
    }

    /**
     * 取得请求中的参数集合
     *
     * @return
     */
    protected HashMap<String, String> getParameterMap() {
        HashMap<String, String> formInputMap = new HashMap<String, String>();
        HttpServletRequest request = this.getRequest();
        Enumeration<?> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String key = names.nextElement().toString();
            try {
                formInputMap.put(key, request.getParameter(key) == null ? request.getParameter(key) : request.getParameter(key).trim());
            } catch (Exception e) {

            }
        }
        //

        return formInputMap;
    }


    /**
     * 生成DataTables需要的JSON数据.
     *
     * @param resourceDataList
     * @param resourceCount
     * @param draw
     * @return
     * @throws Exception
     */
    protected String buildDataTablesRowData(List<HashMap<String, String>> resourceDataList, long resourceCount, String draw) throws Exception {

        //ResourceModuleService resourceService = ServiceHelper.findService(ResourceModuleService.class);

        JSONObject rowsDataJSONObj = new JSONObject();
        JSONArray dataArray = new JSONArray();
        if (resourceDataList != null && resourceDataList.isEmpty() == false) {
            for (HashMap<String, String> attributeMap : resourceDataList) {
                dataArray.put(attributeMap);
            }
        }
        rowsDataJSONObj.put("draw", draw);
        rowsDataJSONObj.put("recordsTotal", resourceCount);
        rowsDataJSONObj.put("recordsFiltered", resourceCount);
        rowsDataJSONObj.put("data", dataArray);
        return rowsDataJSONObj.toString();
        //

    }

    /**
     * 取得当前用户.
     *
     * @param request
     * @return
     */
//    protected AutUser getCurrentUserByRequest(HttpServletRequest request) throws LossUserException {
//
//        if (request == null) {
//            return null;
//        }
//
//        return this._httpSessionService.getCurrentUser(request);
//    }

    /**
     * 参数替换.
     *
     * @param formInputMap
     * @param request
     * @return
     */
//    private HashMap<String, String> replaceParamFilter(HashMap<String, String> formInputMap, HttpServletRequest request) {
//
//        if (Assert.isEmptyMap(formInputMap) == true) {
//            return formInputMap;
//        }
//        if (formInputMap.containsKey("replace.application.current.user") == true) {
//            String replaceAppCurrentUser = formInputMap.get("replace.application.current.user");
//            if (Assert.isEmptyString(replaceAppCurrentUser) == false && formInputMap.containsKey(replaceAppCurrentUser) == false) {
//                try {
//                    // formInputMap.put(replaceAppCurrentUser, this.getCurrentUserByRequest(request).getId().toString());
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return formInputMap;
//    }

    /**
     * 取得参数集盒.
     *
     * @return
     */


}
