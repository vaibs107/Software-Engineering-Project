<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>High School Library System</title>
    <link rel="stylesheet" href="styles.css" type="text/css" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<%
String uid = (String)session.getAttribute("loginFrom");

Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");    
PreparedStatement stmt, stmt1, stmt2;

String select_child_query = "select pstudentuserid from parent where puserid = '" + uid + "';";
stmt2 = conn.prepareStatement(select_child_query);
ResultSet rs2 = stmt2.executeQuery();
String childId = "";
while(rs2.next())
{
		childId = rs2.getString("pstudentuserid");
}

String select_query = "select bookId from checkout where userid = '" + childId + "';";
String bookId = "";
List<String> booksBorrowed = new ArrayList<String>();

stmt = conn.prepareStatement(select_query);

ResultSet rs = stmt.executeQuery();
while(rs.next())
{
	bookId = rs.getString("bookId");
	System.out.println("inside while, bookId = " + bookId);
	String select_book_query = "select bookTitle from books where bookId = '" + bookId + "';";
	stmt1= conn.prepareStatement(select_book_query);
	ResultSet rs1 = stmt1.executeQuery();
	while(rs1.next())
	{
		System.out.println("inside 2nd while");
%>
		<div id='container'>
			<center>
				<table border='1' cellpadding='5' cellspacing='2'>
					<thead>
						<tr>
						<th colspan='2'>Books Borrowed By Your Child</th>
						</tr>
					</thead>
					<tbody>
						<%System.out.println("bookTitle = " + rs1.getString("bookTitle")); %>
						<tr><td><%= rs1.getString("bookTitle")%>
					</tbody>
				</table>
			</center>
		</div>
<%	
	}
}
%>
	<form method="post" action="index.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Back"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
</body>
</html>