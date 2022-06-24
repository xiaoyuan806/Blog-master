package cn.edu.ldu.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cn.edu.ldu.bean.Article;
import cn.edu.ldu.bean.Author;
import cn.edu.ldu.daoImpl.ArticleDaoImpI;

public class WriteTitServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
		request.setCharacterEncoding("utf-8");
		Article art=new Article();
		String article,content,summary,label;
		String date;
		int read=0;
int authorId;

		try {
			HttpSession session=request.getSession();
			Author author= (Author) session.getAttribute("author");
			authorId=author.getAuthorId();
			article=request.getParameter("article");
			content=request.getParameter("content");
			summary=request.getParameter("summary");
			label=request.getParameter("label");
			int sortId=Integer.parseInt(label);
           date=request.getParameter("data");
			Date date1 =  formatter.parse(date);
			art.setAuthorId(authorId);
			art.setArticleTitle(article);
			art.setArticleContent(content);
			art.setSummary(summary);
			art.setArticleDate(date1);
			art.setReadAmount(read);
            art.setSortId(sortId);
			ArticleDaoImpI articleDaoImpI=new ArticleDaoImpI();
			articleDaoImpI.add(art);
			request.getRequestDispatcher("/FindAllServlet?num=1").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
