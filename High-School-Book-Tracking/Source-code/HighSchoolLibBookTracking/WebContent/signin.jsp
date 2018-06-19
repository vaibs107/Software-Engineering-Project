<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>High School Library System</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
    </head>
    <body>
        <form method="post" action="validate.jsp">
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="userid" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pwd" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
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