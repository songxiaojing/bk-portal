package com.mpe.portal.web.resources.modules;

import java.util.Date;

public class ResNews {
    private Long id;

    private String type;

    private String style;

    private String newTitle;

    private String newCatagory;

    private String newSource;

    private Date publishAt;

    private String publishBy;

    private Date createAt;

    private String newBody;

    private byte[] newPicture;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getNewTitle() {
        return newTitle;
    }

    public void setNewTitle(String newTitle) {
        this.newTitle = newTitle;
    }

    public String getNewCatagory() {
        return newCatagory;
    }

    public void setNewCatagory(String newCatagory) {
        this.newCatagory = newCatagory;
    }

    public String getNewSource() {
        return newSource;
    }

    public void setNewSource(String newSource) {
        this.newSource = newSource;
    }

    public Date getPublishAt() {
        return publishAt;
    }

    public void setPublishAt(Date publishAt) {
        this.publishAt = publishAt;
    }

    public String getPublishBy() {
        return publishBy;
    }

    public void setPublishBy(String publishBy) {
        this.publishBy = publishBy;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getNewBody() {
        return newBody;
    }

    public void setNewBody(String newBody) {
        this.newBody = newBody;
    }

    public byte[] getNewPicture() {
        return newPicture;
    }

    public void setNewPicture(byte[] newPicture) {
        this.newPicture = newPicture;
    }
}