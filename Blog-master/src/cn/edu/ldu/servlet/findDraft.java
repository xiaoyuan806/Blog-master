package cn.edu.ldu.servlet;

import cn.edu.ldu.bean.Draft;
import cn.edu.ldu.daoImpl.draftImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/findDraft")
public class findDraft extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             request.setCharacterEncoding("UTF-8");
             draftImpI dr=new draftImpI();
            List<Draft> list=new ArrayList<>();
          list=dr.findall();
            System.out.println(list);
request.setAttribute("list",list);
request.getRequestDispatcher("/jsp/drafts.jsp").forward(request,response);
        }
}
