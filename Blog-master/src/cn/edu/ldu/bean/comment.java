package cn.edu.ldu.bean;

public class comment {
    private int commentId;
    private int authorId;
    private int articleId;
    private String commentcontent;

    public comment(int commentId, int authorId, int articleId, String commentcontent) {
        this.commentId = commentId;
        this.authorId = authorId;
        this.articleId = articleId;
        this.commentcontent = commentcontent;
    }

    public comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent;
    }

    @Override
    public String toString() {
        return "comment{" +
                "commentId=" + commentId +
                ", authorId=" + authorId +
                ", articleId=" + articleId +
                ", commentcontent='" + commentcontent + '\'' +
                '}';
    }
}
