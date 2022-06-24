package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Author;
import cn.edu.ldu.bean.comment;
import cn.edu.ldu.daoImpl.ArticleDaoImpI;
import cn.edu.ldu.daoImpl.commentDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GetArticle")
public class GetArticleServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
      int nowarticle= Integer.parseInt(request.getParameter("articleId"));
      int prearticle=nowarticle-1;
      int nextarticle=nowarticle+1;
        Article article=new Article();
        Article pre=new Article();
        Article next=new Article();
        Author author1=new Author();
        HttpSession session=request.getSession();
        author1= (Author) session.getAttribute("author");
        int idd=author1.getAuthorId();
        commentDaoImpI commentDaoImpI=new commentDaoImpI();
      List list=new ArrayList();
      list=  commentDaoImpI.findbyId(nowarticle);
        System.out.println(11111);
        System.out.println(list);
        ArticleDaoImpI articleDaoImpI=new ArticleDaoImpI();
        articleDaoImpI.addread(nowarticle);
        articleDaoImpI.addHistory(idd,nowarticle);
       article= articleDaoImpI.findbyId(nowarticle);
       pre=articleDaoImpI.findbyId(prearticle);
       next=articleDaoImpI.findbyId(nextarticle);
        request.setAttribute("article", article);
        request.setAttribute("comment",list);
        request.setAttribute("pre_article", pre);
        request.setAttribute("next_article", next);
        request.getRequestDispatcher("/jsp/show_title.jsp").forward(request,response);

    }


}
