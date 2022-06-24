package cn.edu.ldu.daoImpl;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Author;
import cn.edu.ldu.dao.ArticleDao;
import cn.edu.ldu.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ArticleDaoImpI implements ArticleDao {

    @Override
    public Article findbyId(int id) {
        Connection conn= DBConn.getConnection();
        String findSql="select * from article where articleId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
      Article article=new Article();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,id);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int ArtticleId = rs.getInt("articleId");
                int AuthorId = rs.getInt("authorId");
                String articletitle = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int  read = rs.getInt("readAmount");
                String content=rs.getString("articlecontent");
                String summary=rs.getString("summary");
                int sortId=rs.getInt("sortId");

              article.setSortId(sortId);
              article.setArticleContent(content);
              article.setSummary(summary);
              article.setArticleDate(date);
              article.setReadAmount(read);
article.setArticleTitle(articletitle);
article.setAuthorId(AuthorId);
article.setArticleId(ArtticleId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }

        return article;
    }
    public void addread(int id){
        Connection conn= DBConn.getConnection();
        String findSql="update article set readAmount=readAmount+1 where articleId=?";
        PreparedStatement stmt = null;


        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,id);
           stmt.executeUpdate();
    } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
    }
        @Override
    public int add(Article article){
        Connection conn= DBConn.getConnection();
        String addSql="insert into article(authorId,articletitle,articledate,readAmount,articlecontent,summary,sortId) values(?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        java.sql.Date date = new java.sql.Date(article.getArticleDate().getTime());
        int addline = -1;
        try {
            stmt=conn.prepareStatement(addSql);
            stmt.setInt(1, article.getAuthorId());
            stmt.setString(2,article.getArticleTitle());
            stmt.setDate(3, date);
            stmt.setInt(4,article.getReadAmount());
            stmt.setString(5,article.getArticleContent());
            stmt.setString(6,article.getSummary());
            stmt.setInt(7,article.getSortId());
            addline=stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return addline;
    }
    public List<Article> sort(int sortId){
        Connection conn= DBConn.getConnection();
        String findSql="select * from article where sortId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
       List list=new ArrayList();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,sortId);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int ArtticleId = rs.getInt("articleId");
                int AuthorId = rs.getInt("authorId");
                String articletitle = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int  read = rs.getInt("readAmount");
                String content=rs.getString("articlecontent");
                String summary=rs.getString("summary");
                int sort=rs.getInt("sortId");
                Article article=new Article();
                article.setSortId(sort);
                article.setArticleContent(content);
                article.setSummary(summary);
                article.setArticleDate(date);
                article.setReadAmount(read);
                article.setArticleTitle(articletitle);
                article.setAuthorId(AuthorId);
                article.setArticleId(ArtticleId);
                list.add(article);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }


        return list;
    }

    @Override
    public List<Article> fuzzySearch(String keyword) {
        Connection conn= DBConn.getConnection();
        String findSql="select * from article where articletitle like ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String key="%"+keyword+"%";
        System.out.println(11111);
        System.out.println(key);
      List<Article> list=new ArrayList<Article>();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setString(1,key);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int ArtticleId = rs.getInt("articleId");
                int AuthorId = rs.getInt("authorId");
                String articletitle = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int  read = rs.getInt("readAmount");
                String content=rs.getString("articlecontent");
                String summary=rs.getString("summary");
                int sortId=rs.getInt("sortId");
                Article article=new Article();
                article.setSortId(sortId);
                article.setArticleContent(content);
                article.setSummary(summary);
                article.setArticleDate(date);
                article.setReadAmount(read);
                article.setArticleTitle(articletitle);
                article.setAuthorId(AuthorId);
                article.setArticleId(ArtticleId);
                list.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }


        return list;
    }
    public List<Article> showArticles(int id) {
        Connection connection = DBConn.getConnection();
        String sql = "SELECT article.articleId,article.authorId,article.articletitle,article.articledate,article.readAmount,article.articlecontent,article.summary,article.sortId\n" +
                "FROM article,history\n" +
                "WHERE history.authorId=? AND history.arctileId=article.articleId";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Article> list = new ArrayList<>();
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int articleid = rs.getInt("articleId");
                int authorid = rs.getInt("authorId");
                String title = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int readamount = Integer.parseInt(rs.getString("readAmount"));
                String content = rs.getString("articlecontent");
                String summary = rs.getString("summary");
                int sortid = rs.getInt("sortId");

                Article article = new Article();
                article.setArticleId(articleid);
                article.setArticleContent(content);
                article.setArticleDate(date);
                article.setArticleTitle(title);
                article.setReadAmount(readamount);
                article.setSummary(summary);
                article.setSortId(sortid);
                article.setAuthorId(authorid);
                list.add(article);
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(connection);
        }
        return list;
    }


    public void deleteMyPassage(int author_id, int article_id) throws SQLException {
        Connection connection = DBConn.getConnection();
        String sql = "delete from article where article.authorId=? and article" +
                ".articleId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
//        List<Article> list = new ArrayList<>();
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, author_id);
            stmt.setInt(2, article_id);
            stmt.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(connection);
        }

    }

    //展示当前用户id的创作文章列表

    public List<Article> showMyOwnArticles(int id) {
        Connection connection = DBConn.getConnection();
        String sql = "SELECT article.articleId,article.authorId,article.articletitle,article.articledate,article.readAmount,article.articlecontent,article.summary,article.sortId\n" +
                "FROM article\n" +
                "WHERE authorId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Article> list = new ArrayList<>();
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int articleid = rs.getInt("articleId");
                int authorid = rs.getInt("authorId");
                String title = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int readamount = Integer.parseInt(rs.getString("readAmount"));
                String content = rs.getString("articlecontent");
                String summary = rs.getString("summary");
                int sortid = rs.getInt("sortId");

                Article article = new Article();
                article.setArticleId(articleid);
                article.setArticleContent(content);
                article.setArticleDate(date);
                article.setArticleTitle(title);
                article.setReadAmount(readamount);
                article.setSummary(summary);
                article.setSortId(sortid);
                article.setAuthorId(authorid);
                list.add(article);
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(connection);
        }
        return list;
    }
    public void addHistory(int authorId,int article){

        Connection conn= DBConn.getConnection();
        String addSql="insert into history(authorId,arctileId) values(?,?)";
        PreparedStatement stmt = null;


        try {
            stmt=conn.prepareStatement(addSql);
            stmt.setInt(1, authorId);

            stmt.setInt(2,article);

        stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }

    }
}
