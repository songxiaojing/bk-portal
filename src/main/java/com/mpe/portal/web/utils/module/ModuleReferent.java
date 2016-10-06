package com.mpe.portal.web.utils.module;

/**
 * 
 * 简易资源模型定义参考.
 * 
 * 通过Module.js文件中的定义来描述资源在维护与显示的模型.
 * 
 * @title ModuleReferent
 * @package com.topsec.tss.platform.module
 * @author baiyanwei
 * @version
 * @date 2014-11-18
 * 
 */
final public class ModuleReferent {

    /**
     * 字段定义标题
     */
    final public static String FIELDS = "fields";
    /**
     * 模型名称.
     */
    final public static String MODULE_NAME = "moduleName";
    /**
     * 模型显示名称.
     */
    final public static String SHOW_NAME = "showName";
    /**
     * 模型TOOLBAR操作.
     */
    final public static String DEFAULT_TOOL_BAR = "toolbar";
    /**
     * 详细页TOOLBAR
     */
    final public static String DETAIL_TOOL_BAE = "detailToolBar";

    /**
     * 
     * 模型字段内配置项常量定义.
     * 
     * 模型字段内配置项常量定义.
     * 
     * @title field
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2014-11-18
     * 
     */
    public static class field {

        /*
        {
           "fieldName" : "取值范围说明",
           "fieldType" : "java.lang.Long",
           "elementId" : "XXXXXXXX",
           "showName" : "显示名称",
           "showType" : "date/text/hidden/referent/boolean",
           "size" : 20,
           "maxSize" : 15,
           "order" : "0000001",
           "referent" : {
               "type" : "dictionary/resource",
               "className" : "com.topsec.tss.core.web.resource.module.DimCity",
               "dictionaryType" : "ip.type"
           },
           "validation" : "required,ipv4,number,port,emain"
           }
        */
        /**
         * 字段名称.
         */
        final public static String FIELD_NAME = "fieldName";
        /**
         * 字段值类型.
         */
        final public static String FIELD_TYPE = "fieldType";
        /**
         * HTML INPUT 元素ID.
         */
        final public static String ELEMENT_ID = "elementId";
        /**
         * HTML INPUT 元素 LABEL 显示名称
         */
        final public static String SHOW_NAME = "showName";
        /**
         * HTML INPUT 元素 显示类别.
         */
        final public static String SHOW_TYPE = "showType";
        /**
         * HTML INPUT 元素 长度.
         */
        final public static String SIZE = "size";
        /**
         * HTML INPUT 元素 最大输入长度.
         */
        final public static String MAXSIZE = "maxSize";
        /**
         * HTML INPUT 元素显示排序序号.
         */
        final public static String ORDER = "order";
        /**
         * HTML INPUT 元素 参考定义.
         */
        final public static String REFERENT = "referent";
        /**
         * HTML INPUT 元素 JS 验证方式.
         */
        final public static String VALIDATION = "validation";
        /**
         * HTML INPUT 元素 是否出现在查询功能中.
         */
        final public static String IN_SEARCH = "inSearch";
        /**
         * HTML INPUT 元素 是否出现在详细信息功能中.
         */
        final public static String IN_DETAIL = "inDetail";
        /**
         * HTML INPUT 元素 是否出现在查询功能中.
         */
        final public static String IN_LIST = "inList";
        /**
         * HTML INPUT 元素 是否出现在创建功能中.
         */
        final public static String IN_CREATE = "inCreate";
        /**
         * HTML INPUT 元素 是否出现在单个修改中功能中.
         */
        final public static String IN_UPDATE = "inUpdate";
        /**
         * HTML INPUT 元素 是否出现在批量修改中.
         */
        final public static String IN_BATCHUPDATE = "inBatchUpdate";
        /**
         * HTML INPUT 元素 在列表显示时的RENDER.
         */
        final public static String TABLE_FORMATTER = "tableFormatter";
        /**
         * HTML INPUT 元素 在单个修改时 属性是否为只读
         */
        final public static String READONLY = "readOnly";
        /**
         * HTML INPUT 元素 为FILE时，最多可以增加附件的数量
         */
        final public static String FILECOUNT = "fileCount";

        /**
         * HTML INPUT 元素 是否为导入的记录唯一确认条件 .
         */
        final public static String IS_IMPORT_KEY = "isImportKey";
    }

    /**
     * 
     * 字段参考类型定义常量.
     * 
     * Your class Detail description,end with '.'.
     * 
     * @title Referent
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2014-11-18
     * 
     */
    public static class Referent {

        /*
        "referent" : {
        "type":"DimDictionary",
        "className":"com.topsec.tss.core.web.resource.module.DimDictionary",
        "dictionaryType":"ip.status"
        },*/
        /**
         * 字段参考类型.
         */
        final public static String TYPE = "type";
        /**
         * 参考类型相关资源类名.
         */
        final public static String CLASS_NAME = "className";
        /**
         * 参考类型相关资源描述名称.
         */
        final public static String REF_NAME = "refName";

        /**
         * 参考类型相关资源描述名称.
         */
        final public static String REF_FIELD = "refField";

        /**
         * 参考类型相关字典类型.
         */
        final public static String DICTIONARY_TYPE = "dictionaryType";

        /**
         * 定义字典类型是否影响其它值.
         */
        final public static String SUB_ELEMENT = "subElement";

        /**
         * 参考类型相关字典类型.
         */
        final public static String SUB_ELEMENT_DICTIONARY_TYPE = "subElementDictionaryType";
        /**
         * 参考类型相关资源选择模式，单，多.
         */
        final public static String SELECT_OPERATION = "selectOperation";
        /**
         * 指定打开的URL.
         */
        final public static String OPENURL = "openUrl";

        final public static String IS_FIXABLE = "isFixable";

        /**
         * 参考类型 资源类型.
         */
        final public static String REFERENT_TYPE_RESOURCE = "resource";
        /**
         * 参考类型 资源类型.
         */
        final public static String REFERENT_TYPE_DICTIONARY = "dictionary";
        /**
         * 参考类型 资源类型.
         */
        final public static String REFERENT_TYPE_OPENED = "opened";

        /**
         * 资源类型选择.
         */
        final public static String SELECT_OPERATION_TYPE_SINGLE = "single";
        /**
         * 资源类型选择.
         */
        final public static String SELECT_OPERATION_TYPE_MORE = "more";

        /**
         * 转换后，值的显示方式.
         */
        final public static String VALUE_SHOW_TYPE = "valueShowType";

    }

    /**
     * 
     * 前台JS验证方式.
     * 
     * 前台JS验证方式.
     * 
     * @title Validate
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2014-11-19
     * 
     */
    public static class Validate {

        /*
         * required,digital,integer,long,portNumber,float,double,ipV4,unZero,ipV4MaskBit,date,email,macAddress,domainName
        */
        /**
         * 必填.
         */
        final public static String VALIDATE_REQUIRED = "required";
        /**
         * 数字.
         */
        final public static String VALIDATE_DIGITAL = "digital";
        /**
         * 整数.
         */
        final public static String VALIDATE_INTEGER = "integer";
        /**
         * 长整数.
         */
        final public static String VALIDATE_LONG = "long";
        /**
         * 端口号.
         */
        final public static String VALIDATE_PORTNUMBER = "portNumber";
        /**
         * 浮点.
         */
        final public static String VALIDATE_FLOAT = "float";
        /**
         * 双精浮点.
         */
        final public static String VALIDATE_DOUBLE = "double";
        /**
         * IP地址V4.
         */
        final public static String VALIDATE_IPV4 = "ipV4";

        /**
         * 非零.
         */
        final public static String VALIDATE_UNZERO = "unZero";
        /**
         * IP地址V4的掩码.
         */
        final public static String VALIDATE_IPV4MASKBIT = "ipV4MaskBit";
        /**
         * 日期.
         */
        final public static String VALIDATE_DATE = "date";
        /**
         * 电子邮箱.
         */
        final public static String VALIDATE_EMAIL = "email";
        /**
         * MAC地址.
         */
        final public static String VALIDATE_MACADDRESS = "macAddress";
        /**
         * 域名
         */
        final public static String VALIDATE_DOMAINNAME = "domainName";
        
        /**
         * 上传IP
         */
        final public static String VALIDATE_UPLOADIPV4S = "uploadIpV4s";
        /**
         * 上传date
         */
        final public static String VALIDATE_UPLOADUPLOADDATE = "uploadDate";
        
    }

    /**
     * 
     * 工具栏.
     * 
     * 工具栏.
     * 
     * @title ToolBar
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2014-11-19
     * 
     */
    public static class ToolBar {

        /**
         * 权限点ID.
         */
        final public static String AUT_PERMISSION = "autPermission";

    }

    /**
     * 
     * HTML INPUT ELEMENT显示类型.
     * 
     * HTML INPUT ELEMENT显示类型.
     * 
     * @title FieldShowType
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2014-11-19
     * 
     */
    public static class FieldShowType {

        /*
        {
           "fieldName" : "取值范围说明",
           "fieldType" : "java.lang.Long",
           "elementId" : "XXXXXXXX",
           "showName" : "显示名称",
           "showType" : "date/text/hidden/referent/boolean",
           "size" : 20,
           "maxSize" : 15,
           "order" : "0000001",
           "referent" : {
               "type" : "dictionary/resource",
               "className" : "com.topsec.tss.core.web.resource.module.DimCity",
               "dictionaryType" : "ip.type"
           },
           "validation" : "required,ipv4,number,port,emain"
           }
        */
        /**
         * 日期.
         */
        final public static String SHOW_TYPE_DATE = "date";
        /**
         * 文本.
         */
        final public static String SHOW_TYPE_TEXT = "text";
        /**
         * 隐藏.
         */
        final public static String SHOW_TYPE_HIDDEN = "hidden";
        /**
         * 关联参考.
         */
        final public static String SHOW_TYPE_REFERENT = "referent";
        /**
         * 开关.
         */
        final public static String SHOW_TYPE_BOOLEAN = "boolean";
        /**
         * 文件.
         */
        final public static String SHOW_TYPE_FILE = "file";
        /**
         * 密码.
         */
        final public static String SHOW_TYPE_PASSWORD = "password";

        /**
         * 密码.
         */
        final public static String SHOW_TYPE_SECRET_MOBILE_NUMBER = "secretMobileNumber";
    }

    /**
     * 
     * 资源对象通用属性.
     * 
     * 资源对象通用属性.
     * 
     * @title SystemField
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2015-1-22
     * 
     */
    public static class SystemField {

        final public static String CREATE_AT = "createAt";
        final public static String LASTUPDATE_AT = "lastUpdateAt";
        final public static String CREATE_BY = "createBy";

    }

    /**
     * 
     * 属性显示构建参考.
     * 
     * 属性显示构建参考.
     * 
     * @title FeildDefineReferent
     * @package com.topsec.tss.platform.module
     * @author baiyanwei
     * @version
     * @date 2015-1-22
     * 
     */
    public static class FeildDefineReferent {

        //
        final public static int INPUT_TEXT_MIN_SIZE = 20;
        final public static int INPUT_TEXT_MAX_SIZE = 40;
        //文本域显示值大小.
        final public static int TEXTAREASHOWVALUE = 100;
        /**
         * 日期格式定义.
         */
        final public static String INPUT_DATE_FORMATTOR = "yyyy-MM-dd";
        final public static String INPUT_DATE_TIME_FORMATTOR = "yyyy-MM-dd HH:mm:ss";
        final public static String INPUT_DATE_TIME_WINDOW_FORMATTOR = "yyyy/MM/dd HH:mm:ss";

    }

}
