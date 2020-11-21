package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   try {
		   String note_id=request.getParameter("note_id");
		   int noteid=Integer.parseInt(note_id);
		   
		   Session s=FactoryProvider.getFactory().openSession();
		   Transaction tx=s.beginTransaction();
		   
		   Note note=new Note();
		   note=(Note)s.get(Note.class, noteid);
		   s.delete(note);
		   
		   
		   tx.commit();
		   s.close();
		   response.sendRedirect("all_notes.jsp");
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	
	}
	

}
