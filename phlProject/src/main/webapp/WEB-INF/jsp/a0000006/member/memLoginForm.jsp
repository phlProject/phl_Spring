<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){		
		$("#mainIndex").on("click", function(e){
			e.preventDefault();
			fn_mainIndex();
		});
		$("#loginAction").on("click", function(e){
			e.preventDefault();
			fn_loginAction();
		});
	});

	function fn_mainIndex(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mainIndex.do'/>");
		comSubmit.submit();
	}
	
	function fn_loginAction(){
		var comSubmit = new ComSubmit("loginActionForm");
		comSubmit.setUrl("<c:url value='/a0000006/mem/loginAction.do'/>");
		comSubmit.submit();
	}
</script>
<body>
	<form id="loginActionForm">
		아이디 :  <input type="text" id="mem_id" name="mem_id"/>
		비밀번호 : <input type="text" id="mem_pw" name="mem_pw"/>
	</form>
	<a href="#this" id="loginAction">로그인</a>
	<a href="#this" id="mainIndex">메인</a>
</body>
</html>