package cn.edu.ldu.admin;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/ReUser")
public class ReWriteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println(11111);
//        System.out.println(request.getParameter("authorId"));
       int authorId=Integer.parseInt(request.getParameter("authorId")) ;
        AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
        Author author=new Author();
      author=  authorDaoImpI.findById(authorId);
      request.setAttribute("author",author);
      request.getRequestDispatcher("/admin/ReWrite.jsp").forward(request,response);
    }
}
