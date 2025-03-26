package com.yong.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestCountServlet extends HttpServlet {

	private int count;
	private String filename;

	public GuestCountServlet() {
		count = 0;
		filename = "C://student_java/count.txt";
	}

	@Override
	public void init() throws ServletException {
		try {
			BufferedReader br = new BufferedReader(new FileReader(filename));
			String count_s = br.readLine();
			count=Integer.parseInt(count_s);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();

		pw.println("<html><head><title>");
		pw.println("손님 접속 카운트");
		pw.println("</title></head><body>");

		count++;
		pw.println("<h1 style='color:blue;'>현재까지의 접속자 수 : " + count + "명</h1>");
		pw.println("</body></html>");

		pw.close();
	}

	@Override
	public void destroy() {

		try {
			PrintWriter pw = new PrintWriter(new FileWriter(filename));
			pw.println(count);
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
