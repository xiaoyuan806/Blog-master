package cn.edu.ldu.servlet;

import cn.edu.ldu.daoImpl.ArticleDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class searchServlet extends HttpServlet {

        public void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            doPost(request, response);
        }

        public void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
       String search=  request.getParameter("search");
            ArticleDaoImpI ai=new ArticleDaoImpI();
            List list=new ArrayList();
        list=ai.fuzzySearch(search);
            System.out.println(list);
        request.setAttribute("key",search);
            request.setAttribute("result",list);
            request.getRequestDispatcher("/jsp/result.jsp").forward(request,response);

        }

}