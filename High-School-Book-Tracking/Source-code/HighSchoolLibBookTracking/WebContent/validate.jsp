<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("userid");   
        String password = request.getParameter("pwd");
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");    
        PreparedStatement stmt;
        
        String select_query = "select userid, pwd, role from allusers where userid = ? and pwd = ?;";
        stmt = conn.prepareStatement(select_query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        
        ResultSet rs = stmt.executeQuery();                        
        if(rs.next())
        {
          String user_role = rs.getString(3);
          session.setAttribute("loginFrom", username);
          session.setAttribute("userRole", user_role);
          request.getRequestDispatcher("index.jsp").include(request, response);
        }
        else
           request.getRequestDispatcher("signin.jsp").include(request, response);        
   }
   catch(Exception e){       
       out.println("Exception: Something went wrong !! Please try again");       
   }      
%>