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

@WebServlet("/ShowDetails")
public class ShowDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        AuthorDaoImpI authorDaoImpI = new AuthorDaoImpI();

        int id_Friend = Integer.parseInt(request.getParameter("id"));
        HttpSession session=request.getSession();
        Author author1=new Author();
        author1= (Author) session.getAttribute("author");
        int idd=author1.getAuthorId();
        Author author_Friend = authorDaoImpI.findById(id_Friend);
        Author author_Own = authorDaoImpI.findById(idd);

        request.setAttribute("author_friend",author_Friend);
        request.setAttribute("author_own",author_Own);

        request.getRequestDispatcher("/jsp" +
                "/show_personalDetails.jsp").forward(request,response);
    }
}
