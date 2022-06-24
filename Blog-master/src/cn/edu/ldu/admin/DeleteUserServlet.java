package cn.edu.ldu.admin;

import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelUser")
public class DeleteUserServlet extends HttpServlet { @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
   int authorId=Integer.parseInt(request.getParameter("authorId"));
        AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
        authorDaoImpI.delete(authorId);
        request.getRequestDispatcher("/GAU").forward(request,response);
    }

    }
