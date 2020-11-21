<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<jsp:include page="css_js_file.jsp"/>
</head>
<body>
    <div class="container">
       <jsp:include page="navbar.jsp"/><br>
        <h3>Please Fill Your Notes Details</h3><br>
        
        <form action="SaveNoteServlet" method="post">
		  <div class="form-group">
		    <label for="exampleFormControlInput1">Note Title</label>
		    <input type="text" name="title" class="form-control" required id="exampleFormControlInput1" placeholder="Enter Here">
		  </div>
	
		  <div class="form-group">
		    <label for="exampleFormControlTextarea1">Note Content</label>
		    <textarea class="form-control" name="content" required id="exampleFormControlTextarea1" rows="3" placeholder="Enetr Your Content Here"></textarea>
		  </div>
		  <div class="text-center">
		     <button type="submit" class="btn btn-primary">Add</button>
		  </div>
		  
		</form>
   
    </div>
    
    

</body>
</html>