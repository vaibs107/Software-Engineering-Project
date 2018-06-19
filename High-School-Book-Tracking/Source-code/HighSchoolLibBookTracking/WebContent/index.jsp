<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>High School Library System</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
        <script type="text/javascript" src="js/javascript.js"></script>
    </head>
    
    <body>
        <div id="container">
            
            <header>
                <div class="width">
                    <h1><a href="/">Illinois State High School<span>LIBRARY</span></a></h1>
                </div>
            </header>
            <%
                if(request.getParameter("signOut") != null && request.getParameter("signOut").equals("yes"))
                {
                    session.removeAttribute("loginFrom");
                    session.removeAttribute("pid");
                }
            %>
            <%
                if(session.getAttribute("loginFrom") == null)
                {
                    System.out.println("Session attribute is: " + session.getAttribute("loginFrom"));
            %>
                    <nav>
                       <div class="width">
                            <ul>
                                <li class="start selected"><a href="index.jsp">Home</a></li>
                                <li><a href="signin.jsp">Sign In</a></li>
                                <li class="end"><a href="register.jsp">New User? Sign Up!</a></li>
                            </ul>
                       </div>
                    </nav>
            <%
                }
                else{
                    System.out.println("Session attribute is: " + session.getAttribute("loginFrom"));
                    if(session.getAttribute("userRole").toString() != null)
                    {
                        if(session.getAttribute("userRole").toString().equalsIgnoreCase("Student")){
            %>
                    <nav>
                       <div class="width">
                            <ul>
                                <li class="start selected"><a href="index.jsp">Home</a></li>
                                <li><a href="viewAccount.jsp">Account</a></li>
                        		<li><a href="viewBorrowHistory.jsp">View Borrow History</a></li>
                                <li class="end"><a href="index.jsp?signOut=yes">Sign Out</a></li>

                            </ul>
                       </div>
                    </nav>
            <%
                    	}
                    	else if (session.getAttribute("userRole").toString().equalsIgnoreCase("Faculty")){
            %>
                    <nav>
                       <div class="width">
                            <ul>
                                <li class="start selected"><a href="index.jsp">Home</a></li>
                                <li><a href="viewAccount.jsp">Account</a></li>
                                <li class="end"><a href="index.jsp?signOut=yes">Sign Out</a></li>

                            </ul>
                       </div>
                    </nav>
                    <nav>
		                <div class="width">
		                    <ul>
		                        <li><a href="addNewStudent.jsp">Add New Student</a></li>
		                        <li><a href="updateStudentInfoForm.jsp">Update Student Info</a></li>
		                        <li><a href="deleteUserRecordForm.html">Delete Student</a></li>   
		                        <li><a href="viewStudentHistory.jsp">View Student History</a></li> 
		                    </ul>
		                </div>
		            </nav>
            <%
                    	}
                    	else if (session.getAttribute("userRole").toString().equalsIgnoreCase("Admin")){
            %>
                    <nav>
                       <div class="width">
                            <ul>
                                <li class="start selected"><a href="index.jsp">Home</a></li>
                                <li class="end"><a href="index.jsp?signOut=yes">Sign Out</a></li>
                            </ul>
                       </div>
                    </nav>
                    <nav>
		                <div class="width">
		                    <ul>
		                        <li><a href="addNewBook.html">Add New Book</a></li>
		                        <li><a href="updateBookInfoForm.html">Update Book Info</a></li>
		                        <li><a href="deleteBookForm.html">Delete Book</a></li>
		                        <li><a href="viewCheckoutRequest.jsp">View Checkout Requests</a></li>
		                    </ul>
		                </div>
			            </nav>
			            <nav>
			                <div class="width">
			                    <ul>
			                        <li><a href="register.jsp">Add New User</a></li>
			                        <li><a href="updateUserInfoForm.jsp">Update User Info</a></li>
			                        <li><a href="deleteUserRecordForm.html">Delete User</a></li>    
			                    </ul>
			                </div>
			            </nav>

            <%
                    	}
                    	else if (session.getAttribute("userRole").toString().equalsIgnoreCase("Parent")){
            %>        
                    <nav>
                       <div class="width">
                            <ul>
                                <li class="start selected"><a href="index.jsp">Home</a></li>
                                <li><a href="viewAccount.jsp">Account</a></li>
                        		<li><a href="viewChildHistory.jsp">View Child's Borrow History</a></li>
                                <li class="end"><a href="index.jsp?signOut=yes">Sign Out</a></li>

                            </ul>
                       </div>
                    </nav>
           <%
           				}
                	}
               }
            %>
            <div id="body" class="width">
                <section id="content">
                    <article>
                        <h2>About school</h2>
                            <p> <img src="images\high-school.jpg" alt="About Us" style="float:right; width:150px; height:150px; padding-right:15px">
                            Welcome to Illinois State High School. 
                            A Country School Established in 1857 Supported by a Vibrant Community Committed to Academic and Artistic Excellence. 
                            Illinois State is a beautiful secondary school in a picturesque setting, serving seventh grade through twelfth grade 
                            with a strong emphasis in Literature, History, Science, Math and Technology. 
                            The high school is located near Smoky Mountains, nestled in the foot hills of North Carolina. 
                            The rural campus is sprinkled with oak trees and is surrounded by beautiful rivers and waterfalls. </p><br>
                    </article>
                    <article>
                            <p><img src="images\Contacts-icon.png" alt="Contact Us" style="float:left;width:150px; height:150px; padding-right:55px">
                            <h2>Contact Us</h2>
                            <strong>Reception Desk</strong> : 1800-RECE-DESK (Toll Free)<br>
                            <strong>Library Desk</strong> : +1(987) 654-3210 <br>
                            <strong>Queries? Email us @</strong> : <i style="font-color:blue">illinois_state@high.edu</i><br>
                    </article>
                </section>

                <aside class="sidebar">
                    <ul>    
                       <li>
                            <h4>Book Categories</h4>
                            <form method='POST' action="showBooksServlet">
                                <ul>
                                    <li><input type='submit' name='category' value = 'ALL BOOKS'/></li>
                                    <li><input type='submit' name='category' value = 'Art'/></li>
                                    <li><input type='submit' name='category' value = 'History'/></li>
                                    <li><input type='submit' name='category' value = 'Journals'/></li>
                                    <li><input type='submit' name='category' value = 'Literature'/></li>
                                    <li><input type='submit' name='category' value = 'Mathematics'/></li>
                                    <li><input type='submit' name='category' value = 'Sample Exam Papers'/></li>
                                    <li><input type='submit' name='category' value = 'Technology'/></li>
                                    <li><input type='submit' name='category' value = 'Sports'/></li>
                                </ul>
                            </form>
                        </li>
                        <li>
                            <h4>Search site</h4>
                            <ul>
                                <li class="text">
                                    <div name="autofillform">
                                        <input type="text" name="searchId" value="" class="input" id="searchId" onkeyup="doCompletion()"/>
                                        <div id="auto-row">
                                            <table id="complete-table" class="gridtable" style="background-color: #711; position: absolute; width:200px;"></table>
                                        </div>
                                    </div> 
                                </li>
                            </ul>
                        </li>                        
                    </ul>
                </aside>
                <div class="clear"></div>
            </div>
            
            <footer>
                <div class="footer-bottom">
                    <p>&copy;Copyright ISH 2017. All rights reserved.</p>
                </div>
            </footer>
        
        </div>
    </body>

</html>