package cn.edu.ldu.bean;



public class Author {
    private int authorId;
    private String authorName;
    private String authorResume;
    private String authorHobby;
    private String sortName;
    private String headPortrait;
    private String password;

    public Author(int authorId, String authorName, String authorResume, String authorHobby, String sortName, String headPortrait, String password) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.authorResume = authorResume;
        this.authorHobby = authorHobby;
        this.sortName = sortName;
        this.headPortrait = headPortrait;
        this.password = password;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId=" + authorId +
                ", authorName='" + authorName + '\'' +
                ", authorResume='" + authorResume + '\'' +
                ", authorHobby='" + authorHobby + '\'' +
                ", sortName='" + sortName + '\'' +
                ", headPortrait='" + headPortrait + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Author(){}

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorResume() {
        return authorResume;
    }

    public void setAuthorResume(String authorResume) {
        this.authorResume = authorResume;
    }

    public String getAuthorHobby() {
        return authorHobby;
    }

    public void setAuthorHobby(String authorHobby) {
        this.authorHobby = authorHobby;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}