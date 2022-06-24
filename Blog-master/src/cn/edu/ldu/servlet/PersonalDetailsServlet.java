package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.AuthorDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/personalDetails")
public class PersonalDetailsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        AuthorDaoImpI authorDaoImpI = new AuthorDaoImpI();
        HttpSession session=request.getSession();
        Author author1=new Author();
       author1= (Author) session.getAttribute("author");
       int idd=author1.getAuthorId();
        Author author = authorDaoImpI.findById(idd);

        request.setAttribute("author",author);

        request.getRequestDispatcher("/jsp" +
                "/personal_details.jsp").forward(request,response);
    }



}
