<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>Spring MVC 09</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">게시판</div>
	    <div class="panel-body">
	    	<form action="${cpath}/board/register" method="post">
	    	
	    		<input type="hidden" name="memid" value="${mvo.memid}">
	    		<div class = "form-group">
	    			<label>제목</label>
	    			<input type="text" name="title" class="form-control">
	    		</div><div class = "form-group">
	    			<label>내용</label>
	    			<textarea class="form-control" name="content" row="10" cols=""></textarea>
	    		</div><div class = "form-group">
	    			<label>작성자</label>
	    			<input value="${mvo.memname}" readonly="readonly" type="text" name="writer" class="form-control">
	    		</div>
	    		<button type="submit" class="btn btn-default">등록</button>
	    		<button type="reset" class="btn btn-default">취소</button>
	    	</form>
	    </div>
	    <div class="panel-footer">-편승훈-</div>
	  </div>
	</div>
	
	<script type="text/javascript">

	
	
	</script>
</body>
</html>
