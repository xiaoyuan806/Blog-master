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

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Author author=new Author();
        try {
            String name=request.getParameter("username");
            String password=request.getParameter("password");
            if(name.equals("admin")&&password.equals("admin")){

                request.getRequestDispatcher("/admin.jsp").forward(request,response);

            }else{
                AuthorDaoImpI authorDaoImpI=new AuthorDaoImpI();
                author=authorDaoImpI.findlogin(name,password);


                if(author.getAuthorName()!=null){
                    HttpSession session=request.getSession();
                    session.setAttribute("author",author);

                    response.sendRedirect(request.getContextPath()+"/FindAllServlet?num=1");
                }
                else{
                    request.setAttribute("message","密码或账号错误");
                    request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }
