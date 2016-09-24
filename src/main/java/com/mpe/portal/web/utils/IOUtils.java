package com.mpe.portal.web.utils;

import java.io.*;
import java.util.Properties;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * This is the platform general utility class.
 * <p>
 * This is the platform general utility class.
 *
 * @author baiyanwei
 * @title Utils
 * @package com.topsec.tss.platform.core.utils
 * @date 2014-8-8
 */
public class IOUtils {

    //
    // Logging Object
    //
    final private static Logger theLogger = LoggerFactory.getLogger(IOUtils.class);
    final private static int BUFFER_SIZE = 1024;
    final private static int EOF = -1;

    /**
     * This will turn an input stream into a String Buffer. The InputStream will always be closed before return.
     *
     * @param inputStream
     * @return
     */
    public static StringBuffer getInputStream2StringBuffer(InputStream inputStream) throws Exception{

        if (inputStream == null) {
            return null;
        }

        InputStreamReader utf8 = null;
        //
        try {
            utf8 = new InputStreamReader(inputStream, Constants.UTF_8);
            //
            StringBuffer stringBuffer = new StringBuffer();
            //
            char[] buffer = new char[BUFFER_SIZE];
            int n = 0;
            //
            while ((n = utf8.read(buffer)) != EOF) {
                stringBuffer.append(buffer, 0, n);
            }
            //
            return stringBuffer;
        } catch (Exception e) {
            throw e;
        } finally {
            if (utf8 != null) {
                try {
                    utf8.close();
                } catch (IOException e) {
                }
            }
        }
    }

    /**
     * 将字节写入到File中.
     *
     * @param bytes byte[]
     * @param file File
     */
    public static void writeByteContentToFile(byte[] bytes, File file) {

        if (file == null || !(file.exists())) {
            return;
        }
        if (bytes == null || bytes.length <= 0) {
            return;
        }
        ByteArrayInputStream byteInputStream = null;

        OutputStream sOutput = null;
        try {
            byteInputStream = new ByteArrayInputStream(bytes);
            sOutput = new FileOutputStream(file);

            byte[] buffer = new byte[BUFFER_SIZE];
            int size;
            while ((size = byteInputStream.read(buffer, 0, buffer.length)) != EOF) {
                sOutput.write(buffer, 0, size);
            }
            sOutput.flush();
        } catch (Exception e) {
            theLogger.error("",e);
        } finally {
            if (byteInputStream != null) {
                try {
                    byteInputStream.close();
                } catch (IOException e) {
                }
            }
            if (sOutput != null) {
                try {
                    sOutput.close();
                } catch (IOException e) {
                }
            }
        }

    }

    /**
     * This will turn an input stream into a byte[]. The InputStream will always be closed before return.
     *
     * @param inputStream InputStream
     * @return byte[]
     */
    public static byte[] readInputStream2ByteArray(InputStream inputStream) throws Exception {

        if (inputStream == null) {
            return null;
        }
        //
        ByteArrayOutputStream byteArrayOutput = null;

        try {
            byteArrayOutput = new ByteArrayOutputStream();
            //
            byte[] buffer = new byte[BUFFER_SIZE];
            int n = 0;
            //
            while ((n = inputStream.read(buffer)) != EOF) {
                byteArrayOutput.write(buffer, 0, n);
            }
            //
            return byteArrayOutput.toByteArray();
        } catch (IOException e) {
            theLogger.error("",e);
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
            }
            if (byteArrayOutput != null) {
                try {
                    byteArrayOutput.close();
                } catch (IOException e) {
                }
            }
        }
        return null;
    }

    /**
     * Use the standard java GZip functionality.
     * <p>
     * returns a byte array of the compress module.
     *
     * @param inputBytes byte[]
     * @return byte[]
     * @throws Exception
     */
    public static byte[] compress(byte[] inputBytes) throws Exception {

        if (inputBytes == null || inputBytes.length == 0) {
            return null;
        }

        ByteArrayOutputStream bytesOutputStream = null;
        GZIPOutputStream gZIPOutputStream = null;
        //
        try {
            bytesOutputStream = new ByteArrayOutputStream();
            gZIPOutputStream = new GZIPOutputStream(bytesOutputStream);
            //compress the module
            gZIPOutputStream.write(inputBytes, 0, inputBytes.length);
            //
            gZIPOutputStream.finish();
            //
            return bytesOutputStream.toByteArray();
        } catch (IOException e) {
            throw e;
        } finally {
            if (bytesOutputStream != null) {
                try {
                    bytesOutputStream.close();
                } catch (IOException e) {
                }
            }
            if (gZIPOutputStream != null) {
                try {
                    gZIPOutputStream.close();
                } catch (IOException e) {
                }
            }
        }
    }

    /**
     * Uncompress a byte array of module
     *
     * @param inputBytes byte[]
     * @return byte[]
     */
    public static byte[] decompress(byte[] inputBytes) throws Exception {

        if (inputBytes == null || inputBytes.length == 0) {
            return null;
        }
        GZIPInputStream gzipInputStream = null;
        ByteArrayOutputStream bytesOutputStream = null;
        try {
            gzipInputStream = new GZIPInputStream(new ByteArrayInputStream(inputBytes));
            bytesOutputStream = new ByteArrayOutputStream();

            byte[] buffer = new byte[BUFFER_SIZE];
            int n = 0;

            while ((n = gzipInputStream.read(buffer)) != EOF) {
                bytesOutputStream.write(buffer, 0, n);
            }
            //
            return bytesOutputStream.toByteArray();
        } catch (IOException e) {
            throw e;
        } finally {
            if (gzipInputStream != null) {
                try {
                    gzipInputStream.close();
                } catch (IOException e) {
                }
            }
            if (bytesOutputStream != null) {
                try {
                    bytesOutputStream.close();
                } catch (IOException e) {
                }
            }
        }
    }


    /**
     * load the properties collection by path.
     *
     * @param path
     * @return
     * @throws IOException
     */
    public static Properties createProperties(String path) throws IOException {

        if (Assert.isEmptyString(path)) {
            return null;
        }

        InputStream fileInput = null;
        try {
            // parser the class name to path.
            fileInput = IOUtils.class.getClassLoader().getResourceAsStream(path);
            if (fileInput == null) {
                // Doesn't define the RES.properties file
                fileInput = new FileInputStream(path);
            }

            Properties properties = new Properties();
            // loading into cache.
            properties.load(fileInput);
            return properties;
        } catch (IOException e) {
            throw e;
        } finally {
            if (fileInput != null) {
                try {
                    fileInput.close();
                } catch (IOException e) {
                }
            }
        }
    }

    /**
     * save Object to file
     *
     * @param file    File
     * @param saveObj Object
     * @throws Exception
     */
    public static void saveObject2File(File file, Object saveObj) throws Exception {
        if (file == null) {
            throw new Exception("invalid file");
        }
        if (saveObj == null) {
            throw new Exception("invalid save object");
        }
        //
        ObjectOutputStream out = null;
        try {
            out = new ObjectOutputStream(new FileOutputStream(file));
            out.writeObject(saveObj);
        } catch (Exception e) {
            throw e;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                }
            }
        }
    }

    /**
     * read Object from file.
     *
     * @param file File
     * @return Object
     */
    public static Object readObject4File(File file) throws Exception {
        if (file == null) {
            throw new Exception("invalid file");
        }
        ObjectInputStream oInput = null;
        Object readObj = null;
        try {
            oInput = new ObjectInputStream(new FileInputStream(file));
            readObj = oInput.readObject();
        } catch (Exception e) {
            throw e;
        } finally {
            if (oInput != null) {
                try {
                    oInput.close();
                } catch (IOException e) {
                }
            }
        }
        return readObj;
    }
}
