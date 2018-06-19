<%@ page import ="java.sql.*" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>High School Library System</title>
		<link rel="stylesheet" href="styles.css" type="text/css" />
		<script src="js/form.js" type="text/javascript"></script>
	</head>
	<body>
<%
	String user_role = "";
    try{
        String uid = request.getParameter("userid");
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");    
        PreparedStatement stmt, stmt1;
        
        String select_query = "select role from allusers where userid = ?;";
        stmt = conn.prepareStatement(select_query);
        stmt.setString(1, uid);
        ResultSet rs = stmt.executeQuery();                        
        if(rs.next())
        {
          user_role = rs.getString("role");
        }
        if(user_role.equalsIgnoreCase("Student"))
    	{
%>
    	<form method="post" action="validate_update.jsp">
    		<input type="hidden" name="uid" value="<%=uid%>">
    		<input type="hidden" name="role" value="<%=user_role%>">
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
    					<td><input type="TEXT" size=25 name="lname"  /></td>
    				</tr>
    				<tr>
    					<td>Email id:</td>
    					<td><input type="TEXT" size=35 name="email"  /></td>
    				</tr>
    				<tr>
    					<td>Class:</td>
    					<td><input type="TEXT" size=7 name="sclass"  /></td>
    				</tr>
    				<tr>
    					<td colspan="2" align="center"><input type="submit"
    						value="Update" /> &nbsp;&nbsp; <input type="reset"
    						value="Reset" /></td>
    				</tr>
    			</tbody>
    		</table>
    	</form>
    	<form method="post" action="updateUserInfoForm.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Back"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
<%
		}
        else if(user_role.equalsIgnoreCase("Faculty"))
        {
%>
		<form method="post" action="validate_update.jsp">
			<input type="hidden" name="uid" value="<%=uid%>">
			<input type="hidden" name="role" value="<%=user_role%>">
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
						<td><input type="TEXT" size=25 name="lname"  /></td>
					</tr>
					<tr>
						<td>Email id:</td>
						<td><input type="TEXT" size=30 name="email"  /></td>
					</tr>
					<tr>
						<td>Department:</td>
						<td><input type="TEXT" size=35 name="dept"  /></td>
					</tr>
					<tr>
						<td>Contact #:</td>
						<td><input type="TEXT" size=15 name="fcontact"  /></td>
					</tr>
					<tr>
						<td>Address Line 1: </td>
						<td><input type='TEXT' size=25 name ='fadd1' /></td>
					</tr>
					<tr>
						<td>Address Line 2: </td>
						<td><input type='TEXT' size=25 name = 'fadd2' /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Update" /> &nbsp;&nbsp; <input type="reset"
							value="Reset" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<form method="post" action="updateUserInfoForm.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Back"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
<%
		}
        else if(user_role.equalsIgnoreCase("Parent"))
        {
%>
		<form method="post" action="validate_update.jsp">
			<input type="hidden" name="uid" value="<%=uid%>">
			<input type="hidden" name="role" value="<%=user_role%>">
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
						<td><input type="TEXT" size=25 name="lname"  /></td>
					</tr>
					<tr>
						<td>Email id:</td>
						<td><input type="TEXT" size=30 name="email"  /></td>
					</tr>
					<tr>
						<td>Contact #:</td>
						<td><input type="TEXT" size=15 name="pcontact"  /></td>
					</tr>
					<tr>
						<td>Address Line 1: </td>
						<td><input type='TEXT' size=25 name ="padd1" /></td>
					</tr>
					<tr>
						<td>Address Line 2: </td>
						<td><input type='TEXT' size=25 name = "padd2" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Update" /> &nbsp;&nbsp; <input type="reset"
							value="Reset" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<form method="post" action="updateUserInfoForm.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Back"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
<%
		}
    }  
    catch(Exception e){       
       e.printStackTrace();      
   	}      
%>
	</body>
</html>