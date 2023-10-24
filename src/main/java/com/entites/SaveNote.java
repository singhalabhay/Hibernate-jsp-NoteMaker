package com.entites;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;





public class SaveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	try {	String title=request.getParameter("tittle");
		String content=request.getParameter("content");
		Note note=new Note(title,content,new Date());
		  Configuration cfg=new Configuration();
		    cfg.configure("hibernate.cfg.xml");
		    SessionFactory  factory=cfg.buildSessionFactory();
		    Session s=factory.openSession();
		Transaction tx=s.beginTransaction();
		s.persist(note);
		tx.commit();
		s.close();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		System.out.println(note.getId()+":"+note.getTitle());
		out.println("<h1 style='text-align:center;'>Note is added Successfull</h1>");
		out.println("<h1 style='text-align:center;'><a href='All_Note.jsp'>View all note</a></h1>");
		
}
	catch(Exception e) {e.printStackTrace();}
	}

}
