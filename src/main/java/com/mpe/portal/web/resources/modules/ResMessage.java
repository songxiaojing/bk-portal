package com.mpe.portal.web.resources.modules;

import java.util.Date;

public class ResMessage {
    private Long id;

    private String name;

    private String mobile;

    private String email;

    private Date messageAt;

    private String feedback;

    private Date feedbackAt;

    private String feedbackBy;

    private Date createAt;

    private String message;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getMessageAt() {
        return messageAt;
    }

    public void setMessageAt(Date messageAt) {
        this.messageAt = messageAt;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Date getFeedbackAt() {
        return feedbackAt;
    }

    public void setFeedbackAt(Date feedbackAt) {
        this.feedbackAt = feedbackAt;
    }

    public String getFeedbackBy() {
        return feedbackBy;
    }

    public void setFeedbackBy(String feedbackBy) {
        this.feedbackBy = feedbackBy;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}