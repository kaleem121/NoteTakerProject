<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
<%@include file = "all_js_css.jsp" %>
</head>
<body>
<div class ="container">  
<%@include file ="navbar.jsp" %>
<h1>Please fill your note details</h1>
<br>

<!-- This is add note form  -->
<form action ="SaveNoteServlet" method ="post">
  <div class="form-group">
    <label for="title">Note Title </label>
    <input required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter title here" name="title">
  </div>
  
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea required class ="form-control" id ="content" placeholder ="Enter your note content here" style ="height:250px" name ="content"></textarea>
  </div>
  
  <div class ="container text-center">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
  
</form>

</div>

</body>
</html>