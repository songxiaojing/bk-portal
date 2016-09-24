package com.mpe.portal.web.services;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by baiyanwei on 9/24/16.
 */
public interface IAuthenticationService {


    public int hasAuthentication(HttpServletRequest request);
}
