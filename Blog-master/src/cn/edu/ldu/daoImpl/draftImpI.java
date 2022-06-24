package cn.edu.ldu.daoImpl;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Draft;
import cn.edu.ldu.dao.draftDao;
import cn.edu.ldu.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class draftImpI implements draftDao {

    @Override
    public int add(Draft draft) {
        Connection conn= DBConn.getConnection();
        String addSql="insert into drafts(authorId,articletitle,articledate,readAmount,articlecontent,summary,sortId) values(?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        java.sql.Date date = new java.sql.Date(draft.getArticleDate().getTime());
        int addline = -1;
        try {
            stmt=conn.prepareStatement(addSql);
            stmt.setInt(1, draft.getAuthorId());
            stmt.setString(2,draft.getArticleTitle());
            stmt.setDate(3, date);
            stmt.setInt(4,draft.getReadAmount());
            stmt.setString(5,draft.getArticleContent());
            stmt.setString(6,draft.getSummary());
            stmt.setInt(7,draft.getSortId());
            addline=stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return addline;

    }

    @Override
    public List<Draft> findall() {
        Connection conn= DBConn.getConnection();
        String findSql="select * from drafts ";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Draft> list=new ArrayList<>();
        try {
            stmt=conn.prepareStatement(findSql);

            rs=stmt.executeQuery();
            while (rs.next()) {
                int draftId = rs.getInt("draftsId");
                int AuthorId = rs.getInt("authorId");
                String articletitle = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int  read = rs.getInt("readAmount");
                String content=rs.getString("articlecontent");
                String summary=rs.getString("summary");
                int sortId=rs.getInt("sortId");
                Draft draft=new Draft();
                draft.setSortId(sortId);
                draft.setArticleContent(content);
                draft.setSummary(summary);
                draft.setArticleDate(date);
                draft.setReadAmount(read);
                draft.setArticleTitle(articletitle);
                draft.setAuthorId(AuthorId);
                draft.setDraftId(draftId);
                list.add(draft);
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
    public Draft findById(int draftId) {
        Connection conn= DBConn.getConnection();
        String findSql="select * from drafts where draftsId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Draft draft=new Draft();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,draftId);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int AdraftsId= rs.getInt("draftsId");
                int AuthorId = rs.getInt("authorId");
                String articletitle = rs.getString("articletitle");
                Date date = rs.getDate("articledate");
                int  read = rs.getInt("readAmount");
                String content=rs.getString("articlecontent");
                String summary=rs.getString("summary");
                int sortId=rs.getInt("sortId");

                draft.setSortId(sortId);
                draft.setArticleContent(content);
                draft.setSummary(summary);
                draft.setArticleDate(date);
                draft.setReadAmount(read);
                draft.setArticleTitle(articletitle);
                draft.setAuthorId(AuthorId);
                draft.setDraftId(draftId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }


        return draft;
    }
}
