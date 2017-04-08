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

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		/* 회원등록 */
		$("#insertMemRegist").on("click", function(e){
			e.preventDefault();
			fn_insertMemRegist();
		});
		/* 메인 */
		$("#mainIndex").on("click", function(e){
			e.preventDefault();
			fn_mainIndex();
		});
	});

	/* 회원등록 */
	function fn_insertMemRegist(){
		
		/* 유효성 검사 */
		if(!fn_validation()){
			return false;
		}

		var comSubmit = new ComSubmit("memRegistForm");
		comSubmit.setUrl("<c:url value='/a0000006/mem/insertMemRegist.do'/>");
		comSubmit.submit();
	}
	
	/* 메인 */
	function fn_mainIndex(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/a0000006/mainIndex.do'/>");
		comSubmit.submit();
	}
	
	/* 유효성 검사 */
	function fn_validation(){
		if($("#mem_id").val() == ""){
			alert(" * 아이디를 입력해주세요. ");
			$("#mem_id").focus();
			return false;
		}
		
		if($("#mem_pw").val() == ""){
			alert(" * 비밀번호를 입력해주세요. ");
			$("#mem_pw").focus();
			return false;
		}
		
		if($("#mem_nm").val() == ""){
			alert(" * 이름을 입력해주세요. ");
			$("#mem_nm").focus();
			return false;
		}
		
		if($("#mem_email").val() == ""){
			alert(" * 이메일을 입력해주세요. ");
			$("#mem_email").focus();
			return false;
		}
		
		if($("#mem_nicknm").val() == ""){
			alert(" * 닉네임을 입력해주세요. ");
			$("#mem_nicknm").focus();
			return false;
		}
		
		if($("#mem_grade").val() == ""){
			alert(" * 회원구분을 선택해주세요. ");
			$("#mem_grade").focus();
			return false;
		}
		
		if($("#mem_phone").val() == ""){
			alert(" * 핸드폰번호를 입력해주세요. ");
			$("#mem_phone").focus();
			return false;
		}
		
		return true;
	}
	
	function aa(){
		$.ajax({
			url		: "/a0000006/mem/idDupChk.do",
			type 	: "post",
			data : {
					mbId : $("#mem_id").val()
					},
			dataType : "json",
			success : function(data){
				if(data == 0){
					alert(0);
					
				}else{
					alert(1);
					
				}
				
			}
			
			
			
		})
	}

</script>

<body>
	<form id="memRegistForm" name="memRegistForm">
		<table>
			<tr>
				<td>
					아이디 : <input type="text" id="mem_id" name="mem_id"/>
					<input type="button" value="중복검사" onclick="aa()">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 : <input type="text" id="mem_pw" name="mem_pw"/>
				</td>	
			</tr>
			<tr>
				<td>
					이름 : <input type="text" id="mem_nm" name="mem_nm"/>
				</td>
			</tr>
			<tr>
				<td>
					이메일 : <input type="text" id="mem_email" name="mem_email"/>
				</td>
			</tr>
			<tr>
				<td>
					닉네임 : <input type="text" id="mem_nicknm" name="mem_nicknm"/>
				</td>
			</tr>
			<tr>
				<td>
					회원구분 : <input type="text" id="mem_grade" name="mem_grade"/>
				</td>
			</tr>
			<tr>
				<td>
					핸드폰 : <input type="text" id="mem_phone" name="mem_phone"/>
				</td>
			</tr>
		</table>
	</form>
	
	<a href="#this" id="insertMemRegist">작성</a>
	<a href="#this" id="mainIndex">메인</a>
</body>
</html>