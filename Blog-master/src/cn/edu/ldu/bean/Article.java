package cn.edu.ldu.bean;

import java.util.Date;

public class Article {
    private int articleId;
    private int authorId;
    private String articleTitle;
    private Date articleDate;
    private int readAmount;
    private String articleContent;
    private String summary;
    private int sortId;

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public Date getArticleDate() {
        return articleDate;
    }

    public void setArticleDate(Date articleDate) {
        this.articleDate = articleDate;
    }

    public int getReadAmount() {
        return readAmount;
    }

    public void setReadAmount(int readAmount) {
        this.readAmount = readAmount;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getSortId() {
        return sortId;
    }

    public void setSortId(int sortId) {
        this.sortId = sortId;
    }

    public Article(int articleId, int authorId, String articleTitle, Date articleDate, int readAmount, String articleContent, String summary, int sortId) {
        this.articleId = articleId;
        this.authorId = authorId;
        this.articleTitle = articleTitle;
        this.articleDate = articleDate;
        this.readAmount = readAmount;
        this.articleContent = articleContent;
        this.summary = summary;
        this.sortId = sortId;
    }

    public Article() {
    }
}