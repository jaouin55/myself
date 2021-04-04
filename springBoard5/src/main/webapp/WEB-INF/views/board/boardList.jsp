<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	function checkSelectAll()  {
		  const checkboxes 
		    = document.querySelectorAll('input[name="codeId"]');
		  const checked 
		    = document.querySelectorAll('input[name="codeId"]:checked');
		  const selectAll 
		    = document.querySelector('input[name="allCheck"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }
	};
	
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('codeId');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	};
	
	function btn_ck(){
		if (!$j("input:checked[Name='codeId']").is(":checked")){
			alert("한개 이상 선택해주세요!"); 
			$("#codeId").focus(); 
			return; 
			}
		};
</script>
<body>
	<table align="center">
		<tr>
			<td align="left"><a href="/board/userLogin.do">login</a> <a
				href="/board/userJoin.do">join</a></td>
		</tr>
		<tr>
			<td align="right">total : ${totalCnt}</td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">Type</td>
						<td width="40" align="center">No</td>
						<td width="300" align="center">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center">${list.codeName}</td>
							<td>${list.boardNum}</td>
							<td><a href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardWrite.do">글쓰기</a></td>
		</tr>
		<tr>
			<td align="left">
				<form id="selectType" class="selectType" method="get" action="/board/boardList.do">
					<input type="checkbox" class="allCheck" id="allCheck" name="allCheck" value="allCheckbox"  onclick='selectAll(this)'>전체선택
					<c:forEach var="code" items="${codeName}" varStatus="status">
						<input type="checkbox" class="codeId" id="codeId" name="codeId" value="${code.codeId}" onclick='checkSelectAll()'>${code.codeName}</>
					</c:forEach>
					<button id="submitFrm" onclick="btn_ck()">조회</button>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>