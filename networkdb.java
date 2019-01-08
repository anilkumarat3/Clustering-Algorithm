package com.churn;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

/**
 * Servlet implementation class networkdb
 */
public class networkdb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public networkdb() {
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
		try
		{
			String a = request.getParameter("forename");
			String b = request.getParameter("surname");
			String c = request.getParameter("email");
			String d = request.getParameter("network");
			String e = request.getParameter("addressline");
			String f = request.getParameter("city");
			String g = request.getParameter("postalcode");
			String h = request.getParameter("hometelephone");
			String i = request.getParameter("mobile");
			String j = request.getParameter("dob");
			String k = request.getParameter("gender");
			String l = request.getParameter("pass");
			String m = "Not Activated";
			String n= "mn";
			
			
			Mongo mongo = new Mongo("127.0.0.1",27017);
			DB db = mongo.getDB("churn");
			DBCollection collection = db.getCollection("network");
			BasicDBObject object = new BasicDBObject("forename",a).append("surname", b).append("email", c).append("network", d).append("addressline", e).append("city", f).append("postalcode", g).append("hometelephone", h).append("mobile", i).append("dob", j).append("gender", k).append("password", l).append("status", m).append("membershipno", n);		
			collection.insert(object);
			response.sendRedirect("networkerlogin.jsp");
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}

}
