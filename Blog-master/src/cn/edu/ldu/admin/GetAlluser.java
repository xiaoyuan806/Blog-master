package cn.edu.ldu.admin;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/GAU")
public class GetAlluser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
        List<Author> list=new ArrayList<>();

       list= authorDaoImpI.getAll();
       request.setAttribute("list",list);
        request.getRequestDispatcher("/admin/userManage.jsp").forward(request,response);

    }
}
