<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		/* 회원가입 폼 */
		$("#memRegistForm").on("click", function(e){
			e.preventDefault();
			fn_memRegistForm();
		});
		/* 로그인 폼 */
		$("#memLoginForm").on("click", function(e){
			e.preventDefault();
			fn_memLoginForm();
		});
		/* 회원리스트 */
		$("#memList").on("click", function(e){
			e.preventDefault();
			fn_memList();
		});
		/* 로그아웃 */
		$("#logoutAction").on("click", function(e){
			e.preventDefault();
			fn_logoutAction();
		});
		/* 마이페이지 */
		$("#memMyPage").on("click", function(e){
			e.preventDefault();
			fn_memMyPage();
		});
	});
	
	/* 회원가입 폼 이동 */
	function fn_memRegistForm(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mem/memRegistForm.do'/>");
		comSubmit.submit();
	}
	
	/* 로그인 폼 이동 */
	function fn_memLoginForm(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mem/memLoginForm.do'/>");
		comSubmit.submit();
	}
	
	/* 회원리스트 */
	function fn_memList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mem/selectMemList.do'/>");
		comSubmit.submit();
	}
	
	/* 로그아웃 */
	function fn_logoutAction(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mem/logoutAction.do'/>");
		comSubmit.submit();
	}
	
	/* 마이페이지 */
	function fn_memMyPage(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mem/memMyPage.do'/>");
		comSubmit.submit();
	}
	
</script>
	
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.loginInfo}">
			<a href="#this" id="memMyPage">${sessionScope.loginInfo.MEM_NM}</a>
			<a href="#this" id="logoutAction">로그아웃</a>
			<a href="#this" id="memList">회원리스트</a>
		</c:when>
		<c:otherwise>
			<a href="#this" id="memRegistForm">회원가입</a>
			<a href="#this" id="memLoginForm">로그인</a>
		</c:otherwise>
	</c:choose>	
</body>
</html>