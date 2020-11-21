package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String note_iid=request.getParameter("note_iid");
			int note_idd=Integer.parseInt(note_iid);
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();  
			
			Note note=new Note();
			note=(Note)s.get(Note.class, note_idd);
			
			note.setTitle(title);
			note.setContent(content);
            note.setAddDate(new Date());			
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
