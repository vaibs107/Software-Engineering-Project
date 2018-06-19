import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class showBooksServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String category = request.getParameter("category");
		String action = request.getParameter("action");
		String searchName = request.getParameter("searchName");

		if (action != null && searchName != null) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Books Selected</title>");
			out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");
			out.println("</head>");
			out.println("<body>");
			out.println("<div id='container'>");
			System.out.println("in showBooksServlet, category = " + category);
			try {
				System.out.println("inside try");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/highSchoolLibrary",
						"root", "root123");

				String select_query = "select * from books where bookTitle = '"
						+ searchName + "';";
				PreparedStatement stmt = conn.prepareStatement(select_query);
				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					String bookId = rs.getString(1);
					String bookIsbn = rs.getString(2);
					String bookTitle = rs.getString(3);
					String bookAuthor = rs.getString(4);
					String bookPublisher = rs.getString(5);
					String bookEdition = rs.getString(6);
					double bookPrice = rs.getDouble(7);
					String bookImage = rs.getString(8);
					String bookCategory = category;

					out.println("<div class='productsDiv' name='Div'>");
					out.println("<form method='POST' action='checkoutServlet'>");
					out.println("<img src='"
							+ bookImage
							+ "' width='200' height='200' float='left'/><br><br>");
					out.println("<strong>Name: </strong>" + bookTitle + "<br>");
					out.println("<strong>Author: </strong>" + bookAuthor
							+ "<br>");
					out.println("<input type='hidden' name='bookId' value='"
							+ bookId + "'/><strong>ISBN: </strong>" + bookIsbn
							+ "<br>");
					out.println("<strong>Publisher: </strong>" + bookPublisher
							+ "<br>");
					out.println("<strong>Price: </strong>$" + bookPrice
							+ "<br>");
					out.println("<strong>Edition: </strong>" + bookEdition
							+ "<br>");
					out.println("<strong>Category: </strong>" + bookCategory
							+ "<br>");
					out.println("<input type='SUBMIT' value='Borrow'/><br>");
					out.println("</form>");
					out.println("</div>");
				}
				out.println("<form method='post' action='index.jsp'>");
				out.println("<table border='1' cellpadding='5' cellspacing='2'>");
				out.println("<tbody>");
				out.println("<tr>");
				out.println("<td colspan='2' align='center'><input type='submit' value='Back'/></td>");
				out.println("</tr>");
				out.println("</tbody>");
				out.println("</table>");
				out.println("</form>");
				out.println("</div>");
				out.println("</body>");
				out.println("</html>");
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			if (category.equalsIgnoreCase("ALL BOOKS")) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Books Selected</title>");
				out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");
				out.println("</head>");
				out.println("<body>");
				out.println("<div id='container'>");
				System.out.println("in showBooksServlet, category = "
						+ category);
				try {
					System.out.println("inside try");
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/highSchoolLibrary",
							"root", "root123");

					String select_query = "select * from books;";
					PreparedStatement stmt = conn
							.prepareStatement(select_query);
					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						String bookId = rs.getString(1);
						String bookIsbn = rs.getString(2);
						String bookTitle = rs.getString(3);
						String bookAuthor = rs.getString(4);
						String bookPublisher = rs.getString(5);
						String bookEdition = rs.getString(6);
						double bookPrice = rs.getDouble(7);
						String bookImage = rs.getString(8);
						String bookCategory = category;

						out.println("<div class='productsDiv' name='Div'>");
						out.println("<form method='POST' action='checkoutServlet'>");
						out.println("<img src='"
								+ bookImage
								+ "' width='200' height='200' float='left'/><br><br>");
						out.println("<strong>Name: </strong>" + bookTitle
								+ "<br>");
						out.println("<strong>Author: </strong>" + bookAuthor
								+ "<br>");
						out.println("<input type='hidden' name='bookId' value='"
								+ bookId
								+ "'/><strong>ISBN: </strong>"
								+ bookIsbn + "<br>");
						out.println("<strong>Publisher: </strong>"
								+ bookPublisher + "<br>");
						out.println("<strong>Price: </strong>$" + bookPrice
								+ "<br>");
						out.println("<strong>Edition: </strong>" + bookEdition
								+ "<br>");
						out.println("<strong>Category: </strong>"
								+ bookCategory + "<br>");
						out.println("<input type='SUBMIT' value='Borrow'/><br>");
						out.println("</form>");
						out.println("</div>");
					}
					out.println("<form method='post' action='index.jsp'>");
					out.println("<table border='1' cellpadding='5' cellspacing='2'>");
					out.println("<tbody>");
					out.println("<tr>");
					out.println("<td colspan='2' align='center'><input type='submit' value='Back'/></td>");
					out.println("</tr>");
					out.println("</tbody>");
					out.println("</table>");
					out.println("</form>");
					out.println("</div>");
					out.println("</body>");
					out.println("</html>");
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Books Selected</title>");
				out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");
				out.println("</head>");
				out.println("<body>");
				out.println("<div id='container'>");
				System.out.println("in showBooksServlet, category = "
						+ category);
				try {
					System.out.println("inside try");
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/highSchoolLibrary",
							"root", "root123");

					String select_query = "select * from books where bookCatergory = '"
							+ category + "';";
					PreparedStatement stmt = conn
							.prepareStatement(select_query);
					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						String bookId = rs.getString(1);
						String bookIsbn = rs.getString(2);
						String bookTitle = rs.getString(3);
						String bookAuthor = rs.getString(4);
						String bookPublisher = rs.getString(5);
						String bookEdition = rs.getString(6);
						double bookPrice = rs.getDouble(7);
						String bookImage = rs.getString(8);
						String bookCategory = category;

						out.println("<div class='productsDiv' name='Div'>");
						out.println("<form method='POST' action='checkoutServlet'>");
						out.println("<img src='"
								+ bookImage
								+ "' width='200' height='200' float='left'/><br><br>");
						out.println("<strong>Name: </strong>" + bookTitle
								+ "<br>");
						out.println("<strong>Author: </strong>" + bookAuthor
								+ "<br>");
						out.println("<input type='hidden' name='bookId' value='"
								+ bookId
								+ "'/><strong>ISBN: </strong>"
								+ bookIsbn + "<br>");
						out.println("<strong>Publisher: </strong>"
								+ bookPublisher + "<br>");
						out.println("<strong>Price: </strong>$" + bookPrice
								+ "<br>");
						out.println("<strong>Edition: </strong>" + bookEdition
								+ "<br>");
						out.println("<strong>Category: </strong>"
								+ bookCategory + "<br>");
						out.println("<input type='SUBMIT' value='Borrow'/><br>");
						out.println("</form>");
						out.println("</div>");
					}
					out.println("<form method='post' action='index.jsp'>");
					out.println("<table border='1' cellpadding='5' cellspacing='2'>");
					out.println("<tbody>");
					out.println("<tr>");
					out.println("<td colspan='2' align='center'><input type='submit' value='Back'/></td>");
					out.println("</tr>");
					out.println("</tbody>");
					out.println("</table>");
					out.println("</form>");
					out.println("</div>");
					out.println("</body>");
					out.println("</html>");
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
