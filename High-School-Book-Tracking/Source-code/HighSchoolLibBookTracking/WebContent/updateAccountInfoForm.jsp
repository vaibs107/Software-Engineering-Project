<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>High School Library System</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
<%
String role = request.getParameter("role");
String userid = request.getParameter("userid");
%>
	<form method="post" action="updateAccountInfo.jsp">
		<input type="hidden" name="role" value="<%=role%>">
		<input type="hidden" name="userid" value="<%=userid%>">
		<input type="hidden" name="updateAction" value="passwordChange">
		<table border="1" cellpadding="5" cellspacing="2">
			<thead>
				<tr>
					<th colspan="2">Change Password</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Enter current password:</td>
					<td><input type="password" name="currentPwd" /></td>
				</tr>
				<tr>
					<td>Enter new password:</td>
					<td><input type="password" name="newPwd" /></td>
				</tr>
				<tr>
					<td>Re-enter new password:</td>
					<td><input type="password" name="reNewPwd" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Change Password" /> &nbsp;&nbsp; <input type="reset" value="Reset" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="viewAccount.jsp">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Back" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>