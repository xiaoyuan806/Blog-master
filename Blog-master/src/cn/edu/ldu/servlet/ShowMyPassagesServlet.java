package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.ArticleDaoImpI;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ShowMyPassages")
public class ShowMyPassagesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        ArticleDaoImpI articleDao = new ArticleDaoImpI();
        HttpSession session=request.getSession();
        Author author1=new Author();
        author1= (Author) session.getAttribute("author");
        int idd=author1.getAuthorId();
        List<Article> list = articleDao.showMyOwnArticles(idd);

        request.setAttribute("myOwnPassage", list);

        System.out.println(list);
        request.getRequestDispatcher("/jsp" +
                "/personal_passageManage.jsp").forward(request, response);
    }
}
