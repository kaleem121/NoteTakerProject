<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Todo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp"%>
<title>All Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();

				Query q = s.createQuery("from Todo");

				List<Todo> list = q.list();
				for (Todo todo : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto"  style = "max-width:50px" src="img/notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=todo.getTitle() %></h5>
						<p class="card-text"><%=todo.getContent() %></p>
						<p><b class ="text-primary"><%=todo.getAddedDate() %></b></p>
						<div class ="container text-center mt-2">
						 <a href="DeleteServlet?Note_Id=<%=todo.getId() %>" class="btn btn-danger">Delete</a>
						 <a href="edit.jsp?note_id=<%=todo.getId() %>" class="btn btn-primary">Update</a>
						
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