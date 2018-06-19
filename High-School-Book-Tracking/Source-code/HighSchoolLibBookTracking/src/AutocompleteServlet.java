import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AutocompleteServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        try
        {
            String action = (String)request.getParameter("action");
            String searchId = (String)request.getParameter("searchId");
            System.out.println("action-->"+action);
            System.out.println("searchId-->"+searchId);
            StringBuffer sb = new StringBuffer();
            boolean namesAdded = false;
            if (action.equals("complete"))
            {
                if (!searchId.equals(""))
                { 
                    AjaxUtility a=new AjaxUtility();
                    sb=a.readdata(searchId);
                    System.out.println("sb-->"+sb);
                    if(sb!=null || !sb.equals(""))
                    {
                        namesAdded=true;
                    }
                    System.out.println("namesAdded-->"+namesAdded);
                    if (namesAdded)
                    {
                        response.setContentType("text/xml");
                        response.getWriter().write("<products>" + sb.toString() + "</products >");
                    }
                }
            }
	    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}