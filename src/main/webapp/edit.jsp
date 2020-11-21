<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="css_js_file.jsp"/>
<title>Insert title here</title>
</head>
<body>
   
   <div class="container">
      <jsp:include page="navbar.jsp"/><br>
      <h1>Edit Your Content:</h1><br>
      
      <%
        try{
        	 String note_id=request.getParameter("note_id");
  		     int noteid=Integer.parseInt(note_id);
  		     
  		     Session s=FactoryProvider.getFactory().openSession();
		     Transaction tx=s.beginTransaction();
		     
		     Note note=new Note();
		     note=(Note)s.get(Note.class,noteid);
		%>
		      
		        <form action="UpdateNoteServlet" method="post">
		         
		          <input type="hidden" value="<%=note.getId()%>" name="note_iid">
				  <div class="form-group">
				    <label for="exampleFormControlInput1">Note Title</label>
				    <input type="text" name="title" class="form-control" value="<%=note.getTitle() %>" required id="exampleFormControlInput1" placeholder="Enter Here">
				  </div>
			
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Note Content</label>
				    <textarea class="form-control" name="content" required id="exampleFormControlTextarea1" rows="3" placeholder="Enetr Your Content Here"><%=note.getContent()%></textarea>
				  </div>
				  <div class="text-center">
				     <button type="submit" class="btn btn-success">Save</button>
				  </div>
				  
				</form>
		
		
		<%     
		     
		     tx.commit();
		     s.close();
        	
        }catch(Exception e){
        	e.printStackTrace();
        }
      %>
    </div>

</body>
</html>