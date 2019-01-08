package com.churn;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class mem
 */
public class mem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mem() {
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
		String aa = request.getParameter("membership");
		String bb = request.getParameter("pass");
		try
		{
			Mongo mongo = new Mongo("localhost",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("network");
			DBCursor cursor = collection.find(new BasicDBObject("membershipno",aa).append("password", bb));
			if(cursor.hasNext())
			{
				DBObject object = cursor.next();
				String forename = (String)object.get("forename");
				HttpSession session = request.getSession();
				session.setAttribute("forename", forename);
				String network = (String)object.get("network");
				response.sendRedirect("member_home.jsp");
			}
			else
			{
				out.println("your membership login id and password are incorrect");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
