

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entites.Note;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
	
		  Configuration cfg=new Configuration();
		    cfg.configure("hibernate.cfg.xml");
		    SessionFactory  factory=cfg.buildSessionFactory();
		    int notId=Integer.parseInt(request.getParameter("noteId").trim());
		    Session s=factory.openSession();
		Transaction tx=s.beginTransaction();
	Note not=(Note)s.get(Note.class,notId);
		not.setTitle(title);
		not.setContent(content);
		not.setAddedDate(new Date());
		tx.commit();
		s.close();
		response.sendRedirect("All_Note.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}
