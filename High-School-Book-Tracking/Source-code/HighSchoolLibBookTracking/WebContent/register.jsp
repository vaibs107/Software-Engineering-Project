<%@page import="javax.swing.text.Document"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>High School Library System Sign Up</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
    </head>
    <body>
    	<table>
    		<thead>
	            <tr>
	                <th colspan="2">SELECT THE ROLE TO PROCEED</th>
	            </tr>
            </thead>
    	</table>
        <form method="post" action="submitRegForm.jsp">
        	<input type="hidden" name="role" value="Student">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Student"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
       <form method="post" action="submit.jsp">
			<input type="hidden" name="role" value="Parent">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Parent"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
       <form method="post" action="submit.jsp">
       		<input type="hidden" name="role" value="Faculty">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Faculty"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
        <form method="post" action="index.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <tbody>
                	<tr>
                    	<td colspan="2" align="center"><input type="submit" value="Home"/></td>
                    </tr>                   
                </tbody>
         	</table>
       </form>
    </body>
</html>