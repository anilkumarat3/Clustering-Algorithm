package com.churn;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

/**
 * Servlet implementation class network_login
 */
public class network_login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public network_login1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String pass	=	request.getParameter("pass");
		
		try
		{
			MongoClient mongoClient = new MongoClient("localhost",27017);
			DB db = mongoClient.getDB("churn");
			DBCollection collection = db.getCollection("network");
			DBCursor cursor = collection.find(new BasicDBObject("email",email).append("password",pass));
			if(cursor.hasNext())
			{
				DBObject object2 = cursor.next();
				String name = (String)object2.get("forename");
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				System.out.println("%%%%%%%%%%%%%%%%"+name);
				String network = (String)object2.get("network");
				session.setAttribute("network", network);

				/*RequestDispatcher rd = request.getRequestDispatcher("network_home.jsp");
				rd.forward(request, response);*/
				
			
				response.sendRedirect("network_home.jsp");
				
			}
			else
			{
			
				  out.println("Sorry Email id or Password Error!");  
			       
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
