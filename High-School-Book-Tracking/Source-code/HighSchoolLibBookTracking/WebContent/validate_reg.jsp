<%@ page import="java.sql.*"%>
<%
    try{
    	String role = request.getParameter("role");
    	
        String firstname = request.getParameter("fname");   
        String lastname = request.getParameter("lname");   
        String email = request.getParameter("email");
        
        String sclass = request.getParameter("sclass");
               
        String pcontact = request.getParameter("pcontact");
        String paddress = request.getParameter("padd1") + " " + request.getParameter("padd2");
        String pstudentuserid = request.getParameter("pstudentuserid");
        
        String department = request.getParameter("dept");
        String fcontact = request.getParameter("fcontact");
        String faddress = request.getParameter("fadd1") + " " + request.getParameter("fadd2");
        
        String username = request.getParameter("userid");   
        String password = request.getParameter("pwd");
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");
        PreparedStatement stmt; 
        PreparedStatement stmt1; 
        
        if(role.equalsIgnoreCase("Student"))
		{    
	        String insert_query = "insert into student (sfname, slname, semail, suserid, spwd, sclass) " + 
	        					  "values (?,?,?,?,?,?);";
	        stmt = conn.prepareStatement(insert_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, username);
	        stmt.setString(5, password);
	        stmt.setString(6, sclass);
	        stmt.execute();
	        
	        String insert_query_1 = "insert into allusers (userid, pwd, role) values (?,?,?)";
	        stmt1 = conn.prepareStatement(insert_query_1);
	        stmt1.setString(1, username);
	        stmt1.setString(2, password);
	        stmt1.setString(3, role);
	        stmt1.execute();
	        
	        request.getRequestDispatcher("index.jsp").include(request, response);
	        conn.close();
		}
        else if(role.equalsIgnoreCase("Parent"))
		{    
	        String insert_query = "insert into parent (pfname, plname, pemail, pcontact, phomeaddress, "
	        						+ "pstudentuserid, puserid, ppwd) values (?,?,?,?,?,?,?,?);";
	        stmt = conn.prepareStatement(insert_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, pcontact);
	        stmt.setString(5, paddress);
	        stmt.setString(6, pstudentuserid);
	        stmt.setString(7, username);
	        stmt.setString(8, password);
	        stmt.execute();
	        
	        String insert_query_1 = "insert into allusers (userid, pwd, role) values (?,?,?)";
	        stmt1 = conn.prepareStatement(insert_query_1);
	        stmt1.setString(1, username);
	        stmt1.setString(2, password);
	        stmt1.setString(3, role);
	        stmt1.execute();
	        
	        request.getRequestDispatcher("index.jsp").include(request, response); 
	        conn.close();
		}
        else if(role.equalsIgnoreCase("Faculty"))
		{    
	        String insert_query = "insert into faculty (ffname, flname, femail, fcontact, fuserid, fpwd," 
	        						+ "fdept, faddress) values (?,?,?,?,?,?,?,?);";
	        stmt = conn.prepareStatement(insert_query);
	        stmt.setString(1, firstname);
	        stmt.setString(2, lastname);
	        stmt.setString(3, email);
	        stmt.setString(4, fcontact);
	        stmt.setString(5, username);
	        stmt.setString(6, password);
	        stmt.setString(7, department);
	        stmt.setString(8, faddress);
	        stmt.execute();
	        
	        String insert_query_1 = "insert into allusers (userid, pwd, role) values (?,?,?)";
	        stmt1 = conn.prepareStatement(insert_query_1);
	        stmt1.setString(1, username);
	        stmt1.setString(2, password);
	        stmt1.setString(3, role);
	        stmt1.execute();
	        
	        request.getRequestDispatcher("index.jsp").include(request, response);    
	        conn.close();
		}        
	}
    catch(Exception e){       
       out.println("Exception: Something went wrong !! Please try again");
       e.printStackTrace();
   }      
%>