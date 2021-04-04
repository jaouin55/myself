<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {

		$j("#update_btn").on("click", function() {
			var $frm = $j('.formParam :input');
			var param = $frm.serialize();
			var cf_Up = confirm("�����Ͻðڽ��ϱ�?");
			//alert(param);

			if (cf_Up) {
				$j.ajax({
					url : "/board/boardUpdateAction.do",
					dataType : "json",
					type : "POST",
					data : param,
					success : function(data, textStatus, jqXHR) {
						alert("������ �Ϸ�Ǿ����ϴ�");
						//alert("�޼���:"+data.success);
						location.href = "/board/boardList.do?pageNo=1";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Error : �������� .. �����ڿ��� �����ϼ���!");
					}
				});
			} else {
				return false;
			}
		});

		$j("#delete_btn").on("click", function() {
			var $frm = $j('.formParam :input');
			var param = $frm.serialize();
			var cf_Del = confirm("�����Ͻðڽ��ϱ�?");

			//alert(param);

			if (cf_Del) {
				$j.ajax({
					url : "/board/boardDeleteAction.do",
					dataType : "json",
					type : "GET",
					data : param,
					success : function(data, textStatus, jqXHR) {
						alert("������ �Ϸ�Ǿ����ϴ�");
						//alert("�޼���:"+data.success);
						location.href = "/board/boardList.do?pageNo=1";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Error : �������� .. �����ڿ��� �����ϼ���!");
					}
				});
			} else {
				return false;
			}
		});
	});
</script>
<body>
	<form class="formParam">
		<input type="hidden" id="boardType" name="boardType" value="${board.boardType}"> 
			<input type="hidden" id="boardNum" name="boardNum" value="${board.boardNum}"> 
			<input type="button" id="update_btn" value="����" /> 
			<input type="button"id="delete_btn" value="����" />
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">Title</td>
							<td width="400"><input name="boardTitle" type="text"
								size="50" value="${board.boardTitle}"></td>
						</tr>
						<tr>
							<td height="300" align="center">Comment</td>
							<td valign="top"><textarea name="boardComment" rows="20"
									cols="55">${board.boardComment}</textarea></td>
						</tr>
						<tr>
							<td align="center">Writer</td>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="/board/boardList.do">List</a></td>
			</tr>
		</table>
	</form>
</body>
</html>