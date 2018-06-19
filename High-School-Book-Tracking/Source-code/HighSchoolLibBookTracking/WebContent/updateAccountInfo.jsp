<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String role = request.getParameter("role");
		String userid = request.getParameter("userid");
		String action = request.getParameter("updateAction");
		String currentPwd = request.getParameter("currentPwd");
		String newPwd = request.getParameter("newPwd");
		String storedPwd = "";
		System.out.println("in updateAccountInfo.jsp, action = " + action);
		System.out.println("in updateAccountInfo.jsp, userid = " + userid);
		System.out.println("in updateAccountInfo.jsp, role = " + role);

		if (action.equalsIgnoreCase("PasswordChange")) {
			PreparedStatement stmt;
			String query1 = "", query2 = "", query3 = "";

			if (role.equalsIgnoreCase("Student")) {
				try {
					Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
					Connection conn = DriverManager
							.getConnection(
									"jdbc:mysql://localhost:3306/highSchoolLibrary",
									"root", "root123");
					query1 = "select spwd from student where suserid = ?;";
					stmt = conn.prepareStatement(query1);
					stmt.setString(1, userid);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						storedPwd = rs.getString("spwd");
					}

					if (storedPwd.equals(currentPwd)) {
						query2 = "update student set spwd = ? where suserid = ?;";
						stmt = conn.prepareStatement(query2);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();
						
						query3 = "update allusers set pwd = ? where userid = ?;";
						stmt = conn.prepareStatement(query3);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();

						request.getRequestDispatcher("viewAccount.jsp")
								.include(request, response);
						conn.close();
					} else {
						request.getRequestDispatcher(
								"changeAccountDetailsForm.jsp").include(
								request, response);
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (role.equalsIgnoreCase("Parent")) {
				try {
					Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
					Connection conn = DriverManager
							.getConnection(
									"jdbc:mysql://localhost:3306/highSchoolLibrary",
									"root", "root123");
					query1 = "select ppwd from parent where puserid = ?;";
					stmt = conn.prepareStatement(query1);
					stmt.setString(1, userid);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						storedPwd = rs.getString("ppwd");
					}

					if (storedPwd.equals(currentPwd)) {
						query2 = "update parent set ppwd = ? where puserid = ?;";
						stmt = conn.prepareStatement(query2);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();

						query3 = "update allusers set pwd = ? where userid = ?;";
						stmt = conn.prepareStatement(query3);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();
						
						request.getRequestDispatcher("viewAccount.jsp")
								.include(request, response);
						conn.close();
					} else {
						request.getRequestDispatcher(
								"changeAccountDetailsForm.jsp").include(
								request, response);
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (role.equalsIgnoreCase("Faculty")) {
				try {
					Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
					Connection conn = DriverManager
							.getConnection(
									"jdbc:mysql://localhost:3306/highSchoolLibrary",
									"root", "root123");
					query1 = "select fpwd from faculty where fuserid = ?;";
					stmt = conn.prepareStatement(query1);
					stmt.setString(1, userid);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						storedPwd = rs.getString("fpwd");
					}
					System.out.println("in updateAccountInfo.jsp, fpwd = "
							+ storedPwd);
					if (storedPwd.equals(currentPwd)) {
						query2 = "update faculty set fpwd = ? where fuserid = ?;";
						stmt = conn.prepareStatement(query2);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();

						query3 = "update allusers set pwd = ? where userid = ?;";
						stmt = conn.prepareStatement(query3);
						stmt.setString(1, newPwd);
						stmt.setString(2, userid);
						stmt.executeUpdate();
						
						request.getRequestDispatcher("viewAccount.jsp")
								.include(request, response);
						conn.close();
					} else {
						request.getRequestDispatcher(
								"changeAccountDetailsForm.jsp").include(
								request, response);
						conn.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	%>
</body>
</html>