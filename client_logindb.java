package com.churn;

import java.io.IOException;

import javax.mail.Session;
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
import com.mongodb.Mongo;

/**
 * Servlet implementation class client_logindb
 */
public class client_logindb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public client_logindb() {
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
		
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		
		try
		{
			Mongo mongo = new Mongo("127.0.0.1",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("client_reg");
			DBCursor cursor = collection.find(new BasicDBObject("name",name).append("pass", pass));
			while(cursor.hasNext())
			{
				DBObject object = cursor.next();
				String name1 = (String)object.get("name");
				HttpSession session = request.getSession();
				session.setAttribute("name", name1);
				System.out.println("&&&&&&&&&&&&&"+name1);
				String network = (String)object.get("network");
				session.setAttribute("network1", network);
				response.sendRedirect("client_home.jsp");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
