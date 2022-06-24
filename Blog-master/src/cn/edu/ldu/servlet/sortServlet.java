package cn.edu.ldu.servlet;

import cn.edu.ldu.daoImpl.ArticleDaoImpI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sort")
public class sortServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int num=Integer.parseInt(request.getParameter("sort"));
        String sortname;
        switch (num){
            case 1:
                sortname="Python";
                break;
            case 2:
                sortname="java";
                break;
            case 3:
                sortname="c/c++";
                break;
            case 4:
                sortname="前端";
                break;
            case 5:
                sortname="数据库";
                break;
            case 6:
                sortname="计算机基础";
                break;
            case 7:
                sortname="AI";
                break;
            case 8:
                sortname="移动";
                break;
            case 9:
                sortname="区块链";
                break;
            case 10:
                sortname="其他";
                break;
            default:
                sortname="无此分类";
                break;

        }
        System.out.println(sortname);
        ArticleDaoImpI articleDaoImpI=new ArticleDaoImpI();
        List list=new ArrayList();

        list=articleDaoImpI.sort(num);
        request.setAttribute("list",list);
        request.setAttribute("sortname",sortname);
        request.getRequestDispatcher("/jsp/sort.jsp").forward(request,response);
    }
}
