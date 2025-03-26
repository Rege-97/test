package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlert extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<html>");
		pw.println("<head><title>");
		pw.println("이것은 서블릿");
		pw.println("</title></head>");
		pw.println("<body>");
		pw.println("<h1>이것은 servlet입니다</h1>");
		pw.println("</body></html>");
		
		Calendar now=Calendar.getInstance();
	      int y=now.get(Calendar.YEAR);
	      int m=now.get(Calendar.MONTH)+1;
	      int d=now.get(Calendar.DATE);
	      
	      pw.println("<h1>"+y+" 년 "+m+"월 "+d+"일<h1>");
	      
	      pw.println("</body></html>");
	      pw.close();

	}
}
