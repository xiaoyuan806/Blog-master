package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Draft;
import cn.edu.ldu.daoImpl.draftImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Rewrite")
public class RewriteServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int draftId=Integer.parseInt(request.getParameter("draftId"));
        Draft draft=new Draft();
      draftImpI dr=new draftImpI();
     draft= dr.findById(draftId);
     request.setAttribute("draft",draft);
     request.getRequestDispatcher("/jsp/rewrite.jsp").forward(request,response);
    }

}