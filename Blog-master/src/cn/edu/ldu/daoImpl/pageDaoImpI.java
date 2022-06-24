package cn.edu.ldu.daoImpl;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.dao.pageDao;
import cn.edu.ldu.util.DBConn;
import cn.edu.ldu.util.PageModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class pageDaoImpI{

    public int getTotalRecords() throws SQLException {
        Connection conn= DBConn.getConnection();
        int total=0;
        ResultSet rs=null;
        String addSql="select count(articleId) from article";
        PreparedStatement stmt = null;

        try {
            stmt=conn.prepareStatement(addSql);
            rs=stmt.executeQuery();
            while (rs.next()){
                total=rs.getInt("count(articleId)");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return total;
    }
    public List findAll(int startIndex, int pageSize) throws SQLException {
        Connection conn= DBConn.getConnection();
        String selSql="select * from article limit ?,?";
        PreparedStatement stmt = null;
        ResultSet rs=null;
        int addline = -1;
        List list=new ArrayList();

        try {
            stmt=conn.prepareStatement(selSql);
            stmt.setInt(1,startIndex);
            stmt.setInt(2,pageSize);
           rs=stmt.executeQuery();
           while(rs.next()){
               Article article=new Article();
              article.setArticleId(rs.getInt("articleId"));
              article.setAuthorId(rs.getInt("authorId"));
              article.setArticleTitle(rs.getString("articletitle"));
              article.setArticleDate(rs.getDate("articledate"));
              article.setSortId(rs.getInt("readAmount"));
              article.setSummary(rs.getString("summary"));
              article.setArticleContent(rs.getString("articlecontent"));
              article.setSortId(rs.getInt("sortId"));
              list.add(article);
           }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return list;
    }

}
