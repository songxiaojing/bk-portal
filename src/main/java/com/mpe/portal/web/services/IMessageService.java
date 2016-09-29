package com.mpe.portal.web.services;


import com.mpe.portal.web.resources.modules.ResMessage;

public interface IMessageService {
    public int createNewMessage(ResMessage resMessage);

    public int feedbackMessage(ResMessage resMessage);
}
