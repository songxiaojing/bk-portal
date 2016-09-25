package com.mpe.portal.web.services.impl;

import com.mpe.portal.web.services.IAuthenticationService;
import com.mpe.portal.web.utils.IOUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by baiyanwei on 9/25/16.
 */
@Service("AuthenticationServiceImpl")
public class AuthenticationServiceImpl implements IAuthenticationService{

    final private static String USER_FILE_PATH="users.properties";

    @Override
    public int hasAuthentication(HttpServletRequest request) {
        try {
            Properties userProperties=IOUtils.createProperties("users.properties");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
