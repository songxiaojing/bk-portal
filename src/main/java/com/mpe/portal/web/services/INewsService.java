package com.mpe.portal.web.services;


import com.mpe.portal.web.resources.modules.ResNews;

import java.util.HashMap;
import java.util.List;

public interface INewsService {
    public int publishNews(ResNews resNews);

    public int deleteByIds(String ids);

    public ResNews getResNewsById(long l);

    public long countByCondition(HashMap<String, String> paramsMap);

    public List<HashMap<String, String>> selectByCondition(HashMap<String, String> paramsMap);

}
