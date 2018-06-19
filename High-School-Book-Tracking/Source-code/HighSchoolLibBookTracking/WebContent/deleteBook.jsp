<%@ page import ="java.sql.*" %>
<%
    try{
        String bname = request.getParameter("bookTitle");   
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");    
        
        String delete_query = "delete from books where bookTitle = '" + bname + "';";
        PreparedStatement stmt = conn.prepareStatement(delete_query);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
        
        request.getRequestDispatcher("index.jsp").include(request, response);
   }
   catch(Exception e){       
       e.printStackTrace();       
   }      
%>