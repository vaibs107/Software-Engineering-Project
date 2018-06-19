import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class addNewBookServlet extends HttpServlet {
	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;
	static String bookId = "";
	static String bookIsbn = "";
	static String bookTitle = "";
	static String bookAuthor = "";
	static String bookPublisher = "";
	static String bookEdition = "";
	static double bookPrice = 0.00;
	static int bookCount = 0;
	static String bookImage = "";
	static String bookCategory = "";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			bookId = request.getParameter("bookId");
			bookIsbn = request.getParameter("bookIsbn");
			bookTitle = request.getParameter("bookTitle");
			bookAuthor = request.getParameter("bookAuthor");
			bookPublisher = request.getParameter("bookPublisher");
			bookEdition = request.getParameter("bookEdition");
			bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
			bookCount = Integer.parseInt(request.getParameter("bookCount"));
			bookImage = request.getParameter("bookImage");
			bookCategory = request.getParameter("bookCategory");

			// Insert into books.xml file as well
			write_XML_File(bookId);
			System.out
					.println("\nin addNewBookServlet, after write_XML_File called\n");

			// Insert into MySQL books table
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/highSchoolLibrary", "root",
					"root123");
			String insert_query = "insert into books (bookId, bookIsbn, bookTitle, bookAuthor, bookPublisher, "
					+ "bookEdition, bookPrice, bookImage, bookCount, bookCatergory) "
					+ "values (?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement stmt = conn.prepareStatement(insert_query);
			stmt.setString(1, bookId);
			stmt.setString(2, bookIsbn);
			stmt.setString(3, bookTitle);
			stmt.setString(4, bookAuthor);
			stmt.setString(5, bookPublisher);
			stmt.setString(6, bookEdition);
			stmt.setDouble(7, bookPrice);
			stmt.setString(8, bookImage);
			stmt.setInt(9, bookCount);
			stmt.setString(10, bookCategory);
			stmt.execute();

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/index.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void write_XML_File(String id) {
		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

			Document doc = docBuilder.parse(new File(
					"C:/apache-tomcat-7.0.34/webapps/ishl/books.xml"));

			Element rootTag = (Element) doc.getElementsByTagName("catalog")
					.item(0);

			Element product1 = doc.createElement("book");

			Attr attr = doc.createAttribute("bookId");
			attr.setValue(id);
			product1.setAttributeNode(attr);

			Element category1 = doc.createElement("bookIsbn");
			category1.appendChild(doc.createTextNode(bookIsbn));
			product1.appendChild(category1);

			Element retailer1 = doc.createElement("bookTitle");
			retailer1.appendChild(doc.createTextNode(bookTitle));
			product1.appendChild(retailer1);

			Element pname1 = doc.createElement("bookAuthor");
			pname1.appendChild(doc.createTextNode(bookAuthor));
			product1.appendChild(pname1);

			Element price1 = doc.createElement("bookPublisher");
			price1.appendChild(doc.createTextNode(bookPublisher));
			product1.appendChild(price1);

			Element manufacturer1 = doc.createElement("bookEdition");
			manufacturer1.appendChild(doc.createTextNode(bookEdition));
			product1.appendChild(manufacturer1);

			Element accessory1 = doc.createElement("bookPrice");
			accessory1
					.appendChild(doc.createTextNode(String.valueOf(bookPrice)));
			product1.appendChild(accessory1);

			Element space1 = doc.createElement("bookImage");
			space1.appendChild(doc.createTextNode(bookImage));
			product1.appendChild(space1);

			Element screensize1 = doc.createElement("bookCategory");
			screensize1.appendChild(doc.createTextNode(bookCategory));
			product1.appendChild(screensize1);

			Element image1 = doc.createElement("bookCount");
			image1.appendChild(doc.createTextNode(String.valueOf(bookCount)));
			product1.appendChild(image1);

			rootTag.appendChild(product1);

			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File(
					"C:/apache-tomcat-7.0.34/webapps/ishl/books.xml"));
			transformer.transform(source, result);

			System.out.println("File saved!");
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
