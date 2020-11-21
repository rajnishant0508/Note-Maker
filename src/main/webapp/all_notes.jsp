<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<jsp:include page="css_js_file.jsp"/>
</head>
<body>
   <div class="container">
      <jsp:include page="navbar.jsp"/><br>
      
      <h2 >All Notes:</h2><br>
      
      <div class="row">
        <div class="col-12">
           <%
	        Session s=FactoryProvider.getFactory().openSession();
	        
	        Query q=s.createQuery("from Note");
	        List<Note> list=q.list();
	        
	        for(Note note:list){
	       %> 	
	        	<div class="card mt-3" style="width: 18rem;">
				  <img src="./img/images.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title"><%=note.getTitle()%></h5>
				    <p class="card-text"><%=note.getContent()%></p>
				    <div class="text-center">
				      <a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-danger">Delete</a>
				      <a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Edit</a>
				   </div>
				  </div>
				</div>
	       <% 
	       }
	        
	        s.close();
         %>
           
        </div>
      </div>
      
      
   </div>
   

</body>
</html>