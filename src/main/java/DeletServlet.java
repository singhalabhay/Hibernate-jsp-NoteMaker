

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import com.entites.Note;

public class DeletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeletServlet() {
        super();
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			int notId=Integer.parseInt(request.getParameter("note_id").trim());
			 Configuration cfg=new Configuration();
			    cfg.configure("hibernate.cfg.xml");
			    SessionFactory  factory=cfg.buildSessionFactory();
			    Session s=factory.openSession();
			Transaction tx=s.beginTransaction();
			Note note=(Note)s.get(Note.class,notId);
			s.delete(note);
			response.sendRedirect("All_Note.jsp");
			tx.commit();
			s.close();
		}catch(Exception e) {
			
		}
	
	}

	


}
