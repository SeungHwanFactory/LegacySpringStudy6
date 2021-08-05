<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 등록 페이지</h1>
<form role="form" action="/board/register" method="post">
	<div class="mb-3">
	  <label for="inputTitle" class="form-label">제목</label>
	  <input type="text" class="form-control" id="inputTitle" name="title">
	</div>
	
	<div class="mb-3">
	  <label for="inputContent" class="form-label">내용</label>
	  <textarea class="form-control" id="inputContent" rows="3" name="content"></textarea>
	</div>
	
	<div class="mb-3">
	  <label for="inputWriter" class="form-label">작성자</label>
	  <input type="text" class="form-control" id="inputWriter" name="writer">
	</div>
	
	<button type="submit" class="btn btn-primary">등록</button>
	<button type="reset" class="btn btn-primary">초기화</button>
</form>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>