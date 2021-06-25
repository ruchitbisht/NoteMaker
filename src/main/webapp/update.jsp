<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css_js.jsp" %>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp" %>
		<h1>Update Your Note</h1>
		
		<%
		int noteId =Integer.parseInt(request.getParameter("note_id").trim());
		
		Session s= FactoryProvider.getFactory().openSession();
		
		
		Note note=s.get(Note.class, noteId);
		
		%>
		
		<form action="UpdateServlet" method="post">
		
		<input value="<%= note.getId() %>" name="noteId" type="hidden"/>
		
			<div class="form-group">
				<label for="title">Note title</label> 
				<input
					name="title"
					type="text"
					required
					class="form-control"
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter here"
					value="<%= note.getTitle() %>"
					> 
			</div>
			
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				name="content"
				id="content" 
				required
				placeholder="Enter your content here" 
				class="form-control"
				style="height:300px;">
				<%= note.getContent() %>
				</textarea>
			</div>
			
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>
		
		
	</div>
</body>
</html>