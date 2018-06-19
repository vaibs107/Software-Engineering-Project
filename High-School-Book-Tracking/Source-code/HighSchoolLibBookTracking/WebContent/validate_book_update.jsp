<%@ page import="java.sql.*"%>
<%
	try {
		String bookId = request.getParameter("bookId");
		String bookPublisher = request.getParameter("bookPublisher");
		String bookEdition = request.getParameter("bookEdition");
		double bookPrice = Double.parseDouble(request
				.getParameter("bookPrice"));
		int bookCount = Integer.parseInt(request
				.getParameter("bookCount"));
		String bookCategory = request.getParameter("bookCategory");

		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/highSchoolLibrary",
				"root", "root123");
		PreparedStatement stmt, stmt1;

		String update_query = "update books set bookPublisher = ?, bookEdition = ?, bookPrice = ?, bookCount = ?, bookCatergory = ? "
				+ "where bookId = ?;";

		stmt = conn.prepareStatement(update_query);
		stmt.setString(1, bookPublisher);
		stmt.setString(2, bookEdition);
		stmt.setDouble(3, bookPrice);
		stmt.setInt(4, bookCount);
		stmt.setString(5, bookCategory);
		stmt.setString(6, bookId);
		stmt.executeUpdate();

		request.getRequestDispatcher("index.jsp").include(request,
				response);
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>