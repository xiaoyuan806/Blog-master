package cn.edu.ldu.daoImpl;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.dao.AuthorDao;
import cn.edu.ldu.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorDaoImpI implements AuthorDao {
    @Override
    public int addAuthor(Author author) {
        Connection conn= DBConn.getConnection();
        String addSql="insert into author(authorName,authorresume,authorhobby,sortname,password) values(?,?,?,?,?)";
        PreparedStatement stmt = null;
        int addline = -1;
        try {
            stmt=conn.prepareStatement(addSql);
            stmt.setString(1, author.getAuthorName());
            stmt.setString(2,author.getAuthorResume());
            stmt.setString(3,author.getAuthorHobby());
            stmt.setString(4,author.getSortName());
            stmt.setString(5,author.getPassword());
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
    public Author findlogin(String authorName, String password) {
        Connection conn= DBConn.getConnection();
        String findSql="select authorName,authorId from author where authorName=? and password=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
       Author author=new Author();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setString(1, authorName);
            stmt.setString(2,password);
            rs=stmt.executeQuery();
            if(rs.next()) {
              author.setAuthorId(rs.getInt("authorId"));
              author.setAuthorName(rs.getString("authorName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }

        return author;
    }
    public Author findById(int a) {

        Connection conn= DBConn.getConnection();
        String findSql="select * from author where authorId=?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Author author=new Author();
        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setInt(1,a);
            rs=stmt.executeQuery();
            while (rs.next()) {
                int AuthorId = rs.getInt("authorId");
                String AuthorName = rs.getString("authorName");
                String AuthorResume = rs.getString("authorresume");
                String AuthorHobby = rs.getString("authorhobby");
                String sortName = rs.getString("sortname");
                String password=rs.getString("password");
                author.setAuthorId(AuthorId);
                author.setAuthorHobby(AuthorHobby);
                author.setAuthorResume(AuthorResume);
                author.setAuthorName(AuthorName);
                author.setSortName(sortName);
                author.setPassword(password);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return author;
    }
    public List<Author> getAll(){

        Connection conn= DBConn.getConnection();
        String findSql="select * from author";
        PreparedStatement stmt = null;
        ResultSet rs = null;
List<Author> list =new ArrayList<>();
        try {
            stmt=conn.prepareStatement(findSql);

            rs=stmt.executeQuery();
            while (rs.next()) {
                int AuthorId = rs.getInt("authorId");
                String AuthorName = rs.getString("authorName");
                String AuthorResume = rs.getString("authorresume");
                String AuthorHobby = rs.getString("authorhobby");
                String sortName = rs.getString("sortname");
                String password=rs.getString("password");
                Author author=new Author();
                author.setAuthorId(AuthorId);
                author.setAuthorHobby(AuthorHobby);
                author.setAuthorResume(AuthorResume);
                author.setAuthorName(AuthorName);
                author.setSortName(sortName);
                author.setPassword(password);
list.add(author);
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
    public void update(Author author){
        Connection conn= DBConn.getConnection();
        String findSql="update author set authorName=?,authorresume=?,authorhobby=?,sortname=?,password=?  where authorId=?";
        PreparedStatement stmt = null;


        try {
            stmt=conn.prepareStatement(findSql);
            stmt.setString(1,author.getAuthorName());
            stmt.setString(2,author.getAuthorResume());
            stmt.setString(3,author.getAuthorHobby());
            stmt.setString(4,author.getSortName());
            stmt.setString(5,author.getPassword());
            stmt.setInt(6,author.getAuthorId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }

    }
    public void delete(int authorId){
        Connection conn= DBConn.getConnection();
        String findSql="Delete from author where authorId=?";
        PreparedStatement stmt = null;


        try {
            stmt=conn.prepareStatement(findSql);
           stmt.setInt(1,authorId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {

            DBConn.close(stmt);
            DBConn.close(conn);
        }
    }

    public void changeIfo(int id,Author author) throws SQLException {
        Connection conn = DBConn.getConnection();
        String sql = "update author set authorName=?,authorresume=?,authorhobby=? where" +
                " authorId=?" ;
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1,author.getAuthorName());
        preparedStatement.setString(2,author.getAuthorResume());
        preparedStatement.setString(3,author.getAuthorHobby());
        preparedStatement.setInt(4,id);

        preparedStatement.executeUpdate();
        preparedStatement.close();
        conn.close();

    }


    public List<Author> showFriends(int id) {
        Connection conn = DBConn.getConnection();

        String sql = "SELECT author.authorName,author.authorId,author.authorhobby,author.authorresume\n" +
                "FROM author,friends\n" +
                "WHERE friends.authorId=? AND friends.FriendsId=author.authorId";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Author> arr = new ArrayList<>();

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int AuthorId = rs.getInt("authorId");
                String AuthorName = rs.getString("authorName");
                String AuthorResume = rs.getString("authorresume");
                String AuthorHobby = rs.getString("authorhobby");
                Author author = new Author();
                author.setAuthorId(AuthorId);
                author.setAuthorHobby(AuthorHobby);
                author.setAuthorResume(AuthorResume);
                author.setAuthorName(AuthorName);
                arr.add(author);
            }
        } catch (SQLException e) {
            System.out.println("error:" + e.getMessage());
        } finally {
            DBConn.close(rs);
            DBConn.close(stmt);
            DBConn.close(conn);
        }
        return arr;
    }
}
