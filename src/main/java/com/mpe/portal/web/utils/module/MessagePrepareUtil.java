package com.mpe.portal.web.utils.module;


import com.mpe.portal.web.utils.Assert;
import com.mpe.portal.web.utils.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.text.MessageFormat;
import java.util.HashMap;

public class MessagePrepareUtil {

    //
    // Logging Object
    //
    final private static Logger theLogger = LoggerFactory.getLogger(MessagePrepareUtil.class);

    //
    // PRIVATE FINAL STATIC INSANCE VARIABLE
    //
    final private static String CLASS_NAME_TO_PATH_RULE_STR = "\\.";
    final private static String CLASS_NAME_TO_PATH_TARGET_STR = "/";
    private static final String SUFFIX = ".json";
    private static final String MESSAGE_PATH = "messages";

    private static HashMap<String, MessageFormat> _propertyFormatters = new HashMap<String, MessageFormat>();
    

    /**
     * according to the class and key ,format the messages, the configuration will be defined into property file which name is suffix with Res.properties
     *
     * @param messageName
     * @param arguments
     * @return
     */
    public String formatMessage(String messageName, Object... arguments) {

        if (Assert.isEmptyString(messageName) == true) {
            return null;
        }

        MessageFormat messageFormatter = _propertyFormatters.get(messageName);

        // If the formatter doesn't exist then we want to create
        // a new one. First see if we loaded the bundle
        // and then create the formatter.
        if (messageFormatter == null) {
            // Load the resource Bundle.
            StringBuffer contentBuffer = null;
            try {
                contentBuffer = IOUtils.getInputStream2StringBuffer(getMessageFileStream(messageName));
            } catch (Exception e) {
                theLogger.error("formatMessage", e);
            }
            if (contentBuffer == null) {
                return null;
            }
            // Create the message formatter and format the message.
            messageFormatter = new MessageFormat(contentBuffer.toString());
            _propertyFormatters.put(messageName, messageFormatter);
        }

        return messageFormatter.format(arguments);
    }

    /**
     * This method will use the supplied class to load the resource bundle and add it to the HashMap.
     *
     * @param messageName
     * @return InputStream
     */
    private InputStream getMessageFileStream(String messageName) {

        return this.getClass().getClassLoader()
                .getResourceAsStream(this.getClass().getPackage().getName().replaceAll(CLASS_NAME_TO_PATH_RULE_STR, CLASS_NAME_TO_PATH_TARGET_STR) + CLASS_NAME_TO_PATH_TARGET_STR + MESSAGE_PATH + CLASS_NAME_TO_PATH_TARGET_STR + messageName + SUFFIX);
    }

}
