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
import java.sql.SQLException;

@WebServlet("/SetIfo")
public class SetIfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("UTF-8");
//        int id = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("username");
        String resume = request.getParameter("resume");
        String hobby = request.getParameter("hobby");
//        String hobby = request.getParameter("hobby");

        String password = request.getParameter("password");

        //resp.setHeader("contentType", "text/html;charset=GBK");

//        response.setCharacterEncoding("GBK");
        HttpSession session=request.getSession();
        Author author1=new Author();
        author1= (Author) session.getAttribute("author");
        int idd=author1.getAuthorId();
        Author author = new Author(idd,name,resume,hobby,null,null,password);
        System.out.println(author.toString());
        AuthorDaoImpI authorDaoImpI = new AuthorDaoImpI();

        try {
            authorDaoImpI.changeIfo(idd,author);
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        request.getRequestDispatcher("/jsp" +
                "/personal_details.jsp").forward(request,response);

    }

}
