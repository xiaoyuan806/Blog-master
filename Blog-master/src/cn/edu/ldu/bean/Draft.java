package cn.edu.ldu.bean;

import java.util.Date;

public class Draft {
    private int draftId;
    private int authorId;
    private String articleTitle;
    private Date articleDate;
    private int readAmount;
    private String articleContent;
    private String summary;
    private int sortId;

    public Draft(int draftId, int authorId, String articleTitle, Date articleDate, int readAmount, String articleContent, String summary, int sortId) {
        this.draftId = draftId;
        this.authorId = authorId;
        this.articleTitle = articleTitle;
        this.articleDate = articleDate;
        this.readAmount = readAmount;
        this.articleContent = articleContent;
        this.summary = summary;
        this.sortId = sortId;
    }

    public Draft() {
    }

    @Override
    public String toString() {
        return "Draft{" +
                "draftId=" + draftId +
                ", authorId=" + authorId +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleDate=" + articleDate +
                ", readAmount=" + readAmount +
                ", articleContent='" + articleContent + '\'' +
                ", summary='" + summary + '\'' +
                ", sortId=" + sortId +
                '}';
    }

    public int getDraftId() {
        return draftId;
    }

    public void setDraftId(int draftId) {
        this.draftId = draftId;
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
}
