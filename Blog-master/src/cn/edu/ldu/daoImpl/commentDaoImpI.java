package cn.edu.ldu.daoImpl;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.comment;
import cn.edu.ldu.dao.commentDao;
import cn.edu.ldu.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class commentDaoImpI implements commentDao {
    @Override
    public List<comment> findbyId(int id) {
        Connection conn= DBConn.getConnection();
        String findSql="select * from comment where articleId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List list=new ArrayList();

        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,id);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int articleId=rs.getInt("articleId");
                int commentId = rs.getInt("commentId");
                int AuthorId = rs.getInt("authorId");
            String commentcontent=rs.getString("commentcontent");
                comment comment=new comment();
comment.setArticleId(articleId);
comment.setAuthorId(AuthorId);
comment.setCommentcontent(commentcontent);
comment.setCommentId(commentId);
list.add(comment);

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
    public void add(comment comment){
        Connection conn= DBConn.getConnection();
        String addSql="insert into comment(authorId,articleId,commentcontent) values(?,?,?)";
        PreparedStatement stmt = null;

        int addline = -1;
        try {
            stmt=conn.prepareStatement(addSql);
            stmt.setInt(1, comment.getAuthorId());
            stmt.setInt(2,comment.getArticleId());

            stmt.setString(3,comment.getCommentcontent());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }


    }

}
