<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>High School Library System</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>

<%
	String userid = request.getParameter("userid");
%>

	<form method="post" action="validate_update.jsp">
		<input type="hidden" name="uid" value="<%=userid%>"> 
		<input type="hidden" name="role" value="Student">
		<table border="1" cellpadding="5" cellspacing="2">
			<thead>
				<tr>
					<th colspan="2">Enter New Details</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>First Name:</td>
					<td><input type="TEXT" size=25 name="fname" /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><input type="TEXT" size=25 name="lname" /></td>
				</tr>
				<tr>
					<td>Email id:</td>
					<td><input type="TEXT" size=35 name="email" /></td>
				</tr>
				<tr>
					<td>Class:</td>
					<td><input type="TEXT" size=7 name="sclass" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Update" /> &nbsp;&nbsp; <input type="reset" value="Reset" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="updateStudentInfoForm.jsp">
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