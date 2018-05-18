package com.atguigu.crud.bean;

import java.util.Date;

public class KnowLedge {
    private Integer id;

    private String title;

    private String content;

    private Date issuedate;

    private String reside;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getIssuedate() {
        return issuedate;
    }

    public void setIssuedate(Date issuedate) {
        this.issuedate = issuedate;
    }

    public String getReside() {
        return reside;
    }

    public void setReside(String reside) {
        this.reside = reside == null ? null : reside.trim();
    }
}