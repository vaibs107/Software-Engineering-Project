import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Date;
import java.util.Calendar;
import java.sql.*;

public class checkoutServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static int checkoutId = 10;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{		
		Date date = new Date();
		@SuppressWarnings("deprecation")
		int return_date = date.getDate() + 14;
		@SuppressWarnings("deprecation")
		int month = date.getMonth() + 1;
	    
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    int year = cal.get(Calendar.YEAR);
	    if(month == 2 || month == 4 || month == 6 || month == 9 || month == 11)
	    {
	    	if(return_date > 30)
	    	{	
	    		month += 1;
	    		return_date = return_date % 30;
	    	}
	    }
	    else
	    {
	    	if(return_date > 31)
	    	{
	    		month += 1;
	    		return_date = return_date % 31;
	    	}
	    }
		HttpSession session=request.getSession(true);
		String uid = (String)session.getAttribute("loginFrom") ; 
		String bookId = request.getParameter("bookId");
    	checkoutId += 5;
    	
    	if(uid != null)
    	{
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");
			
			/*String select_query = "select role from allusers where userid = '" + uid + "';";
			PreparedStatement stmt = conn.prepareStatement(select_query);
			ResultSet rs = stmt.executeQuery();
			if(role )
			*/
			
			String insert_query = "insert into checkout (checkoutId, bookId, checkoutStatus, userid) values (?, ?, ?, ?);";
			PreparedStatement stmt1 = conn.prepareStatement(insert_query); 
			stmt1.setInt(1, checkoutId);
			stmt1.setString(2, bookId);
			stmt1.setString(3, "Pending" );
			stmt1.setString(4, uid);
			stmt1.execute(); 	
		}
		catch(Exception e){
			e.printStackTrace();
		}

    	PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html>");
            out.println("<head>");
                out.println("<title>Checkout</title>");
                out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");
            out.println("</head>");
            out.println("<body>");
            	out.println("<table border='1' cellpadding='5' cellspacing='2'>");
	                out.println("<thead>");
	                    out.println("<tr>");
	                        out.println("<th colspan='2'>Your borrow request is placed successfully.</th>");
	                    out.println("</tr>");
	                out.println("</thead>");
	                out.println("<tbody>");
	                    out.println("<tr>");
	                        out.println("<td>Your request id is "+ checkoutId + "</td>");
	                    out.println("</tr>"); 
	                    out.println("<tr>");
	                        out.println("<td>The return date for the book borrowed is " + month +"/"+ return_date +"/"+ year + "</td>");
	                    out.println("</tr>"); 
	                    out.println("<tr>");
	                    	out.println("<td><form method='GET' action='index.jsp'>");
	                 		out.println("<input type='submit' value='Back'/></form></td>");
	                 	out.println("</tr>");
	                out.println("</tbody>");
	            out.println("</table>");
	        out.println("</body>");
        out.println("</html>");		
    	}
    	else
		{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<html>");
                out.println("<head>");
                    out.println("<title>Checkout</title>");
                    out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");
                out.println("</head>");
                out.println("<body>");
                	out.println("<table border='1' cellpadding='5' cellspacing='2'>");
		                out.println("<thead>");
		                    out.println("<tr>");
		                        out.println("<th colspan='2'>You are not logged in!</th>");
		                    out.println("</tr>");
		                out.println("</thead>");
		                out.println("<tbody>");
		                    out.println("<tr>");
		                        out.println("<td> <form method='post' action='signin.jsp'>");
		                        out.println("&nbsp;&nbsp;");
		                 		out.println("<input type='submit' value='Please login to continue..'/></form> </td>");
		                    out.println("</tr>");             
		                out.println("</tbody>");
		            out.println("</table>");
		        out.println("</body>");
            out.println("</html>");
		}
	}
}