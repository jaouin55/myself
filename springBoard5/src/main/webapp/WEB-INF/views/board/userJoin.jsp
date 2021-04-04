<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>UserJoin</title>
</head>
<style>
#wrapper {
	margin-top: 40px;
}

td {
	height: 30px;
}

input {
	height: 22px;
}
</style>
<body>
	<div id="wrapper">
		<table align="center">
			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="150" align="center">ID</td>
							<td width="350"><input type="text" id="userId" name="userId"
								maxlength="20" value=""> <input type="button"
								value="중복확인"></td>
						</tr>
						<tr>
							<td width="150" align="center">Password</td>
							<td width="350"><input type="text" id="userPassword"
								name="userPassword" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">PasswordCheck</td>
							<td width="350"><input type="text" id="userPasswordCheck"
								name="userPasswordCheck" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">Name</td>
							<td width="350"><input type="text" id="userName"
								name="userName" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">Phone</td>
							<td width="350"><input type="text" id="userPhone"
								name="userPhone" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">PostNo</td>
							<td width="350"><input type="text" id="userPostNo"
								name="userPostNo" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">Address</td>
							<td width="350"><input type="text" id="userAddress"
								name="userAddress" maxlength="20" value=""></td>
						</tr>
						<tr>
							<td width="150" align="center">Company</td>
							<td width="350"><input type="text" id="userCompany"
								name="userCompany" maxlength="20" value=""></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="">join</a></td>
			</tr>
		</table>
	</div>
</html>