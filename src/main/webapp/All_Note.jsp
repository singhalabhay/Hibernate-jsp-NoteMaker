<%@ page import= "org.hibernate.SessionFactory" %>
<%@ page import= "org.hibernate.query.Query" %>
<%@ page import ="org.hibernate.cfg.Configuration" %>

<%@ page import ="org.hibernate.Session" %>
<%@ page import ="com.entites.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="com.entites.Note" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="all_css_jsp.jsp" %>
</head>
<body>
<div class="conainer">
 <%@include file="navbar.jsp" %>
  <h1 class="text-uppercase">All Notes:</h1>
  <div class="row">
  <div class="col-12">
  <% 
 Configuration cfg=new Configuration();
 cfg.configure("hibernate.cfg.xml");
 SessionFactory  factory=cfg.buildSessionFactory();
 Session s=factory.openSession();
 Query query = s.createQuery("from Note");
 List<Note> list =query.list();
 for(Note note:list){
	 //out.println(note.getId()+":"+note.getTitle()+"<br>");
 %>
 <div class="card" >
  <img src="image/notes.png" class="card-img-top mx-auto" style="max-width:100px" alt="Notes">
  <div class="card-body px-5">
   <h5 class="card-title m-4"><%= note.getTitle()%></h5>
    <p class="card-text">
    		<%= note.getContent() %></p>
    		<p><%= note.getAddedDate() %></p>
    <div class="container text-center">
   <a href="DeletServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
  </div></div>
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