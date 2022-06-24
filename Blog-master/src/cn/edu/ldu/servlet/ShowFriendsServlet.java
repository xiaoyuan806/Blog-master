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
import java.util.List;

@WebServlet("/ShowFriends")
public class ShowFriendsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AuthorDaoImpI authorDaoImpI = new AuthorDaoImpI();
        HttpSession session=request.getSession();
        Author author1=new Author();
        author1= (Author) session.getAttribute("author");
        int idd=author1.getAuthorId();
        List<Author> list = authorDaoImpI.showFriends(idd);
        System.out.println(list);
        request.setAttribute("friendList",list);
        request.getRequestDispatcher("/jsp" +
                "/person_friends.jsp").forward(request,response);
    }
}
