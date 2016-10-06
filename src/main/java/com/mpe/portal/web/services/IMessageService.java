package com.mpe.portal.web.services;


import com.mpe.portal.web.resources.modules.ResMessage;

import java.util.HashMap;
import java.util.List;

public interface IMessageService {
    public int createNewMessage(ResMessage resMessage);

    public int feedbackMessage(ResMessage resMessage);

    int countByCondition(HashMap<String, String> paramsMap);

    List<HashMap<String,String>> selectByCondition(HashMap<String, String> paramsMap);
}
