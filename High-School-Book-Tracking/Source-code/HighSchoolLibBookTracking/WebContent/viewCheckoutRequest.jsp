<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>High School Library System</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<div id='container'>
			<center>
				<table border='1' cellpadding='5' cellspacing='2'>
					<thead>
						<tr>
							<th colspan='2'>Checkout Requests</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>Book Name</th>
							<th>Requested By</th>
							<th>Action</th>
						</tr>
<%
Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");
PreparedStatement stmt, stmt1;

String htmlString = "";
String bookName = "";
String userName = "";

String query = "select checkoutId, bookId, checkoutStatus, userid from checkout where checkoutStatus = 'Pending';";
stmt = conn.prepareStatement(query);

ResultSet rs = stmt.executeQuery();
while(rs.next())
{
	String bookId = rs.getString("bookId");
	String userId = rs.getString("userid");
	
	String query1 = "select bookTitle from books where bookId = '" + bookId + "';";
	String query2 = "select sfname, slname from student where suserid = '" + userId + "';";
	
	stmt = conn.prepareStatement(query1);
	stmt1 = conn.prepareStatement(query2);
	
	ResultSet rs1 = stmt.executeQuery();
	ResultSet rs2 = stmt1.executeQuery();
	while(rs1.next() && rs2.next())
	{
		bookName = rs1.getString("bookTitle");
		userName = rs2.getString("sfname") + " " + rs2.getString("slname");
	}
	htmlString += "<tr><td>"+ bookName +"</td>" + 
			 		"<td>"+ userName +"</td>" +
			 		"<td><form method ='POST' action='updateBorrowServlet'>"+
			 		"<input type ='SUBMIT' value='Approve'/></form></td>"+
			 		"</tr>";
}
%>
						<tr><%=htmlString %></tr>
					</tbody>
				</table>
			</center>
		</div>
</body>
</html>