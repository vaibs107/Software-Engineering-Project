import java.util.*;
import java.sql.*;

public class AjaxUtility
{
	public static Connection conn = null;
	
	public static HashMap<String,String> getData()
	{	
		HashMap<String,String> products=new HashMap<String,String>();
		try
		{	
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/highSchoolLibrary","root","root123");
			String select_from_books = "select bookIsbn, bookTitle from books";
			PreparedStatement stmt=conn.prepareStatement(select_from_books);
			ResultSet rs = stmt.executeQuery(); 
			while(rs.next())
			{
				products.put(rs.getString("bookIsbn"),rs.getString("bookTitle"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		return products;
		}
	
	public  StringBuffer readdata(String searchId)
	{
		StringBuffer sb = new StringBuffer(); 
		HashMap<String,String> data;
		data=getData();
		System.out.println("data length-->"+data.size());
		Iterator it = data.entrySet().iterator();
		while (it.hasNext())
		{
			Map.Entry entry = (Map.Entry)it.next();
			System.out.println(entry.getValue());
			try{
				String valueOfKey = (String)entry.getValue();
				if (valueOfKey.toLowerCase().startsWith(searchId))
				{
					sb.append("<book>"); 
					sb.append("<bookIsbn>" + entry.getKey() + "</bookIsbn>");
					sb.append("<bookTitle>" + entry.getValue() + "</bookTitle>"); 
					sb.append("</book>");
				}
			} 
			catch(Exception e){
				
				e.printStackTrace();
			}
			
		}
		return sb;
	}

}