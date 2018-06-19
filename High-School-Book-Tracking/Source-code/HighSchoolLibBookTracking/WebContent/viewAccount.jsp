<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>High School Library System Sign Up</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
</head>
<body>
	<%
		String userid = (String) session.getAttribute("loginFrom");
		System.out.println("in viewAccount.jsp, userid = " + userid);
		String user_role = "";

		try {
			Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/highSchoolLibrary",
					"root", "root123");
			PreparedStatement stmt, stmt1;

			String select_query = "select role from allusers where userid = ?;";
			stmt = conn.prepareStatement(select_query);
			stmt.setString(1, userid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				user_role = rs.getString("role");
			}
			System.out.println("in viewAccount.jsp, role = " + user_role);
			if (user_role.equalsIgnoreCase("Student")) {
				String sname = "", semail = "", sclass = "", pname = "", pemail = "", pcontact = "", phomeaddress = "";
				String select_query_1 = "select sfname, slname, semail, sclass from student where suserid = ?;";
				stmt = conn.prepareStatement(select_query_1);
				stmt.setString(1, userid);
				ResultSet rs1 = stmt.executeQuery();
				if (rs1.next()) {
					sname = rs1.getString("sfname") + " "
							+ rs1.getString("slname");
					semail = rs1.getString("semail");
					sclass = rs1.getString("sclass");
				}

				String select_query_2 = "select pfname, plname, pemail, pcontact, phomeaddress from parent where pstudentuserid = ?;";
				stmt = conn.prepareStatement(select_query_2);
				stmt.setString(1, userid);
				ResultSet rs2 = stmt.executeQuery();
				if (rs2.next()) {
					pname = rs2.getString("pfname") + " "
							+ rs2.getString("plname");
					pemail = rs2.getString("pemail");
					pcontact = rs2.getString("pcontact");
					phomeaddress = rs2.getString("phomeaddress");
				}
				conn.close();
				if (pname != "" && pemail != "" && pcontact != ""
						&& phomeaddress != "") {
	%>
	<table border="1" cellpadding="5" cellspacing="2" align='center'>
		<thead>
			<tr>
				<th colspan='2'>Your Details</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="200px">Name:</td>
				<td><%=sname%></td>
			</tr>
			<tr>
				<td width="200px">Email id:</td>
				<td><%=semail%></td>
			</tr>
			<tr>
				<td width="200px">User Id:</td>
				<td><%=userid%></td>
			</tr>
			<tr>
				<td width="200px">Class:</td>
				<td><%=sclass%></td>
			</tr>
			<tr>
				<td width="200px">Parent Name:</td>
				<td><%=pname%></td>
			</tr>
			<tr>
				<td width="200px">Parent Email Id:</td>
				<td><%=pemail%></td>
			</tr>
			<tr>
				<td width="200px">Parent Contact #:</td>
				<td><%=pcontact%></td>
			</tr>
			<tr>
				<td width="200px">Address:</td>
				<td><%=phomeaddress%></td>
			</tr>
		</tbody>
	</table>
	<form method="post" action="updateAccountInfoForm.jsp">
		<input type="hidden" name="userid" value="<%=userid%>"> <input
			type="hidden" name="role" value="Student">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Change Password" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="index.jsp">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Back" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<%
		} else {
	%>
	<table border="1" cellpadding="5" cellspacing="2" align='center'>
		<thead>
			<tr>
				<th colspan='2'>Your parent details are not found. Please ask
					your parent to register!!</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<form method="post" action="index.jsp">
						<table border="1" cellpadding="5" cellspacing="2">
							<tbody>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="Back" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<%
		}
			} else if (user_role.equalsIgnoreCase("Faculty")) {
				String fname = "", femail = "", fcontact = "", fdept = "", faddress = "";
				String select_query_1 = "select ffname, flname, femail, fcontact, fdept, faddress "
						+ "from faculty where fuserid = ?;";
				stmt = conn.prepareStatement(select_query_1);
				stmt.setString(1, userid);
				ResultSet rs3 = stmt.executeQuery();
				if (rs3.next()) {
					fname = rs3.getString("ffname") + " "
							+ rs3.getString("flname");
					femail = rs3.getString("femail");
					fcontact = rs3.getString("fcontact");
					fdept = rs3.getString("fdept");
					faddress = rs3.getString("faddress");
				}
				conn.close();
	%>
	<table border="1" cellpadding="5" cellspacing="2" align='center'>
		<thead>
			<tr>
				<th colspan='2'>Your Details</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="200px">Name:</td>
				<td><%=fname%></td>
			</tr>
			<tr>
				<td width="200px">Email id:</td>
				<td><%=femail%></td>
			</tr>
			<tr>
				<td width="200px">User Id:</td>
				<td><%=userid%></td>
			</tr>
			<tr>
				<td width="200px">Department:</td>
				<td><%=fdept%></td>
			</tr>
			<tr>
				<td width="200px">Contact #:</td>
				<td><%=fcontact%></td>
			</tr>
			<tr>
				<td width="200px">Address:</td>
				<td><%=faddress%></td>
			</tr>
		</tbody>
	</table>
	<form method="post" action="updateAccountInfoForm.jsp">
		<input type="hidden" name="userid" value="<%=userid%>"> <input
			type="hidden" name="role" value="Faculty">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Change Password" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="index.jsp">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Back" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<%
		} else if (user_role.equalsIgnoreCase("Parent")) {
				String pname = "", pemail = "", pcontact = "", phomeaddress = "", sname = "", suserid = "", pstudentuserid = "";
				String select_query_1 = "select pfname, plname, pemail, pcontact, phomeaddress, pstudentuserid "
						+ "from parent where puserid = ?;";
				stmt = conn.prepareStatement(select_query_1);
				stmt.setString(1, userid);
				ResultSet rs4 = stmt.executeQuery();
				if (rs4.next()) {
					pname = rs4.getString("pfname") + " "
							+ rs4.getString("plname");
					pemail = rs4.getString("pemail");
					pcontact = rs4.getString("pcontact");
					phomeaddress = rs4.getString("phomeaddress");
					pstudentuserid = rs4.getString("pstudentuserid");
				}

				String select_query_2 = "select  sfname, slname, suserid from student where suserid = ?;";
				stmt = conn.prepareStatement(select_query_2);
				stmt.setString(1, pstudentuserid);
				ResultSet rs5 = stmt.executeQuery();
				if (rs5.next()) {
					sname = rs5.getString("sfname") + " "
							+ rs5.getString("slname");
					suserid = rs5.getString("suserid");
				}
				conn.close();
				if (sname != "" && suserid != "") {
	%>
	<table border="1" cellpadding="5" cellspacing="2" align='center'>
		<thead>
			<tr>
				<th colspan='2'>Your Details</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="200px">Name:</td>
				<td><%=pname%></td>
			</tr>
			<tr>
				<td width="200px">Email id:</td>
				<td><%=pemail%></td>
			</tr>
			<tr>
				<td width="200px">User Id:</td>
				<td><%=userid%></td>
			</tr>
			<tr>
				<td width="200px">Contact #:</td>
				<td><%=pcontact%></td>
			</tr>
			<tr>
				<td width="200px">Address:</td>
				<td><%=phomeaddress%></td>
			</tr>
			<tr>
				<td width="200px">Child's Name:</td>
				<td><%=sname%></td>
			</tr>
			<tr>
				<td width="200px">Child's User ID:</td>
				<td><%=suserid%></td>
			</tr>
		</tbody>
	</table>
	<form method="post" action="updateAccountInfoForm.jsp">
		<input type="hidden" name="userid" value="<%=userid%>"> <input
			type="hidden" name="role" value="Parent">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Change Password" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="index.jsp">
		<table border="1" cellpadding="5" cellspacing="2">
			<tbody>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Back" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<%
		} else {
	%>
	<table border="1" cellpadding="5" cellspacing="2" align='center'>
		<thead>
			<tr>
				<th colspan='2'>Your parent details are not found. Please ask
					your parent to register!!</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<form method="post" action="index.jsp">
						<table border="1" cellpadding="5" cellspacing="2">
							<tbody>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="Back" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
	<%
		}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>