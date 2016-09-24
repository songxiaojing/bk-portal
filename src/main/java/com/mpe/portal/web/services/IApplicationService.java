package com.mpe.portal.web.services;

import java.util.HashMap;


public interface IApplicationService {
    /**
     * 验证登录
     *
     * @param parameterMap HashMap<String,String>
     * @return SysUser
     * @throws Exception
     */
    public boolean verifyLogin(HashMap<String, String> parameterMap) throws Exception;



}
