package com.mpe.portal.web.services;


import com.mpe.portal.web.resources.modules.ResNews;

public interface INewsService {
    public int publishNews(ResNews resNews);
    public int removeResNews(long resNewsId);
}
