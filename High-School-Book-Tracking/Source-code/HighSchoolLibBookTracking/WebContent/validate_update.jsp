<%@ page import="java.sql.*"%>
<%
    try{
    	String role = request.getParameter("role");
    	String username = request.getParameter("uid"); 
    	
        String firstname = request.getParameter("fname");   
        String lastname = request.getParameter("lname");   
        String email = request.getParameter("email");
        String department = request.getParameter("dept");
        
        String sclass = request.getParameter("sclass");
        
        String pcontact = request.getParameter("pcontact");
        String paddress = request.getParameter("padd1") + " " + request.getParameter("padd2");
        
        String fcontact = request.getParameter("fcontact");
        String faddress = request.getParameter("fadd1") + " " + request.getParameter("fadd2");
        
          
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");
        PreparedStatement stmt; 
        
        if(role.equalsIgnoreCase("Student"))
		{    
	        String update_query = "update student set sfname = ?, slname = ?, semail = ?, sclass = ? "
	        						+ "where suserid = ?;"; 
	        					  
	        stmt = conn.prepareStatement(update_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, sclass);
	        stmt.setString(5, username);
	        stmt.executeUpdate();
	      
	        request.getRequestDispatcher("index.jsp").include(request, response);
	        conn.close();
		}
        else if(role.equalsIgnoreCase("Parent"))
		{    
	        String update_query = "update parent set pfname = ?, plname = ?, pemail = ?, pcontact = ?, "
	        						+ "phomeaddress = ? where puserid = ?;";
	        stmt = conn.prepareStatement(update_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, pcontact);
	        stmt.setString(5, paddress);
	        stmt.setString(6, username);
	        stmt.executeUpdate();
	        
	        request.getRequestDispatcher("index.jsp").include(request, response); 
	        conn.close();
		}
        else if(role.equalsIgnoreCase("Faculty"))
		{    
	        String update_query = "update faculty set ffname = ?, flname = ?, femail = ?, fcontact = ?, "
	        						+ "fdept = ?, faddress = ? where fuserid = ?;";
	        stmt = conn.prepareStatement(update_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, fcontact);
	        stmt.setString(5, department);
	        stmt.setString(6, faddress);
	        stmt.setString(7, username);
	        stmt.executeUpdate();
	        
	        request.getRequestDispatcher("index.jsp").include(request, response);    
	        conn.close();
		}        
	}
    catch(Exception e){       
       e.printStackTrace();
   }      
%>