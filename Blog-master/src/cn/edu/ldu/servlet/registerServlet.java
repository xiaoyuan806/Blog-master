package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/register")
public class registerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Author author=new Author();
        try {
             String username=request.getParameter("username");
             String password=request.getParameter("password");
             String hobby=request.getParameter("hobby");
             String sortname=request.getParameter("sortname");
             String resume=request.getParameter("resume");
             author.setAuthorName(username);
             author.setPassword(password);
             author.setAuthorHobby(hobby);
             author.setSortName(sortname);
             author.setAuthorResume(resume);
            System.out.println(author.toString());
             AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
             int result= authorDaoImpI.addAuthor(author);
             if (result!=-1){
                 response.sendRedirect(request.getContextPath()+"/jsp/login.jsp");
             }
             else{
                 request.setAttribute("message","密码或账号错误");
                 request.getRequestDispatcher("/jsp/register.jsp").forward(request,response);
             }
            }
         catch (Exception e) {
            e.printStackTrace();
        }
    }
}
