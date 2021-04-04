<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>userJoin</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){

</script>
<body>
	<table align="center">
		<tr>
			<td>
				<table border="1">
					<tr>
						<td width="120" align="center">ID</td>
						<td width="200"><input type="text" class="form-control"
							placeholder="ID" path="id" /></td>
					</tr>
					<tr>
						<td width="120" align="center">Password</td>
						<td width="200"><input type="password" class="form-control"
							placeholder="Password" path="pw" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="">login</a></td>
		</tr>
	</table>
</body>
</html>