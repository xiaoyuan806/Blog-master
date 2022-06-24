package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.bean.comment;
import cn.edu.ldu.daoImpl.commentDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addcomm")
public class AddComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int articleId=Integer.parseInt(request.getParameter("articleId"));
        String comment=request.getParameter("comment");
        HttpSession session=request.getSession();
      Author author=new Author();
      author= (Author) session.getAttribute("author");
      int authorId=author.getAuthorId();
      cn.edu.ldu.bean.comment com=new comment();
      com.setCommentcontent(comment);
      com.setArticleId(articleId);
      com.setAuthorId(authorId);
      commentDaoImpI co=new commentDaoImpI();
      co.add(com);
      request.getRequestDispatcher("/GetArticle?articleId="+articleId).forward(request,response);

    }
}
