<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session,com.entities.Todo"%>
<%@page import="com.helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">

		<%@include file="navbar.jsp"%>
		<h1>Edit your note.</h1>
		<%
		Session s = FactoryProvider.getFactory().openSession();
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Todo todo = (Todo) s.get(Todo.class, noteId);
		s.close();
		%>

		<form action="UpdateServlet" method="post">
		<input value ="<%=todo.getId() %>" name = "noteId" type ="hidden"/>
			<div class="form-group">
				<label for="title">Note Title </label>
				<input required 
				       type="text"
					   class="form-control" 
					   id="title" 
					   aria-describedby="emailHelp"
					   placeholder="Enter title here" 
					   name="title"
					   value="<%=todo.getTitle()%>"
					   />
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required 
				         class="form-control" 
				         id="content"
					     placeholder="Enter your note content here" 
					     style="height: 250px"
					     name="content"><%=todo.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Note</button>
			</div>

		</form>


	</div>

</body>
</html>