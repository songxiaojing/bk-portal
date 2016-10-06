package com.mpe.portal.web.utils.module;


import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.net.URL;
import java.util.HashMap;


/**
 * Created by martin on 5/10/16.
 * 权限点，菜单，字典数据缓存服务
 */

public class ResourceModuleUtils {

    final private static Logger theLogger = LoggerFactory.getLogger(ResourceModuleUtils.class);

    private static ResourceModuleUtils resourceModuleUtils = null;

    final public static String MODULE_FILE_SUFFIX = ".module";

    public String _modulePath = "module";


    private HashMap<String, JSONObject> _formDefineMap = new HashMap<String, JSONObject>();

    private MessagePrepareUtil messagePrepareUtil = null;


    public synchronized static ResourceModuleUtils getInstance() throws Exception {

        if (resourceModuleUtils == null) {

            resourceModuleUtils = new ResourceModuleUtils();

            resourceModuleUtils.loadAllModuleReferent();

            resourceModuleUtils.messagePrepareUtil = new MessagePrepareUtil();

            theLogger.info("Instance ResourceModuleUtils " + resourceModuleUtils.hashCode());
        }

        return ResourceModuleUtils.resourceModuleUtils;
    }

    /**
     * 加载MODULE包下所有的module.jsp配置文件.
     */
    private void loadAllModuleReferent() throws Exception {
        this._formDefineMap.clear();
        URL resources = this.getClass().getClassLoader().getResource(this._modulePath);
        File moduleFile = new File(resources.toURI());
        if (!moduleFile.exists()) {
            throw new Exception("module directory doesn't exist");
        }
        //取得对应的模型文件
        File[] jsonFiles = moduleFile.listFiles(new FileFilter() {

            @Override
            public boolean accept(File pathname) {

                if (pathname.getName().endsWith(MODULE_FILE_SUFFIX)) {
                    return true;
                }
                return false;
            }
        });
        if (jsonFiles == null || jsonFiles.length == 0) {
            return;
        }
        for (int i = 0; i < jsonFiles.length; i++) {
            try {
                //读取模型文件
                StringBuffer jsonMessage = IOUtils.getInputStream2StringBuffer(new FileInputStream(jsonFiles[i]));
                if (jsonMessage == null) {
                    continue;
                }
                JSONObject formJSONObject = new JSONObject(jsonMessage.toString());
                String className = formJSONObject.getString(ModuleReferent.MODULE_NAME);
                if (Assert.isEmptyString(className)) {
                    theLogger.debug("noModuleName", jsonFiles[i].getAbsolutePath());
                    continue;
                }

                synchronized (this._formDefineMap) {
                    this._formDefineMap.put(className, formJSONObject);
                }
            } catch (Exception e) {
                theLogger.error("loadAllModuleReferent", e);
            }
        }
    }

    /**
     * 根据类定义取得列表显示的属性.
     *
     * @param tableHeaderName
     * @return
     */
    public String getHeaderContext(String tableHeaderName, boolean withCheckBox, boolean isSort) {

        if (tableHeaderName == null) {
            return null;
        }
        //
        //取得属性定义
        JSONObject moduleJSONObject = getFormDefineByClass(tableHeaderName);
        if (moduleJSONObject != null) {
            StringBuffer headString = new StringBuffer();
            headString.append("[");
            JSONArray fieldArray = moduleJSONObject.getJSONArray("fields");
            if (fieldArray == null || fieldArray.length() == 0) {
                return "[]";
            }
            //构建表头数组
            //headString.append(messagePrepareService.formatMessage("bootstrap.datatables.header", "id", "<input type='checkbox' name='dataTables.row.checkAll' id='dataTables.row.checkAll' onclick='checkAll()'/>", "selectFormatter", "false")).append(",");
            for (int i = 0; i < fieldArray.length(); i++) {
                JSONObject inputDefine = fieldArray.getJSONObject(i);
                //过滤掉不在表头出现的属性
                if (inputDefine.has(ModuleReferent.field.IN_LIST) == false) {
                    continue;
                }
                boolean inList = inputDefine.getBoolean(ModuleReferent.field.IN_LIST);
                if (inList != true) {
                    continue;
                }
                String fieldName = inputDefine.getString(ModuleReferent.field.FIELD_NAME);


                String showName = inputDefine.getString(ModuleReferent.field.SHOW_NAME);

                String dataFormatter = null;
                if (inputDefine.has(ModuleReferent.field.TABLE_FORMATTER) == true) {
                    dataFormatter = inputDefine.getString(ModuleReferent.field.TABLE_FORMATTER);
                }

                //theLogger.debug("showInList:" + fieldName + ":" + showName);
                //'{'"field":"{0}","title":"{1}","editor":"{2}","sortable":{3},"width":{4},"formatter":{5}'}'

                String message = "";
                //如果定义了表格式化输出
                if (Assert.isEmptyString(dataFormatter) == false) {
                    message = this.messagePrepareUtil.formatMessage("bootstrap.datatables.header", fieldName, showName, dataFormatter, String.valueOf(isSort));
                } else {
                    message = this.messagePrepareUtil.formatMessage("bootstrap.datatables.header.noformatter", fieldName, showName, String.valueOf(isSort));
                }
                headString.append(message).append(",");
            }
            if (headString.length() > 0) {
                headString.deleteCharAt(headString.length() - 1);
            }
            headString.append("]");
            theLogger.debug("headList:" + headString);
            return headString.toString();
        }

        return "[]";
    }

    /**
     * Your Methods description is in here.
     *
     * @param clazz
     * @return
     */
    private JSONObject getFormDefineByClass(String clazz) {

        if (this._formDefineMap.containsKey(clazz) == true) {
            return this._formDefineMap.get(clazz);
        }
        JSONObject formDefined = this.loadModuleFormDefine(clazz);
        if (formDefined == null) {
            return null;
        }

        synchronized (this._formDefineMap) {
            this._formDefineMap.put(clazz, formDefined);
        }
        return formDefined;

    }


    /**
     * 加载资源模型FORM信息.
     */
    private JSONObject loadModuleFormDefine(String clazz) {
        try {
            String resPath = this._modulePath + "/" + clazz + MODULE_FILE_SUFFIX;
            StringBuffer jsonMessage = IOUtils.getInputStream2StringBuffer(this.getClass().getClassLoader().getResourceAsStream(resPath));
            if (jsonMessage == null) {
                return null;
            }
            JSONObject formJSONObject = new JSONObject(jsonMessage.toString());
            return formJSONObject;
        } catch (Exception e) {
            theLogger.error("loadModuleFormDefine", e);
        }
        return null;
    }

}
