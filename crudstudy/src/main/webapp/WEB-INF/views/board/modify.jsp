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
<form role="form" action="/board/modify" method="post">
	<div class="mb-3">
	  <label for="showBno" class="form-label">글번호</label>
	  <input type="text" class="form-control" id="showBno" name="bno" 
	  value='<c:out value="${board.bno}"/>' readonly="readonly">
	</div>

	<div class="mb-3">
	  <label for="showTitle" class="form-label">제목</label>
	  <input type="text" class="form-control" id="showTitle" name="title" 
	  value='<c:out value="${board.title}"/>'>
	</div>
	
	<div class="mb-3">
	  <label for="showContent" class="form-label">내용</label>
	  <textarea class="form-control" id="showContent" rows="3" name="content" 
	  ><c:out value="${board.content}"/></textarea>
	</div>
	
	<div class="mb-3">
	  <label for="showWriter" class="form-label">작성자</label>
	  <input type="text" class="form-control" id="showWriter" name="writer" 
	  value='<c:out value="${board.writer}"/>' readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="showRegDate" class="form-label">작성일</label>
	  <input type="hidden" class="form-control" id="showRegDate" name="regDate" 
	  value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${board.regdate}" />' readonly="readonly">
	</div>
	
	<div class="mb-3">
	  <label for="showUpdateDate" class="form-label">수정일</label>
	  <input type="hidden" class="form-control" id="showUpdateDate" name="updateDate" 
	  value='<fmt:formatDate pattern = "yyyy/MM/dd" value= "${board.updateDate}" />' readonly="readonly">
	</div>
	
	<!-- 페이징 처리 값 추가 -->
	<input type='hidden' name='pageNum' value='<c:out value="${page.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${page.amount}"/>'>
	
	<button id="modifyBtn" data-oper="modify" type="submit" class="btn btn-primary">수정</button>
	<button id="delBtn" data-oper="remove" type="submit" class="btn btn-danger">삭제</button>
	<button id="listBtn" data-oper="list" type="submit" class="btn btn-primary">목록으로 돌아가기</button>
</form>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		let formObj = $("form");
		
		/* $('button').click(function(e) {
			e.preventDefault();
			
			let operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
			} else if (operation === 'list') {
				formObj.attr("action", "/board/list").attr("method", "get");
				formObj.empty();
			}
			
			formObj.submit();
		}) */
		
		/*
		* 목록 버튼을 클릭하면 <form>태그에서 필요한 부분만
		* 복사(clone)한 뒤, 보관하고 <form>태그 내 모든 내용을 지운다(empty)
		* 이후, 다시 필요한 태그만 추가해 /board/list 를 호출하는 형태
		*/
		$('button').click(function(e) {
			e.preventDefault();
			
			let operation = $(this).data("oper");
			
			console.log("operation: ", operation);
			
			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
			} else if (operation === 'list') {
				//게시글 삭제
				formObj.attr("action", "/board/list").attr("method", "get");
				let pageNumTag = $("input[name='pageNum']").clone();
				let amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
	</script>
</body>
</html>