<%@ page import ="java.sql.*" %>
<%
    try{
        String uid = request.getParameter("uid");   
        String user_role = "";
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");    
        
        String select_query = "select role from allusers where userid = ?;";
        PreparedStatement stmt = conn.prepareStatement(select_query);
        stmt.setString(1, uid);
        ResultSet rs = stmt.executeQuery();                        
        if(rs.next())
        {
          user_role = rs.getString("role");
        }    
        
        if(user_role.equalsIgnoreCase("Student"))
		{    
	        String delete_query = "delete from student where suserid = ?"; 
	        stmt = conn.prepareStatement(delete_query);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        String delete_query_1 = "delete from allusers where userid = ?"; 
	        stmt = conn.prepareStatement(delete_query_1);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        request.getRequestDispatcher("deleteUserRecordForm.html").include(request, response);
	        conn.close();
		}
        else if(user_role.equalsIgnoreCase("Parent"))
		{    
        	String delete_query = "delete from parent where puserid = ?"; 
	        stmt = conn.prepareStatement(delete_query);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        String delete_query_1 = "delete from allusers where userid = ?"; 
	        stmt = conn.prepareStatement(delete_query_1);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        request.getRequestDispatcher("deleteUserRecordForm.html").include(request, response);
	        conn.close();
		}
        else if(user_role.equalsIgnoreCase("Faculty"))
		{    
        	String delete_query = "delete from faculty where fuserid = ?"; 
	        stmt = conn.prepareStatement(delete_query);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        String delete_query_1 = "delete from allusers where userid = ?"; 
	        stmt = conn.prepareStatement(delete_query_1);
	        stmt.setString(1, uid);
	        stmt.executeUpdate();
	        stmt.close();
	        
	        request.getRequestDispatcher("deleteUserRecordForm.html").include(request, response);
	        conn.close();
		}
   }
   catch(Exception e){       
       e.printStackTrace();       
   }      
%>