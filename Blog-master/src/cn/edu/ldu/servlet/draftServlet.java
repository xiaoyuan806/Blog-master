package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Author;
import cn.edu.ldu.bean.Draft;
import cn.edu.ldu.daoImpl.ArticleDaoImpI;
import cn.edu.ldu.daoImpl.draftImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/draft")
public class draftServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        request.setCharacterEncoding("utf-8");
        Draft art=new Draft();
        String article,content,summary,label;
        String date;
        int read=0;
        int authorId;

        try {
            HttpSession session=request.getSession();
            Author author= (Author) session.getAttribute("author");
            authorId=author.getAuthorId();
            article=request.getParameter("article");
            content=request.getParameter("content");
            summary=request.getParameter("summary");
            label=request.getParameter("label");
            int sortId=Integer.parseInt(label);
            date=request.getParameter("data");
            Date date1 =  formatter.parse(date);
            art.setAuthorId(authorId);
            art.setArticleTitle(article);
            art.setArticleContent(content);
            art.setSummary(summary);
            art.setArticleDate(date1);
            art.setReadAmount(read);
            art.setSortId(sortId);
           draftImpI draft=new draftImpI();
            draft.add(art);
            request.getRequestDispatcher("/FindAllServlet?num=1").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
