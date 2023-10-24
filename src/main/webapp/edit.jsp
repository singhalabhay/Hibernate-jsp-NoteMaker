<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Transaction"%>
<%@ page import="org.hibernate.cfg.Configuration"%>

<%@ page import="com.entites.Note"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdatePage</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>
<div class="container">
 <%@include file="navbar.jsp" %>
 
 <%
  int notId=Integer.parseInt(request.getParameter("note_id").trim());
 Configuration cfg=new Configuration();
 cfg.configure("hibernate.cfg.xml");
 SessionFactory  factory=cfg.buildSessionFactory();
 Session s=factory.openSession();
Transaction tx=s.beginTransaction();
Note note=(Note)s.get(Note.class,notId);
  
  
  %>
<form action="UpdateServlet" method="post">


  <input value="<%=note.getId()%>" name="noteId" type="hidden" />
  	<div class="form-group">
				<label for="title">Note title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%=note.getTitle()%>" />

			</div>
  			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=note.getContent()%>
					</textarea>
 <br>
  <div class="container text-center">
	<button type="submit" class="btn btn-success">Save your
					note</button>
  </div>
</form>
 


 </div>

</body>
</html>