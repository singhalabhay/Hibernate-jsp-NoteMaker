<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <%@include file="all_css_jsp.jsp" %>
<title>Add Notes</title>
</head>
<body>
 <div class="container">
 <%@include file="navbar.jsp" %>
 <br>
 <h1>Please fill your note Detail</h1>
 <!-- this is add form -->
 <form action="SaveNote" method="get">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" name="tittle" class="form-control" id="title" required aria-describedby="emailHelp" placeholder="Enter here title">
    
  </div>
  <div class="form-group">
    <label for="content">Note Content:</label>
    <textarea id="content" name="content" placeholder="Enter your conttent here" required class="form-control"></textarea>
  </div>
 <br>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
</form>
 
 

</body>
</html>