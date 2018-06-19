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
        <form method="post" action="viewStudentBorrowHistory.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">View Student History</th>
                    </tr>
                </thead>
                <tbody>
					<tr>
						<td>Enter the username of the student:  </td>
						<td><input type="TEXT" size=20 name="userId" required/></td>
					</tr>
                    <tr>
                        <td colspan="2" align="center"><input type="SUBMIT" value="Get Info" />
                            &nbsp;&nbsp;
                            <input type="RESET" value="Reset" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
        </form>
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