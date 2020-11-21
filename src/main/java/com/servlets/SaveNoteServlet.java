package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  try {	
		//fetch title and content  
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		//creating object of Note
		Note note=new Note(title,content,new Date());
		
		//System.out.print(note.getId()+" : "+note.getTitle()+" : "+note.getContent());
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();  
		 
		 s.save(note);
		 
		tx.commit();
		s.close();
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.print("<h2 style='text-align:center;'>Note is added Sucessfully</h2>");
		out.print("<h2 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h2>");
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	}

}
