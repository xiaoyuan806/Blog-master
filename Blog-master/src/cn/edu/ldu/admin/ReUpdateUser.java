package cn.edu.ldu.admin;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ReUpdateUser")
public class ReUpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String hobby=request.getParameter("hobby");
        String sortname=request.getParameter("sortname");
        String resume=request.getParameter("resume");
        int authorId=Integer.parseInt(request.getParameter("authorId"));
        Author author=new Author();
        author.setPassword(password);
        author.setAuthorResume(resume);
        author.setSortName(sortname);
        author.setAuthorHobby(hobby);
        author.setAuthorId(authorId);
        author.setAuthorName(username);
        AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
        authorDaoImpI.update(author);
        request.getRequestDispatcher("/GAU").forward(request,response);

    }
}
