package com.mpe.portal.web.resources.modules;

import java.util.Date;

public class MetricWebVisitRecord {
    private Long id;

    private String visitTarget;

    private String visitReferent;

    private String remoteIp;

    private String userAgent;

    private Date visitAt;

    private Date createAt;

    private String httpHead;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVisitTarget() {
        return visitTarget;
    }

    public void setVisitTarget(String visitTarget) {
        this.visitTarget = visitTarget;
    }

    public String getVisitReferent() {
        return visitReferent;
    }

    public void setVisitReferent(String visitReferent) {
        this.visitReferent = visitReferent;
    }

    public String getRemoteIp() {
        return remoteIp;
    }

    public void setRemoteIp(String remoteIp) {
        this.remoteIp = remoteIp;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public Date getVisitAt() {
        return visitAt;
    }

    public void setVisitAt(Date visitAt) {
        this.visitAt = visitAt;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getHttpHead() {
        return httpHead;
    }

    public void setHttpHead(String httpHead) {
        this.httpHead = httpHead;
    }
}