package com.mpe.portal.web.utils;

import java.io.File;


/**
 * Created by byw-m on 2016/7/18.
 * STRUTS 上传的文件包装类
 */
public class UploadFile {

    /**
     * 上传文件的名称.
     */
    private String fileName = null;
    /**
     * 上传文件主体.
     */
    private File file = null;
    /**
     * 属性名称.
     */
    private String parameterName = null;
    /**
     * UUID.
     */
    private String uuid = null;
    /**
     * 类名.
     */
    private String className = null;

    public UploadFile(String fileName, File file, String parameterName) {

        super();
        this.fileName = fileName;
        this.file = file;
        this.parameterName = parameterName;
        this.uuid = Utils.getUUID32();
    }

    public String getFileName() {

        return fileName;
    }

    public void setFileName(String fileName) {

        this.fileName = fileName;
    }

    public File getFile() {

        return file;
    }

    public void setFile(File file) {

        this.file = file;
    }

    public String getParameterName() {

        return parameterName;
    }

    public void setParameterName(String parameterName) {

        this.parameterName = parameterName;
    }

    public String getUuid() {

        return uuid;
    }

    public void setUuid(String uuid) {

        this.uuid = uuid;
    }

    public String getClassName() {

        return className;
    }

    public void setClassName(String className) {

        this.className = className;
    }

    @Override
    public String toString() {
        return this.file.getAbsolutePath();
    }
}
